SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF OBJECT_ID('[dbo].[getReceivablesOfCustomersOnDay]') IS NOT NULL
	DROP FUNCTION [dbo].[getReceivablesOfCustomersOnDay]
GO

-- =============================================
-- Author:		<Author,,Valentin Avramko>
-- Create date: <Create Date,,04.01.2015>
-- Description:	<Description,,Возвращает талблицу с дебиторской задолженностью контрагентов на дату>
-- =============================================
CREATE FUNCTION [dbo].[getReceivablesOfCustomersOnDay]
(
	@Date AS date		-- Дата, на которую формируем отчет	
)
RETURNS TABLE
AS
RETURN
(
SELECT
	Receivables.ДатаЗадолженности AS ДатаЗадолженности								-- Дата задолженности
	,TypesOfDebt.ТипДолга AS ТипДолга												-- Тип долга
	,TypesOfDelay.ВидПросрочки AS ВидПросрочки										-- Вид просрочки
	,Customer.Код AS ШифрКонтрагента												-- Код контрагента
	,Customer.Наименование AS НаименованиеКонтрагента								-- Наименование контрагента
	,Customer.ИНН AS ИННКонтрагента													-- ИНН контрагента
	,Company.Наименование AS Организация											-- Наименование организации
	,Business.Наименование AS НаправлениеБизнеса									-- Направление бизнеса
	,Branch.Наименование AS Филиал													-- Наименовнаие филиала
	,ISNULL(CASE
				WHEN DocumentsTypes.ВидДокумента = 'Реализация товаров' THEN (	SELECT TOP 1
																					Наименование
																				FROM [uas_central].dbo.Справочник_КредитныеНаправления
																				WHERE Ссылка = DocSales.КредитноеНаправление)
				WHEN DocumentsTypes.ВидДокумента = 'Возврат товаров от покупателя' THEN (	SELECT TOP 1
																								Наименование
																							FROM [uas_central].dbo.Справочник_КредитныеНаправления
																							WHERE Ссылка = DocRefunds.КредитноеНаправление)
				WHEN DocumentsTypes.ВидДокумента = 'Ввод начальных остатков взаиморасчетов' THEN (	SELECT TOP 1
																										Наименование
																									FROM [uas_central].dbo.Справочник_КредитныеНаправления
																									WHERE Ссылка = DocOpeningBalance.КредитноеНаправление)
				WHEN DocumentsTypes.ВидДокумента = 'Аванс' THEN NULL
			END, 'Без кредитного направления') AS КредитноеНаправление				-- Кредитное направления
	,ISNULL(CASE
				WHEN DocumentsTypes.ВидДокумента = 'Реализация товаров' THEN (	SELECT TOP 1
																					Наименование
																				FROM [uas_central].dbo.Справочник_Маршруты
																				WHERE Ссылка = DocSales.Маршрут)
				WHEN DocumentsTypes.ВидДокумента = 'Возврат товаров от покупателя' THEN (	SELECT TOP 1
																								Наименование
																							FROM [uas_central].dbo.Справочник_Маршруты
																							WHERE Ссылка = DocRefunds.Маршрут)
				WHEN DocumentsTypes.ВидДокумента = 'Ввод начальных остатков взаиморасчетов' THEN NULL
				WHEN DocumentsTypes.ВидДокумента = 'Аванс' THEN NULL
			END, 'Без маршрута') AS Маршрут											-- Марушрта (торговый представитель)
	,DocumentsTypes.ВидДокумента AS ВидДокумента									-- Вид документа
	,CASE
		WHEN DocumentsTypes.ВидДокумента = 'Реализация товаров' THEN DocSales.Номер
		WHEN DocumentsTypes.ВидДокумента = 'Возврат товаров от покупателя' THEN DocRefunds.Номер
		WHEN DocumentsTypes.ВидДокумента = 'Ввод начальных остатков взаиморасчетов' THEN DocOpeningBalance.Номер
		WHEN DocumentsTypes.ВидДокумента = 'Аванс' THEN 'Без номера'
	END AS НомерДокумента															-- Номер документа
	,CASE
		WHEN DocumentsTypes.ВидДокумента = 'Реализация товаров' THEN DocSales.Дата
		WHEN DocumentsTypes.ВидДокумента = 'Возврат товаров от покупателя' THEN DocRefunds.Дата
		WHEN DocumentsTypes.ВидДокумента = 'Ввод начальных остатков взаиморасчетов' THEN DocOpeningBalance.ДатаИсходногоДокумента
		WHEN DocumentsTypes.ВидДокумента = 'Аванс' THEN NULL
	END AS ДатаДокумента															-- Дата документа
	,CASE
		WHEN DocumentsTypes.ВидДокумента = 'Реализация товаров' THEN ISNULL(DocSales.ДатаОплаты, DocSales.Дата)
		WHEN DocumentsTypes.ВидДокумента = 'Возврат товаров от покупателя' THEN ISNULL(DocRefunds.Дата, 0)
		WHEN DocumentsTypes.ВидДокумента = 'Ввод начальных остатков взаиморасчетов' THEN ISNULL(DocOpeningBalance.ДатаОплаты, DocOpeningBalance.Дата)
		WHEN DocumentsTypes.ВидДокумента = 'Аванс' THEN NULL
	END AS ДатаОплаты																-- Дата оплаты
	,Receivables.ДнейПросрочки														-- Дней просрочки
	,CASE
		WHEN DocumentsTypes.ВидДокумента = 'Реализация товаров' THEN DocSales.СуммаДокумента
		WHEN DocumentsTypes.ВидДокумента = 'Возврат товаров от покупателя' THEN DocRefunds.СуммаДокумента
		WHEN DocumentsTypes.ВидДокумента = 'Ввод начальных остатков взаиморасчетов' THEN DocOpeningBalance.СуммаИсходногоДокумента
		WHEN DocumentsTypes.ВидДокумента = 'Аванс' THEN 0
	END AS СуммаДокумента															-- Сумма документа
	,Receivables.Сумма_0 AS СуммаРазвернутая										-- все авансы свернуты до одной строки, долги контрагента остаются как есть
	,Receivables.Сумма_1 AS СуммаЗакратаяПоПросроченным								-- все авансы свернуты до одной строки, просрочненные долги контрагента закрываются имеющимися  авансами
	,Receivables.Сумма_2 AS СуммаЗакрытаяПоВсем										-- все авансы свернуты до одной строки, все долги контрагента закрываются имеющимися авансами

FROM [ReportingDatabase].dbo.t_ReceivablesOfCustomers AS Receivables
LEFT JOIN [ReportingDatabase].dbo.t_TypesOfDebt AS TypesOfDebt ON TypesOfDebt.ID = Receivables.ВидДолга
LEFT JOIN [ReportingDatabase].dbo.t_TypesOfDelay AS TypesOfDelay ON TypesOfDelay.ID = Receivables.ВидПросрочки
LEFT JOIN [ReportingDatabase].dbo.t_DocumentsTypes AS DocumentsTypes ON DocumentsTypes.ID = Receivables.ВидДокумента
LEFT JOIN [uas_central].dbo.Справочник_Контрагенты AS Customer ON Customer.Ссылка = Receivables.Контрагент
LEFT JOIN [uas_central].dbo.Справочник_Организации AS Company ON Company.Ссылка = Receivables.Организация
LEFT JOIN [uas_central].dbo.Справочник_НаправленияБизнеса AS Business ON Business.Ссылка = Receivables.НаправлениеБизнеса
LEFT JOIN [uas_central].dbo.Справочник_Филиалы AS Branch ON Branch.Ссылка = Receivables.Филиал

LEFT JOIN [uas_central].dbo.Документ_РеализацияТоваров AS DocSales ON DocSales.Ссылка = Receivables.ДокументВзаиморасчета										-- Документ.РеализацияТоваров
														AND DocumentsTypes.ВидДокумента = 'Реализация товаров'
LEFT JOIN [uas_central].dbo.Документ_ВозвратТоваровОтПокупателя AS DocRefunds ON DocRefunds.Ссылка = Receivables.ДокументВзаиморасчета						-- Документ.ВозвратТоваровОтПокупателя
																	AND DocumentsTypes.ВидДокумента = 'Возврат товаров от покупателя'
LEFT JOIN [uas_central].dbo.Документ_ВводНачальныхОстатковВзаиморасчета AS DocOpeningBalance ON DocOpeningBalance.Ссылка = Receivables.ДокументВзаиморасчета	-- Документ.ВводНачальныхОстатковВзаиморасчета
																					AND DocumentsTypes.ВидДокумента = 'Ввод начальных остатков взаиморасчетов'
WHERE Receivables.ДатаЗадолженности = @Date
);
GO
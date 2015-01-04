DECLARE @DateOfSummation AS date
DECLARE @Date AS date

SET @Date = CAST('2014-07-29' AS date) --DATEADD(day, 1, GETDATE())
SET @DateOfSummation = (	SELECT TOP 1
						_Период
					FROM dbo.РегистрНакопления_ВзаиморасчетыСКонтрагентами_Остатки
					GROUP BY _Период
					HAVING _Период < @Date
					ORDER BY _Период DESC
				)

;
WITH Взаиморасчеты AS
(
SELECT
	ВзаиморасчетыИтоги.НаправлениеБизнеса AS НаправлениеБизнеса
	,ВзаиморасчетыИтоги.Организация AS Организация
	,ВзаиморасчетыИтоги.Филиал AS Филиал
	,ВзаиморасчетыИтоги.Контрагент AS Контрагент
	--,CASE
	--	WHEN ВзаиморасчетыИтоги.ДокументВзаиморасчета_ВидСсылки = 0x00000000 THEN 'Аванс'
	--	WHEN ВзаиморасчетыИтоги.ДокументВзаиморасчета_ВидСсылки = 0x0000004B THEN 'Возврат товаров поставщику'
	--	WHEN ВзаиморасчетыИтоги.ДокументВзаиморасчета_ВидСсылки = 0x00000050 THEN 'Поступление товаров'
	--	WHEN ВзаиморасчетыИтоги.ДокументВзаиморасчета_ВидСсылки = 0x00000051 THEN 'Реализация товаров'
	--	WHEN ВзаиморасчетыИтоги.ДокументВзаиморасчета_ВидСсылки = 0x00000056 THEN 'Ввод начальных остатков взаиморасчетов'
	--	WHEN ВзаиморасчетыИтоги.ДокументВзаиморасчета_ВидСсылки = 0x0000041C THEN 'Покупка консигнационного товара'
	--	WHEN ВзаиморасчетыИтоги.ДокументВзаиморасчета_ВидСсылки = 0x0000050C THEN 'Возврат товаров от покупателя'
	--	ELSE 'Неизвестный документ'
	--END AS ВидДокумента
	,ВзаиморасчетыИтоги.ДокументВзаиморасчета_ВидСсылки AS ВидДокумента
	,ВзаиморасчетыИтоги.ДокументВзаиморасчета_Ссылка AS ДокументВзаиморасчета
	,ВзаиморасчетыИтоги.Сумма AS Сумма
FROM dbo.РегистрНакопления_ВзаиморасчетыСКонтрагентами_Остатки AS ВзаиморасчетыИтоги
INNER JOIN dbo.Справочник_Контрагенты AS Контрагенты ON Контрагенты.Ссылка = ВзаиморасчетыИтоги.Контрагент
														AND Контрагенты.Покупатель = 0x01
WHERE ВзаиморасчетыИтоги._Период = @DateOfSummation
	AND ВзаиморасчетыИтоги._РазделительИтогов = 0
	AND ВзаиморасчетыИтоги.ДокументВзаиморасчета_ВидСсылки IN (0x00000000, 0x00000051, 0x00000056, 0x0000050C)
UNION ALL
SELECT
	ВзаиморасчетыОбороты.НаправлениеБизнеса AS НаправлениеБизнеса
	,ВзаиморасчетыОбороты.Организация AS Организация
	,ВзаиморасчетыОбороты.Филиал AS Филиал
	,ВзаиморасчетыОбороты.Контрагент AS Контрагент
	,ВзаиморасчетыОбороты.ДокументВзаиморасчета_ВидСсылки AS ВидДокумента
	,ВзаиморасчетыОбороты.ДокументВзаиморасчета_Ссылка AS ДокументВзаиморасчета
	,(1 - 2*ВзаиморасчетыОбороты.ВидДвижения) * ВзаиморасчетыОбороты.Сумма AS Сумма
FROM dbo.РегистрНакопления_ВзаиморасчетыСКонтрагентами AS ВзаиморасчетыОбороты
INNER JOIN dbo.Справочник_Контрагенты AS Контрагенты ON Контрагенты.Ссылка = ВзаиморасчетыОбороты.Контрагент
														AND Контрагенты.Покупатель = 0x01
WHERE (ВзаиморасчетыОбороты._Период >= @DateOfSummation AND ВзаиморасчетыОбороты._Период < @Date)
	AND ВзаиморасчетыОбороты.Активность = 0x01
	AND ВзаиморасчетыОбороты.ДокументВзаиморасчета_ВидСсылки IN (0x00000000, 0x00000051, 0x00000056, 0x0000050C)
)
,Долги AS
(
SELECT
	Взаиморасчеты.Организация
	,Взаиморасчеты.НаправлениеБизнеса
	,Взаиморасчеты.Филиал
	,Взаиморасчеты.Контрагент
	,CASE
		WHEN SUM(Взаиморасчеты.Сумма) < 0 THEN 0x00000000
		ELSE Взаиморасчеты.ВидДокумента
	END AS ВидДокумента
	,CASE
		WHEN SUM(Взаиморасчеты.Сумма) < 0 THEN 0x00000000000000000000000000000000
		ELSE Взаиморасчеты.ДокументВзаиморасчета
	END AS ДокументВзаиморасчета
	,CASE
		WHEN Взаиморасчеты.ВидДокумента = 0x00000056 AND SUM(Взаиморасчеты.Сумма) > 0 THEN MAX(DocOpeningBalance.Дата)
		WHEN Взаиморасчеты.ВидДокумента = 0x00000051 AND SUM(Взаиморасчеты.Сумма) > 0 THEN MAX(DocSale.Дата)
		WHEN Взаиморасчеты.ВидДокумента = 0x0000050C AND SUM(Взаиморасчеты.Сумма) > 0 THEN Max(DocRefund.Дата)
		ELSE NULL
	END AS ДатаДокумента
	,SUM(Взаиморасчеты.Сумма) AS Сумма
	--,SUM(Сумма) OVER (PARTITION BY SUM(Сумма)) AS Итог
FROM Взаиморасчеты AS Взаиморасчеты
LEFT JOIN dbo.Документ_ВводНачальныхОстатковВзаиморасчета AS DocOpeningBalance ON DocOpeningBalance.Ссылка = Взаиморасчеты.ДокументВзаиморасчета
																					AND Взаиморасчеты.ВидДокумента = 0x00000056
LEFT JOIN dbo.Документ_РеализацияТоваров AS DocSale ON DocSale.Ссылка = Взаиморасчеты.ДокументВзаиморасчета
																					AND Взаиморасчеты.ВидДокумента = 0x00000051
LEFT JOIN dbo.Документ_ВозвратТоваровОтПокупателя AS DocRefund ON DocRefund.Ссылка = Взаиморасчеты.ДокументВзаиморасчета
																					AND Взаиморасчеты.ВидДокумента = 0x0000050C
GROUP BY
	Взаиморасчеты.Организация
	,Взаиморасчеты.НаправлениеБизнеса
	,Взаиморасчеты.Филиал
	,Взаиморасчеты.Контрагент
	,Взаиморасчеты.ВидДокумента
	,Взаиморасчеты.ДокументВзаиморасчета
HAVING SUM(Взаиморасчеты.Сумма) <> 0
		--AND Контрагент = 0x82CE08606E8882E611E44A59476BA001
)
SELECT
	Долги.Организация
	,Долги.НаправлениеБизнеса
	,Долги.Филиал
	,Долги.Контрагент
	,Долги.ВидДокумента
	,Долги.ДокументВзаиморасчета
	,Долги.ДатаДокумента
	--,CASE
	--	WHEN Долги.ВидДокумента = 0x00000056 THEN MAX(DocOpeningBalance.Дата)
	--	WHEN Долги.ВидДокумента = 0x00000051 THEN MAX(DocSale.Дата)
	--	WHEN Долги.ВидДокумента = 0x0000050C THEN Max(DocRefund.Дата)
	--	ELSE NULL
	--END AS DocDate
	,SUM(Долги.Сумма)
FROM Долги AS Долги
--LEFT JOIN dbo.Документ_ВводНачальныхОстатковВзаиморасчета AS DocOpeningBalance ON DocOpeningBalance.Ссылка = Долги.ДокументВзаиморасчета
--																					AND Долги.ВидДокумента = 0x00000056
--LEFT JOIN dbo.Документ_РеализацияТоваров AS DocSale ON DocSale.Ссылка = Долги.ДокументВзаиморасчета
--																					AND Долги.ВидДокумента = 0x00000051
--LEFT JOIN dbo.Документ_ВозвратТоваровОтПокупателя AS DocRefund ON DocRefund.Ссылка = Долги.ДокументВзаиморасчета
--																					AND Долги.ВидДокумента = 0x0000050C
GROUP BY
	Долги.Организация
	,Долги.НаправлениеБизнеса
	,Долги.Филиал
	,Долги.Контрагент
	,Долги.ВидДокумента
	,Долги.ДокументВзаиморасчета
	,Долги.ДатаДокумента


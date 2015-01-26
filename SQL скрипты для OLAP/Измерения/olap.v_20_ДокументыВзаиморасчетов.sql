SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF OBJECT_ID('[olap].[v_20_ДокументыВзаиморасчетов]','V') IS NOT NULL
	DROP VIEW [olap].[v_20_ДокументыВзаиморасчетов]
GO

CREATE VIEW [olap].[v_20_ДокументыВзаиморасчетов]
AS

SELECT
	CONVERT(varchar(32), DocSales.Ссылка, 2) AS ID											-- ID документа
	,'Реализация товаров №'+RTRIM(DocSales.Номер)+' от '
		+ CONVERT(varchar(10), CAST(DocSales.Дата AS date), 104) AS Description				-- Описание документа
	,'Реализация товаров' AS Document														-- Тип документа
	,CAST(DocSales.Дата AS date) AS DocDate													-- Дата документа
	,DocSales.Номер AS DocNumber															-- Номер документа
	,CONVERT(varchar(32), DocSales.ТипДокумента, 2) AS DocumentTypeID						-- ID типа документа
	,CONVERT(varchar(32), DocSales.СпособОплаты, 2) AS PaymentMethodID						-- ID способа оплаты документа
	,CAST(DocSales.ДатаОплаты AS date) AS DocPaymentDay										-- Дата оплаты
FROM dbo.Документ_РеализацияТоваров AS DocSales								-- Документ.РеализацияТоваров
WHERE DocSales.Проведен = 0x01												-- Проведен
UNION ALL
SELECT
	CONVERT(varchar(32), DocRefunds.Ссылка, 2) AS ID										-- ID документа
	,'Возврат товаров от покупателя №'+RTRIM(DocRefunds.Номер)+' от '
		+ CONVERT(varchar(10), CAST(DocRefunds.Дата AS date), 104) AS Description			-- Описание документа
	,'Возврат товаров от покупателя' AS Document											-- Тип документа
	,CAST(DocRefunds.Дата AS date) AS DocDate												-- Дата документа
	,DocRefunds.Номер AS DocNumber															-- Номер документа
	,CONVERT(varchar(32), DocRefunds.ТипДокумента, 2) AS DocumentTypeID						-- ID типа документа
	,CONVERT(varchar(32), DocRefunds.СпособОплаты, 2) AS PaymentMethodID					-- ID способа оплаты документа
	,CAST(DocRefunds.Дата AS date) AS DocPaymentDay											-- Дата оплаты
FROM dbo.Документ_ВозвратТоваровОтПокупателя AS DocRefunds					-- Документ.ВозвратТоваровОтПокупателя
WHERE DocRefunds.Проведен = 0x01											-- Проведен
UNION ALL
SELECT
	CONVERT(varchar(32), DocOpeningBalance.Ссылка, 2) AS ID									-- ID документа
	,'Ввод начальных остатков взаиморасчета №'+RTRIM(DocOpeningBalance.Номер)+' от '
		+ CONVERT(varchar(10), CAST(DocOpeningBalance.Дата AS date), 104) AS Description	-- Описание документа
	,'Ввод начальных остатков взаиморасчета' AS Document									-- Тип документа
	,CAST(DocOpeningBalance.Дата AS date) AS DocDate										-- Дата документа
	,DocOpeningBalance.Номер AS DocNumber													-- Номер документа
	,CONVERT(varchar(32), DocOpeningBalance.ТипДокумента, 2) AS DocumentTypeID				-- ID типа документа
	,CONVERT(varchar(32), DocOpeningBalance.СпособОплаты, 2) AS PaymentMethodID				-- ID способа оплаты документа
	,CAST(DocOpeningBalance.ДатаОплаты AS date) AS DocPaymentDay							-- Дата оплаты
FROM dbo.Документ_ВводНачальныхОстатковВзаиморасчета AS DocOpeningBalance	-- Документ.ВводНачальныхОстатковВзаиморасчета
WHERE DocOpeningBalance.Проведен = 0x01										-- Проведен
--UNION ALL
--SELECT
--	'00000000000000000000000000000000' AS ID
--	,'Аванс' AS Description
--	,'Аванс' AS Document
--	,NULL AS DocDate
--	,'Без номера' AS DocNumber
--	,NULL AS DocumentTypeID
--	,NULL AS PaymentMethodID
--	,NULL AS DocPaymentDay



GO



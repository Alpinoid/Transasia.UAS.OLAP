SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF OBJECT_ID('[olap].[v_14_Документы]','V') IS NOT NULL
	DROP VIEW [olap].[v_14_Документы]
GO

CREATE VIEW [olap].[v_14_Документы]
AS

SELECT
	CONVERT(varchar(32), DocSales.Ссылка, 2) AS ID											-- ID документа
	,'Реализация товаров №'+RTRIM(DocSales.Номер)+' от '
		+ CONVERT(varchar(10), CAST(DocSales.Дата AS date), 104) AS Description				-- Описание документа
	,'Реализация товаров' AS Document														-- Тип документа
	,CAST(DocSales.Дата AS date) AS DocDate													-- Дата документа
	,DocSales.Номер AS DocNumber															-- Номер документа
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
FROM dbo.Документ_ВозвратТоваровОтПокупателя AS DocRefunds					-- Документ.ВозвратТоваровОтПокупателя
WHERE DocRefunds.Проведен = 0x01											-- Проведен

GO



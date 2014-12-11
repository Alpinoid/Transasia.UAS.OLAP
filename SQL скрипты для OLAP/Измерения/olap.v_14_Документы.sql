USE [UASD]
GO

/****** Object:  View [olap].[v_14_Документы]    Script Date: 11.12.2014 16:23:43 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO





ALTER VIEW [olap].[v_14_Документы]
AS

SELECT
	CONVERT(varchar(32), DocSales._IDRRef, 2) AS ID																-- ID документа
	,'Реализация товаров №'+RTRIM(DocSales._Number)+' от '
		+ CONVERT(varchar(10), DATEADD(year, -1*2000, CAST(DocSales._Date_Time AS date)), 104) AS Description	-- Описание документа
	,'Реализация товаров' AS Document																			-- Тип документа
	,DATEADD(year, -1*2000, CAST(DocSales._Date_Time AS date)) AS DocDate										-- Дата документа
	,DocSales._Number AS DocNumber																				-- Номер документа
FROM dbo._Document81 AS DocSales WITH(NOLOCK)		-- Документ.РеализацияТоваров
WHERE DocSales._Posted = 0x01						-- Проведен
UNION ALL
SELECT
	CONVERT(varchar(32), DocRefunds._IDRRef, 2) AS ID															-- ID документа
	,'Возврат товаров от покупателя №'+RTRIM(DocRefunds._Number)+' от '
		+ CONVERT(varchar(10), DATEADD(year, -1*2000, CAST(DocRefunds._Date_Time AS date)), 104) AS Description	-- Описание документа
	,'Возврат товаров от покупателя' AS Document																-- Тип документа
	,DATEADD(year, -1*2000, CAST(DocRefunds._Date_Time AS date)) AS DocDate										-- Дата документа
	,DocRefunds._Number AS DocNumber																			-- Номер документа
FROM dbo._Document1292 AS DocRefunds WITH(NOLOCK)	-- Документ.ВозвратТоваровОтПокупателя
WHERE DocRefunds._Posted = 0x01						-- Проведен


GO



USE [UASD]
GO

/****** Object:  View [olap].[v_10_ТипыЦенНоменклатуры]    Script Date: 11.12.2014 12:51:46 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO





ALTER VIEW [olap].[v_10_ТипыЦенНоменклатуры]
AS

SELECT
	CONVERT(varchar(32), Element.Ссылка, 2) AS ID					-- ID типа цен номенклатуры
	,Element.Наименование AS Description							-- Наименование
	,ISNULL(Bussiness.Наименование, 'Без направления') AS Business	-- Направление бизнеса
FROM dbo.Справочник_ТипыЦенНоменклатуры AS Element															-- Справочник.ТипыЦенНоменклатуры
LEFT JOIN dbo.Справочник_НаправленияБизнеса AS Bussiness ON Bussiness.Ссылка = Element.НаправлениеБизнеса	-- Справочник.НаправленияБизнеса
WHERE Element.ЭтоГруппа = 0x01


GO



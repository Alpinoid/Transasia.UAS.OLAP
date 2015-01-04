SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF OBJECT_ID('[olap].[v_10_ТипыЦенНоменклатуры]','V') IS NOT NULL
	DROP VIEW [olap].[v_10_ТипыЦенНоменклатуры]
GO

CREATE VIEW [olap].[v_10_ТипыЦенНоменклатуры]
AS

SELECT
	CONVERT(varchar(32), Element.Ссылка, 2) AS ID					-- ID типа цен номенклатуры
	,Element.Наименование AS Description							-- Наименование
	,ISNULL(Bussiness.Наименование, 'Без направления') AS Business	-- Направление бизнеса
FROM dbo.Справочник_ТипыЦенНоменклатуры AS Element															-- Справочник.ТипыЦенНоменклатуры
LEFT JOIN dbo.Справочник_НаправленияБизнеса AS Bussiness ON Bussiness.Ссылка = Element.НаправлениеБизнеса	-- Справочник.НаправленияБизнеса
WHERE Element.ЭтоГруппа = 0x01


GO



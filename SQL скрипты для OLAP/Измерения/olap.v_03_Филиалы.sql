SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF OBJECT_ID('[olap].[v_03_Филиалы]','V') IS NOT NULL
	DROP VIEW [olap].[v_03_Филиалы]
GO

CREATE VIEW [olap].[v_03_Филиалы]
AS

SELECT
	CONVERT(varchar(32), Element.Ссылка, 2) AS ID
	,Element.Наименование AS Description
	,CASE
		WHEN SUM(1) OVER (PARTITION BY Parent.Наименование) <=1 THEN Element.Наименование
		ELSE Parent.Наименование
	END AS ParentDescription
	,CASE
		WHEN SUM(1) OVER (PARTITION BY Parent.Наименование) <=1 THEN NULL
		ELSE Element.Наименование
	END AS ChildDescription
FROM dbo.Справочник_Филиалы AS Element															-- Справочник.Филиалы
LEFT JOIN dbo.Справочник_Филиалы AS Parent ON Parent.Ссылка = Element.Родитель					-- Справочник.Филиалы (родитель)
										OR (Parent.Ссылка = Element.Ссылка AND Element.Родитель = 0)
--UNION ALL
--SELECT
--	'00000000000000000000000000000000' AS ID
--	,'Без филиала' AS Description
--	,'Без филиала' ParentDescription
--	,'Без филиала' ChildDescription


GO



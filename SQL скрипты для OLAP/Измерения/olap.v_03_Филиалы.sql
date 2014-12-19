USE [UASD]
GO

/****** Object:  View [olap].[v_03_Филиалы]    Script Date: 10.12.2014 17:17:10 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



ALTER VIEW [olap].[v_03_Филиалы]
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


GO



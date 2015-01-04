SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF OBJECT_ID('[olap].[v_15_КаналыПродаж]','V') IS NOT NULL
	DROP VIEW [olap].[v_15_КаналыПродаж]
GO

CREATE VIEW [olap].[v_15_КаналыПродаж]
AS

SELECT
	CONVERT(varchar(32), Element.Ссылка, 2) AS ID
	,CASE
		WHEN SUM(1) OVER (PARTITION BY Parent.Наименование) <=1 THEN Element.Наименование
		ELSE Parent.Наименование
	END AS ParentDescription
	,Element.Наименование AS Description
	,Element.РегламентноеНаименование AS OfficialDescription
	,Element.КодNew AS Code
	,Element.КодISIS AS ISIS
FROM dbo.Справочник_КаналыПродаж AS Element											-- Справочник.КаналыПродаж
LEFT JOIN dbo.Справочник_КаналыПродаж AS Parent ON Parent.Ссылка = Element.Родитель	-- Справочник.КаналыПродаж (родитель)
										OR (Parent.Ссылка = Element.Ссылка AND Element.Родитель = 0)
WHERE Element.Родитель <> 0x00  AND Element.ПометкаУдаления = 0x00


GO



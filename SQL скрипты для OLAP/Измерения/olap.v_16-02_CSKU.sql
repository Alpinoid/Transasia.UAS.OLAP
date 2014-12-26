USE [UASD]
GO

/****** Object:  View [olap].[v_16-02-01_HierarchyCSKU]    Script Date: 26.12.2014 17:48:35 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO






ALTER VIEW [olap].[v_16-02_CSKU]
AS

SELECT
	CONVERT(varchar(32), Element.Ссылка, 2)				AS ID					-- ID CSKU
	,CONVERT(varchar(32), Element.Родитель, 2)			AS HierarchyID
	,Element.Код										AS Code
	,Element.Наименование								AS Description
	,Element.Код + ': ' + Element.Наименование			AS Code_Description
	,Element.Наименование + ' (' + Element.Код + ')'	AS Description_Code
FROM  dbo.Справочник_CSKU AS Element
WHERE Element.ЭтоГруппа = 0x01

GO



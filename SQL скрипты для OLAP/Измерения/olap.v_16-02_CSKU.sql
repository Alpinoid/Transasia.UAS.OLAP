SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF OBJECT_ID('[olap].[v_16-02_CSKU]','V') IS NOT NULL
	DROP VIEW [olap].[v_16-02_CSKU]
GO

CREATE VIEW [olap].[v_16-02_CSKU]
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



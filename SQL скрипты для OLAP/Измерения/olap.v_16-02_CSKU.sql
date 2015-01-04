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
	CONVERT(varchar(32), Element.������, 2)				AS ID					-- ID CSKU
	,CONVERT(varchar(32), Element.��������, 2)			AS HierarchyID
	,Element.���										AS Code
	,Element.������������								AS Description
	,Element.��� + ': ' + Element.������������			AS Code_Description
	,Element.������������ + ' (' + Element.��� + ')'	AS Description_Code
FROM  dbo.����������_CSKU AS Element
WHERE Element.��������� = 0x01

GO



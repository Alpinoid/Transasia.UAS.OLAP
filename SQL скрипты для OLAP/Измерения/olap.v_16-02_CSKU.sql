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
	CONVERT(varchar(32), Element.������, 2)				AS ID					-- ID CSKU
	,CONVERT(varchar(32), Element.��������, 2)			AS HierarchyID
	,Element.���										AS Code
	,Element.������������								AS Description
	,Element.��� + ': ' + Element.������������			AS Code_Description
	,Element.������������ + ' (' + Element.��� + ')'	AS Description_Code
FROM  dbo.����������_CSKU AS Element
WHERE Element.��������� = 0x01

GO



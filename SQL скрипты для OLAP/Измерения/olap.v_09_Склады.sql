SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF OBJECT_ID('[olap].[v_09_������]','V') IS NOT NULL
	DROP VIEW [olap].[v_09_������]
GO

CREATE VIEW [olap].[v_09_������]
AS

SELECT
	CONVERT(varchar(32), Element.������, 2) AS ID			-- ID ������
	,Element.������������ AS Description					-- ������������
	,ISNULL(Branches.������������, '��� �������') AS Branch	-- ������
FROM dbo.����������_������ AS Element												-- ����������.������
LEFT JOIN  dbo.����������_������� AS Branches ON Branches.������ = Element.������	-- ����������.�������
WHERE Element.��������� = 0x01


GO



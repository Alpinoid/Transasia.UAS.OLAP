SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF OBJECT_ID('[olap].[v_07_��������]','V') IS NOT NULL
	DROP VIEW [olap].[v_07_��������]
GO

CREATE VIEW [olap].[v_07_��������]
AS

SELECT
	CONVERT(varchar(32), Element.������, 2) AS ID
	,CONVERT(varchar(32), Element.��������, 2) AS TeamID
	,Element.������������ AS Description
	,ISNULL(Branches.������������, '��� �������') AS Branch
FROM dbo.����������_�������� AS Element												-- ����������.��������
LEFT JOIN  dbo.����������_������� AS Branches ON Branches.������ = Element.������	-- ����������.�������
--WHERE Element.��������� = 0x01
--UNION ALL
--SELECT
--	'00000000000000000000000000000000' AS ID
--	,'00000000000000000000000000000000' AS TeamID
--	,'��� ��������' AS Description
--	,'��� �������' AS Branch


GO




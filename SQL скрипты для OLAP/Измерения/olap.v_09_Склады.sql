USE [UASD]
GO

/****** Object:  View [olap].[v_09_������]    Script Date: 11.12.2014 12:37:49 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO





ALTER VIEW [olap].[v_09_������]
AS

SELECT
	CONVERT(varchar(32), Element.������, 2) AS ID			-- ID ������
	,Element.������������ AS Description					-- ������������
	,ISNULL(Branches.������������, '��� �������') AS Branch	-- ������
FROM dbo.����������_������ AS Element												-- ����������.������
LEFT JOIN  dbo.����������_������� AS Branches ON Branches.������ = Element.������	-- ����������.�������
WHERE Element.��������� = 0x01


GO



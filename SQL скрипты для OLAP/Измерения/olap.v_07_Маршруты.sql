USE [UASD]
GO

/****** Object:  View [olap].[v_07_��������]    Script Date: 11.12.2014 11:48:57 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO






ALTER VIEW [olap].[v_07_��������]
AS

SELECT
	CONVERT(varchar(32), Element.������, 2) AS ID
	,CONVERT(varchar(32), Element.��������, 2) AS TeamID
	,Element.������������ AS Description
	,ISNULL(Branches.������������, '��� �������') AS Branch
FROM dbo.����������_�������� AS Element												-- ����������.��������
LEFT JOIN  dbo.����������_������� AS Branches ON Branches.������ = Element.������	-- ����������.�������
WHERE Element.��������� = 0x01

GO



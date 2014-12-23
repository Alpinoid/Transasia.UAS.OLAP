USE [UASD]
GO

/****** Object:  View [olap].[v_10_�������������������]    Script Date: 11.12.2014 12:51:46 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO





ALTER VIEW [olap].[v_10_�������������������]
AS

SELECT
	CONVERT(varchar(32), Element.������, 2) AS ID					-- ID ���� ��� ������������
	,Element.������������ AS Description							-- ������������
	,ISNULL(Bussiness.������������, '��� �����������') AS Business	-- ����������� �������
FROM dbo.����������_������������������� AS Element															-- ����������.�������������������
LEFT JOIN dbo.����������_������������������ AS Bussiness ON Bussiness.������ = Element.������������������	-- ����������.������������������
WHERE Element.��������� = 0x01


GO



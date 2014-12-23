USE [UASD]
GO

/****** Object:  View [olap].[v_08_��������������������]    Script Date: 11.12.2014 12:21:20 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO






ALTER VIEW [olap].[v_08_��������������������]
AS

SELECT
	CONVERT(varchar(32), Element.������, 2) AS ID					-- ID ���������� �����������
	,Element.������������ AS Description							-- ������������
	,ISNULL(Bussiness.������������, '��� �����������') AS Business	-- ����������� �������
FROM dbo.����������_�������������������� AS Element																				-- ����������.��������������������
LEFT JOIN dbo.����������_������������������ AS Bussiness ON Bussiness.������ = Element.������������������						-- ����������.������������������
INNER JOIN dbo.������������_������������������������ AS CreditType ON CreditType.�������� = Element.������������������������	-- ������������.������������������������
													AND CreditType.��� LIKE '�������'											-- ��� ���������� �����������: �������
WHERE Element.�������� <> 0


GO

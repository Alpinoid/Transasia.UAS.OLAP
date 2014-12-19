USE [UASD]
GO

/****** Object:  View [olap].[v_06_�������������]    Script Date: 11.12.2014 11:23:05 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO







ALTER VIEW [olap].[v_06_�������������]
AS

SELECT
	CONVERT(varchar(32), Element.������, 2) AS ID							-- ID ����� ��������
	,Element.��� AS Code													-- ���
	,Element.������������ AS Description									-- ������������
	,Element.��� + ': ' + Element.������������ AS CodeDescription			-- ���: ������������
	,Element.������������ + ' (' + Element.��� + ')' AS DescriptionCode		-- ������������ (���)
	,ISNULL(Branch.������������, '��� �������') AS Branch					-- ������
FROM dbo.����������_������������� AS Element																-- ����������.�������������
INNER JOIN dbo.����������_����������� AS Customers ON Customers.������ = Element.��������					-- ����������.�����������
											AND Customers.���������� = 1									-- ����������
INNER JOIN dbo.����������_��������������� AS CustomerType ON CustomerType.������ = Customers.��������������	-- ����������.���������������
												AND CustomerType.��� = '000000003'							-- ��� �����������: ������� ������
LEFT JOIN dbo.����������_������� AS Branch ON Branch.������ = Element.������								-- ����������.�������


GO
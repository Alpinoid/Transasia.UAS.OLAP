SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF OBJECT_ID('[olap].[v_06_�������������]','V') IS NOT NULL
	DROP VIEW [olap].[v_06_�������������]
GO

CREATE VIEW [olap].[v_06_�������������]
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
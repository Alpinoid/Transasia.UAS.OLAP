SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF OBJECT_ID('[olap].[v_05_�����������]','V') IS NOT NULL
	DROP VIEW [olap].[v_05_�����������]
GO

CREATE VIEW [olap].[v_05_�����������]
AS

SELECT
	CONVERT(varchar(32), Customers.������, 2) AS ID							-- ID �����������
	,Customers.��� AS Code													-- ���
	,Customers.��� AS INN													-- ���
	,Customers.������������ AS Description									-- ������������		
	,Customers.��� + ': ' + Customers.������������ AS CodeDescription		-- ���: ������������
	,Customers.������������ + ' (' + Customers.��� + ')' AS DescriptionCode	-- ������������ (���)
	,Customers.��� + ': ' + Customers.������������ AS INNDescription		-- ���: ������������
	,Customers.������������ + ' (' + Customers.��� + ')' AS DescriptionINN	-- ������������ (���)
	,CastomerLegalAddress.������������� AS LegalAddress						-- ����������� �����
	,CastomerFactAddress.������������� AS FactAddress						-- ����������� �����
FROM dbo.����������_����������� AS Customers																													-- ����������.�����������
INNER JOIN dbo.����������_��������������� AS CustomerType ON CustomerType.������ = Customers.��������������														-- ����������.���������������
											AND CustomerType.��� = '000000003'																					-- ��� �����������: ������� ������
LEFT JOIN dbo.����������_�����������_�������������������� AS CastomerLegalAddress ON CastomerLegalAddress.�������� = Customers.������							-- ����������.�����������_��������������������
INNER JOIN dbo.����������_������������������������ AS ContactTypeLegalAddress ON ContactTypeLegalAddress.������ = CastomerLegalAddress.���						-- ����������.������������������������
																	AND ContactTypeLegalAddress.������������������������� = 0xA581F8724C86FD9C4E1AA1B9D95035D6	-- ����������� �����
LEFT JOIN dbo.����������_�����������_�������������������� AS CastomerFactAddress ON CastomerFactAddress.�������� = Customers.������								-- ����������.�����������_��������������������
INNER JOIN dbo.����������_������������������������ AS ContactTypeFactAddress ON ContactTypeFactAddress.������ = CastomerFactAddress.���							-- ����������.������������������������
																	AND ContactTypeFactAddress.������������������������� = 0x9F0111DE9B2A95ED4087A3968FFB5332	-- ���������� �����
WHERE Customers.���������� = 1		-- ����������


GO



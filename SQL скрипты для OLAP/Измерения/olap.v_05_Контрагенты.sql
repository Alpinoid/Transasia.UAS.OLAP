USE [UASD]
GO

/****** Object:  View [olap].[v_05_�����������]    Script Date: 10.12.2014 17:51:40 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER VIEW [olap].[v_05_�����������]
AS

SELECT
	CONVERT(varchar(32), Customers.������, 2) AS ID
	,Customers.��� AS Code
	,Customers.��� AS INN
	,Customers.������������ AS Description
	,Customers.��� + ': ' + Customers.������������ AS CodeDescription
	,Customers.������������ + ' (' + Customers.��� + ')' AS DescriptionCode
	,Customers.��� + ': ' + Customers.������������ AS INNDescription
	,Customers.������������ + ' (' + Customers.��� + ')' AS DescriptionINN
FROM dbo.����������_����������� AS Customers WITH(NOLOCK)																	-- ����������.�����������
INNER JOIN dbo.����������_��������������� AS CustomerType WITH(NOLOCK) ON CustomerType.������ = Customers.��������������	-- ����������.���������������
											AND CustomerType.��� = '000000003'												-- ��� �����������: ������� ������
WHERE Customers.���������� = 1																								-- ����������


GO



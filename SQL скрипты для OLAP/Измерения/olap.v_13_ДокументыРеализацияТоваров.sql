SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF OBJECT_ID('[olap].[v_13_��������������������������]','V') IS NOT NULL
	DROP VIEW [olap].[v_13_��������������������������]
GO

CREATE VIEW [olap].[v_13_��������������������������]
AS

SELECT
	CONVERT(varchar(32), DocSales.������, 2) AS ID								-- ID ���������
	,'���������� ������� �'+RTRIM(DocSales.�����)+' �� '
		+ CONVERT(varchar(10), CAST(DocSales.���� AS date), 104) AS Description	-- �������� ���������
	,CAST(DocSales.���� AS date) AS DocDate										-- ���� ���������
	,DocSales.����� AS DocNumber												-- ����� ���������
	,CONVERT(varchar(32), DocSales.������������, 2) AS DocumentTypeID			-- ID ���� ���������
	,CONVERT(varchar(32), DocSales.������������, 2) AS PaymentMethodID			-- ID ������� ������ ���������
	,CAST(DocSales.����������������������� AS date) AS DocDeliveryDate			-- ���� ��������																			-- ���� ��������
	,CAST(DocSales.���������� AS date) AS DocPaymentDay							-- ���� ������
	,CONVERT(int, DocSales.����������������) AS IsBonusDoc						-- ������� ��������� ���������
FROM dbo.��������_����������������� AS DocSales		-- ��������.�����������������
WHERE DocSales.�������� = 0x01						-- ��������



GO



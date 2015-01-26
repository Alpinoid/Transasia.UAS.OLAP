SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF OBJECT_ID('[olap].[v_20_�����������������������]','V') IS NOT NULL
	DROP VIEW [olap].[v_20_�����������������������]
GO

CREATE VIEW [olap].[v_20_�����������������������]
AS

SELECT
	CONVERT(varchar(32), DocSales.������, 2) AS ID											-- ID ���������
	,'���������� ������� �'+RTRIM(DocSales.�����)+' �� '
		+ CONVERT(varchar(10), CAST(DocSales.���� AS date), 104) AS Description				-- �������� ���������
	,'���������� �������' AS Document														-- ��� ���������
	,CAST(DocSales.���� AS date) AS DocDate													-- ���� ���������
	,DocSales.����� AS DocNumber															-- ����� ���������
	,CONVERT(varchar(32), DocSales.������������, 2) AS DocumentTypeID						-- ID ���� ���������
	,CONVERT(varchar(32), DocSales.������������, 2) AS PaymentMethodID						-- ID ������� ������ ���������
	,CAST(DocSales.���������� AS date) AS DocPaymentDay										-- ���� ������
FROM dbo.��������_����������������� AS DocSales								-- ��������.�����������������
WHERE DocSales.�������� = 0x01												-- ��������
UNION ALL
SELECT
	CONVERT(varchar(32), DocRefunds.������, 2) AS ID										-- ID ���������
	,'������� ������� �� ���������� �'+RTRIM(DocRefunds.�����)+' �� '
		+ CONVERT(varchar(10), CAST(DocRefunds.���� AS date), 104) AS Description			-- �������� ���������
	,'������� ������� �� ����������' AS Document											-- ��� ���������
	,CAST(DocRefunds.���� AS date) AS DocDate												-- ���� ���������
	,DocRefunds.����� AS DocNumber															-- ����� ���������
	,CONVERT(varchar(32), DocRefunds.������������, 2) AS DocumentTypeID						-- ID ���� ���������
	,CONVERT(varchar(32), DocRefunds.������������, 2) AS PaymentMethodID					-- ID ������� ������ ���������
	,CAST(DocRefunds.���� AS date) AS DocPaymentDay											-- ���� ������
FROM dbo.��������_�������������������������� AS DocRefunds					-- ��������.��������������������������
WHERE DocRefunds.�������� = 0x01											-- ��������
UNION ALL
SELECT
	CONVERT(varchar(32), DocOpeningBalance.������, 2) AS ID									-- ID ���������
	,'���� ��������� �������� ������������� �'+RTRIM(DocOpeningBalance.�����)+' �� '
		+ CONVERT(varchar(10), CAST(DocOpeningBalance.���� AS date), 104) AS Description	-- �������� ���������
	,'���� ��������� �������� �������������' AS Document									-- ��� ���������
	,CAST(DocOpeningBalance.���� AS date) AS DocDate										-- ���� ���������
	,DocOpeningBalance.����� AS DocNumber													-- ����� ���������
	,CONVERT(varchar(32), DocOpeningBalance.������������, 2) AS DocumentTypeID				-- ID ���� ���������
	,CONVERT(varchar(32), DocOpeningBalance.������������, 2) AS PaymentMethodID				-- ID ������� ������ ���������
	,CAST(DocOpeningBalance.���������� AS date) AS DocPaymentDay							-- ���� ������
FROM dbo.��������_���������������������������������� AS DocOpeningBalance	-- ��������.����������������������������������
WHERE DocOpeningBalance.�������� = 0x01										-- ��������
--UNION ALL
--SELECT
--	'00000000000000000000000000000000' AS ID
--	,'�����' AS Description
--	,'�����' AS Document
--	,NULL AS DocDate
--	,'��� ������' AS DocNumber
--	,NULL AS DocumentTypeID
--	,NULL AS PaymentMethodID
--	,NULL AS DocPaymentDay



GO



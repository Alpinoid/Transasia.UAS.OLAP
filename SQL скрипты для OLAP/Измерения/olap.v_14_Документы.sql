SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF OBJECT_ID('[olap].[v_14_���������]','V') IS NOT NULL
	DROP VIEW [olap].[v_14_���������]
GO

CREATE VIEW [olap].[v_14_���������]
AS

SELECT
	CONVERT(varchar(32), DocSales.������, 2) AS ID											-- ID ���������
	,'���������� ������� �'+RTRIM(DocSales.�����)+' �� '
		+ CONVERT(varchar(10), CAST(DocSales.���� AS date), 104) AS Description				-- �������� ���������
	,'���������� �������' AS Document														-- ��� ���������
	,CAST(DocSales.���� AS date) AS DocDate													-- ���� ���������
	,DocSales.����� AS DocNumber															-- ����� ���������
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
FROM dbo.��������_�������������������������� AS DocRefunds					-- ��������.��������������������������
WHERE DocRefunds.�������� = 0x01											-- ��������

GO



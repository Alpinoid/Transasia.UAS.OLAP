SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF OBJECT_ID('[dbo].[getReceivablesOfCustomersOnDay]') IS NOT NULL
	DROP FUNCTION [dbo].[getReceivablesOfCustomersOnDay]
GO

-- =============================================
-- Author:		<Author,,Valentin Avramko>
-- Create date: <Create Date,,04.01.2015>
-- Description:	<Description,,���������� �������� � ����������� �������������� ������������ �� ����>
-- =============================================
CREATE FUNCTION [dbo].[getReceivablesOfCustomersOnDay]
(
	@Date AS date		-- ����, �� ������� ��������� �����	
)
RETURNS TABLE
AS
RETURN
(
SELECT
	Receivables.����������������� AS �����������������								-- ���� �������������
	,TypesOfDebt.�������� AS ��������												-- ��� �����
	,TypesOfDelay.������������ AS ������������										-- ��� ���������
	,Customer.��� AS ���������������												-- ��� �����������
	,Customer.������������ AS �����������������������								-- ������������ �����������
	,Customer.��� AS ��������������													-- ��� �����������
	,Company.������������ AS �����������											-- ������������ �����������
	,Business.������������ AS ������������������									-- ����������� �������
	,Branch.������������ AS ������													-- ������������ �������
	,ISNULL(CASE
				WHEN DocumentsTypes.������������ = '���������� �������' THEN (	SELECT TOP 1
																					������������
																				FROM [uas_central].dbo.����������_��������������������
																				WHERE ������ = DocSales.��������������������)
				WHEN DocumentsTypes.������������ = '������� ������� �� ����������' THEN (	SELECT TOP 1
																								������������
																							FROM [uas_central].dbo.����������_��������������������
																							WHERE ������ = DocRefunds.��������������������)
				WHEN DocumentsTypes.������������ = '���� ��������� �������� ��������������' THEN (	SELECT TOP 1
																										������������
																									FROM [uas_central].dbo.����������_��������������������
																									WHERE ������ = DocOpeningBalance.��������������������)
				WHEN DocumentsTypes.������������ = '�����' THEN NULL
			END, '��� ���������� �����������') AS ��������������������				-- ��������� �����������
	,ISNULL(CASE
				WHEN DocumentsTypes.������������ = '���������� �������' THEN (	SELECT TOP 1
																					������������
																				FROM [uas_central].dbo.����������_��������
																				WHERE ������ = DocSales.�������)
				WHEN DocumentsTypes.������������ = '������� ������� �� ����������' THEN (	SELECT TOP 1
																								������������
																							FROM [uas_central].dbo.����������_��������
																							WHERE ������ = DocRefunds.�������)
				WHEN DocumentsTypes.������������ = '���� ��������� �������� ��������������' THEN NULL
				WHEN DocumentsTypes.������������ = '�����' THEN NULL
			END, '��� ��������') AS �������											-- �������� (�������� �������������)
	,DocumentsTypes.������������ AS ������������									-- ��� ���������
	,CASE
		WHEN DocumentsTypes.������������ = '���������� �������' THEN DocSales.�����
		WHEN DocumentsTypes.������������ = '������� ������� �� ����������' THEN DocRefunds.�����
		WHEN DocumentsTypes.������������ = '���� ��������� �������� ��������������' THEN DocOpeningBalance.�����
		WHEN DocumentsTypes.������������ = '�����' THEN '��� ������'
	END AS ��������������															-- ����� ���������
	,CASE
		WHEN DocumentsTypes.������������ = '���������� �������' THEN DocSales.����
		WHEN DocumentsTypes.������������ = '������� ������� �� ����������' THEN DocRefunds.����
		WHEN DocumentsTypes.������������ = '���� ��������� �������� ��������������' THEN DocOpeningBalance.����������������������
		WHEN DocumentsTypes.������������ = '�����' THEN NULL
	END AS �������������															-- ���� ���������
	,CASE
		WHEN DocumentsTypes.������������ = '���������� �������' THEN ISNULL(DocSales.����������, DocSales.����)
		WHEN DocumentsTypes.������������ = '������� ������� �� ����������' THEN ISNULL(DocRefunds.����, 0)
		WHEN DocumentsTypes.������������ = '���� ��������� �������� ��������������' THEN ISNULL(DocOpeningBalance.����������, DocOpeningBalance.����)
		WHEN DocumentsTypes.������������ = '�����' THEN NULL
	END AS ����������																-- ���� ������
	,Receivables.�������������														-- ���� ���������
	,CASE
		WHEN DocumentsTypes.������������ = '���������� �������' THEN DocSales.��������������
		WHEN DocumentsTypes.������������ = '������� ������� �� ����������' THEN DocRefunds.��������������
		WHEN DocumentsTypes.������������ = '���� ��������� �������� ��������������' THEN DocOpeningBalance.�����������������������
		WHEN DocumentsTypes.������������ = '�����' THEN 0
	END AS ��������������															-- ����� ���������
	,Receivables.�����_0 AS ����������������										-- ��� ������ �������� �� ����� ������, ����� ����������� �������� ��� ����
	,Receivables.�����_1 AS ���������������������������								-- ��� ������ �������� �� ����� ������, ������������� ����� ����������� ����������� ����������  ��������
	,Receivables.�����_2 AS �������������������										-- ��� ������ �������� �� ����� ������, ��� ����� ����������� ����������� ���������� ��������

FROM [ReportingDatabase].dbo.t_ReceivablesOfCustomers AS Receivables
LEFT JOIN [ReportingDatabase].dbo.t_TypesOfDebt AS TypesOfDebt ON TypesOfDebt.ID = Receivables.��������
LEFT JOIN [ReportingDatabase].dbo.t_TypesOfDelay AS TypesOfDelay ON TypesOfDelay.ID = Receivables.������������
LEFT JOIN [ReportingDatabase].dbo.t_DocumentsTypes AS DocumentsTypes ON DocumentsTypes.ID = Receivables.������������
LEFT JOIN [uas_central].dbo.����������_����������� AS Customer ON Customer.������ = Receivables.����������
LEFT JOIN [uas_central].dbo.����������_����������� AS Company ON Company.������ = Receivables.�����������
LEFT JOIN [uas_central].dbo.����������_������������������ AS Business ON Business.������ = Receivables.������������������
LEFT JOIN [uas_central].dbo.����������_������� AS Branch ON Branch.������ = Receivables.������

LEFT JOIN [uas_central].dbo.��������_����������������� AS DocSales ON DocSales.������ = Receivables.���������������������										-- ��������.�����������������
														AND DocumentsTypes.������������ = '���������� �������'
LEFT JOIN [uas_central].dbo.��������_�������������������������� AS DocRefunds ON DocRefunds.������ = Receivables.���������������������						-- ��������.��������������������������
																	AND DocumentsTypes.������������ = '������� ������� �� ����������'
LEFT JOIN [uas_central].dbo.��������_���������������������������������� AS DocOpeningBalance ON DocOpeningBalance.������ = Receivables.���������������������	-- ��������.����������������������������������
																					AND DocumentsTypes.������������ = '���� ��������� �������� ��������������'
WHERE Receivables.����������������� = @Date
);
GO
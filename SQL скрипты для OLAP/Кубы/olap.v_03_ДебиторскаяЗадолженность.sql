SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF OBJECT_ID('[olap].[v_03_������������������������]','V') IS NOT NULL
	DROP VIEW [olap].[v_03_������������������������]
GO

CREATE VIEW [olap].[v_03_������������������������]
AS

SELECT
	Receivables.����������������� AS DateDebt										-- ���� �������������
	,CONVERT(varchar(32), Receivables.����������, 2) AS CustomerID					-- ID �����������
	,CONVERT(varchar(32), Receivables.�����������, 2) AS CompanyID					-- ID �����������
	,CONVERT(varchar(32), Receivables.������������������, 2) AS BusinessID			-- ID ����������� �������
	,CONVERT(varchar(32), Receivables.������, 2) AS BranchID						-- ID �������
	,Receivables.�������� AS TypesOfDebtID											-- ID ��� �����
	,CONVERT(varchar(32), Receivables.���������������������, 2) AS DocumentID		-- ID ��������� �������������
	,Receivables.������������
	,CONVERT(varchar(32),	CASE
								WHEN Receivables.������������ = '���������� �������' THEN DocSales.��������������������
								WHEN Receivables.������������ = '������� ������� �� ����������' THEN DocRefunds.��������������������
								WHEN Receivables.������������ = '���� ��������� �������� ��������������' THEN DocOpeningBalance.��������������������
								WHEN Receivables.������������ = '�����' THEN 0x00000000000000000000000000000000
							END
						, 2) AS CreditLineID										-- ID ���������� �����������
	,CONVERT(varchar(32),	CASE
								WHEN Receivables.������������ = '���������� �������' THEN DocSales.�������
								WHEN Receivables.������������ = '������� ������� �� ����������' THEN DocRefunds.�������
								WHEN Receivables.������������ = '���� ��������� �������� ��������������' THEN 0x00000000000000000000000000000000
								WHEN Receivables.������������ = '�����' THEN 0x00000000000000000000000000000000
							END
						, 2) AS RouteID												-- ID �������� (��������� �������������)
	,Receivables.�����_0 AS FullDebtAmmount											-- ��� ������ �������� �� ����� ������, ����� ����������� �������� ��� ����
	,Receivables.�����_1 AS OutstandingDebtAmmount									-- ��� ������ �������� �� ����� ������, ������������� ����� ����������� ����������� ����������  ��������
	,Receivables.�����_2 AS ClosedDebtAmmount										-- ��� ������ �������� �� ����� ������, ��� ����� ����������� ����������� ���������� ��������

FROM [ReportingDatabase].dbo.t_ReceivablesOfCustomers AS Receivables
LEFT JOIN dbo.��������_����������������� AS DocSales ON DocSales.������ = Receivables.���������������������										-- ��������.�����������������
														AND Receivables.������������ = '���������� �������'
LEFT JOIN dbo.��������_�������������������������� AS DocRefunds	ON DocRefunds.������ = Receivables.���������������������						-- ��������.��������������������������
																	AND Receivables.������������ = '������� ������� �� ����������'
LEFT JOIN dbo.��������_���������������������������������� AS DocOpeningBalance ON DocOpeningBalance.������ = Receivables.���������������������	-- ��������.����������������������������������
																					AND Receivables.������������ = '���� ��������� �������� ��������������'

GO
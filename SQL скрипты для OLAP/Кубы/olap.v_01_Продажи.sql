USE [UASD]
GO

/****** Object:  View [olap].[v_01_�������]    Script Date: 10.12.2014 17:09:02 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


ALTER VIEW [olap].[v_01_�������]
AS

SELECT
	CAST(RegSales._������ AS date) AS TransactionDate								-- ���� ��������
	,CONVERT(varchar(32), RegSales.�����������, 2) AS DocumentID					-- ID ���������
	,CONVERT(varchar(32), RegSales.���������������, 2) AS SalesDocumentID			-- ID ��������� �������
	,CONVERT(varchar(32), RegSales.���������������������, 2) AS TransactionTypeID	-- ID ���� ��������
	,CONVERT(varchar(32), RegSales.������������������, 2) AS BusinessID				-- ID ����������� �������
	,CONVERT(varchar(32), RegSales.�����������, 2) AS CompanyID						-- ID �����������
	,CONVERT(varchar(32), RegSales.������, 2) AS BranchID							-- ID �������
	,CONVERT(varchar(32), RegSales.�����, 2) AS StorehouseID						-- ID ������
	,CONVERT(varchar(32), RegSales.����������, 2) AS CustomerID						-- ID �����������
	,CONVERT(varchar(32), RegSales.�������������, 2) AS TardeShopID					-- ID ����� �������� (�������)
	,CONVERT(varchar(32), RegSales.��������������������, 2) AS CreditLineID			-- ID ���������� �����������
	,CONVERT(varchar(32), RegSales.�������, 2) AS RouteID							-- ID �������� (��������� �������������)
	,CONVERT(varchar(32), RegSales.�������������, 2) AS AgentID						-- ID ��������� ������ (����������)
	,CONVERT(varchar(32), RegSales.�������, 2) AS TypePriceID						-- ID ���� ����
	,CONVERT(varchar(32), RegSales.������������, 2) AS GoodID						-- ID ������������
	,RegSales.���������� AS QuantityBase											-- ���������� � ������� �������� ���������
	,ROUND(RegSales.���������� * (
									SELECT TOP 1
										CASE
											WHEN ISNULL(MeasuresUnit.�����������, 0) = 0 THEN 0
											ELSE 1 / MeasuresUnit.�����������
										END
									FROM dbo.����������_���������������� AS MeasuresUnit	-- ����������.����������������
									INNER JOIN dbo.����������_���������������������������� AS Class ON MeasuresUnit.�������������� = Class.������
																										AND Class.������������ LIKE '��%'-- [��]
									WHERE MeasuresUnit.�������� = Goods.������
								), 0, 1) AS QuantityUnit																-- ���������� � [��]
	,ROUND(RegSales.���������� * (
									SELECT TOP 1
										CASE
											WHEN ISNULL(MeasuresUnit.�����������, 0) = 0 THEN 0
											ELSE 1 / MeasuresUnit.�����������
										END
									FROM dbo.����������_���������������� AS MeasuresUnit	-- ����������.����������������
									INNER JOIN dbo.����������_���������������������������� AS Class ON MeasuresUnit.�������������� = Class.������
																										AND Class.������������ LIKE '���%'-- [���]
									WHERE MeasuresUnit.�������� = Goods.������
								), 0, 1)  AS QuantityBox																-- ���������� � [���]
	,ROUND(RegSales.���������� * (
									SELECT TOP 1
										CASE
											WHEN ISNULL(MeasuresUnit.�����������, 0) = 0 THEN 0
											ELSE 1 / MeasuresUnit.�����������
										END
									FROM dbo.����������_���������������� AS MeasuresUnit	-- ����������.����������������
									INNER JOIN dbo.����������_���������������������������� AS Class ON MeasuresUnit.�������������� = Class.������
																										AND Class.������������ LIKE '��%'-- [��]
									WHERE MeasuresUnit.�������� = Goods.������
								), 0, 1)  AS QuantityBlock															-- ���������� � [��]
	,ISNULL(MeasuresBase.�����, 0) * RegSales.���������� AS Value					-- �����
	,ISNULL(MeasuresBase.���������, 0) * RegSales.���������� AS WeightGross			-- ��� ������
	,ISNULL(MeasuresBase.��������, 0) * RegSales.���������� AS WeightNet			-- ��� ������
	,RegSales.�������� AS AmountVAT													-- ����� ���
	,RegSales.�������������� AS AmountWithoutDiscount								-- ����� ��� ������
	,RegSales.����� AS Amount														-- �����
	,(SELECT TOP 1
		Cost.����� AS Ammount
		FROM ���������������_����� AS Cost
		WHERE Cost.���������� = 0x01
		AND Cost.������������ = RegSales.������������
		AND Cost._������ <= RegSales._������
	ORDER BY Cost._������ DESC) * RegSales.���������� AS Cost						-- ����� �������������
FROM dbo.�����������������_������� AS RegSales														-- �����������������.�������
LEFT JOIN dbo.����������_������������ AS Goods ON Goods.������ = RegSales.������������				-- ����������.������������
LEFT JOIN dbo.����������_���������������� AS MeasuresBase ON MeasuresBase.������ = Goods.�����������������������	-- ����������.����������������

WHERE RegSales.���������� = 0x01

GO



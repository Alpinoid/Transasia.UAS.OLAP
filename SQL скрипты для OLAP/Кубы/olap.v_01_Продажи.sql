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
	DATEADD(year, -2000, CAST(RegSales._Period AS date)) AS TransactionDate		-- ���� ��������
	,CONVERT(varchar(32), RegSales._RecorderRRef, 2) AS DocumentID				-- ID ���������
	,CONVERT(varchar(32), RegSales._Fld2034RRef, 2) AS SalesDocumentID			-- ID ��������� �������
	,CONVERT(varchar(32), RegSales._Fld2037RRef, 2) AS TransactionTypeID		-- ID ���� ��������
	,CONVERT(varchar(32), RegSales._Fld2032RRef, 2) AS BusinessID				-- ID ����������� �������
	,CONVERT(varchar(32), RegSales._Fld2030RRef, 2) AS CompanyID				-- ID �����������
	,CONVERT(varchar(32), RegSales._Fld2031RRef, 2) AS BranchID					-- ID �������
	,CONVERT(varchar(32), RegSales._Fld2106RRef, 2) AS StorehouseID				-- ID ������
	,CONVERT(varchar(32), RegSales._Fld2028RRef, 2) AS CustomerID				-- ID �����������
	,CONVERT(varchar(32), RegSales._Fld2029RRef, 2) AS TardeShopID				-- ID ����� �������� (�������)
	,CONVERT(varchar(32), RegSales._Fld2033RRef, 2) AS CreditLineID				-- ID ���������� �����������
	,CONVERT(varchar(32), RegSales._Fld2035RRef, 2) AS RouteID					-- ID �������� (��������� �������������)
	,CONVERT(varchar(32), RegSales._Fld2036RRef, 2) AS AgentID					-- ID ��������� ������ (����������)
	,CONVERT(varchar(32), RegSales._Fld2243RRef, 2) AS TypePriceID				-- ID ���� ����
	,CONVERT(varchar(32), RegSales._Fld2027RRef, 2) AS GoodID					-- ID ������������
	,RegSales._Fld2038 AS Quantity												-- ���������� � ������� �������� ��������� (��.)
	,ROUND(RegSales._Fld2038/(CASE
								WHEN Units._Fld152 = 0 THEN 1
								ELSE ISNULL(Units._Fld152, 1)
							END), 0, 1) AS QuantityInDeliveryUnits				-- ���������� � �������� ����������� (���.)
	,RegSales._Fld2039 AS AmountVAT												-- ����� ���
	,RegSales._Fld2040 AS AmountWithoutDiscount									-- ����� ��� ������
	,RegSales._Fld2041 AS Amount												-- �����
	,(SELECT TOP 1
		Cost._Fld1587 AS Ammount
		FROM dbo._InfoRg1585 AS Cost
		WHERE Cost._Active = 0x01
		AND Cost._Fld1586RRef = RegSales._Fld2027RRef
		AND Cost._Period <= RegSales._Period
	ORDER BY Cost._Period DESC) * RegSales._Fld2038 AS Cost						-- ����� �������������
FROM dbo._AccumRg2026 AS RegSales WITH(NOLOCK)												-- �����������������.�������
LEFT JOIN dbo._Reference55 AS Goods WITH(NOLOCK) ON Goods._IDRRef = RegSales._Fld2027RRef	-- ����������.������������
LEFT JOIN dbo._Reference46 AS Units WITH(NOLOCK) ON Units._IDRRef = Goods._Fld224RRef		-- ����������.����������������
WHERE RegSales._Active = 0x01





GO



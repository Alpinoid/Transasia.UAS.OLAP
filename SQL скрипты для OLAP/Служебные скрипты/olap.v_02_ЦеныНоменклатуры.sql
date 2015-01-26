SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF OBJECT_ID('[dbo].[PriceListCPG]','V') IS NOT NULL
	DROP VIEW [dbo].[PriceListCPG]
GO

CREATE VIEW [dbo].[PriceListCPG]
AS

	WITH PriceAll AS
	(
	SELECT
		CAST(Price._������ AS date) AS Date																		-- ���� ����
		,Price.������������ AS GoodID																			-- ID ������
		,PriceType.������������ AS PriceType																	-- ID ���� ����
		,Price.���� AS Price																					-- ����
	FROM dbo.���������������_���������������� AS Price													-- ���������������.����������������
	INNER JOIN dbo.����������_������������������� AS PriceType ON PriceType.������ = Price.�������		-- .����������_�������������������
																AND PriceType.������������������ = 0x829508606E88610311E4843B1F21A0A5
	)
	,PriceCalculation AS
	(
	SELECT
		GETDATE() AS Date
		,GoodID AS GoodID
		,PriceType AS PriceType
		,FIRST_VALUE(Price) OVER (PARTITION BY GoodID, PriceType ORDER BY Date DESC) AS Price
	FROM PriceAll
	WHERE Date <= GETDATE()
	)
	,Price AS
	(
	SELECT
		Date AS Date
		,GoodID AS GoodID
		,������������.�������� AS ParentID
		,������������.������� AS GoodArticle
		,������������.������������ AS GoodDescription
		,MAX(�������.�����������) AS UnitsInBox
		,PriceType AS PriceType
		,Price AS Price
	FROM PriceCalculation
	LEFT JOIN dbo.����������_������������ AS ������������ ON ������������.������ = GoodID
	LEFT JOIN dbo.����������_���������������� AS ������� ON �������.�������� = ������������.������ AND �������.������������ LIKE '%���%'
	GROUP BY Date, GoodID, ������������.��������, ������������.�������, ������������.������������, PriceType, Price
	)
	SELECT
		Hierarchy.Level0
		,Hierarchy.Level1
		,Hierarchy.Level2
		,Hierarchy.Level3
		,Hierarchy.Level4
		,Date
		,GoodID
		,ParentID
		,GoodArticle
		,GoodDescription
		,UnitsInBox
		,PriceType
		,Price
	FROM Price
	LEFT JOIN olap.v_GoodsHierarchy AS Hierarchy ON Hierarchy.UID_1C = Price.ParentID


GO



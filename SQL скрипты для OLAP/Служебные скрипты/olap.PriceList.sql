SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF OBJECT_ID('[dbo].[getPriceList]', 'TF') IS NOT NULL
	DROP FUNCTION [dbo].[getPriceList]
GO

CREATE FUNCTION [dbo].[getPriceList]
(
	@Date AS date		-- ����, �� ������� ��������� �����	
)
RETURNS 
@PriceList TABLE 
(
      Level0 varchar(100)
      ,Level1 varchar(100)
      ,Level2 varchar(100)
      ,Level3 varchar(100)
      ,Level4 varchar(100)
	  ,Date date
	  ,GoodID binary(16)
	  ,ParentID binary(16)
	  ,GoodArticle varchar(25)
	  ,GoodDescription varchar(100)
	  ,PriceTypeID binary(16)
	  ,PriceTypeDescription varchar(25)
	  ,Price numeric(15, 4) NOT NULL
)
AS
BEGIN
	WITH PriceAll AS
	(
	--SELECT
	--	CAST(Cost._������ AS date) AS Date																		-- ���� ����
	--	,Cost.������������ AS GoodID																			-- ID ������
	--	,(SELECT TOP 1 ������ FROM dbo.����������_������������������� WHERE ��� = '000000004') AS PriceTypeID	-- ID ���� ����
	--	,Cost.����� AS Price																					-- ����
	--FROM dbo.���������������_����� AS Cost				-- ���������������.�����

	--WHERE Cost.���������� = 0x01
	--UNION ALL
	SELECT
		CAST(Price._������ AS date) AS Date																		-- ���� ����
		,Price.������������ AS GoodID																			-- ID ������
		,Price.������� AS PriceTypeID																			-- ID ���� ����
		,Price.���� AS Price																					-- ����
	FROM dbo.���������������_���������������� AS Price	-- ���������������.����������������
	)
	,PriceCalculation AS
	(
	SELECT
		@Date AS Date
		,GoodID AS GoodID
		,PriceTypeID AS PriceTypeID
		,FIRST_VALUE(Price) OVER (PARTITION BY GoodID, PriceTypeID ORDER BY Date DESC) AS Price
	FROM PriceAll
	WHERE Date <= @Date
	)
	,Price AS
	(
	SELECT
		Date AS Date
		,GoodID AS GoodID
		,������������.�������� AS ParentID
		,������������.������� AS GoodArticle
		,������������.������������ AS GoodDescription
		,PriceTypeID AS PriceTypeID
		,����������������.������������ AS PriceTypeDescription
		,Price AS Price
	FROM PriceCalculation
	LEFT JOIN dbo.����������_������������ AS ������������ ON ������������.������ = GoodID
	LEFT JOIN dbo.����������_������������������� AS ���������������� ON ����������������.������ = PriceTypeID
	GROUP BY Date, GoodID, ������������.��������, ������������.�������, ������������.������������, PriceTypeID, ����������������.������������, Price
	)
	INSERT INTO @PriceList
		SELECT TOP 1000
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
		  ,PriceTypeID
		  ,PriceTypeDescription
		  ,Price
		FROM Price
		LEFT JOIN olap.v_GoodsHierarchy AS Hierarchy ON Hierarchy.UID_1C = Price.ParentID

	RETURN
 
END
GO



SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF OBJECT_ID('[dbo].[getPriceList]', 'TF') IS NOT NULL
	DROP FUNCTION [dbo].[getPriceList]
GO

CREATE FUNCTION [dbo].[getPriceList]
(
	@Date AS date		-- Дата, на которую формируем отчет	
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
	--	CAST(Cost._Период AS date) AS Date																		-- Дата цены
	--	,Cost.Номенклатура AS GoodID																			-- ID товара
	--	,(SELECT TOP 1 Ссылка FROM dbo.Справочник_ТипыЦенНоменклатуры WHERE Код = '000000004') AS PriceTypeID	-- ID типа цены
	--	,Cost.Сумма AS Price																					-- Цена
	--FROM dbo.РегистрСведений_Срезы AS Cost				-- РегистрСведений.Срезы

	--WHERE Cost.Активность = 0x01
	--UNION ALL
	SELECT
		CAST(Price._Период AS date) AS Date																		-- Дата цены
		,Price.Номенклатура AS GoodID																			-- ID товара
		,Price.ТипЦены AS PriceTypeID																			-- ID типа цены
		,Price.Цена AS Price																					-- Цена
	FROM dbo.РегистрСведений_ЦеныНоменклатуры AS Price	-- РегистрСведений.ЦеныНоменклатуры
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
		,Номенклатура.Родитель AS ParentID
		,Номенклатура.Артикул AS GoodArticle
		,Номенклатура.Наименование AS GoodDescription
		,PriceTypeID AS PriceTypeID
		,ЦенаНоменклатура.Наименование AS PriceTypeDescription
		,Price AS Price
	FROM PriceCalculation
	LEFT JOIN dbo.Справочник_Номенклатура AS Номенклатура ON Номенклатура.Ссылка = GoodID
	LEFT JOIN dbo.Справочник_ТипыЦенНоменклатуры AS ЦенаНоменклатура ON ЦенаНоменклатура.Ссылка = PriceTypeID
	GROUP BY Date, GoodID, Номенклатура.Родитель, Номенклатура.Артикул, Номенклатура.Наименование, PriceTypeID, ЦенаНоменклатура.Наименование, Price
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



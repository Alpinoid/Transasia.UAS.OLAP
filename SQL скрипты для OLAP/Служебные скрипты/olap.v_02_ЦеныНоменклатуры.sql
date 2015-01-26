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
		CAST(Price._Период AS date) AS Date																		-- Дата цены
		,Price.Номенклатура AS GoodID																			-- ID товара
		,PriceType.Наименование AS PriceType																	-- ID типа цены
		,Price.Цена AS Price																					-- Цена
	FROM dbo.РегистрСведений_ЦеныНоменклатуры AS Price													-- РегистрСведений.ЦеныНоменклатуры
	INNER JOIN dbo.Справочник_ТипыЦенНоменклатуры AS PriceType ON PriceType.Ссылка = Price.ТипЦены		-- .Справочник_ТипыЦенНоменклатуры
																AND PriceType.НаправлениеБизнеса = 0x829508606E88610311E4843B1F21A0A5
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
		,Номенклатура.Родитель AS ParentID
		,Номенклатура.Артикул AS GoodArticle
		,Номенклатура.Наименование AS GoodDescription
		,MAX(Коробки.Коэффициент) AS UnitsInBox
		,PriceType AS PriceType
		,Price AS Price
	FROM PriceCalculation
	LEFT JOIN dbo.Справочник_Номенклатура AS Номенклатура ON Номенклатура.Ссылка = GoodID
	LEFT JOIN dbo.Справочник_ЕдиницыИзмерения AS Коробки ON Коробки.Владелец = Номенклатура.Ссылка AND Коробки.Наименование LIKE '%кор%'
	GROUP BY Date, GoodID, Номенклатура.Родитель, Номенклатура.Артикул, Номенклатура.Наименование, PriceType, Price
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



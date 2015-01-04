SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF OBJECT_ID('[olap].[v_02_ЦеныНоменклатуры]','V') IS NOT NULL
	DROP VIEW [olap].[v_02_ЦеныНоменклатуры]
GO

CREATE VIEW [olap].[v_02_ЦеныНоменклатуры]
AS

SELECT
	CONVERT(varchar(8), CAST(Cost._Период AS date), 112)
		+ '_' + CONVERT(varchar(32), Cost.Номенклатура, 2)
		+ '_' + (SELECT TOP 1 CONVERT(varchar(32), Ссылка, 2) FROM dbo.Справочник_ТипыЦенНоменклатуры WHERE Код = '000000004')
		+ '_' + CAST(Cost.Сумма AS varchar) AS ID																					-- ID	
	,CAST(Cost._Период AS date) AS Date																								-- Дата цены
	,CONVERT(varchar(32), Cost.Номенклатура, 2) AS GoodID																			-- ID товара
	,(SELECT TOP 1 CONVERT(varchar(32), Ссылка, 2) FROM dbo.Справочник_ТипыЦенНоменклатуры WHERE Код = '000000004') AS PriceTypeID	-- ID типа цены
	,Cost.Сумма AS Price																											-- Цена
FROM dbo.РегистрСведений_Срезы AS Cost				-- РегистрСведений.Срезы
WHERE Cost.Активность = 0x01
UNION ALL
SELECT
	CONVERT(varchar(8), CAST(Price._Период AS date), 112)
		+ '_' + CONVERT(varchar(32), Price.Номенклатура, 2)
		+ '_' + CONVERT(varchar(32), Price.ТипЦены, 2)
		+ '_' + CAST(Price.Цена AS varchar) AS ID																					-- ID
	,CAST(Price._Период AS date) AS Date																							-- Дата цены
	,CONVERT(varchar(32), Price.Номенклатура, 2) AS GoodID																			-- ID товара
	,CONVERT(varchar(32), Price.ТипЦены, 2) AS PriceTypeID																			-- ID типа цены
	,Price.Цена AS Price																											-- Цена
FROM dbo.РегистрСведений_ЦеныНоменклатуры AS Price	-- РегистрСведений.ЦеныНоменклатуры

GO



USE [UASD]
GO

/****** Object:  View [olap].[v_01_Продажи]    Script Date: 10.12.2014 17:09:02 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


ALTER VIEW [olap].[v_01_Продажи]
AS

SELECT
	CAST(RegSales._Период AS date) AS TransactionDate								-- Дата операции
	,CONVERT(varchar(32), RegSales.Регистратор, 2) AS DocumentID					-- ID документа
	,CONVERT(varchar(32), RegSales.ДокументПродажи, 2) AS SalesDocumentID			-- ID документа продажи
	,CONVERT(varchar(32), RegSales.ХозяйственнаяОперация, 2) AS TransactionTypeID	-- ID типа операции
	,CONVERT(varchar(32), RegSales.НаправлениеБизнеса, 2) AS BusinessID				-- ID направления бизнеса
	,CONVERT(varchar(32), RegSales.Организация, 2) AS CompanyID						-- ID организации
	,CONVERT(varchar(32), RegSales.Филиал, 2) AS BranchID							-- ID филиала
	,CONVERT(varchar(32), RegSales.Склад, 2) AS StorehouseID						-- ID склада
	,CONVERT(varchar(32), RegSales.Контрагент, 2) AS CustomerID						-- ID контрагента
	,CONVERT(varchar(32), RegSales.ТочкаДоставки, 2) AS TardeShopID					-- ID точки доставки (продажи)
	,CONVERT(varchar(32), RegSales.КредитноеНаправление, 2) AS CreditLineID			-- ID кредитного направления
	,CONVERT(varchar(32), RegSales.Маршрут, 2) AS RouteID							-- ID марушрта (торгового представителя)
	,CONVERT(varchar(32), RegSales.ТорговыйАгент, 2) AS AgentID						-- ID торгового агента (сотрудника)
	,CONVERT(varchar(32), RegSales.ТипЦены, 2) AS TypePriceID						-- ID типа цены
	,CONVERT(varchar(32), RegSales.Номенклатура, 2) AS GoodID						-- ID номенклатуры
	,RegSales.Количество AS QuantityBase											-- Количество в базовых единицах измерения
	,CASE
		WHEN MeasuresUnit.Коэффициент = 0 OR MeasuresUnit.Коэффициент IS NULL THEN 0 
		ELSE ROUND(RegSales.Количество / MeasuresUnit.Коэффициент, 0, 1)
	END AS QuantityUnit																-- Количество в [шт]
	,CASE
		WHEN MeasuresBox.Коэффициент = 0 OR MeasuresBox.Коэффициент IS NULL THEN 0 
		ELSE ROUND(RegSales.Количество / MeasuresBox.Коэффициент, 0, 1)
	END AS QuantityBox																-- Количество в [кор]
	,CASE
		WHEN MeasuresBlock.Коэффициент = 0 OR MeasuresBlock.Коэффициент IS NULL THEN 0 
		ELSE ROUND(RegSales.Количество / MeasuresBlock.Коэффициент, 0, 1)
	END AS QuantityBlock															-- Количество в [бл]
	,ISNULL(MeasuresBase.Объем, 0) * RegSales.Количество AS Value					-- Объем
	,ISNULL(MeasuresBase.ВесБрутто, 0) * RegSales.Количество AS WeightGross			-- Вес брутто
	,ISNULL(MeasuresBase.ВесНетто, 0) * RegSales.Количество AS WeightNet			-- Вес брутто
	,RegSales.СуммаНДС AS AmountVAT													-- Сумма НДС
	,RegSales.СуммаБезСкидки AS AmountWithoutDiscount								-- Сумма без скидки
	,RegSales.Сумма AS Amount														-- Сумма
	,(SELECT TOP 1
		Cost.Сумма AS Ammount
		FROM РегистрСведений_Срезы AS Cost
		WHERE Cost.Активность = 0x01
		AND Cost.Номенклатура = RegSales.Номенклатура
		AND Cost._Период <= RegSales._Период
	ORDER BY Cost._Период DESC) * RegSales.Количество AS Cost						-- Сумма себестоимости
FROM dbo.РегистрНакопления_Продажи AS RegSales														-- РегистрНакопления.Продажи
LEFT JOIN dbo.Справочник_Номенклатура AS Goods ON Goods.Ссылка = RegSales.Номенклатура				-- Справочник.Номенклатура
LEFT JOIN dbo.Справочник_ЕдиницыИзмерения AS MeasuresBase ON MeasuresBase.Ссылка = Goods.БазоваяЕдиницаИзмерения	-- Справочник.ЕдиницыИзмерения
LEFT JOIN dbo.Справочник_ЕдиницыИзмерения AS MeasuresUnit ON MeasuresUnit.Владелец = Goods.Ссылка	-- Справочник.ЕдиницыИзмерения
															AND MeasuresUnit.БазоваяЕдиница = (	SELECT TOP 1
																									Ссылка	
																								FROM dbo.Справочник_КлассификаторЕдиницИзмерения
																								WHERE Наименование LIKE 'шт%')	-- [шт]
LEFT JOIN dbo.Справочник_ЕдиницыИзмерения AS MeasuresBox ON MeasuresBox.Владелец = Goods.Ссылка	-- Справочник.ЕдиницыИзмерения
															AND MeasuresBox.БазоваяЕдиница = (	SELECT TOP 1
																									Ссылка	
																								FROM dbo.Справочник_КлассификаторЕдиницИзмерения
																								WHERE Наименование LIKE 'кор%')	-- [кор]
LEFT JOIN dbo.Справочник_ЕдиницыИзмерения AS MeasuresBlock ON MeasuresBlock.Владелец = Goods.Ссылка	-- Справочник.ЕдиницыИзмерения
															AND MeasuresBlock.БазоваяЕдиница = (SELECT TOP 1
																									Ссылка	
																								FROM dbo.Справочник_КлассификаторЕдиницИзмерения
																								WHERE Наименование LIKE 'бл%')	-- [бл]
WHERE RegSales.Активность = 0x01

GO



SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF OBJECT_ID('[olap].[v_01_Продажи]','V') IS NOT NULL
	DROP VIEW [olap].[v_01_Продажи]
GO

CREATE VIEW [olap].[v_01_Продажи]
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
	,ISNULL( (	SELECT TOP 1
					CONVERT(varchar(32), TradeChanel.ISISКанал, 2)
				FROM dbo.РегистрСведений_ПериодическиеРеквизитыТочекДоставки AS TradeChanel			-- РегистрСведений.ПериодическиеРеквизитыТочекДоставки
				WHERE TradeChanel.ТочкаДоставки = RegSales.ТочкаДоставки
						AND TradeChanel._Период <= RegSales._Период
				ORDER BY TradeChanel._Период DESC)
			, '00000000000000000000000000000000') AS TradeChanelID					-- ID канала торговли
	,CONVERT(varchar(32), RegSales.Номенклатура, 2) AS GoodID						-- ID номенклатуры
	,RegSales.Количество AS QuantityBase											-- Количество в базовых единицах измерения
	,ROUND(RegSales.Количество * (
									SELECT TOP 1
										CASE
											WHEN ISNULL(MeasuresUnit.Коэффициент, 0) = 0 THEN 0
											ELSE 1 / MeasuresUnit.Коэффициент
										END
									FROM dbo.Справочник_ЕдиницыИзмерения AS MeasuresUnit	-- Справочник.ЕдиницыИзмерения
									INNER JOIN dbo.Справочник_КлассификаторЕдиницИзмерения AS Class ON MeasuresUnit.БазоваяЕдиница = Class.Ссылка
																										AND Class.Наименование LIKE 'шт%'-- [шт]
									WHERE MeasuresUnit.Владелец = Goods.Ссылка
								), 0, 1) AS QuantityUnit							-- Количество в [шт]
	,ROUND(RegSales.Количество * (
									SELECT TOP 1
										CASE
											WHEN ISNULL(MeasuresUnit.Коэффициент, 0) = 0 THEN 0
											ELSE 1 / MeasuresUnit.Коэффициент
										END
									FROM dbo.Справочник_ЕдиницыИзмерения AS MeasuresUnit	-- Справочник.ЕдиницыИзмерения
									INNER JOIN dbo.Справочник_КлассификаторЕдиницИзмерения AS Class ON MeasuresUnit.БазоваяЕдиница = Class.Ссылка
																										AND Class.Наименование LIKE 'кор%'-- [кор]
									WHERE MeasuresUnit.Владелец = Goods.Ссылка
								), 0, 1)  AS QuantityBox							-- Количество в [кор]
	,ROUND(RegSales.Количество * (
									SELECT TOP 1
										CASE
											WHEN ISNULL(MeasuresUnit.Коэффициент, 0) = 0 THEN 0
											ELSE 1 / MeasuresUnit.Коэффициент
										END
									FROM dbo.Справочник_ЕдиницыИзмерения AS MeasuresUnit	-- Справочник.ЕдиницыИзмерения
									INNER JOIN dbo.Справочник_КлассификаторЕдиницИзмерения AS Class ON MeasuresUnit.БазоваяЕдиница = Class.Ссылка
																										AND Class.Наименование LIKE 'бл%'-- [бл]
									WHERE MeasuresUnit.Владелец = Goods.Ссылка
								), 0, 1)  AS QuantityBlock							-- Количество в [бл]
	,ISNULL(MeasuresBase.Объем, 0) * RegSales.Количество AS Value					-- Объем
	,ISNULL(MeasuresBase.ВесБрутто, 0) * RegSales.Количество AS WeightGross			-- Вес брутто
	,ISNULL(MeasuresBase.ВесНетто, 0) * RegSales.Количество AS WeightNet			-- Вес брутто
	,RegSales.СуммаНДС AS AmountVAT													-- Сумма НДС
	,RegSales.СуммаБезСкидки AS AmountWithoutDiscount								-- Сумма без скидки
	,RegSales.Сумма AS Amount														-- Сумма
	,(	SELECT TOP 1
			ISNULL(Cost.Сумма, 0) AS Ammount
		FROM РегистрСведений_Срезы AS Cost					-- РегистрСведений.Срезы
		WHERE Cost.Активность = 0x01
			AND Cost.Номенклатура = RegSales.Номенклатура
			AND Cost._Период <= RegSales._Период
		ORDER BY Cost._Период DESC
	) * RegSales.Количество AS Cost						-- Сумма себестоимости
	,(	SELECT TOP 1
			ISNULL(Price.Цена, 0) AS InputPrice
		FROM dbo.РегистрСведений_ЦеныНоменклатуры AS Price	-- РегистрСведений.ЦеныНоменклатуры
		INNER JOIN dbo.Справочник_ТипыЦенНоменклатуры AS PriceType ON PriceType.Ссылка = Price.ТипЦены
																		AND PriceType.ИмяПредопределенныхДанных = 0x9688769FCF7C991545B04E324B1591F5
		WHERE Price.Номенклатура = RegSales.Номенклатура
			AND Price._Период <= RegSales._Период
		ORDER BY Price._Период DESC
	) * RegSales.Количество AS AmountInInputPrices		-- Сумма во входных ценах
FROM dbo.РегистрНакопления_Продажи AS RegSales																		-- РегистрНакопления.Продажи
LEFT JOIN dbo.Справочник_Номенклатура AS Goods ON Goods.Ссылка = RegSales.Номенклатура								-- Справочник.Номенклатура
LEFT JOIN dbo.Справочник_ЕдиницыИзмерения AS MeasuresBase ON MeasuresBase.Ссылка = Goods.БазоваяЕдиницаИзмерения	-- Справочник.ЕдиницыИзмерения
WHERE RegSales.Активность = 0x01
	AND CAST(RegSales._Период AS date) BETWEEN '2014-12-10' AND '2014-12-10'

GO





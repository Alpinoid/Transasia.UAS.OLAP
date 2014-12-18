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
	DATEADD(year, -2000, CAST(RegSales._Period AS date)) AS TransactionDate		-- Дата операции
	,CONVERT(varchar(32), RegSales._RecorderRRef, 2) AS DocumentID				-- ID документа
	,CONVERT(varchar(32), RegSales._Fld2034RRef, 2) AS SalesDocumentID			-- ID документа продажи
	,CONVERT(varchar(32), RegSales._Fld2037RRef, 2) AS TransactionTypeID		-- ID типа операции
	,CONVERT(varchar(32), RegSales._Fld2032RRef, 2) AS BusinessID				-- ID направления бизнеса
	,CONVERT(varchar(32), RegSales._Fld2030RRef, 2) AS CompanyID				-- ID организации
	,CONVERT(varchar(32), RegSales._Fld2031RRef, 2) AS BranchID					-- ID филиала
	,CONVERT(varchar(32), RegSales._Fld2106RRef, 2) AS StorehouseID				-- ID склада
	,CONVERT(varchar(32), RegSales._Fld2028RRef, 2) AS CustomerID				-- ID контрагента
	,CONVERT(varchar(32), RegSales._Fld2029RRef, 2) AS TardeShopID				-- ID точки доставки (продажи)
	,CONVERT(varchar(32), RegSales._Fld2033RRef, 2) AS CreditLineID				-- ID кредитного направления
	,CONVERT(varchar(32), RegSales._Fld2035RRef, 2) AS RouteID					-- ID марушрта (торгового представителя)
	,CONVERT(varchar(32), RegSales._Fld2036RRef, 2) AS AgentID					-- ID торгового агента (сотрудника)
	,CONVERT(varchar(32), RegSales._Fld2243RRef, 2) AS TypePriceID				-- ID типа цены
	,CONVERT(varchar(32), RegSales._Fld2027RRef, 2) AS GoodID					-- ID номенклатуры
	,RegSales._Fld2038 AS Quantity												-- Количество в базовых единицах измерения (шт.)
	,ROUND(RegSales._Fld2038/(CASE
								WHEN Units._Fld152 = 0 THEN 1
								ELSE ISNULL(Units._Fld152, 1)
							END), 0, 1) AS QuantityInDeliveryUnits				-- Количество в единицах поступления (кор.)
	,RegSales._Fld2039 AS AmountVAT												-- Сумма НДС
	,RegSales._Fld2040 AS AmountWithoutDiscount									-- Сумма без скидки
	,RegSales._Fld2041 AS Amount												-- Сумма
	,(SELECT TOP 1
		Cost._Fld1587 AS Ammount
		FROM dbo._InfoRg1585 AS Cost
		WHERE Cost._Active = 0x01
		AND Cost._Fld1586RRef = RegSales._Fld2027RRef
		AND Cost._Period <= RegSales._Period
	ORDER BY Cost._Period DESC) * RegSales._Fld2038 AS Cost						-- Сумма себестоимости
FROM dbo._AccumRg2026 AS RegSales WITH(NOLOCK)												-- РегистрНакопления.Продажи
LEFT JOIN dbo._Reference55 AS Goods WITH(NOLOCK) ON Goods._IDRRef = RegSales._Fld2027RRef	-- Справочник.Номенклатура
LEFT JOIN dbo._Reference46 AS Units WITH(NOLOCK) ON Units._IDRRef = Goods._Fld224RRef		-- Справочник.ЕдиницыИзмерения
WHERE RegSales._Active = 0x01





GO



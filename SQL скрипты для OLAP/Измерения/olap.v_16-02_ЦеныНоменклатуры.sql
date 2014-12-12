USE [UASD]
GO

/****** Object:  View [olap].[v_16-02_ЦеныНоменклатуры]    Script Date: 12.12.2014 9:18:42 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO





ALTER VIEW [olap].[v_16-02_ЦеныНоменклатуры]
AS

SELECT
	DATEADD(year, -1*2000, CAST(Cost._Period AS date)) AS Date															-- Дата цены
	,CONVERT(varchar(32), Cost._Fld1586RRef, 2) AS GoodID																-- ID товара
	,(SELECT TOP 1 CONVERT(varchar(32), _IDRRef, 2) FROM dbo.t_PredefinedValue WHERE ID = 38) AS PriceType				-- ID типа цены
	,CONVERT(varchar(8), DATEADD(year, -1*2000, CAST(Cost._Period AS date)), 112)
		+ '_' + CONVERT(varchar(32), Cost._Fld1586RRef, 2)
		+ '_' + (SELECT TOP 1 CONVERT(varchar(32), _IDRRef, 2) FROM dbo.t_PredefinedValue WHERE ID = 38)
		+ '_' + CAST(Cost._Fld1587 AS varchar) AS Decription	-- Определение
	,Cost._Fld1587 AS Price																								-- Цена
FROM dbo._InfoRg1585 AS Cost WITH(NOLOCK)	-- РегистрСведений.Срезы
WHERE Cost._Active = 0x01
UNION ALL
SELECT
	DATEADD(year, -1*2000, CAST(Price._Period AS date)) AS Date															-- Дата цены
	,CONVERT(varchar(32), Price._Fld821RRef, 2) AS GoodID																-- ID товара
	,CONVERT(varchar(32), Price._Fld820RRef, 2) AS PriceType															-- ID типа цены
	,CONVERT(varchar(8), DATEADD(year, -1*2000, CAST(Price._Period AS date)), 112)
		+ '_' + CONVERT(varchar(32), Price._Fld821RRef, 2)
		+ '_' + CONVERT(varchar(32), Price._Fld820RRef, 2)
		+ '_' + CAST(Price._Fld822 AS varchar) AS Decription												-- Определение
	,Price._Fld822 AS Price																								-- Цена
FROM dbo._InfoRg819 AS Price WITH(NOLOCK)	-- РегистрСведений.ЦеныНоменклатуры



GO



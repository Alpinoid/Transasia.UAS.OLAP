USE [UASD]
GO

/****** Object:  View [olap].[v_16_Номенклатура]    Script Date: 11.12.2014 16:49:30 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO





ALTER VIEW [olap].[v_16_Номенклатура]
AS

SELECT
	CONVERT(varchar(32), Element.Ссылка, 2) AS ID								-- ID номенклатуры
	,Element.Артикул AS Article													-- Артикул
	,Element.Наименование AS Description										-- Наименование
	,Element.Артикул + ': ' + Element.Наименование AS ArticleDescription		-- Артикул: Наименовнаие
	,Element.Наименование + ' (' + Element.Артикул + ')' AS DescriptionArticle	-- Наименовнаие (Артикул)
	,ISNULL(Bussiness.Наименование, 'Без направления') AS Business				-- Направление бизнеса
	,CONVERT(varchar(32), Element.Бренд, 2) AS BrandID							-- ID бренда
	,(	SELECT TOP 1
			VATValue.Синоним
		FROM dbo.РегистрСведений_СтавкиНДС
		LEFT JOIN dbo.Перечисление_СтавкиНДС AS VATValue ON VATValue.Значение = dbo.РегистрСведений_СтавкиНДС.НДС
		WHERE dbo.РегистрСведений_СтавкиНДС.Номенклатура = Element.Ссылка
		ORDER BY dbo.РегистрСведений_СтавкиНДС._Период DESC
	) AS VAT																	-- Става НДС
FROM dbo.Справочник_Номенклатура AS Element																	-- Справочник.Номенклатура
LEFT JOIN dbo.Справочник_НаправленияБизнеса AS Bussiness ON Bussiness.Ссылка = Element.НаправлениеБизнеса	-- Справочник.НаправленияБизнеса
WHERE Element.ЭтоГруппа = 0x01


GO



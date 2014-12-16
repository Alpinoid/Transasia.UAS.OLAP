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
	CONVERT(varchar(32), Element._IDRRef, 2) AS ID								-- ID номенклатуры
	,Element._Fld221 AS Article													-- Артикул
	,Element._Description AS Description										-- Наименование
	,Element._Fld221 + ': ' + Element._Description AS ArticleDescription		-- Артикул: Наименовнаие
	,Element._Description + ' (' + Element._Fld221 + ')' AS DescriptionArticle	-- Наименовнаие (Артикул)
	,ISNULL(Bussiness._Description, 'Без направления') AS Business				-- Направление бизнеса
	,CONVERT(varchar(32), Element._Fld223RRef, 2) AS BrandID					-- ID бренда
FROM dbo._Reference55 AS Element WITH(NOLOCK)													-- Справочник.Номенклатура
LEFT JOIN dbo._Reference54 AS Bussiness WITH(NOLOCK) ON Bussiness._IDRRef = Element._Fld165RRef	-- Справочник.НаправленияБизнеса
WHERE Element._Folder = 0x01

GO



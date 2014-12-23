USE [UASD]
GO

/****** Object:  View [olap].[v_09_Склады]    Script Date: 11.12.2014 12:37:49 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO





ALTER VIEW [olap].[v_09_Склады]
AS

SELECT
	CONVERT(varchar(32), Element.Ссылка, 2) AS ID			-- ID склада
	,Element.Наименование AS Description					-- Наименовнаие
	,ISNULL(Branches.Наименование, 'Без филиала') AS Branch	-- Филиал
FROM dbo.Справочник_Склады AS Element												-- Справочник.Склады
LEFT JOIN  dbo.Справочник_Филиалы AS Branches ON Branches.Ссылка = Element.Филиал	-- Справочник.Филиалы
WHERE Element.ЭтоГруппа = 0x01


GO



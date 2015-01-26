SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF OBJECT_ID('[olap].[v_07_Маршруты]','V') IS NOT NULL
	DROP VIEW [olap].[v_07_Маршруты]
GO

CREATE VIEW [olap].[v_07_Маршруты]
AS

SELECT
	CONVERT(varchar(32), Element.Ссылка, 2) AS ID
	,CONVERT(varchar(32), Element.Владелец, 2) AS TeamID
	,Element.Наименование AS Description
	,ISNULL(Branches.Наименование, 'Без филиала') AS Branch
FROM dbo.Справочник_Маршруты AS Element												-- Справочник.Маршруты
LEFT JOIN  dbo.Справочник_Филиалы AS Branches ON Branches.Ссылка = Element.Филиал	-- Справочник.Филиалы
--WHERE Element.ЭтоГруппа = 0x01
--UNION ALL
--SELECT
--	'00000000000000000000000000000000' AS ID
--	,'00000000000000000000000000000000' AS TeamID
--	,'Без маршрута' AS Description
--	,'Без филиала' AS Branch


GO




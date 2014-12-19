USE [UASD]
GO

/****** Object:  View [olap].[v_07_Маршруты]    Script Date: 11.12.2014 11:48:57 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO






ALTER VIEW [olap].[v_07_Маршруты]
AS

SELECT
	CONVERT(varchar(32), Element.Ссылка, 2) AS ID
	,CONVERT(varchar(32), Element.Владелец, 2) AS TeamID
	,Element.Наименование AS Description
	,ISNULL(Branches.Наименование, 'Без филиала') AS Branch
FROM dbo.Справочник_Маршруты AS Element												-- Справочник.Маршруты
LEFT JOIN  dbo.Справочник_Филиалы AS Branches ON Branches.Ссылка = Element.Филиал	-- Справочник.Филиалы
WHERE Element.ЭтоГруппа = 0x01

GO



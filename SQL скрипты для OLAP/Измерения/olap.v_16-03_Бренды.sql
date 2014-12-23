USE [UASD]
GO

/****** Object:  View [olap].[v_16-01-01_КлассификаторЕдиницИзмерения]    Script Date: 12.12.2014 9:06:01 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO





ALTER VIEW [olap].[v_16-03_Бренды]
AS

SELECT
	CONVERT(varchar(32), Ссылка, 2) AS ID	-- ID бренда
	,Наименование AS Description			-- Наименование
FROM dbo.Справочник_Бренды		-- Справочник.Бренды
WHERE Родитель <> 0x00
UNION ALL
SELECT
	'00000000000000000000000000000000' AS ID
	,'Без филиала' AS Description

GO


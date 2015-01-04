SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF OBJECT_ID('[olap].[v_16-03_Бренды]','V') IS NOT NULL
	DROP VIEW [olap].[v_16-03_Бренды]
GO

CREATE VIEW [olap].[v_16-03_Бренды]
AS

SELECT
	CONVERT(varchar(32), Ссылка, 2) AS ID	-- ID бренда
	,Наименование AS Description			-- Наименование
FROM dbo.Справочник_Бренды		-- Справочник.Бренды
WHERE Родитель <> 0x00
UNION ALL
SELECT
	'00000000000000000000000000000000' AS ID
	,'Без бренда' AS Description

GO


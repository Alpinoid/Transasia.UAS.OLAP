SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF OBJECT_ID('[olap].[v_08-01_ТипыКредитныхНаправлений]','V') IS NOT NULL
	DROP VIEW [olap].[v_08-01_ТипыКредитныхНаправлений]
GO

CREATE VIEW [olap].[v_08-01_ТипыКредитныхНаправлений]
AS

SELECT
	CONVERT(varchar(32), Element.Значение, 2) AS ID			-- ID типа кредитного направления
	,Element.Синоним AS Description							-- Наименование	
FROM dbo.Перечисление_ТипыКредитныхНаправлений AS Element	-- Перечисление.ТипыКредитныхНаправлений

GO

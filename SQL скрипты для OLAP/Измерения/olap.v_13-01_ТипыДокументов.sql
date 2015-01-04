SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF OBJECT_ID('[olap].[v_13-01_ТипыДокументов]','V') IS NOT NULL
	DROP VIEW [olap].[v_13-01_ТипыДокументов]
GO

CREATE VIEW [olap].[v_13-01_ТипыДокументов]
AS

SELECT
	CONVERT(varchar(32), Значение, 2) AS ID		-- ID типа документа
	,Синоним AS Description						-- Тип документа
FROM dbo.Перечисление_ТипыДокументов	-- Перечисление.ТипыДокументов



GO

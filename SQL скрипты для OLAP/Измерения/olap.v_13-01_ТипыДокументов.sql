USE [UASD]
GO

/****** Object:  View [olap].[v_13-01_ТипыДокументов]    Script Date: 11.12.2014 16:07:01 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO





ALTER VIEW [olap].[v_13-01_ТипыДокументов]
AS

SELECT
	CONVERT(varchar(32), Значение, 2) AS ID		-- ID типа документа
	,Синоним AS Description						-- Тип документа
FROM dbo.Перечисление_ТипыДокументов	-- Перечисление.ТипыДокументов



GO

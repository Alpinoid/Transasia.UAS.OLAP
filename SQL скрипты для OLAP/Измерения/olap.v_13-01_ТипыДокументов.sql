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
	CONVERT(varchar(32), _IDRRef, 2) AS ID
	,CASE
		WHEN _EnumOrder = 0 THEN 'Список'
		WHEN _EnumOrder = 1 THEN 'Счет-фактура'
	END AS Description
FROM dbo._Enum99 WITH(NOLOCK)	-- Перечисление.ТипыДокументов
WHERE _EnumOrder IN (0, 1)		-- Список или Счет-фактура


GO



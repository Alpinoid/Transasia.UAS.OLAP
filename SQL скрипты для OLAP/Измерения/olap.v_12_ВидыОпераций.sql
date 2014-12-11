USE [UASD]
GO

/****** Object:  View [olap].[v_12_ВидыОпераций]    Script Date: 11.12.2014 13:47:05 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO





ALTER VIEW [olap].[v_12_ВидыОпераций]
AS

SELECT
	CONVERT(varchar(32), _IDRRef, 2) AS ID
	,CASE
		WHEN _EnumOrder = 5 THEN 'Возврат'
		WHEN _EnumOrder = 12 THEN 'Продажа'
	END AS Description
FROM dbo._Enum105 WITH(NOLOCK)	-- Перечисление.ХозяйственныеОперации
WHERE _EnumOrder IN (5, 12)		-- Возврат или Продажа

GO



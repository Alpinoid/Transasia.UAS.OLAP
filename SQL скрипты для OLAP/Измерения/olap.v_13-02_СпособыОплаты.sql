USE [UASD]
GO

/****** Object:  View [olap].[v_13-02_СпособыОплаты]    Script Date: 11.12.2014 16:16:38 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO





ALTER VIEW [olap].[v_13-02_СпособыОплаты]
AS

SELECT
	CONVERT(varchar(32), _IDRRef, 2) AS ID
	,CASE
		WHEN _EnumOrder = 0 THEN 'Банк'
		WHEN _EnumOrder = 1 THEN 'Касса'
	END AS Description
FROM dbo._Enum94 WITH(NOLOCK)	-- Перечисление.СпособыОплаты
WHERE _EnumOrder IN (0, 1)		-- Банк или Касса


GO



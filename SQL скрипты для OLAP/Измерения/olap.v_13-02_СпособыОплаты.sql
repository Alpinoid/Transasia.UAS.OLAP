USE [UASD]
GO

/****** Object:  View [olap].[v_13-02_—пособыќплаты]    Script Date: 11.12.2014 16:16:38 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO





ALTER VIEW [olap].[v_13-02_—пособыќплаты]
AS

SELECT
	CONVERT(varchar(32), «начение, 2) AS ID		-- ID способа оплаты
	,—иноним AS Description						-- —пособ оплаты
FROM dbo.ѕеречисление_—пособыќплаты	-- ѕеречисление.—пособыќплаты



GO



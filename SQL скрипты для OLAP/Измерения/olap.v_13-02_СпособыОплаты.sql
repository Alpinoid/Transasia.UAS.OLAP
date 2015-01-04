SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF OBJECT_ID('[olap].[v_13-02_—пособыќплаты]','V') IS NOT NULL
	DROP VIEW [olap].[v_13-02_—пособыќплаты]
GO

CREATE VIEW [olap].[v_13-02_—пособыќплаты]
AS

SELECT
	CONVERT(varchar(32), «начение, 2) AS ID		-- ID способа оплаты
	,—иноним AS Description						-- —пособ оплаты
FROM dbo.ѕеречисление_—пособыќплаты	-- ѕеречисление.—пособыќплаты



GO



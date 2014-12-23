USE [UASD]
GO

/****** Object:  View [olap].[v_12_¬идыќпераций]    Script Date: 11.12.2014 13:47:05 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO





ALTER VIEW [olap].[v_12_¬идыќпераций]
AS

SELECT
	CONVERT(varchar(32), «начение, 2) AS ID	-- ID хоз€йственной операции
	,—иноним AS Description					-- ¬ид операции
FROM dbo.ѕеречисление_’оз€йственныеќперации	-- ѕеречисление.’оз€йственныеќперации

GO


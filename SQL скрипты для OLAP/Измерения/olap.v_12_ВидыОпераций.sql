SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF OBJECT_ID('[olap].[v_12_¬идыќпераций]','V') IS NOT NULL
	DROP VIEW [olap].[v_12_¬идыќпераций]
GO

CREATE VIEW [olap].[v_12_¬идыќпераций]
AS

SELECT
	CONVERT(varchar(32), «начение, 2) AS ID	-- ID хоз€йственной операции
	,—иноним AS Description					-- ¬ид операции
FROM dbo.ѕеречисление_’оз€йственныеќперации	-- ѕеречисление.’оз€йственныеќперации

GO


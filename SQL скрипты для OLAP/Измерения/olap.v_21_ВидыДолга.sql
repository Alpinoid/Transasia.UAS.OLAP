SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF OBJECT_ID('[olap].[v_21_ВидыДолга]','V') IS NOT NULL
	DROP VIEW [olap].[v_21_ВидыДолга]
GO

CREATE VIEW [olap].[v_21_ВидыДолга]
AS

SELECT
	ID AS ID
	,ТипДолга AS Description
FROM [ReportingDatabase].dbo.t_TypesOfDebt


GO
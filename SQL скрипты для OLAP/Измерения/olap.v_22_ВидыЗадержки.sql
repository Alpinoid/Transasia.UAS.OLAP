SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF OBJECT_ID('[olap].[v_22_ВидыЗадержки]','V') IS NOT NULL
	DROP VIEW [olap].[v_22_ВидыЗадержки]
GO

CREATE VIEW [olap].[v_22_ВидыЗадержки]
AS

SELECT
	ID AS ID
	,ВидЗадержки AS Description
FROM [ReportingDatabase].dbo.t_TypesOfDelay


GO
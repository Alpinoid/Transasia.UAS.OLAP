SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF OBJECT_ID('[olap].[v_21_���������]','V') IS NOT NULL
	DROP VIEW [olap].[v_21_���������]
GO

CREATE VIEW [olap].[v_21_���������]
AS

SELECT
	ID AS ID
	,�������� AS Description
FROM [ReportingDatabase].dbo.t_TypesOfDebt


GO
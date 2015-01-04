SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF OBJECT_ID('[olap].[v_04_Организации]','V') IS NOT NULL
	DROP VIEW [olap].[v_04_Организации]
GO

CREATE VIEW [olap].[v_04_Организации]
AS

SELECT
	CONVERT(varchar(32), Ссылка, 2) AS ID
	,НаименованиеСокращенное AS Description
FROM dbo.Справочник_Организации			-- Справочник.Организации


GO



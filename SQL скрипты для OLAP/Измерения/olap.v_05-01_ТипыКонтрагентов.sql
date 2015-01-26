SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF OBJECT_ID('[olap].[v_05-01_ТипыКонтрагентов]','V') IS NOT NULL
	DROP VIEW [olap].[v_05-01_ТипыКонтрагентов]
GO

CREATE VIEW [olap].[v_05-01_ТипыКонтрагентов]
AS

SELECT
	CONVERT(varchar(32), CustomerType.Ссылка, 2) AS ID	-- ID типа контрагента
	,CustomerType.Наименование AS Description			-- Наименовнаие		
FROM dbo.Справочник_ТипыКонтрагента AS CustomerType		-- Справочник.ТипыКонтрагента

GO



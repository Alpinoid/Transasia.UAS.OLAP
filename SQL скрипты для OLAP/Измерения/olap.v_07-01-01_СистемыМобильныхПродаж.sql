SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF OBJECT_ID('[olap].[v_07-01-01_СистемыМобильныхПродаж]','V') IS NOT NULL
	DROP VIEW [olap].[v_07-01-01_СистемыМобильныхПродаж]
GO

CREATE VIEW [olap].[v_07-01-01_СистемыМобильныхПродаж]
AS

SELECT
	CONVERT(varchar(32), Element.Ссылка, 2) AS ID	-- ID
	,Element.Наименование AS Description			-- Наименование
FROM dbo.Справочник_СистемыМобильныхПродаж AS Element			-- Справочник.СистемыМобильныхПродаж

GO



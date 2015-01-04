SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF OBJECT_ID('[olap].[v_02_НаправленияБизнеса]','V') IS NOT NULL
	DROP VIEW [olap].[v_02_НаправленияБизнеса]
GO

CREATE VIEW [olap].[v_02_НаправленияБизнеса]
AS

SELECT 
	CONVERT(varchar(32), Element.Ссылка, 2) AS ID	-- ID направления бизнеса
	,Element.Наименование AS Description			-- Наименование направления бизнеса
FROM dbo.Справочник_НаправленияБизнеса AS Element	-- Справочник.НаправленияБизнеса

GO
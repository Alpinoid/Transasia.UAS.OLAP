USE [UASD]
GO

/****** Object:  View [olap].[v_02_НаправленияБизнеса]    Script Date: 10.12.2014 17:12:34 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO





ALTER VIEW [olap].[v_02_НаправленияБизнеса]
AS

SELECT 
	CONVERT(varchar(32), Element.Ссылка, 2) AS ID	-- ID направления бизнеса
	,Element.Наименование AS Description			-- Наименование направления бизнеса
FROM dbo.Справочник_НаправленияБизнеса AS Element	-- Справочник.НаправленияБизнеса

GO



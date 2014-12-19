USE [UASD]
GO

/****** Object:  View [olap].[v_04_Организации]    Script Date: 10.12.2014 17:23:56 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO






ALTER VIEW [olap].[v_04_Организации]
AS

SELECT
	CONVERT(varchar(32), Ссылка, 2) AS ID
	,НаименованиеСокращенное AS Description
FROM dbo.Справочник_Организации WITH(NOLOCK)			-- Справочник.Организации


GO



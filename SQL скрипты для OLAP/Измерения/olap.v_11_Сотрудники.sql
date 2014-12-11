USE [UASD]
GO

/****** Object:  View [olap].[v_11_Сотрудники]    Script Date: 11.12.2014 13:18:43 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO





ALTER VIEW [olap].[v_11_Сотрудники]
AS

SELECT
	CONVERT(varchar(32), Element._IDRRef, 2) AS ID
	,Element._Description AS Description
FROM dbo._Reference64 AS Element WITH(NOLOCK)	-- Справочник.Сотрудники
WHERE Element._Folder = 0x01


GO



USE [UASD]
GO

/****** Object:  View [olap].[v_16-01-01_КлассификаторЕдиницИзмерения]    Script Date: 12.12.2014 9:06:01 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO





ALTER VIEW [olap].[v_16-01-01_КлассификаторЕдиницИзмерения]
AS

SELECT
	CONVERT(varchar(32), _IDRRef, 2) AS ID	-- ID клпссификатора
	,_Description AS Description			-- Наименовнаие
	,_Fld164 AS FullName					-- Полное наименовнаие
FROM dbo._Reference48 WITH(NOLOCK)	-- Справочник.КлассификаторЕдиницИзмерения
WHERE _Marked = 0



GO



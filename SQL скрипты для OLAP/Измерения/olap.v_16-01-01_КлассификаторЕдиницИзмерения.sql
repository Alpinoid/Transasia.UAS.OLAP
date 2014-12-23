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
	CONVERT(varchar(32), Ссылка, 2) AS ID	-- ID классификатора
	,Наименование AS Description			-- Наименовнаие
	,ПолноеНаименование AS FullName			-- Полное наименовнаие
FROM dbo.Справочник_КлассификаторЕдиницИзмерения	-- Справочник.КлассификаторЕдиницИзмерения
WHERE ПометкаУдаления = 0



GO



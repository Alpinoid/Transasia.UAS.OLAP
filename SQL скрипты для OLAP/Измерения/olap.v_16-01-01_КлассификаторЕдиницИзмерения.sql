SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF OBJECT_ID('[olap].[v_16-01-01_КлассификаторЕдиницИзмерения]','V') IS NOT NULL
	DROP VIEW [olap].[v_16-01-01_КлассификаторЕдиницИзмерения]
GO

CREATE VIEW [olap].[v_16-01-01_КлассификаторЕдиницИзмерения]
AS

SELECT
	CONVERT(varchar(32), Ссылка, 2) AS ID	-- ID классификатора
	,Наименование AS Description			-- Наименовнаие
	,ПолноеНаименование AS FullName			-- Полное наименовнаие
FROM dbo.Справочник_КлассификаторЕдиницИзмерения	-- Справочник.КлассификаторЕдиницИзмерения
WHERE ПометкаУдаления = 0



GO



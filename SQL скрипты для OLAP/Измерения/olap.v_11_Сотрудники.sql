SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF OBJECT_ID('[olap].[v_11_Сотрудники]','V') IS NOT NULL
	DROP VIEW [olap].[v_11_Сотрудники]
GO

CREATE VIEW [olap].[v_11_Сотрудники]
AS

SELECT
	CONVERT(varchar(32), Element.Ссылка, 2) AS ID	-- ID сштрудника
	,Element.Наименование AS Description			-- ФИО
FROM dbo.Справочник_Сотрудники AS Element	-- Справочник.Сотрудники
WHERE Element.ЭтоГруппа = 0x01


GO



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
	CONVERT(varchar(32), Element.Ссылка, 2) AS ID	-- ID сштрудника
	,Element.Наименование AS Description			-- ФИО
FROM dbo.Справочник_Сотрудники AS Element	-- Справочник.Сотрудники
WHERE Element.ЭтоГруппа = 0x01


GO



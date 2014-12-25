USE [UASD]
GO

/****** Object:  View [olap].[v_16_Номенклатура]    Script Date: 11.12.2014 16:49:30 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO





ALTER VIEW [olap].[v_16-04_CSKU]
AS

SELECT
	CONVERT(varchar(32), Element.Ссылка, 2) AS ID								-- ID CSKU
	,Element.Наименование AS Description										-- Наименование

FROM dbo.Справочник_CSKU AS Element																	-- Справочник.Номенклатура
WHERE Element.ЭтоГруппа = 0x01

SELECT * FROM dbo.Справочник_CSKU
WHERE Родитель = 0x00

WITH CSKU AS (
	SELECT
		0 AS GroupId
		,Ссылка AS ID
		,Код AS Code
		,Наименование AS Description
	FROM dbo.Справочник_CSKU
	WHERE Родитель = 0x00 AND ПометкаУдаления = 0x0
	UNION ALL
	SELECT
		CSKU.GroupId + 1 AS GroupId
		,CSKU1.Ссылка AS ID
		,CSKU1.Код AS Code
		,CSKU1.Наименование AS Description
	FROM CSKU AS CSKU
	inner join [dbo].[Справочник_CSKU] CSKU1 with (nolock)
	on CSKU1.Родитель = CSKU.ID-- and CSKU.ПометкаУдаления=0
)

SELECT
	*
FROM CSKU
WHERE CSKU.GroupId = 0
OPTION (MAXRECURSION 10000)


GO



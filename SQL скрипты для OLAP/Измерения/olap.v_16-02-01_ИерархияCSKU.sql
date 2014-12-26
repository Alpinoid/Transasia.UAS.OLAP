USE [UASD]
GO

/****** Object:  View [olap].[v_16-02-01_HierarchyCSKU]    Script Date: 26.12.2014 17:48:35 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO






ALTER VIEW [olap].[v_16-02-01_ИерархияCSKU]
AS

SELECT
	CASE
		WHEN SUM(1) OVER (PARTITION BY CONVERT(varchar(32), Parent7.Ссылка, 2)) <=1 THEN CONVERT(varchar(32), Parent7.Ссылка, 2)
		WHEN SUM(1) OVER (PARTITION BY CONVERT(varchar(32), Parent6.Ссылка, 2)) <=1 THEN CONVERT(varchar(32), Parent6.Ссылка, 2)
		WHEN SUM(1) OVER (PARTITION BY CONVERT(varchar(32), Parent5.Ссылка, 2)) <=1 THEN CONVERT(varchar(32), Parent5.Ссылка, 2)
		WHEN SUM(1) OVER (PARTITION BY CONVERT(varchar(32), Parent4.Ссылка, 2)) <=1 THEN CONVERT(varchar(32), Parent4.Ссылка, 2)
		WHEN SUM(1) OVER (PARTITION BY CONVERT(varchar(32), Parent3.Ссылка, 2)) <=1 THEN CONVERT(varchar(32), Parent3.Ссылка, 2)
		WHEN SUM(1) OVER (PARTITION BY CONVERT(varchar(32), Parent2.Ссылка, 2)) <=1 THEN CONVERT(varchar(32), Parent2.Ссылка, 2)
		WHEN SUM(1) OVER (PARTITION BY CONVERT(varchar(32), Parent1.Ссылка, 2)) <=1 THEN CONVERT(varchar(32), Parent1.Ссылка, 2)
		ELSE CONVERT(varchar(32), Parent0.Ссылка, 2)
	END AS ID																	-- ID иерархии CSKU
	,Parent0.Код AS Parent0_Code												-- Код родителя уровень 0
	,Parent0.Наименование AS Parent0_Description								-- Наименование родителя уровень 0
	,CASE
		WHEN SUM(1) OVER (PARTITION BY Parent1.Ссылка) <=0 THEN NULL
		ELSE Parent1.Код
	END AS Parent1_Code															-- Код родителя уровень уровень 1
	,CASE
		WHEN SUM(1) OVER (PARTITION BY Parent1.Ссылка) <=0 THEN NULL
		ELSE Parent1.Наименование
	END AS Parent1_Description													-- Наименование родителя уровень 1
	,CASE
		WHEN SUM(1) OVER (PARTITION BY Parent2.Ссылка) <=0 THEN NULL
		ELSE Parent2.Код
	END AS Parent2_Code															-- Код родителя уровень уровень 2
	,CASE
		WHEN SUM(1) OVER (PARTITION BY Parent2.Ссылка) <=0 THEN NULL
		ELSE Parent2.Наименование
	END AS Parent2_Description													-- Наименование родителя уровень 2
	,CASE
		WHEN SUM(1) OVER (PARTITION BY Parent3.Ссылка) <=0 THEN NULL
		ELSE Parent3.Код
	END AS Parent3_Code															-- Код родителя уровень уровень 3
	,CASE
		WHEN SUM(1) OVER (PARTITION BY Parent3.Ссылка) <=0 THEN NULL
		ELSE Parent3.Наименование
	END AS Parent3_Description													-- Наименование родителя уровень 3
	,CASE
		WHEN SUM(1) OVER (PARTITION BY Parent4.Ссылка) <=0 THEN NULL
		ELSE Parent4.Код
	END AS Parent4_Code															-- Код родителя уровень уровень 4
	,CASE
		WHEN SUM(1) OVER (PARTITION BY Parent4.Ссылка) <=0 THEN NULL
		ELSE Parent4.Наименование	
	END AS Parent4_Description													-- Наименование родителя уровень 4
	,CASE
		WHEN SUM(1) OVER (PARTITION BY Parent5.Ссылка) <=0 THEN NULL
		ELSE Parent5.Код
	END AS Parent5_Code															-- Код родителя уровень уровень 5
	,CASE
		WHEN SUM(1) OVER (PARTITION BY Parent5.Ссылка) <=0 THEN NULL
		ELSE Parent5.Наименование	
	END AS Parent5_Description													-- Наименование родителя уровень 5
	,CASE
		WHEN SUM(1) OVER (PARTITION BY Parent6.Ссылка) <=0 THEN NULL
		ELSE Parent6.Код
	END AS Parent6_Code															-- Код родителя уровень уровень 6
	,CASE
		WHEN SUM(1) OVER (PARTITION BY Parent6.Ссылка) <=0 THEN NULL
		ELSE Parent6.Наименование	
	END AS Parent6_Description													-- Наименование родителя уровень 6
	,CASE
		WHEN SUM(1) OVER (PARTITION BY Parent7.Ссылка) <=0 THEN NULL
		ELSE Parent7.Код
	END AS Parent7_Code															-- Код родителя уровень уровень 7
	,CASE
		WHEN SUM(1) OVER (PARTITION BY Parent7.Ссылка) <=0 THEN NULL
		ELSE Parent7.Наименование	
	END AS Parent7_Description													-- Наименование родителя уровень 7
FROM dbo.Справочник_CSKU AS Parent0												-- Справочник.Справочник_CSKU
LEFT JOIN dbo.Справочник_CSKU AS Parent1 ON Parent1.Родитель = Parent0.Ссылка AND Parent1.ЭтоГруппа = 0x00
LEFT JOIN dbo.Справочник_CSKU AS Parent2 ON Parent2.Родитель = Parent1.Ссылка AND Parent2.ЭтоГруппа = 0x00
LEFT JOIN dbo.Справочник_CSKU AS Parent3 ON Parent3.Родитель = Parent2.Ссылка AND Parent3.ЭтоГруппа = 0x00
LEFT JOIN dbo.Справочник_CSKU AS Parent4 ON Parent4.Родитель = Parent3.Ссылка AND Parent4.ЭтоГруппа = 0x00
LEFT JOIN dbo.Справочник_CSKU AS Parent5 ON Parent5.Родитель = Parent4.Ссылка AND Parent5.ЭтоГруппа = 0x00
LEFT JOIN dbo.Справочник_CSKU AS Parent6 ON Parent6.Родитель = Parent5.Ссылка AND Parent6.ЭтоГруппа = 0x00
LEFT JOIN dbo.Справочник_CSKU AS Parent7 ON Parent7.Родитель = Parent6.Ссылка AND Parent7.ЭтоГруппа = 0x00
WHERE Parent0.Родитель = 0x00 AND Parent0.ЭтоГруппа = 0x00


GO



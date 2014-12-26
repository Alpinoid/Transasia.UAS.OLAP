USE [UASD]
GO

/****** Object:  View [olap].[v_16-02-01_HierarchyCSKU]    Script Date: 26.12.2014 17:48:35 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO






ALTER VIEW [olap].[v_16-02-01_��������CSKU]
AS

SELECT
	CASE
		WHEN SUM(1) OVER (PARTITION BY CONVERT(varchar(32), Parent7.������, 2)) <=1 THEN CONVERT(varchar(32), Parent7.������, 2)
		WHEN SUM(1) OVER (PARTITION BY CONVERT(varchar(32), Parent6.������, 2)) <=1 THEN CONVERT(varchar(32), Parent6.������, 2)
		WHEN SUM(1) OVER (PARTITION BY CONVERT(varchar(32), Parent5.������, 2)) <=1 THEN CONVERT(varchar(32), Parent5.������, 2)
		WHEN SUM(1) OVER (PARTITION BY CONVERT(varchar(32), Parent4.������, 2)) <=1 THEN CONVERT(varchar(32), Parent4.������, 2)
		WHEN SUM(1) OVER (PARTITION BY CONVERT(varchar(32), Parent3.������, 2)) <=1 THEN CONVERT(varchar(32), Parent3.������, 2)
		WHEN SUM(1) OVER (PARTITION BY CONVERT(varchar(32), Parent2.������, 2)) <=1 THEN CONVERT(varchar(32), Parent2.������, 2)
		WHEN SUM(1) OVER (PARTITION BY CONVERT(varchar(32), Parent1.������, 2)) <=1 THEN CONVERT(varchar(32), Parent1.������, 2)
		ELSE CONVERT(varchar(32), Parent0.������, 2)
	END AS ID																	-- ID �������� CSKU
	,Parent0.��� AS Parent0_Code												-- ��� �������� ������� 0
	,Parent0.������������ AS Parent0_Description								-- ������������ �������� ������� 0
	,CASE
		WHEN SUM(1) OVER (PARTITION BY Parent1.������) <=0 THEN NULL
		ELSE Parent1.���
	END AS Parent1_Code															-- ��� �������� ������� ������� 1
	,CASE
		WHEN SUM(1) OVER (PARTITION BY Parent1.������) <=0 THEN NULL
		ELSE Parent1.������������
	END AS Parent1_Description													-- ������������ �������� ������� 1
	,CASE
		WHEN SUM(1) OVER (PARTITION BY Parent2.������) <=0 THEN NULL
		ELSE Parent2.���
	END AS Parent2_Code															-- ��� �������� ������� ������� 2
	,CASE
		WHEN SUM(1) OVER (PARTITION BY Parent2.������) <=0 THEN NULL
		ELSE Parent2.������������
	END AS Parent2_Description													-- ������������ �������� ������� 2
	,CASE
		WHEN SUM(1) OVER (PARTITION BY Parent3.������) <=0 THEN NULL
		ELSE Parent3.���
	END AS Parent3_Code															-- ��� �������� ������� ������� 3
	,CASE
		WHEN SUM(1) OVER (PARTITION BY Parent3.������) <=0 THEN NULL
		ELSE Parent3.������������
	END AS Parent3_Description													-- ������������ �������� ������� 3
	,CASE
		WHEN SUM(1) OVER (PARTITION BY Parent4.������) <=0 THEN NULL
		ELSE Parent4.���
	END AS Parent4_Code															-- ��� �������� ������� ������� 4
	,CASE
		WHEN SUM(1) OVER (PARTITION BY Parent4.������) <=0 THEN NULL
		ELSE Parent4.������������	
	END AS Parent4_Description													-- ������������ �������� ������� 4
	,CASE
		WHEN SUM(1) OVER (PARTITION BY Parent5.������) <=0 THEN NULL
		ELSE Parent5.���
	END AS Parent5_Code															-- ��� �������� ������� ������� 5
	,CASE
		WHEN SUM(1) OVER (PARTITION BY Parent5.������) <=0 THEN NULL
		ELSE Parent5.������������	
	END AS Parent5_Description													-- ������������ �������� ������� 5
	,CASE
		WHEN SUM(1) OVER (PARTITION BY Parent6.������) <=0 THEN NULL
		ELSE Parent6.���
	END AS Parent6_Code															-- ��� �������� ������� ������� 6
	,CASE
		WHEN SUM(1) OVER (PARTITION BY Parent6.������) <=0 THEN NULL
		ELSE Parent6.������������	
	END AS Parent6_Description													-- ������������ �������� ������� 6
	,CASE
		WHEN SUM(1) OVER (PARTITION BY Parent7.������) <=0 THEN NULL
		ELSE Parent7.���
	END AS Parent7_Code															-- ��� �������� ������� ������� 7
	,CASE
		WHEN SUM(1) OVER (PARTITION BY Parent7.������) <=0 THEN NULL
		ELSE Parent7.������������	
	END AS Parent7_Description													-- ������������ �������� ������� 7
FROM dbo.����������_CSKU AS Parent0												-- ����������.����������_CSKU
LEFT JOIN dbo.����������_CSKU AS Parent1 ON Parent1.�������� = Parent0.������ AND Parent1.��������� = 0x00
LEFT JOIN dbo.����������_CSKU AS Parent2 ON Parent2.�������� = Parent1.������ AND Parent2.��������� = 0x00
LEFT JOIN dbo.����������_CSKU AS Parent3 ON Parent3.�������� = Parent2.������ AND Parent3.��������� = 0x00
LEFT JOIN dbo.����������_CSKU AS Parent4 ON Parent4.�������� = Parent3.������ AND Parent4.��������� = 0x00
LEFT JOIN dbo.����������_CSKU AS Parent5 ON Parent5.�������� = Parent4.������ AND Parent5.��������� = 0x00
LEFT JOIN dbo.����������_CSKU AS Parent6 ON Parent6.�������� = Parent5.������ AND Parent6.��������� = 0x00
LEFT JOIN dbo.����������_CSKU AS Parent7 ON Parent7.�������� = Parent6.������ AND Parent7.��������� = 0x00
WHERE Parent0.�������� = 0x00 AND Parent0.��������� = 0x00


GO



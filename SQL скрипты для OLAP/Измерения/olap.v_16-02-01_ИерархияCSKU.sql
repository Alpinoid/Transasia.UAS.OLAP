SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF OBJECT_ID('[olap].[v_16-02-01_��������CSKU]','V') IS NOT NULL
	DROP VIEW [olap].[v_16-02-01_��������CSKU]
GO

CREATE VIEW [olap].[v_16-02-01_��������CSKU]
AS

SELECT
	CASE
		WHEN SUM(1) OVER (PARTITION BY Parent0.������) = 1 THEN CONVERT(varchar(32), Parent0.������, 2)
		WHEN SUM(1) OVER (PARTITION BY Parent1.������) = 1 THEN CONVERT(varchar(32), Parent1.������, 2)
		WHEN SUM(1) OVER (PARTITION BY Parent2.������) <= 1 THEN CONVERT(varchar(32), Parent2.������, 2)
		WHEN SUM(1) OVER (PARTITION BY Parent3.������) <= 1 THEN CONVERT(varchar(32), Parent3.������, 2)
		WHEN SUM(1) OVER (PARTITION BY Parent4.������) <= 1 THEN CONVERT(varchar(32), Parent4.������, 2)
		WHEN SUM(1) OVER (PARTITION BY Parent5.������) <= 1 THEN CONVERT(varchar(32), Parent5.������, 2)
		WHEN SUM(1) OVER (PARTITION BY Parent6.������) <= 1 THEN CONVERT(varchar(32), Parent6.������, 2)
	END AS ID											-- ID �������� CSKU
	,Parent0.��� AS Parent0_Code						-- ��� �������� ������� 0
	,Parent0.������������ AS Parent0_Description		-- ������������ �������� ������� 0
	,Parent1.��� AS Parent1_Code						-- ��� �������� ������� ������� 1
	,Parent1.������������ AS Parent1_Description		-- ������������ �������� ������� 1
	,Parent2.��� AS Parent2_Code						-- ��� �������� ������� ������� 2
	,Parent2.������������ AS Parent2_Description		-- ������������ �������� ������� 2
	,Parent3.��� AS Parent3_Code						-- ��� �������� ������� ������� 3
	,Parent3.������������ AS Parent3_Description		-- ������������ �������� ������� 3
	,Parent4.��� AS Parent4_Code						-- ��� �������� ������� ������� 4
	,Parent4.������������ AS Parent4_Description		-- ������������ �������� ������� 4
	,Parent5.��� AS Parent5_Code						-- ��� �������� ������� ������� 5
	,Parent5.������������ AS Parent5_Description		-- ������������ �������� ������� 5
	,Parent6.��� AS Parent6_Code						-- ��� �������� ������� ������� 6
	,Parent6.������������ AS Parent6_Description		-- ������������ �������� ������� 6
FROM dbo.����������_CSKU AS Parent0						-- ����������.����������_CSKU
LEFT JOIN dbo.����������_CSKU AS Parent1 ON Parent1.�������� = Parent0.������ AND Parent1.��������� = 0x00
LEFT JOIN dbo.����������_CSKU AS Parent2 ON Parent2.�������� = Parent1.������ AND Parent2.��������� = 0x00
LEFT JOIN dbo.����������_CSKU AS Parent3 ON Parent3.�������� = Parent2.������ AND Parent3.��������� = 0x00
LEFT JOIN dbo.����������_CSKU AS Parent4 ON Parent4.�������� = Parent3.������ AND Parent4.��������� = 0x00
LEFT JOIN dbo.����������_CSKU AS Parent5 ON Parent5.�������� = Parent4.������ AND Parent5.��������� = 0x00
LEFT JOIN dbo.����������_CSKU AS Parent6 ON Parent6.�������� = Parent5.������ AND Parent6.��������� = 0x00
WHERE Parent0.�������� = 0x00 AND Parent0.��������� = 0x00


GO



SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF OBJECT_ID('[olap].[v_03_�������]','V') IS NOT NULL
	DROP VIEW [olap].[v_03_�������]
GO

CREATE VIEW [olap].[v_03_�������]
AS

SELECT
	CONVERT(varchar(32), Element.������, 2) AS ID
	,Element.������������ AS Description
	,CASE
		WHEN SUM(1) OVER (PARTITION BY Parent.������������) <=1 THEN Element.������������
		ELSE Parent.������������
	END AS ParentDescription
	,CASE
		WHEN SUM(1) OVER (PARTITION BY Parent.������������) <=1 THEN NULL
		ELSE Element.������������
	END AS ChildDescription
FROM dbo.����������_������� AS Element															-- ����������.�������
LEFT JOIN dbo.����������_������� AS Parent ON Parent.������ = Element.��������					-- ����������.������� (��������)
										OR (Parent.������ = Element.������ AND Element.�������� = 0)
--UNION ALL
--SELECT
--	'00000000000000000000000000000000' AS ID
--	,'��� �������' AS Description
--	,'��� �������' ParentDescription
--	,'��� �������' ChildDescription


GO



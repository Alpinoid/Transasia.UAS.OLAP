USE [UASD]
GO

/****** Object:  View [olap].[v_03_�������]    Script Date: 10.12.2014 17:17:10 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


ALTER VIEW [olap].[v_15_������������]
AS

SELECT
	CONVERT(varchar(32), Element.������, 2) AS ID
	,CASE
		WHEN SUM(1) OVER (PARTITION BY Parent.������������) <=1 THEN Element.������������
		ELSE Parent.������������
	END AS ParentDescription
	,Element.������������ AS Description
	,Element.������������������������ AS OfficialDescription
	,Element.���New AS Code
	,Element.���ISIS AS ISIS
FROM dbo.����������_������������ AS Element											-- ����������.������������
LEFT JOIN dbo.����������_������������ AS Parent ON Parent.������ = Element.��������	-- ����������.������������ (��������)
										OR (Parent.������ = Element.������ AND Element.�������� = 0)
WHERE Element.�������� <> 0x00  AND Element.��������������� = 0x00


GO



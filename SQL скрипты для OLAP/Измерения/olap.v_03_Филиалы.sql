USE [UASD]
GO

/****** Object:  View [olap].[v_03_�������]    Script Date: 10.12.2014 17:17:10 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



ALTER VIEW [olap].[v_03_�������]
AS

SELECT
	CONVERT(varchar(32), Element._IDRRef, 2) AS ID
	,Element._Description AS Description
	,CASE
		WHEN SUM(1) OVER (PARTITION BY Parent._Description) <=1 THEN Element._Description
		ELSE Parent._Description
	END AS ParentDescription
	,CASE
		WHEN SUM(1) OVER (PARTITION BY Parent._Description) <=1 THEN NULL
		ELSE Element._Description
	END AS ChildDescription
FROM dbo._Reference70 AS Element WITH(NOLOCK)																-- ����������.�������
LEFT JOIN dbo._Reference70 AS Parent WITH(NOLOCK) ON Parent._IDRRef = Element._ParentIDRRef					-- ����������.������� (��������)
										OR (Parent._IDRRef = Element._IDRRef AND Element._ParentIDRRef = 0)


GO



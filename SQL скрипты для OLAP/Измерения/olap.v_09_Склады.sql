USE [UASD]
GO

/****** Object:  View [olap].[v_09_������]    Script Date: 11.12.2014 12:37:49 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO





ALTER VIEW [olap].[v_09_������]
AS

SELECT
	CONVERT(varchar(32), Element._IDRRef, 2) AS ID
	,Element._Description AS Description
	,ISNULL(Branches._Description, '��� �������') AS Branch
FROM dbo._Reference63 AS Element WITH(NOLOCK)													-- ����������.������
LEFT JOIN  dbo._Reference70 AS Branches WITH(NOLOCK) ON Branches._IDRRef = Element._Fld278RRef	-- ����������.�������
WHERE Element._Folder = 0x01


GO



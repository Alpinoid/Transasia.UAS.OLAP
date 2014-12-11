USE [UASD]
GO

/****** Object:  View [olap].[v_07_��������]    Script Date: 11.12.2014 11:48:57 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO






ALTER VIEW [olap].[v_07_��������]
AS

SELECT
	CONVERT(varchar(32), Element._IDRRef, 2) AS ID
	,CONVERT(varchar(32), Element._OwnerIDRRef, 2) AS TeamID
	,Element._Description AS Description
	,ISNULL(Branches._Description, '��� �������') AS Branch
FROM dbo._Reference52 AS Element WITH(NOLOCK)													-- ����������.��������
LEFT JOIN  dbo._Reference70 AS Branches WITH(NOLOCK) ON Branches._IDRRef = Element._Fld213RRef	-- ����������.�������
WHERE Element._Folder = 0x01

GO



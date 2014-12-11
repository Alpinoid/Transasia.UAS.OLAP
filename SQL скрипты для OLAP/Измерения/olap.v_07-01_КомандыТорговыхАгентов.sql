USE [UASD]
GO

/****** Object:  View [olap].[v_07-01_����������������������]    Script Date: 11.12.2014 12:01:25 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO






ALTER VIEW [olap].[v_07-01_����������������������]
AS

SELECT
	CONVERT(varchar(32), Element._IDRRef, 2) AS ID
	,Element._Description AS Description
	,CONVERT(varchar(32), Element._Fld1041RRef, 2) AS SMT_ID
	,ISNULL(Bussiness._Description, '��� �����������') AS Business
FROM dbo._Reference49 AS Element WITH(NOLOCK)													-- ����������.����������������������
LEFT JOIN dbo._Reference54 AS Bussiness WITH(NOLOCK) ON Bussiness._IDRRef = Element._Fld165RRef	-- ����������.������������������
WHERE Element._Folder = 0x01


GO



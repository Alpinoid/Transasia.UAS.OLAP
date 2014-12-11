USE [UASD]
GO

/****** Object:  View [olap].[v_10_�������������������]    Script Date: 11.12.2014 12:51:46 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO





ALTER VIEW [olap].[v_10_�������������������]
AS

SELECT
	CONVERT(varchar(32), Element._IDRRef, 2) AS ID
	,Element._Description AS Description
	,ISNULL(Bussiness._Description, '��� �����������') AS Business
FROM dbo._Reference66 AS Element WITH(NOLOCK)													-- ����������.�������������������
LEFT JOIN dbo._Reference54 AS Bussiness WITH(NOLOCK) ON Bussiness._IDRRef = Element._Fld165RRef	-- ����������.������������������
WHERE Element._Folder = 0x01


GO



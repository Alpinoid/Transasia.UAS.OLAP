USE [UASD]
GO

/****** Object:  View [olap].[v_16_������������]    Script Date: 11.12.2014 16:49:30 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO





ALTER VIEW [olap].[v_16_������������]
AS

SELECT
	CONVERT(varchar(32), Element._IDRRef, 2) AS ID								-- ID ������������
	,Element._Fld221 AS Article													-- �������
	,Element._Description AS Description										-- ������������
	,Element._Fld221 + ': ' + Element._Description AS ArticleDescription		-- �������: ������������
	,Element._Description + ' (' + Element._Fld221 + ')' AS DescriptionArticle	-- ������������ (�������)
	,ISNULL(Bussiness._Description, '��� �����������') AS Business				-- ����������� �������
	,CONVERT(varchar(32), Element._Fld223RRef, 2) AS BrandID					-- ID ������
FROM dbo._Reference55 AS Element WITH(NOLOCK)													-- ����������.������������
LEFT JOIN dbo._Reference54 AS Bussiness WITH(NOLOCK) ON Bussiness._IDRRef = Element._Fld165RRef	-- ����������.������������������
WHERE Element._Folder = 0x01

GO



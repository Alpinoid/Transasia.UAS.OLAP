USE [UASD]
GO

/****** Object:  View [olap].[v_14_���������]    Script Date: 11.12.2014 16:23:43 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO





ALTER VIEW [olap].[v_14_���������]
AS

SELECT
	CONVERT(varchar(32), DocSales._IDRRef, 2) AS ID																-- ID ���������
	,'���������� ������� �'+RTRIM(DocSales._Number)+' �� '
		+ CONVERT(varchar(10), DATEADD(year, -1*2000, CAST(DocSales._Date_Time AS date)), 104) AS Description	-- �������� ���������
	,'���������� �������' AS Document																			-- ��� ���������
	,DATEADD(year, -1*2000, CAST(DocSales._Date_Time AS date)) AS DocDate										-- ���� ���������
	,DocSales._Number AS DocNumber																				-- ����� ���������
FROM dbo._Document81 AS DocSales WITH(NOLOCK)		-- ��������.�����������������
WHERE DocSales._Posted = 0x01						-- ��������
UNION ALL
SELECT
	CONVERT(varchar(32), DocRefunds._IDRRef, 2) AS ID															-- ID ���������
	,'������� ������� �� ���������� �'+RTRIM(DocRefunds._Number)+' �� '
		+ CONVERT(varchar(10), DATEADD(year, -1*2000, CAST(DocRefunds._Date_Time AS date)), 104) AS Description	-- �������� ���������
	,'������� ������� �� ����������' AS Document																-- ��� ���������
	,DATEADD(year, -1*2000, CAST(DocRefunds._Date_Time AS date)) AS DocDate										-- ���� ���������
	,DocRefunds._Number AS DocNumber																			-- ����� ���������
FROM dbo._Document1292 AS DocRefunds WITH(NOLOCK)	-- ��������.��������������������������
WHERE DocRefunds._Posted = 0x01						-- ��������


GO



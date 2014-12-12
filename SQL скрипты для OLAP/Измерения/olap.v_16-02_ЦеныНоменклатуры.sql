USE [UASD]
GO

/****** Object:  View [olap].[v_16-02_����������������]    Script Date: 12.12.2014 9:18:42 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO





ALTER VIEW [olap].[v_16-02_����������������]
AS

SELECT
	DATEADD(year, -1*2000, CAST(Cost._Period AS date)) AS Date															-- ���� ����
	,CONVERT(varchar(32), Cost._Fld1586RRef, 2) AS GoodID																-- ID ������
	,(SELECT TOP 1 CONVERT(varchar(32), _IDRRef, 2) FROM dbo.t_PredefinedValue WHERE ID = 38) AS PriceType				-- ID ���� ����
	,CONVERT(varchar(8), DATEADD(year, -1*2000, CAST(Cost._Period AS date)), 112)
		+ '_' + CONVERT(varchar(32), Cost._Fld1586RRef, 2)
		+ '_' + (SELECT TOP 1 CONVERT(varchar(32), _IDRRef, 2) FROM dbo.t_PredefinedValue WHERE ID = 38)
		+ '_' + CAST(Cost._Fld1587 AS varchar) AS Decription	-- �����������
	,Cost._Fld1587 AS Price																								-- ����
FROM dbo._InfoRg1585 AS Cost WITH(NOLOCK)	-- ���������������.�����
WHERE Cost._Active = 0x01
UNION ALL
SELECT
	DATEADD(year, -1*2000, CAST(Price._Period AS date)) AS Date															-- ���� ����
	,CONVERT(varchar(32), Price._Fld821RRef, 2) AS GoodID																-- ID ������
	,CONVERT(varchar(32), Price._Fld820RRef, 2) AS PriceType															-- ID ���� ����
	,CONVERT(varchar(8), DATEADD(year, -1*2000, CAST(Price._Period AS date)), 112)
		+ '_' + CONVERT(varchar(32), Price._Fld821RRef, 2)
		+ '_' + CONVERT(varchar(32), Price._Fld820RRef, 2)
		+ '_' + CAST(Price._Fld822 AS varchar) AS Decription												-- �����������
	,Price._Fld822 AS Price																								-- ����
FROM dbo._InfoRg819 AS Price WITH(NOLOCK)	-- ���������������.����������������



GO



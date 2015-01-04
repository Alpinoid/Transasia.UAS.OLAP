SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF OBJECT_ID('[olap].[v_02_����������������]','V') IS NOT NULL
	DROP VIEW [olap].[v_02_����������������]
GO

CREATE VIEW [olap].[v_02_����������������]
AS

SELECT
	CONVERT(varchar(8), CAST(Cost._������ AS date), 112)
		+ '_' + CONVERT(varchar(32), Cost.������������, 2)
		+ '_' + (SELECT TOP 1 CONVERT(varchar(32), ������, 2) FROM dbo.����������_������������������� WHERE ��� = '000000004')
		+ '_' + CAST(Cost.����� AS varchar) AS ID																					-- ID	
	,CAST(Cost._������ AS date) AS Date																								-- ���� ����
	,CONVERT(varchar(32), Cost.������������, 2) AS GoodID																			-- ID ������
	,(SELECT TOP 1 CONVERT(varchar(32), ������, 2) FROM dbo.����������_������������������� WHERE ��� = '000000004') AS PriceTypeID	-- ID ���� ����
	,Cost.����� AS Price																											-- ����
FROM dbo.���������������_����� AS Cost				-- ���������������.�����
WHERE Cost.���������� = 0x01
UNION ALL
SELECT
	CONVERT(varchar(8), CAST(Price._������ AS date), 112)
		+ '_' + CONVERT(varchar(32), Price.������������, 2)
		+ '_' + CONVERT(varchar(32), Price.�������, 2)
		+ '_' + CAST(Price.���� AS varchar) AS ID																					-- ID
	,CAST(Price._������ AS date) AS Date																							-- ���� ����
	,CONVERT(varchar(32), Price.������������, 2) AS GoodID																			-- ID ������
	,CONVERT(varchar(32), Price.�������, 2) AS PriceTypeID																			-- ID ���� ����
	,Price.���� AS Price																											-- ����
FROM dbo.���������������_���������������� AS Price	-- ���������������.����������������

GO



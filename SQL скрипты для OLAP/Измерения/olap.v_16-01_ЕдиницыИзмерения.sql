USE [UASD]
GO

/****** Object:  View [olap].[v_16-01_����������������]    Script Date: 11.12.2014 17:05:25 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO





ALTER VIEW [olap].[v_16-01_����������������]
AS

SELECT
	CONVERT(varchar(32), Units.������, 2) AS ID							-- ID ������� ���������
	,CONVERT(varchar(32), Units.��������, 2) AS GoodsID					-- ID ������������-���������
	,CONVERT(varchar(32), Units.��������������, 2) AS ClassifierUnitsID	-- ID �������������� ������ ����������
	,Units.������������ AS Description									-- ������������
	,Units.����������� AS Factor										-- �����������
	,Units.����� AS Volume												-- �����
	,Units.�������� AS NetWeight										-- ��� �����
	,Units.��������� AS GrossWeight										-- ��� ������
	,Units.����� AS Lenght												-- �����
	,Units.������ AS Widt												-- ������
	,Units.������ AS Height												-- ������
	,Units.EAN AS CodeEAN												-- ��� EAN
	,CASE
		WHEN Goods.������ IS NULL THEN  0
		ELSE 1
	END AS IsBasicUnit													-- ������� ������� ������� ���������
FROM dbo.����������_���������������� AS Units													-- ����������.����������������
LEFT JOIN dbo.����������_������������ AS Goods ON Goods.����������������������� = Units.������	-- ����������.������������
									AND Goods.������ = Units.��������
WHERE Units.��������������� = 0



GO



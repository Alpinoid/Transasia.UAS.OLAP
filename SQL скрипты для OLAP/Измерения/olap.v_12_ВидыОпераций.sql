USE [UASD]
GO

/****** Object:  View [olap].[v_12_������������]    Script Date: 11.12.2014 13:47:05 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO





ALTER VIEW [olap].[v_12_������������]
AS

SELECT
	CONVERT(varchar(32), ��������, 2) AS ID	-- ID ������������� ��������
	,������� AS Description					-- ��� ��������
FROM dbo.������������_���������������������	-- ������������.���������������������

GO


USE [UASD]
GO

/****** Object:  View [olap].[v_16-01-01_����������������������������]    Script Date: 12.12.2014 9:06:01 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO





ALTER VIEW [olap].[v_16-01-01_����������������������������]
AS

SELECT
	CONVERT(varchar(32), ������, 2) AS ID	-- ID ��������������
	,������������ AS Description			-- ������������
	,������������������ AS FullName			-- ������ ������������
FROM dbo.����������_����������������������������	-- ����������.����������������������������
WHERE ��������������� = 0



GO



SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF OBJECT_ID('[olap].[v_16-01-01_����������������������������]','V') IS NOT NULL
	DROP VIEW [olap].[v_16-01-01_����������������������������]
GO

CREATE VIEW [olap].[v_16-01-01_����������������������������]
AS

SELECT
	CONVERT(varchar(32), ������, 2) AS ID	-- ID ��������������
	,������������ AS Description			-- ������������
	,������������������ AS FullName			-- ������ ������������
FROM dbo.����������_����������������������������	-- ����������.����������������������������
WHERE ��������������� = 0



GO



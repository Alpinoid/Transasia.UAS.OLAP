SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF OBJECT_ID('[olap].[v_04_�����������]','V') IS NOT NULL
	DROP VIEW [olap].[v_04_�����������]
GO

CREATE VIEW [olap].[v_04_�����������]
AS

SELECT
	CONVERT(varchar(32), ������, 2) AS ID
	,����������������������� AS Description
FROM dbo.����������_�����������			-- ����������.�����������


GO



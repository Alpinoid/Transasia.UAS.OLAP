SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF OBJECT_ID('[olap].[v_07-01-01_����������������������]','V') IS NOT NULL
	DROP VIEW [olap].[v_07-01-01_����������������������]
GO

CREATE VIEW [olap].[v_07-01-01_����������������������]
AS

SELECT
	CONVERT(varchar(32), Element.������, 2) AS ID	-- ID
	,Element.������������ AS Description			-- ������������
FROM dbo.����������_���������������������� AS Element			-- ����������.����������������������

GO



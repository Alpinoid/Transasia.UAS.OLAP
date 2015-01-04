SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF OBJECT_ID('[olap].[v_16-03_������]','V') IS NOT NULL
	DROP VIEW [olap].[v_16-03_������]
GO

CREATE VIEW [olap].[v_16-03_������]
AS

SELECT
	CONVERT(varchar(32), ������, 2) AS ID	-- ID ������
	,������������ AS Description			-- ������������
FROM dbo.����������_������		-- ����������.������
WHERE �������� <> 0x00
UNION ALL
SELECT
	'00000000000000000000000000000000' AS ID
	,'��� ������' AS Description

GO


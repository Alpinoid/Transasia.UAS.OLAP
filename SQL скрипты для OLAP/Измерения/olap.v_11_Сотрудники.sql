SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF OBJECT_ID('[olap].[v_11_����������]','V') IS NOT NULL
	DROP VIEW [olap].[v_11_����������]
GO

CREATE VIEW [olap].[v_11_����������]
AS

SELECT
	CONVERT(varchar(32), Element.������, 2) AS ID	-- ID ����������
	,Element.������������ AS Description			-- ���
FROM dbo.����������_���������� AS Element	-- ����������.����������
WHERE Element.��������� = 0x01
--UNION ALL
--SELECT
--	'00000000000000000000000000000000' AS ID
--	,'��� ����������' AS Description


GO



SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF OBJECT_ID('[olap].[v_07-01_����������������������]','V') IS NOT NULL
	DROP VIEW [olap].[v_07-01_����������������������]
GO

CREATE VIEW [olap].[v_07-01_����������������������]
AS

SELECT
	CONVERT(varchar(32), Element.������, 2) AS ID						-- ID ������� �������� �������
	,Element.������������ AS Description								-- ������������
	,CONVERT(varchar(32), Element.����������������������, 2) AS SMT_ID	-- ID ������� ��������� ������
	,ISNULL(Bussiness.������������, '��� �����������') AS Business		-- ����������� �������
FROM dbo.����������_���������������������� AS Element																	-- ����������.����������������������
LEFT JOIN dbo.����������_������������������ AS Bussiness ON Bussiness.������ = Element.������������������	-- ����������.������������������
WHERE Element.��������� = 0x01


GO



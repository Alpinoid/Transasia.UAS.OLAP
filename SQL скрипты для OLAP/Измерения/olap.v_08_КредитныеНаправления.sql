SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF OBJECT_ID('[olap].[v_08_��������������������]','V') IS NOT NULL
	DROP VIEW [olap].[v_08_��������������������]
GO

CREATE VIEW [olap].[v_08_��������������������]
AS

SELECT
	CONVERT(varchar(32), Element.������, 2) AS ID					-- ID ���������� �����������
	,Element.������������ AS Description							-- ������������
	,Element.������������������������ AS CreditType					-- ������������.������������������������
	,ISNULL(Bussiness.������������, '��� �����������') AS Business	-- ����������� �������
FROM dbo.����������_�������������������� AS Element																				-- ����������.��������������������
LEFT JOIN dbo.����������_������������������ AS Bussiness ON Bussiness.������ = Element.������������������						-- ����������.������������������

--UNION ALL
--SELECT
--	'00000000000000000000000000000000' AS ID						-- ID ���������� �����������
--	,'��� ���������� �����������' AS Description					-- ������������
--	,'00000000000000000000000000000000' AS CreditType				-- ������������.������������������������
--	,'��� �����������' AS Business									-- ����������� �������

GO
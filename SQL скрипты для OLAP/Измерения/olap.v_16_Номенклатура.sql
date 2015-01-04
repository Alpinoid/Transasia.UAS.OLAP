SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF OBJECT_ID('[olap].[v_16_������������]','V') IS NOT NULL
	DROP VIEW [olap].[v_16_������������]
GO

CREATE VIEW [olap].[v_16_������������]
AS

SELECT
	CONVERT(varchar(32), Element.������, 2) AS ID								-- ID ������������
	,Element.������� AS Article													-- �������
	,Element.������������ AS Description										-- ������������
	,Element.������� + ': ' + Element.������������ AS ArticleDescription		-- �������: ������������
	,Element.������������ + ' (' + Element.������� + ')' AS DescriptionArticle	-- ������������ (�������)
	,ISNULL(Bussiness.������������, '��� �����������') AS Business				-- ����������� �������
	,CONVERT(varchar(32), CSKU.CSKU, 2) AS CSKU_ID								-- ID CSKU
	,CONVERT(varchar(32), Element.�����, 2) AS BrandID							-- ID ������
	,(	SELECT TOP 1
			VATValue.�������
		FROM dbo.���������������_���������
		LEFT JOIN dbo.������������_��������� AS VATValue ON VATValue.�������� = dbo.���������������_���������.���
		WHERE dbo.���������������_���������.������������ = Element.������
		ORDER BY dbo.���������������_���������._������ DESC
	) AS VAT																	-- ����� ���
FROM dbo.����������_������������ AS Element																	-- ����������.������������
LEFT JOIN dbo.����������_������������������ AS Bussiness ON Bussiness.������ = Element.������������������	-- ����������.������������������
LEFT JOIN dbo.���������������_����CSKU AS CSKU ON CSKU.������������ = Element.������						-- ���������������.����CSKU
WHERE Element.��������� = 0x01


GO



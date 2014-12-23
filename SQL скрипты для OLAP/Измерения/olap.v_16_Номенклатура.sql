USE [UASD]
GO

/****** Object:  View [olap].[v_16_������������]    Script Date: 11.12.2014 16:49:30 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO





ALTER VIEW [olap].[v_16_������������]
AS

SELECT
	CONVERT(varchar(32), Element.������, 2) AS ID								-- ID ������������
	,Element.������� AS Article													-- �������
	,Element.������������ AS Description										-- ������������
	,Element.������� + ': ' + Element.������������ AS ArticleDescription		-- �������: ������������
	,Element.������������ + ' (' + Element.������� + ')' AS DescriptionArticle	-- ������������ (�������)
	,ISNULL(Bussiness.������������, '��� �����������') AS Business				-- ����������� �������
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
WHERE Element.��������� = 0x01


GO



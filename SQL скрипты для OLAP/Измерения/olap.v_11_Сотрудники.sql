USE [UASD]
GO

/****** Object:  View [olap].[v_11_����������]    Script Date: 11.12.2014 13:18:43 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO





ALTER VIEW [olap].[v_11_����������]
AS

SELECT
	CONVERT(varchar(32), Element.������, 2) AS ID	-- ID ����������
	,Element.������������ AS Description			-- ���
FROM dbo.����������_���������� AS Element	-- ����������.����������
WHERE Element.��������� = 0x01


GO



USE [UASD]
GO

/****** Object:  View [olap].[v_02_������������������]    Script Date: 10.12.2014 17:12:34 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO





ALTER VIEW [olap].[v_02_������������������]
AS

SELECT 
	CONVERT(varchar(32), Element.������, 2) AS ID	-- ID ����������� �������
	,Element.������������ AS Description			-- ������������ ����������� �������
FROM dbo.����������_������������������ AS Element	-- ����������.������������������

GO



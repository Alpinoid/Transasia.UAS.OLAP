USE [UASD]
GO

/****** Object:  View [olap].[v_07-01-01_����������������������]    Script Date: 11.12.2014 12:11:35 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO






ALTER VIEW [olap].[v_07-01-01_����������������������]
AS

SELECT
	CONVERT(varchar(32), Element.������, 2) AS ID	-- ID
	,Element.������������ AS Description			-- ������������
FROM dbo.����������_���������������������� AS Element			-- ����������.����������������������

GO



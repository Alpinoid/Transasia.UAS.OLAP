SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF OBJECT_ID('[olap].[v_05-01_����������������]','V') IS NOT NULL
	DROP VIEW [olap].[v_05-01_����������������]
GO

CREATE VIEW [olap].[v_05-01_����������������]
AS

SELECT
	CONVERT(varchar(32), CustomerType.������, 2) AS ID	-- ID ���� �����������
	,CustomerType.������������ AS Description			-- ������������		
FROM dbo.����������_��������������� AS CustomerType		-- ����������.���������������

GO



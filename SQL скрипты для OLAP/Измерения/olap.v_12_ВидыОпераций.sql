USE [UASD]
GO

/****** Object:  View [olap].[v_12_������������]    Script Date: 11.12.2014 13:47:05 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO





ALTER VIEW [olap].[v_12_������������]
AS

SELECT
	CONVERT(varchar(32), _IDRRef, 2) AS ID
	,CASE
		WHEN _EnumOrder = 5 THEN '�������'
		WHEN _EnumOrder = 12 THEN '�������'
	END AS Description
FROM dbo._Enum105 WITH(NOLOCK)	-- ������������.���������������������
WHERE _EnumOrder IN (5, 12)		-- ������� ��� �������

GO



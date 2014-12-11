USE [UASD]
GO

/****** Object:  View [olap].[v_13-01_��������������]    Script Date: 11.12.2014 16:07:01 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO





ALTER VIEW [olap].[v_13-01_��������������]
AS

SELECT
	CONVERT(varchar(32), _IDRRef, 2) AS ID
	,CASE
		WHEN _EnumOrder = 0 THEN '������'
		WHEN _EnumOrder = 1 THEN '����-�������'
	END AS Description
FROM dbo._Enum99 WITH(NOLOCK)	-- ������������.��������������
WHERE _EnumOrder IN (0, 1)		-- ������ ��� ����-�������


GO



USE [UASD]
GO

/****** Object:  View [olap].[v_08_��������������������]    Script Date: 11.12.2014 12:21:20 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO






ALTER VIEW [olap].[v_08_��������������������]
AS

SELECT
	CONVERT(varchar(32), Element._IDRRef, 2) AS ID
	,Element._Description AS Description
	,ISNULL(Bussiness._Description, '��� �����������') AS Business
FROM dbo._Reference51 AS Element WITH(NOLOCK)													-- ����������.��������������������
LEFT JOIN dbo._Reference54 AS Bussiness WITH(NOLOCK) ON Bussiness._IDRRef = Element._Fld165RRef	-- ����������.������������������
INNER JOIN dbo._Enum102 AS CreditType WITH(NOLOCK) ON CreditType._IDRRef = Element._Fld209RRef	-- ������������.������������������������
													AND CreditType._EnumOrder = 1				-- ��� ���������� �����������: �������
WHERE Element._ParentIDRRef <> 0


GO



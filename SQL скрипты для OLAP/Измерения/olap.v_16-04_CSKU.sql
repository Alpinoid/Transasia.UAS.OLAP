USE [UASD]
GO

/****** Object:  View [olap].[v_16_������������]    Script Date: 11.12.2014 16:49:30 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO





ALTER VIEW [olap].[v_16-04_CSKU]
AS

SELECT
	CONVERT(varchar(32), Element.������, 2) AS ID								-- ID CSKU
	,Element.������������ AS Description										-- ������������

FROM dbo.����������_CSKU AS Element																	-- ����������.������������
WHERE Element.��������� = 0x01

SELECT * FROM dbo.����������_CSKU
WHERE �������� = 0x00

WITH CSKU AS (
	SELECT
		0 AS GroupId
		,������ AS ID
		,��� AS Code
		,������������ AS Description
	FROM dbo.����������_CSKU
	WHERE �������� = 0x00 AND ��������������� = 0x0
	UNION ALL
	SELECT
		CSKU.GroupId + 1 AS GroupId
		,CSKU1.������ AS ID
		,CSKU1.��� AS Code
		,CSKU1.������������ AS Description
	FROM CSKU AS CSKU
	inner join [dbo].[����������_CSKU] CSKU1 with (nolock)
	on CSKU1.�������� = CSKU.ID-- and CSKU.���������������=0
)

SELECT
	*
FROM CSKU
WHERE CSKU.GroupId = 0
OPTION (MAXRECURSION 10000)


GO



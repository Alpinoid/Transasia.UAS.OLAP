USE [UASD]
GO

/****** Object:  View [olap].[v_06_�������������]    Script Date: 11.12.2014 11:23:05 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO







ALTER VIEW [olap].[v_06_�������������]
AS

SELECT
	CONVERT(varchar(32), Element._IDRRef, 2) AS ID
	,Element._Code AS Code
	,Element._Description AS Description
	,Element._Code + ': ' + Element._Description AS CodeDescription
	,Element._Description + ' (' + Element._Code + ')' AS DescriptionCode
	,ISNULL(Branch._Description, '��� �������') AS Branch
FROM dbo._Reference68 AS Element WITH(NOLOCK)																-- ����������.�������������
INNER JOIN dbo._Reference50 AS Customers WITH(NOLOCK) ON Customers._IDRRef = Element._OwnerIDRRef			-- ����������.�����������
											AND Customers._Fld176 = 1										-- ����������
INNER JOIN dbo._Reference1044 AS CustomerType WITH(NOLOCK) ON CustomerType._IDRRef = Customers._Fld1216RRef	-- ����������.���������������
												AND CustomerType._Code = '000000003'						-- ��� �����������: ������� ������
LEFT JOIN dbo._Reference70 AS Branch WITH(NOLOCK) ON Branch._IDRRef = Element._Fld2062RRef					-- ����������.�������


GO
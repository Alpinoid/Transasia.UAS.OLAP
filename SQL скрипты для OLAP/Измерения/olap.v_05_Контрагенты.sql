USE [UASD]
GO

/****** Object:  View [olap].[v_05_Контрагенты]    Script Date: 10.12.2014 17:51:40 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO








ALTER VIEW [olap].[v_05_Контрагенты]
AS

SELECT
	CONVERT(varchar(32), Customers._IDRRef, 2) AS ID
	,Customers._Code AS Code
	,CASE
		WHEN ISNULL(Customers._Fld170, '') = '' THEN '000000000000'
		ELSE Customers._Fld170
	END AS INN
	,Customers._Description AS Description
	,Customers._Code + ': ' + Customers._Description AS CodeDescription
	,Customers._Description + ' (' + Customers._Code + ')' AS DescriptionCode
	,CASE
		WHEN ISNULL(Customers._Fld170, '') = '' THEN '000000000000'
		ELSE Customers._Fld170
	END + ': ' + Customers._Description AS INNDescription
	,Customers._Description + ' (' + CASE
										WHEN ISNULL(Customers._Fld170, '') = '' THEN '000000000000'
										ELSE Customers._Fld170
									END + ')' AS DescriptionINN
FROM dbo._Reference50 AS Customers WITH(NOLOCK)																-- Справочник.Контрагенты
INNER JOIN dbo._Reference1044 AS CustomerType WITH(NOLOCK) ON CustomerType._IDRRef = Customers._Fld1216RRef	-- Справочник.ТипыКонтрагента
											AND CustomerType._Code = '000000003'							-- Тип контрагента: Обычный клиент
WHERE Customers._Fld176 = 1																					-- Покупатель


GO



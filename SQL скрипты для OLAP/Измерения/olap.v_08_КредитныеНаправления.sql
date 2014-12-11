USE [UASD]
GO

/****** Object:  View [olap].[v_08_КредитныеНаправления]    Script Date: 11.12.2014 12:21:20 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO






ALTER VIEW [olap].[v_08_КредитныеНаправления]
AS

SELECT
	CONVERT(varchar(32), Element._IDRRef, 2) AS ID
	,Element._Description AS Description
	,ISNULL(Bussiness._Description, 'Без направления') AS Business
FROM dbo._Reference51 AS Element WITH(NOLOCK)													-- Справочник.КредитныеНаправления
LEFT JOIN dbo._Reference54 AS Bussiness WITH(NOLOCK) ON Bussiness._IDRRef = Element._Fld165RRef	-- Справочник.НаправленияБизнеса
INNER JOIN dbo._Enum102 AS CreditType WITH(NOLOCK) ON CreditType._IDRRef = Element._Fld209RRef	-- Перечисление.ТипыКредитныхНаправлений
													AND CreditType._EnumOrder = 1				-- Тип кредитного направления: Базовое
WHERE Element._ParentIDRRef <> 0


GO



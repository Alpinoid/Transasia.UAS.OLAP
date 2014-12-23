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
	CONVERT(varchar(32), Element.Ссылка, 2) AS ID					-- ID кредитного направления
	,Element.Наименование AS Description							-- Наименование
	,ISNULL(Bussiness.Наименование, 'Без направления') AS Business	-- Направление бизнеса
FROM dbo.Справочник_КредитныеНаправления AS Element																				-- Справочник.КредитныеНаправления
LEFT JOIN dbo.Справочник_НаправленияБизнеса AS Bussiness ON Bussiness.Ссылка = Element.НаправлениеБизнеса						-- Справочник.НаправленияБизнеса
INNER JOIN dbo.Перечисление_ТипыКредитныхНаправлений AS CreditType ON CreditType.Значение = Element.ТипКредитногоНаправления	-- Перечисление.ТипыКредитныхНаправлений
													AND CreditType.Имя LIKE 'Базовое'											-- Тип кредитного направления: Базовое
WHERE Element.Родитель <> 0


GO

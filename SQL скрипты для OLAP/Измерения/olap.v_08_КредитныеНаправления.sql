SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF OBJECT_ID('[olap].[v_08_КредитныеНаправления]','V') IS NOT NULL
	DROP VIEW [olap].[v_08_КредитныеНаправления]
GO

CREATE VIEW [olap].[v_08_КредитныеНаправления]
AS

SELECT
	CONVERT(varchar(32), Element.Ссылка, 2) AS ID					-- ID кредитного направления
	,Element.Наименование AS Description							-- Наименование
	,Element.ТипКредитногоНаправления AS CreditType					-- Перечисление.ТипыКредитныхНаправлений
	,ISNULL(Bussiness.Наименование, 'Без направления') AS Business	-- Направление бизнеса
FROM dbo.Справочник_КредитныеНаправления AS Element																				-- Справочник.КредитныеНаправления
LEFT JOIN dbo.Справочник_НаправленияБизнеса AS Bussiness ON Bussiness.Ссылка = Element.НаправлениеБизнеса						-- Справочник.НаправленияБизнеса

--UNION ALL
--SELECT
--	'00000000000000000000000000000000' AS ID						-- ID кредитного направления
--	,'Без кредитного направления' AS Description					-- Наименование
--	,'00000000000000000000000000000000' AS CreditType				-- Перечисление.ТипыКредитныхНаправлений
--	,'Без направления' AS Business									-- Направление бизнеса

GO
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF OBJECT_ID('[olap].[v_06_ТочкиДоставки]','V') IS NOT NULL
	DROP VIEW [olap].[v_06_ТочкиДоставки]
GO

CREATE VIEW [olap].[v_06_ТочкиДоставки]
AS

SELECT
	CONVERT(varchar(32), Element.Ссылка, 2) AS ID							-- ID точки доставки
	,Element.Код AS Code													-- Код
	,Element.Наименование AS Description									-- Наименование
	,Element.Код + ': ' + Element.Наименование AS CodeDescription			-- Код: Наименование
	,Element.Наименование + ' (' + Element.Код + ')' AS DescriptionCode		-- Наименовнаие (Код)
	,ISNULL(Branch.Наименование, 'Без филиала') AS Branch					-- Филиал
FROM dbo.Справочник_ТочкиДоставки AS Element																-- Справочник.ТочкиДоставки
INNER JOIN dbo.Справочник_Контрагенты AS Customers ON Customers.Ссылка = Element.Владелец					-- Справочник.Контрагенты
											AND Customers.Покупатель = 1									-- Покупатель
INNER JOIN dbo.Справочник_ТипыКонтрагента AS CustomerType ON CustomerType.Ссылка = Customers.ТипКонтрагента	-- Справочник.ТипыКонтрагента
												AND CustomerType.Код = '000000003'							-- Тип контрагента: Обычный клиент
LEFT JOIN dbo.Справочник_Филиалы AS Branch ON Branch.Ссылка = Element.Филиал								-- Справочник.Филиалы


GO
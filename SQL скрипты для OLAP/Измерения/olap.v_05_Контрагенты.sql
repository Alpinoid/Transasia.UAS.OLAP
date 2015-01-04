SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF OBJECT_ID('[olap].[v_05_Контрагенты]','V') IS NOT NULL
	DROP VIEW [olap].[v_05_Контрагенты]
GO

CREATE VIEW [olap].[v_05_Контрагенты]
AS

SELECT
	CONVERT(varchar(32), Customers.Ссылка, 2) AS ID							-- ID контрагента
	,Customers.Код AS Code													-- Код
	,Customers.ИНН AS INN													-- ИНН
	,Customers.Наименование AS Description									-- Наименовнаие		
	,Customers.Код + ': ' + Customers.Наименование AS CodeDescription		-- Код: Наименовнаие
	,Customers.Наименование + ' (' + Customers.Код + ')' AS DescriptionCode	-- Наименование (Код)
	,Customers.ИНН + ': ' + Customers.Наименование AS INNDescription		-- ИНН: Наименование
	,Customers.Наименование + ' (' + Customers.ИНН + ')' AS DescriptionINN	-- Наименование (ИНН)
	,CastomerLegalAddress.Представление AS LegalAddress						-- Юридический адрес
	,CastomerFactAddress.Представление AS FactAddress						-- Фактический адрес
FROM dbo.Справочник_Контрагенты AS Customers																													-- Справочник.Контрагенты
INNER JOIN dbo.Справочник_ТипыКонтрагента AS CustomerType ON CustomerType.Ссылка = Customers.ТипКонтрагента														-- Справочник.ТипыКонтрагента
											AND CustomerType.Код = '000000003'																					-- Тип контрагента: Обычный клиент
LEFT JOIN dbo.Справочник_Контрагенты_КонтактнаяИнформация AS CastomerLegalAddress ON CastomerLegalAddress.Владелец = Customers.Ссылка							-- Справочник.Контрагенты_КонтактнаяИнформация
INNER JOIN dbo.Справочник_ВидыКонтактнойИнформации AS ContactTypeLegalAddress ON ContactTypeLegalAddress.Ссылка = CastomerLegalAddress.Вид						-- Справочник.ВидыКонтактнойИнформации
																	AND ContactTypeLegalAddress.ИмяПредопределенныхДанных = 0xA581F8724C86FD9C4E1AA1B9D95035D6	-- Юридический адрес
LEFT JOIN dbo.Справочник_Контрагенты_КонтактнаяИнформация AS CastomerFactAddress ON CastomerFactAddress.Владелец = Customers.Ссылка								-- Справочник.Контрагенты_КонтактнаяИнформация
INNER JOIN dbo.Справочник_ВидыКонтактнойИнформации AS ContactTypeFactAddress ON ContactTypeFactAddress.Ссылка = CastomerFactAddress.Вид							-- Справочник.ВидыКонтактнойИнформации
																	AND ContactTypeFactAddress.ИмяПредопределенныхДанных = 0x9F0111DE9B2A95ED4087A3968FFB5332	-- Фактически адрес
WHERE Customers.Покупатель = 1		-- Покупатель


GO



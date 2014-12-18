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
	CONVERT(varchar(32), Customers.Ссылка, 2) AS ID
	,Customers.Код AS Code
	,Customers.ИНН AS INN
	,Customers.Наименование AS Description
	,Customers.Код + ': ' + Customers.Наименование AS CodeDescription
	,Customers.Наименование + ' (' + Customers.Код + ')' AS DescriptionCode
	,Customers.ИНН + ': ' + Customers.Наименование AS INNDescription
	,Customers.Наименование + ' (' + Customers.ИНН + ')' AS DescriptionINN
FROM dbo.Справочник_Контрагенты AS Customers WITH(NOLOCK)																	-- Справочник.Контрагенты
INNER JOIN dbo.Справочник_ТипыКонтрагента AS CustomerType WITH(NOLOCK) ON CustomerType.Ссылка = Customers.ТипКонтрагента	-- Справочник.ТипыКонтрагента
											AND CustomerType.Код = '000000003'												-- Тип контрагента: Обычный клиент
WHERE Customers.Покупатель = 1																								-- Покупатель


GO



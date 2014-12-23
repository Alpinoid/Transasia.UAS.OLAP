USE [UASD]
GO

/****** Object:  View [olap].[v_16-01_ЕдиницыИзмерения]    Script Date: 11.12.2014 17:05:25 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO





ALTER VIEW [olap].[v_16-01_ЕдиницыИзмерения]
AS

SELECT
	CONVERT(varchar(32), Units.Ссылка, 2) AS ID							-- ID единицы измерения
	,CONVERT(varchar(32), Units.Владелец, 2) AS GoodsID					-- ID номенклатуры-владельца
	,CONVERT(varchar(32), Units.БазоваяЕдиница, 2) AS ClassifierUnitsID	-- ID классификатора единиц ищзмерения
	,Units.Наименование AS Description									-- Наименование
	,Units.Коэффициент AS Factor										-- Коэффициент
	,Units.Объем AS Volume												-- Объем
	,Units.ВесНетто AS NetWeight										-- Вес нетто
	,Units.ВесБрутто AS GrossWeight										-- Вес брутто
	,Units.Длина AS Lenght												-- Длина
	,Units.Ширина AS Widt												-- Ширина
	,Units.Высота AS Height												-- Высота
	,Units.EAN AS CodeEAN												-- Код EAN
	,CASE
		WHEN Goods.Ссылка IS NULL THEN  0
		ELSE 1
	END AS IsBasicUnit													-- Признак базовой единицы измерения
FROM dbo.Справочник_ЕдиницыИзмерения AS Units													-- Справочник.ЕдиницыИзмерения
LEFT JOIN dbo.Справочник_Номенклатура AS Goods ON Goods.БазоваяЕдиницаИзмерения = Units.Ссылка	-- Справочник.Номенклатура
									AND Goods.Ссылка = Units.Владелец
WHERE Units.ПометкаУдаления = 0



GO



USE [UASD]
GO

/****** Object:  View [olap].[v_13_ДокументыРеализацияТоваров]    Script Date: 11.12.2014 13:52:27 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO





ALTER VIEW [olap].[v_13_ДокументыРеализацияТоваров]
AS

SELECT
	CONVERT(varchar(32), DocSales.Ссылка, 2) AS ID								-- ID документа
	,'Реализация товаров №'+RTRIM(DocSales.Номер)+' от '
		+ CONVERT(varchar(10), CAST(DocSales.Дата AS date), 104) AS Description	-- Описание документа
	,CAST(DocSales.Дата AS date) AS DocDate										-- Дата документа
	,DocSales.Номер AS DocNumber												-- Номер документа
	,CONVERT(varchar(32), DocSales.ТипДокумента, 2) AS DocumentTypeID			-- ID типа документа
	,CONVERT(varchar(32), DocSales.СпособОплаты, 2) AS PaymentMethodID			-- ID способа оплаты документа
	,CAST(DocSales.ДатаФактическойДоставки AS date) AS DocDeliveryDate			-- Дата доставки																			-- Дата доставки
	,CAST(DocSales.ДатаОплаты AS date) AS DocPaymentDay							-- Дата оплаты
	,CONVERT(int, DocSales.БонусныйДокумент) AS IsBonusDoc						-- Признак бонусного документа
FROM dbo.Документ_РеализацияТоваров AS DocSales		-- Документ.РеализацияТоваров
WHERE DocSales.Проведен = 0x01						-- Проведен



GO



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
	CONVERT(varchar(32), DocSales._IDRRef, 2) AS ID								-- ID документа
	,DATEADD(year, -1*2000, CAST(DocSales._Date_Time AS date)) AS DocDate		-- Дата документа
	,DocSales._Number AS DocNumber												-- Номер документа
	,CONVERT(varchar(32), DocSales._Fld584RRef, 2) AS DocumentTypeID			-- ID типа документа
	,CONVERT(varchar(32), DocSales._Fld583RRef, 2) AS PaymentMethodID			-- ID способа оплаты документа
	,CASE
		WHEN YEAR(CAST(DocSales._Fld1244 AS date)) IN (3753, 2001) THEN NULL
		ELSE DATEADD(year, -1*2000, CAST(DocSales._Fld1244 AS date))
	END AS DocDeliveryDate														-- Дата доставки
	,DATEADD(year, -1*2000, CAST(DocSales._Fld574 AS date)) AS DocPaymentDay	-- Дата оплаты
	,CONVERT(int, DocSales._Fld1281) AS IsBonusDoc								-- Признак бонусного документа
FROM dbo._Document81 AS DocSales WITH(NOLOCK)	-- Документ.РеализацияТоваров
WHERE DocSales._Posted = 0x01					-- Проведен



GO



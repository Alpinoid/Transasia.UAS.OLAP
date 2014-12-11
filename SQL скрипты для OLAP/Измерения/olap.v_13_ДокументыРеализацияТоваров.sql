USE [UASD]
GO

/****** Object:  View [olap].[v_13_��������������������������]    Script Date: 11.12.2014 13:52:27 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO





ALTER VIEW [olap].[v_13_��������������������������]
AS

SELECT
	CONVERT(varchar(32), DocSales._IDRRef, 2) AS ID								-- ID ���������
	,DATEADD(year, -1*2000, CAST(DocSales._Date_Time AS date)) AS DocDate		-- ���� ���������
	,DocSales._Number AS DocNumber												-- ����� ���������
	,CONVERT(varchar(32), DocSales._Fld584RRef, 2) AS DocumentTypeID			-- ID ���� ���������
	,CONVERT(varchar(32), DocSales._Fld583RRef, 2) AS PaymentMethodID			-- ID ������� ������ ���������
	,CASE
		WHEN YEAR(CAST(DocSales._Fld1244 AS date)) IN (3753, 2001) THEN NULL
		ELSE DATEADD(year, -1*2000, CAST(DocSales._Fld1244 AS date))
	END AS DocDeliveryDate														-- ���� ��������
	,DATEADD(year, -1*2000, CAST(DocSales._Fld574 AS date)) AS DocPaymentDay	-- ���� ������
	,CONVERT(int, DocSales._Fld1281) AS IsBonusDoc								-- ������� ��������� ���������
FROM dbo._Document81 AS DocSales WITH(NOLOCK)	-- ��������.�����������������
WHERE DocSales._Posted = 0x01					-- ��������



GO



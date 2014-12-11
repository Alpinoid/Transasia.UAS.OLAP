USE [UASD]
GO

/****** Object:  View [olap].[v_07-01-01_СистемыМобильныхПродаж]    Script Date: 11.12.2014 12:11:35 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO






ALTER VIEW [olap].[v_07-01-01_СистемыМобильныхПродаж]
AS

SELECT
	CONVERT(varchar(32), Element._IDRRef, 2) AS ID
	,Element._Description AS Description
FROM dbo._Reference1040 AS Element WITH(NOLOCK)			-- Справочник.СистемыМобильныхПродаж

GO



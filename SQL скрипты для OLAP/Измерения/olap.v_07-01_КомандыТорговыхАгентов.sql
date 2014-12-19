USE [UASD]
GO

/****** Object:  View [olap].[v_07-01_КомандыТорговыхАгентов]    Script Date: 11.12.2014 12:01:25 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO






ALTER VIEW [olap].[v_07-01_КомандыТорговыхАгентов]
AS

SELECT
	CONVERT(varchar(32), Element.Ссылка, 2) AS ID						-- ID Команды торговых агентов
	,Element.Наименование AS Description								-- Наименование
	,CONVERT(varchar(32), Element.СистемаМобильныхПродаж, 2) AS SMT_ID	-- ID Системы мобильных продаж
	,ISNULL(Bussiness.Наименование, 'Без направления') AS Business		-- Направление бизнеса
FROM dbo.Справочник_КомандыТорговыхАгентов AS Element																	-- Справочник.КомандыТорговыхАгентов
LEFT JOIN dbo.Справочник_НаправленияБизнеса AS Bussiness WITH(NOLOCK) ON Bussiness.Ссылка = Element.НаправлениеБизнеса	-- Справочник.НаправленияБизнеса
WHERE Element.ЭтоГруппа = 0x01


GO



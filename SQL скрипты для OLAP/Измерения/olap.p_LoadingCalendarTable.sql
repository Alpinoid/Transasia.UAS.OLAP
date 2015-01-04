USE [uas_central]
GO
/****** Object:  StoredProcedure [olap].[LoadingCalendarTable]    Script Date: 10.12.2014 17:20:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Valentin Avramko>
-- Create date: <Create Date,,08.12.2014>
-- Description:	<Description,,Загрузка таблицы olap.Calendar данными по датам>
-- =============================================
ALTER PROCEDURE [olap].[p_LoadingCalendarTable] 

AS
BEGIN

WITH Calendar AS 
(
SELECT
	CAST('2013-12-31' as date) AS [Date]
UNION ALL
SELECT
	DATEADD(DAY, 1, [Date])
FROM Calendar
WHERE [Date] <= CAST('2016-12-31' as date)
)
MERGE INTO olap.t_Calendar AS Target
USING (
	SELECT
		[Date] AS [Date]
		,DATENAME(year, [Date]) AS [Year]
		,DATENAME(quarter, [Date]) AS [Quarter]
		,DATENAME(quarter, [Date])+' квартал' AS [NameQuarter]
		,DATEPART(month, [Date]) AS [Month]
		,DATENAME(month, [Date]) AS [NameOfMonth]
		,DATENAME(week, [Date]) AS [Week]
		,DATENAME(dayofyear, [Date]) AS [DayOfYear]
		,DATENAME(day, [Date]) AS [DayOfMonth]
		,DATEPART(weekday, [Date]) AS [Weekday]
		,DATENAME(weekday, [Date]) AS [WeekdayName]
	FROM Calendar
) AS CalendarSorce
ON Target.[Date] = CalendarSorce.[Date]
WHEN MATCHED THEN
	UPDATE SET
		[Date] = CalendarSorce.[Date]
		,[Year] = CalendarSorce.[Year]
		,[Quarter] = CalendarSorce.[Quarter]
		,[NameQuarter] = CalendarSorce.[NameQuarter]
		,[Month] = CalendarSorce.[Month]
		,[NameOfMonth] = CalendarSorce.[NameOfMonth]
		,[Week] = CalendarSorce.[Week]
		,[DayOfYear] = CalendarSorce.[DayOfYear]
		,[DayOfMonth] = CalendarSorce.[DayOfMonth]
		,[Weekday] = CalendarSorce.[Weekday]
		,[WeekdayName] = CalendarSorce.[WeekdayName]
WHEN NOT MATCHED BY TARGET THEN
	INSERT (
		[Date]
		,[Year]
		,[Quarter]
		,[NameQuarter]
		,[Month]
		,[NameOfMonth]
		,[Week]
		,[DayOfYear]
		,[DayOfMonth]
		,[Weekday]
		,[WeekdayName])
	VALUES (
		CalendarSorce.[Date]
		,CalendarSorce.[Year]
		,CalendarSorce.[Quarter]
		,CalendarSorce.[NameQuarter]
		,CalendarSorce.[Month]
		,CalendarSorce.[NameOfMonth]
		,CalendarSorce.[Week]
		,CalendarSorce.[DayOfYear]
		,CalendarSorce.[DayOfMonth]
		,CalendarSorce.[Weekday]
		,CalendarSorce.[WeekdayName])
OPTION (MAXRECURSION 7300);

END

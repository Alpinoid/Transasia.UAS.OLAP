SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF OBJECT_ID('[dbo].[t_Calendar]','U') IS NOT NULL
	DROP TABLE [dbo].[t_Calendar]
GO

CREATE TABLE [dbo].[t_Calendar](
	[Date] [date] NOT NULL,
	[Year] [smallint] NOT NULL,
	[Quarter] [tinyint] NOT NULL,
	[NameQuarter] [nvarchar](16) NOT NULL,
	[Month] [smallint] NOT NULL,
	[NameOfMonth] [nvarchar](16) NOT NULL,
	[Week] [tinyint] NOT NULL,
	[DayOfYear] [smallint] NOT NULL,
	[DayOfMonth] [tinyint] NOT NULL,
	[Weekday] [tinyint] NOT NULL,
	[WeekdayName] [nvarchar](16) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Date] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO



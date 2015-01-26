SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

IF OBJECT_ID('[dbo].[t_CustomersTypes]','U') IS NOT NULL
	DROP TABLE [dbo].[t_CustomersTypes]
GO

	CREATE TABLE [dbo].[t_CustomersTypes](
		[ID] [int] IDENTITY(1,1) NOT NULL,
		[UID_1C] [binary](16) NOT NULL,
		[Description] [varchar](100) NOT NULL
	 CONSTRAINT [PK_CustomersTypes_ID] PRIMARY KEY CLUSTERED 
	(
		[ID] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
	) ON [PRIMARY]

	CREATE NONCLUSTERED INDEX [t_CustomersTypes_UID] ON [dbo].[t_CustomersTypes]
	(
		[UID_1C] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)

GO

SET IDENTITY_INSERT [dbo].[t_CustomersTypes] ON

INSERT INTO [dbo].[t_CustomersTypes] (ID, UID_1C,Description) VALUES (0, 0x00, 'Переведен в СБ')
INSERT INTO [dbo].[t_CustomersTypes] (ID, UID_1C,Description)
	SELECT
		Код AS ID
		,Ссылка AS UID_1C
		,Наименование AS Description
	FROM [uas_central].dbo.Справочник_ТипыКонтрагента

SET ANSI_PADDING OFF
GO
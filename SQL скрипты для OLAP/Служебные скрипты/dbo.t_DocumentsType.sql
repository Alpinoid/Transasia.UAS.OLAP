SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

IF OBJECT_ID('[dbo].[t_DocumentsTypes]','U') IS NOT NULL
	DROP TABLE [dbo].[t_DocumentsTypes]
GO

CREATE TABLE [dbo].[t_DocumentsTypes](
	[ID] [binary](4) NOT NULL,
	[ВидДокумента] [varchar](64) NOT NULL,
	[ИспользоватьДебиторскаяЗадолженность] bit NOT NULL
 CONSTRAINT [PK_t_DT_ID] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

INSERT INTO [dbo].[t_DocumentsTypes] VALUES (0x00000000, 'Аванс', 1)
INSERT INTO [dbo].[t_DocumentsTypes] VALUES (0x00000078, 'Ввод начальных остатков взаиморасчетов', 1)
INSERT INTO [dbo].[t_DocumentsTypes] VALUES (0x00000079, 'Возврат товаров от покупателя', 1)
INSERT INTO [dbo].[t_DocumentsTypes] VALUES (0x0000008E, 'Реализация товаров', 1)

SET ANSI_PADDING OFF
GO

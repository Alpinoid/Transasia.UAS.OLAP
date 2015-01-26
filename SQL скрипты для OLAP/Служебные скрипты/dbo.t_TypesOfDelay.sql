SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

IF OBJECT_ID('[dbo].[t_TypesOfDelay]','U') IS NOT NULL
	DROP TABLE [dbo].[t_TypesOfDelay]
GO

CREATE TABLE [dbo].[t_TypesOfDelay](
	[ID] [int] NOT NULL,
	[������������] [varchar](64) NOT NULL,
	[MinDay] [int] NOT NULL,
	[MaxDay] [int] NOT NULL,
 CONSTRAINT [PK_t_TODel_ID] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

INSERT INTO [dbo].[t_TypesOfDelay] VALUES (1, '�����', 0, 0)
INSERT INTO [dbo].[t_TypesOfDelay] VALUES (2, '�� ����������', 0, 0)
INSERT INTO [dbo].[t_TypesOfDelay] VALUES (3, '�� 3 ����', 0, 3)
INSERT INTO [dbo].[t_TypesOfDelay] VALUES (4, '�� 4 �� 10 ����', 4, 10)
INSERT INTO [dbo].[t_TypesOfDelay] VALUES (5, '�� 11 �� 25 ����', 11, 25)
INSERT INTO [dbo].[t_TypesOfDelay] VALUES (6, '����� 25 ����',26 , 99999)

SET ANSI_PADDING OFF
GO
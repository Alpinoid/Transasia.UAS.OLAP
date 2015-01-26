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
	[������������] [varchar](64) NOT NULL,
	[������������������������������������] bit NOT NULL
 CONSTRAINT [PK_t_DT_ID] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

INSERT INTO [dbo].[t_DocumentsTypes] VALUES (0x00000000, '�����', 1)
INSERT INTO [dbo].[t_DocumentsTypes] VALUES (0x00000078, '���� ��������� �������� ��������������', 1)
INSERT INTO [dbo].[t_DocumentsTypes] VALUES (0x00000079, '������� ������� �� ����������', 1)
INSERT INTO [dbo].[t_DocumentsTypes] VALUES (0x0000008E, '���������� �������', 1)

SET ANSI_PADDING OFF
GO

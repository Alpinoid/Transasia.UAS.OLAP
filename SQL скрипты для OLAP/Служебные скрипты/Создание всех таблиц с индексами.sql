SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

-- Справочник.НаправленияБизнеса
BEGIN

	IF OBJECT_ID('[dbo].[t_Business]','U') IS NOT NULL
		DROP TABLE [dbo].[t_Business]

	CREATE TABLE [dbo].[t_Business](
		[ID] [int] IDENTITY(1,1) NOT NULL,
		[UID_1C] [binary](16) NOT NULL,
		[Description] [varchar](50) NOT NULL
	 CONSTRAINT [PK_Business_ID] PRIMARY KEY CLUSTERED 
	(
		[ID] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
	) ON [PRIMARY]

	CREATE NONCLUSTERED INDEX [t_Business_UID] ON [dbo].[t_Business]
	(
		[UID_1C] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)

END

-- Справочник.Филиалы
BEGIN

	IF OBJECT_ID('[dbo].[t_Branches]','U') IS NOT NULL
		DROP TABLE [dbo].[t_Branches]

	CREATE TABLE [dbo].[t_Branches](
		[ID] [int] IDENTITY(1,1) NOT NULL,
		[UID_1C] [binary](16) NOT NULL,
		[Description] [varchar](100) NOT NULL,
		[ParentDescription] [varchar](100) NOT NULL,
		[ChildDescriptionn] [varchar](100) NOT NULL
	 CONSTRAINT [PK_Branches_ID] PRIMARY KEY CLUSTERED 
	(
		[ID] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
	) ON [PRIMARY]

	CREATE NONCLUSTERED INDEX [t_Branches_UID] ON [dbo].[t_Branches]
	(
		[UID_1C] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)

END

-- Справочник.Справочник.Организации
BEGIN

	IF OBJECT_ID('[dbo].[t_Organizations]','U') IS NOT NULL
		DROP TABLE [dbo].[t_Organizations]

	CREATE TABLE [dbo].[t_Organizations](
		[ID] [int] IDENTITY(1,1) NOT NULL,
		[UID_1C] [binary](16) NOT NULL,
		[Description] [varchar](50) NOT NULL
	 CONSTRAINT [PK_Organizations_ID] PRIMARY KEY CLUSTERED 
	(
		[ID] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
	) ON [PRIMARY]

	CREATE NONCLUSTERED INDEX [t_Organizations_UID] ON [dbo].[t_Organizations]
	(
		[UID_1C] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)

END

-- Справочник.Контрагенты
BEGIN

	IF OBJECT_ID('[dbo].[[t_Customers]]','U') IS NOT NULL
		DROP TABLE [dbo].[t_Customers]

	CREATE TABLE [dbo].[t_Customers](
		[ID] [int] IDENTITY(1,1) NOT NULL,
		[UID_1C] [binary](16) NOT NULL,
		[Code] [varchar](11) NOT NULL,
		[INN] [varchar](12) NOT NULL,
		[Description] [varchar](50) NOT NULL,
		[CodeDescription] [varchar](70) NOT NULL,
		[DescriptionCode] [varchar](70) NOT NULL,
		[INNDescription] [varchar](70) NOT NULL,
		[DescriptionINN] [varchar](70) NOT NULL,
		[LegalAddress] [varchar](128),
		[FactAddress] [varchar](128),
		[CustomerTypeID] [int] NOT NULL
	 CONSTRAINT [PK_Customers_ID] PRIMARY KEY CLUSTERED 
	(
		[ID] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
	) ON [PRIMARY]

	CREATE NONCLUSTERED INDEX [t_Customers_UID] ON [dbo].[t_Customers]
	(
		[UID_1C] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)

END

-- Справочник.ТипыКонтрагента
BEGIN

	IF OBJECT_ID('[dbo].[t_CustomersTypes]','U') IS NOT NULL
		DROP TABLE [dbo].[t_CustomersTypes]

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

END

-- Справочник.ТочкиДоставки
BEGIN

	IF OBJECT_ID('[dbo].[t_DeliveryPoint]','U') IS NOT NULL
		DROP TABLE [dbo].[t_DeliveryPoint]

	CREATE TABLE [dbo].[t_DeliveryPoint](
		[ID] [int] IDENTITY(1,1) NOT NULL,
		[UID_1C] [binary](16) NOT NULL,
		[Code] [varchar](11) NOT NULL,
		[Description] [varchar](100) NOT NULL,
		[CodeDescription] [varchar](128) NOT NULL,
		[DescriptionCode] [varchar](128) NOT NULL,
		[Branch] [varchar](50) NOT NULL,
	 CONSTRAINT [PK_DeliveryPoint_ID] PRIMARY KEY CLUSTERED 
	(
		[ID] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
	) ON [PRIMARY]

	CREATE NONCLUSTERED INDEX [t_DeliveryPoint_UID] ON [dbo].[t_DeliveryPoint]
	(
		[UID_1C] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)

END

-- Справочник.Маршруты
BEGIN

	IF OBJECT_ID('[dbo].[t_Routes]','U') IS NOT NULL
		DROP TABLE [dbo].[t_Routes]

	CREATE TABLE [dbo].[t_Routes](
		[ID] [int] IDENTITY(1,1) NOT NULL,
		[UID_1C] [binary](16) NOT NULL,
		[TeamID] [int] NOT NULL,
		[Description] [varchar](100) NOT NULL,
		[Branch] [varchar](50) NOT NULL,
	 CONSTRAINT [PK_Routes_ID] PRIMARY KEY CLUSTERED 
	(
		[ID] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
	) ON [PRIMARY]

	CREATE NONCLUSTERED INDEX [t_Routes_UID] ON [dbo].[t_Routes]
	(
		[UID_1C] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)

END

-- Справочник.КомандыТорговыхАгентов
BEGIN

	IF OBJECT_ID('[dbo].[t_Teams]','U') IS NOT NULL
		DROP TABLE [dbo].[t_Teams]

	CREATE TABLE [dbo].[t_Teams](
		[ID] [int] IDENTITY(1,1) NOT NULL,
		[UID_1C] [binary](16) NOT NULL,
		[Description] [varchar](25) NOT NULL,
		[SMT_ID] [int] NOT NULL,
		[Business] [varchar](50) NOT NULL,
	 CONSTRAINT [PK_Teams_ID] PRIMARY KEY CLUSTERED 
	(
		[ID] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
	) ON [PRIMARY]

	CREATE NONCLUSTERED INDEX [t_Teams_UID] ON [dbo].[t_Teams]
	(
		[UID_1C] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)

END

-- Справочник.СистемыМобильныхПродаж
BEGIN

	IF OBJECT_ID('[dbo].[t_SystemsMobileTrade]','U') IS NOT NULL
		DROP TABLE [dbo].[t_SystemsMobileTrade]

	CREATE TABLE [dbo].[t_SystemsMobileTrade](
		[ID] [int] IDENTITY(1,1) NOT NULL,
		[UID_1C] [binary](16) NOT NULL,
		[Description] [varchar](25) NOT NULL,
	 CONSTRAINT [PK_SystemsMobileTrade_ID] PRIMARY KEY CLUSTERED 
	(
		[ID] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
	) ON [PRIMARY]

	CREATE NONCLUSTERED INDEX [t_SystemsMobileTrade_UID] ON [dbo].[t_SystemsMobileTrade]
	(
		[UID_1C] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)

END

-- Справочник.КредитныеНаправления
BEGIN

	IF OBJECT_ID('[dbo].[t_CreditLines]','U') IS NOT NULL
		DROP TABLE [dbo].[t_CreditLines]

	CREATE TABLE [dbo].[t_CreditLines](
		[ID] [int] IDENTITY(1,1) NOT NULL,
		[UID_1C] [binary](16) NOT NULL,
		[Description] [varchar](100) NOT NULL,
		[CreditTypeID] [int] NOT NULL,
		[Business] [varchar](50) NOT NULL,
	 CONSTRAINT [PK_CreditLines_ID] PRIMARY KEY CLUSTERED 
	(
		[ID] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
	) ON [PRIMARY]

	CREATE NONCLUSTERED INDEX [t_CreditLines_UID] ON [dbo].[t_CreditLines]
	(
		[UID_1C] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)

END

-- Перечисление.ТипыКредитныхНаправлений
BEGIN

	IF OBJECT_ID('[dbo].[t_CreditTypes]','U') IS NOT NULL
		DROP TABLE [dbo].[t_CreditTypes]

	CREATE TABLE [dbo].[t_CreditTypes](
		[ID] [int] IDENTITY(1,1) NOT NULL,
		[UID_1C] [binary](16) NOT NULL,
		[Description] [varchar](50) NOT NULL,
	 CONSTRAINT [PK_CreditTypes_ID] PRIMARY KEY CLUSTERED 
	(
		[ID] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
	) ON [PRIMARY]

	CREATE NONCLUSTERED INDEX [t_CreditTypes_UID] ON [dbo].[t_CreditTypes]
	(
		[UID_1C] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)

END

-- Справочник.Склады
BEGIN

	IF OBJECT_ID('[dbo].[t_Warehouses]','U') IS NOT NULL
		DROP TABLE [dbo].[t_Warehouses]

	CREATE TABLE [dbo].[t_Warehouses](
		[ID] [int] IDENTITY(1,1) NOT NULL,
		[UID_1C] [binary](16) NOT NULL,
		[Description] [varchar](100) NOT NULL,
		[Branch] [varchar](50) NOT NULL,
	 CONSTRAINT [PK_Warehouses_ID] PRIMARY KEY CLUSTERED 
	(
		[ID] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
	) ON [PRIMARY]

	CREATE NONCLUSTERED INDEX [t_Warehouses_UID] ON [dbo].[t_Warehouses]
	(
		[UID_1C] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)

END

-- Справочник.ТипыЦенНоменклатуры
BEGIN

	IF OBJECT_ID('[dbo].[t_PriceTypes]','U') IS NOT NULL
		DROP TABLE [dbo].[t_PriceTypes]

	CREATE TABLE [dbo].[t_PriceTypes](
		[ID] [int] IDENTITY(1,1) NOT NULL,
		[UID_1C] [binary](16) NOT NULL,
		[Description] [varchar](25) NOT NULL,
		[Business] [varchar](50) NOT NULL,
	 CONSTRAINT [PK_PriceTypes_ID] PRIMARY KEY CLUSTERED 
	(
		[ID] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
	) ON [PRIMARY]

	CREATE NONCLUSTERED INDEX [t_PriceTypes_UID] ON [dbo].[t_PriceTypes]
	(
		[UID_1C] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)

END

-- Справочник.Сотрудники
BEGIN

	IF OBJECT_ID('[dbo].[t_Staff]','U') IS NOT NULL
		DROP TABLE [dbo].[t_Staff]

	CREATE TABLE [dbo].[t_Staff](
		[ID] [int] IDENTITY(1,1) NOT NULL,
		[UID_1C] [binary](16) NOT NULL,
		[Description] [varchar](50) NOT NULL,
	 CONSTRAINT [PK_Staf_ID] PRIMARY KEY CLUSTERED 
	(
		[ID] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
	) ON [PRIMARY]

	CREATE NONCLUSTERED INDEX [t_Staff_UID] ON [dbo].[t_Staff]
	(
		[UID_1C] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)

END

-- Перечисление.ХозяйственныеОперации
BEGIN

	IF OBJECT_ID('[dbo].[t_BusinessTransactions]','U') IS NOT NULL
		DROP TABLE [dbo].[t_BusinessTransactions]

	CREATE TABLE [dbo].[t_BusinessTransactions](
		[ID] [int] IDENTITY(1,1) NOT NULL,
		[UID_1C] [binary](16) NOT NULL,
		[Description] [varchar](50) NOT NULL,
	 CONSTRAINT [PK_BusinessTransactions_ID] PRIMARY KEY CLUSTERED 
	(
		[ID] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
	) ON [PRIMARY]

	CREATE NONCLUSTERED INDEX [t_BusinessTransactions_UID] ON [dbo].[t_BusinessTransactions]
	(
		[UID_1C] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)

END

-- Документ.РеализацияТоваров
BEGIN

	IF OBJECT_ID('[dbo].[t_SalesDocuments]','U') IS NOT NULL
		DROP TABLE [dbo].[t_SalesDocuments]

	CREATE TABLE [dbo].[t_SalesDocuments](
		[ID] [int] IDENTITY(1,1) NOT NULL,
		[UID_1C] [binary](16) NOT NULL,
		[Description] [varchar](128) NOT NULL,
		[DocDate] [date] NOT NULL,
		[DocNumber]  [varchar](21) NOT NULL,
		[DocumentTypeID] [int] NOT NULL,
		[PaymentMethodID] [int] NOT NULL,
		[DocDeliveryDate] [date] NOT NULL,
		[DocPaymentDay] [date] NOT NULL,
		[IsBonusDoc] [bit] NOT NULL,
	 CONSTRAINT [PK_SalesDocuments_ID] PRIMARY KEY CLUSTERED 
	(
		[ID] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
	) ON [PRIMARY]

	CREATE NONCLUSTERED INDEX [t_SalesDocuments_UID] ON [dbo].[t_SalesDocuments]
	(
		[UID_1C] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)

END

-- Перечисление.ТипыДокументов
BEGIN

	IF OBJECT_ID('[dbo].[t_SalesDocumentsType]','U') IS NOT NULL
		DROP TABLE [dbo].[t_SalesDocumentsType]

	CREATE TABLE [dbo].[t_SalesDocumentsType](
		[ID] [int] IDENTITY(1,1) NOT NULL,
		[UID_1C] [binary](16) NOT NULL,
		[Description] [varchar](50) NOT NULL,
	 CONSTRAINT [PK_SalesDocumentsType_ID] PRIMARY KEY CLUSTERED 
	(
		[ID] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
	) ON [PRIMARY]

	CREATE NONCLUSTERED INDEX [t_SalesDocumentsType_UID] ON [dbo].[t_SalesDocumentsType]
	(
		[UID_1C] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)

END

-- Перечисление.СпособыОплаты
BEGIN

	IF OBJECT_ID('[dbo].[t_PaymentsType]','U') IS NOT NULL
		DROP TABLE [dbo].[t_PaymentsType]

	CREATE TABLE [dbo].[t_PaymentsType](
		[ID] [int] IDENTITY(1,1) NOT NULL,
		[UID_1C] [binary](16) NOT NULL,
		[Description] [varchar](50) NOT NULL,
	 CONSTRAINT [PK_PaymentsType_ID] PRIMARY KEY CLUSTERED 
	(
		[ID] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
	) ON [PRIMARY]

	CREATE NONCLUSTERED INDEX [t_PaymentsType_UID] ON [dbo].[t_PaymentsType]
	(
		[UID_1C] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)

END

-- Документы
BEGIN

	IF OBJECT_ID('[dbo].[t_Documents]','U') IS NOT NULL
		DROP TABLE [dbo].[t_Documents]

	CREATE TABLE [dbo].[t_Documents](
		[ID] [int] IDENTITY(1,1) NOT NULL,
		[UID_1C] [binary](16) NOT NULL,
		[Description] [varchar](128) NOT NULL,
		[DocDate] [date] NOT NULL,
		[DocNumber]  [varchar](21) NOT NULL,
	 CONSTRAINT [PK_Documents_ID] PRIMARY KEY CLUSTERED 
	(
		[ID] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
	) ON [PRIMARY]

	CREATE NONCLUSTERED INDEX [t_Documents_UID] ON [dbo].[t_Documents]
	(
		[UID_1C] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)

END

-- Справочник.КаналыПродаж
BEGIN

	IF OBJECT_ID('[dbo].[t_TradeChanels]','U') IS NOT NULL
		DROP TABLE [dbo].[t_TradeChanels]

	CREATE TABLE [dbo].[t_TradeChanels](
		[ID] [int] IDENTITY(1,1) NOT NULL,
		[UID_1C] [binary](16) NOT NULL,
		[Description] [varchar](25) NOT NULL,
		[ParentDescription] [varchar](25) NOT NULL,
		[OfficialDescription] [varchar](70) NOT NULL,
		[CodeISIS] [numeric](19,0) NOT NULL,
		[IsKBD] [bit] NOT NULL
	 CONSTRAINT [PK_TradeChanels_ID] PRIMARY KEY CLUSTERED 
	(
		[ID] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
	) ON [PRIMARY]

	CREATE NONCLUSTERED INDEX [t_TradeChanels_UID] ON [dbo].[t_TradeChanels]
	(
		[UID_1C] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)

END

-- Справочник.Номенклатура
BEGIN

	IF OBJECT_ID('[dbo].[t_Goods]','U') IS NOT NULL
		DROP TABLE [dbo].[t_Goods]

	CREATE TABLE [dbo].[t_Goods](
		[ID] [int] IDENTITY(1,1) NOT NULL,
		[UID_1C] [binary](16) NOT NULL,
		[Article] [varchar](25) NOT NULL,
		[Description] [varchar](100) NOT NULL,
		[ArticleDescription] [varchar](128) NOT NULL,
		[DescriptionArticle] [varchar](128) NOT NULL,
		[Business] [varchar](50) NOT NULL,
		[CSKU_ID] [int] NOT NULL,
		[BrandID] [int] NOT NULL,
		[VACT] [numeric](2,0) NOT NULL,
	 CONSTRAINT [PK_Goods_ID] PRIMARY KEY CLUSTERED 
	(
		[ID] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
	) ON [PRIMARY]

	CREATE NONCLUSTERED INDEX [t_Goods_UID] ON [dbo].[t_Goods]
	(
		[UID_1C] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)

END

-- Справочник.CSKU (элементы)
BEGIN

	IF OBJECT_ID('[dbo].[t_CSKU_Elements]','U') IS NOT NULL
		DROP TABLE [dbo].[t_CSKU_Elements]

	CREATE TABLE [dbo].[t_CSKU_Elements](
		[ID] [int] IDENTITY(1,1) NOT NULL,
		[UID_1C] [binary](16) NOT NULL,
		[HierarchyID] [int] NOT NULL,
		[Code] [varchar](9) NOT NULL,
		[Description] [varchar](100) NOT NULL,
		[CodeDescription] [varchar](128) NOT NULL,
		[DescriptionCode] [varchar](128) NOT NULL,
	 CONSTRAINT [PK_CSKU_Elements_ID] PRIMARY KEY CLUSTERED 
	(
		[ID] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
	) ON [PRIMARY]

	CREATE NONCLUSTERED INDEX [t_CSKU_Elements_UID] ON [dbo].[t_CSKU_Elements]
	(
		[UID_1C] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)

END


-- Справочник.CSKU (иерархия)
BEGIN

	IF OBJECT_ID('[dbo].[t_CSKU_Hierarchy]','U') IS NOT NULL
		DROP TABLE [dbo].[t_CSKU_Hierarchy]

	CREATE TABLE [dbo].[t_CSKU_Hierarchy](
		[ID] [int] IDENTITY(1,1) NOT NULL,
		[UID_1C] [binary](16) NOT NULL,
		[Parent0_Code] [varchar](9) NOT NULL,
		[Parent0_Description] [varchar](100) NOT NULL,
		[Parent1_Code] [varchar](9) NOT NULL,
		[Parent1_Description] [varchar](100) NOT NULL,
		[Parent2_Code] [varchar](9) NOT NULL,
		[Parent2_Description] [varchar](100) NOT NULL,
		[Parent3_Code] [varchar](9) NOT NULL,
		[Parent3_Description] [varchar](100) NOT NULL,
		[Parent4_Code] [varchar](9) NOT NULL,
		[Parent4_Description] [varchar](100) NOT NULL,
		[Parent5_Code] [varchar](9) NOT NULL,
		[Parent5_Description] [varchar](100) NOT NULL,
		[Parent6_Code] [varchar](9) NOT NULL,
		[Parent6_Description] [varchar](100) NOT NULL,
	 CONSTRAINT [PK_CSKU_Hierarchy_ID] PRIMARY KEY CLUSTERED 
	(
		[ID] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
	) ON [PRIMARY]

	CREATE NONCLUSTERED INDEX [t_CSKU_Hierarchy_UID] ON [dbo].[t_CSKU_Hierarchy]
	(
		[UID_1C] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)

END

-- Справочник.Бренды
BEGIN

	IF OBJECT_ID('[dbo].[t_Brands]','U') IS NOT NULL
		DROP TABLE [dbo].[t_Brands]

	CREATE TABLE [dbo].[t_Brands](
		[ID] [int] IDENTITY(1,1) NOT NULL,
		[UID_1C] [binary](16) NOT NULL,
		[Description] [varchar](100) NOT NULL
	 CONSTRAINT [PK_Brands_ID] PRIMARY KEY CLUSTERED 
	(
		[ID] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
	) ON [PRIMARY]

	CREATE NONCLUSTERED INDEX [t_Brands_UID] ON [dbo].[t_Brands]
	(
		[UID_1C] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)

END

SET ANSI_PADDING OFF
GO

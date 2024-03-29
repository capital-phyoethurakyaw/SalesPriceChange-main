USE [SPCres123]
GO
EXEC sys.sp_dropextendedproperty @name=N'MS_Description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SalesPriceDetail', @level2type=N'COLUMN',@level2name=N'Stage2Status'

GO
EXEC sys.sp_dropextendedproperty @name=N'MS_Description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SalesPriceDetail', @level2type=N'COLUMN',@level2name=N'Stage1Status'

GO
/****** Object:  Table [dbo].[Users_Stage]    Script Date: 2017/12/07 12:21:51 ******/
DROP TABLE [dbo].[Users_Stage]
GO
/****** Object:  Table [dbo].[Users_Menu]    Script Date: 2017/12/07 12:21:51 ******/
DROP TABLE [dbo].[Users_Menu]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 2017/12/07 12:21:51 ******/
DROP TABLE [dbo].[Users]
GO
/****** Object:  Table [dbo].[Suppliers]    Script Date: 2017/12/07 12:21:51 ******/
DROP TABLE [dbo].[Suppliers]
GO
/****** Object:  Table [dbo].[SuperUser]    Script Date: 2017/12/07 12:21:51 ******/
DROP TABLE [dbo].[SuperUser]
GO
/****** Object:  Table [dbo].[Stage_Setting]    Script Date: 2017/12/07 12:21:51 ******/
DROP TABLE [dbo].[Stage_Setting]
GO
/****** Object:  Table [dbo].[Stage]    Script Date: 2017/12/07 12:21:51 ******/
DROP TABLE [dbo].[Stage]
GO
/****** Object:  Table [dbo].[SpecialPrice_Type]    Script Date: 2017/12/07 12:21:51 ******/
DROP TABLE [dbo].[SpecialPrice_Type]
GO
/****** Object:  Table [dbo].[SalesPriceDetail]    Script Date: 2017/12/07 12:21:51 ******/
DROP TABLE [dbo].[SalesPriceDetail]
GO
/****** Object:  Table [dbo].[Menu]    Script Date: 2017/12/07 12:21:51 ******/
DROP TABLE [dbo].[Menu]
GO
/****** Object:  Table [dbo].[Inventory_Type]    Script Date: 2017/12/07 12:21:51 ******/
DROP TABLE [dbo].[Inventory_Type]
GO
/****** Object:  Table [dbo].[Form_Stage]    Script Date: 2017/12/07 12:21:51 ******/
DROP TABLE [dbo].[Form_Stage]
GO
/****** Object:  Table [dbo].[Brand]    Script Date: 2017/12/07 12:21:51 ******/
DROP TABLE [dbo].[Brand]
GO
/****** Object:  Table [dbo].[Apply_Type]    Script Date: 2017/12/07 12:21:51 ******/
DROP TABLE [dbo].[Apply_Type]
GO
/****** Object:  Table [dbo].[Apply_Type]    Script Date: 2017/12/07 12:21:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Apply_Type](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](50) NULL,
 CONSTRAINT [PK_Apply_Type] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Brand]    Script Date: 2017/12/07 12:21:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Brand](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](50) NULL,
 CONSTRAINT [PK_Brand] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Form_Stage]    Script Date: 2017/12/07 12:21:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Form_Stage](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FormID] [int] NULL,
	[StageID] [int] NULL,
 CONSTRAINT [PK_Form_UserType] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Inventory_Type]    Script Date: 2017/12/07 12:21:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Inventory_Type](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](50) NULL,
 CONSTRAINT [PK_Inventory_Type] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Menu]    Script Date: 2017/12/07 12:21:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Menu](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[MenuID] [int] NULL,
	[Description] [nvarchar](200) NULL,
	[ParentID] [int] NULL,
 CONSTRAINT [PK_Menu] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SalesPriceDetail]    Script Date: 2017/12/07 12:21:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SalesPriceDetail](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FormNo] [varchar](20) NULL,
	[ApplyDate] [date] NULL,
	[ApplyType_ID] [int] NULL,
	[StartDate] [date] NULL,
	[EndDate] [date] NULL,
	[Suppliers_ID] [int] NULL,
	[Brand_ID] [int] NULL,
	[Shipping] [nvarchar](50) NULL,
	[Selling_Date] [date] NULL,
	[Selling_Discount1] [int] NULL,
	[Selling_Discount2] [int] NULL,
	[Purchase_Date] [date] NULL,
	[Purchase_Discount1] [int] NULL,
	[Purchase_Discount2] [int] NULL,
	[SpecialPriceType_ID] [int] NULL,
	[InventoryType_ID] [int] NULL,
	[Attachment] [bit] NULL,
	[ProductNoUnit] [bit] NULL,
	[ColorUnit] [bit] NULL,
	[Hot] [bit] NULL,
	[SaleBanner] [bit] NULL,
	[SaleText] [bit] NULL,
	[Header] [bit] NULL,
	[Side] [bit] NULL,
	[Remark] [nvarchar](200) NULL,
	[Stage1Comment] [nvarchar](200) NULL,
	[Stage1Status] [int] NULL CONSTRAINT [DF_SalesPriceDetail_Stage1Status]  DEFAULT ((0)),
	[Stage2Comment] [nvarchar](200) NULL,
	[Stage2Status] [int] NULL CONSTRAINT [DF_SalesPriceDetail_State2Status]  DEFAULT ((0)),
	[Stage3Comment] [nvarchar](200) NULL,
	[Stage3Status] [int] NULL CONSTRAINT [DF_SalesPriceDetail_Stage3Status]  DEFAULT ((0)),
	[Stage4Comment] [nvarchar](200) NULL,
	[Stage4Status] [int] NULL CONSTRAINT [DF_SalesPriceDetail_Stage4Status]  DEFAULT ((0)),
	[Stage5Comment] [nvarchar](200) NULL,
	[Stage5Status] [int] NULL CONSTRAINT [DF_SalesPriceDetail_Stage5Status]  DEFAULT ((0)),
	[Stage6Comment] [nvarchar](200) NULL,
	[Stage6Status] [int] NULL CONSTRAINT [DF_SalesPriceDetail_Stage6Status]  DEFAULT ((0)),
	[Stage7Comment] [nvarchar](200) NULL,
	[Stage7Status] [int] NULL CONSTRAINT [DF_SalesPriceDetail_Stage7Status]  DEFAULT ((0)),
	[CreatedUserID] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedUserID] [int] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_FormDetail] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SpecialPrice_Type]    Script Date: 2017/12/07 12:21:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SpecialPrice_Type](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](50) NULL,
 CONSTRAINT [PK_SpecialPrice_Type] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Stage]    Script Date: 2017/12/07 12:21:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Stage](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[StageID] [int] NULL,
	[Description] [nvarchar](100) NULL,
 CONSTRAINT [PK_UserType] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Stage_Setting]    Script Date: 2017/12/07 12:21:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Stage_Setting](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[StageID] [int] NULL,
	[RowID] [int] NULL,
 CONSTRAINT [PK_Stage_Setting] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SuperUser]    Script Date: 2017/12/07 12:21:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SuperUser](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[SuperUser] [varchar](50) NULL,
	[Password] [varchar](50) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Suppliers]    Script Date: 2017/12/07 12:21:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Suppliers](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](50) NULL,
 CONSTRAINT [PK_Suppliers] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Users]    Script Date: 2017/12/07 12:21:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [nvarchar](8) NULL,
	[Password] [nvarchar](30) NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Users_Menu]    Script Date: 2017/12/07 12:21:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Users_Menu](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NULL,
	[MenuID] [varchar](20) NULL,
 CONSTRAINT [PK_User_Menus] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Users_Stage]    Script Date: 2017/12/07 12:21:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users_Stage](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UsersID] [int] NULL,
	[StageID] [int] NULL,
 CONSTRAINT [PK_User_Usertype] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Apply_Type] ON 

INSERT [dbo].[Apply_Type] ([ID], [Description]) VALUES (1, N'最終処分')
INSERT [dbo].[Apply_Type] ([ID], [Description]) VALUES (2, N'単発企画')
INSERT [dbo].[Apply_Type] ([ID], [Description]) VALUES (3, N'定価変更')
INSERT [dbo].[Apply_Type] ([ID], [Description]) VALUES (4, N'掛率変更')
INSERT [dbo].[Apply_Type] ([ID], [Description]) VALUES (5, N'売価変更')
INSERT [dbo].[Apply_Type] ([ID], [Description]) VALUES (6, N'掛率・売価変更')
INSERT [dbo].[Apply_Type] ([ID], [Description]) VALUES (7, N'原価変更')
INSERT [dbo].[Apply_Type] ([ID], [Description]) VALUES (8, N'その他')
SET IDENTITY_INSERT [dbo].[Apply_Type] OFF
SET IDENTITY_INSERT [dbo].[Brand] ON 

INSERT [dbo].[Brand] ([ID], [Description]) VALUES (1, N'D2')
INSERT [dbo].[Brand] ([ID], [Description]) VALUES (2, N'i max')
INSERT [dbo].[Brand] ([ID], [Description]) VALUES (3, N'Spite')
INSERT [dbo].[Brand] ([ID], [Description]) VALUES (4, N'Giordano')
SET IDENTITY_INSERT [dbo].[Brand] OFF
SET IDENTITY_INSERT [dbo].[Form_Stage] ON 

INSERT [dbo].[Form_Stage] ([ID], [FormID], [StageID]) VALUES (3, 3, 2)
INSERT [dbo].[Form_Stage] ([ID], [FormID], [StageID]) VALUES (4, 4, 2)
INSERT [dbo].[Form_Stage] ([ID], [FormID], [StageID]) VALUES (5, 5, 2)
INSERT [dbo].[Form_Stage] ([ID], [FormID], [StageID]) VALUES (6, 6, 2)
INSERT [dbo].[Form_Stage] ([ID], [FormID], [StageID]) VALUES (7, 7, 2)
INSERT [dbo].[Form_Stage] ([ID], [FormID], [StageID]) VALUES (8, 8, 2)
INSERT [dbo].[Form_Stage] ([ID], [FormID], [StageID]) VALUES (9, 9, 1)
INSERT [dbo].[Form_Stage] ([ID], [FormID], [StageID]) VALUES (10, 10, 2)
INSERT [dbo].[Form_Stage] ([ID], [FormID], [StageID]) VALUES (11, 11, 2)
INSERT [dbo].[Form_Stage] ([ID], [FormID], [StageID]) VALUES (12, 12, 2)
INSERT [dbo].[Form_Stage] ([ID], [FormID], [StageID]) VALUES (13, 13, 2)
INSERT [dbo].[Form_Stage] ([ID], [FormID], [StageID]) VALUES (14, 14, 2)
INSERT [dbo].[Form_Stage] ([ID], [FormID], [StageID]) VALUES (15, 15, 2)
INSERT [dbo].[Form_Stage] ([ID], [FormID], [StageID]) VALUES (16, 16, 2)
INSERT [dbo].[Form_Stage] ([ID], [FormID], [StageID]) VALUES (17, 17, 2)
INSERT [dbo].[Form_Stage] ([ID], [FormID], [StageID]) VALUES (18, 1, 3)
INSERT [dbo].[Form_Stage] ([ID], [FormID], [StageID]) VALUES (19, 1, 4)
INSERT [dbo].[Form_Stage] ([ID], [FormID], [StageID]) VALUES (20, 18, 2)
INSERT [dbo].[Form_Stage] ([ID], [FormID], [StageID]) VALUES (21, 19, 2)
INSERT [dbo].[Form_Stage] ([ID], [FormID], [StageID]) VALUES (22, 20, 2)
INSERT [dbo].[Form_Stage] ([ID], [FormID], [StageID]) VALUES (23, 21, 2)
INSERT [dbo].[Form_Stage] ([ID], [FormID], [StageID]) VALUES (24, 22, 2)
INSERT [dbo].[Form_Stage] ([ID], [FormID], [StageID]) VALUES (25, 23, 2)
INSERT [dbo].[Form_Stage] ([ID], [FormID], [StageID]) VALUES (26, 24, 2)
INSERT [dbo].[Form_Stage] ([ID], [FormID], [StageID]) VALUES (27, 25, 2)
INSERT [dbo].[Form_Stage] ([ID], [FormID], [StageID]) VALUES (28, 26, 2)
INSERT [dbo].[Form_Stage] ([ID], [FormID], [StageID]) VALUES (31, 29, 2)
INSERT [dbo].[Form_Stage] ([ID], [FormID], [StageID]) VALUES (32, 30, 2)
INSERT [dbo].[Form_Stage] ([ID], [FormID], [StageID]) VALUES (33, 31, 2)
INSERT [dbo].[Form_Stage] ([ID], [FormID], [StageID]) VALUES (34, 32, 2)
INSERT [dbo].[Form_Stage] ([ID], [FormID], [StageID]) VALUES (35, 33, 2)
INSERT [dbo].[Form_Stage] ([ID], [FormID], [StageID]) VALUES (36, 34, 2)
INSERT [dbo].[Form_Stage] ([ID], [FormID], [StageID]) VALUES (37, 35, 2)
INSERT [dbo].[Form_Stage] ([ID], [FormID], [StageID]) VALUES (38, 36, 2)
INSERT [dbo].[Form_Stage] ([ID], [FormID], [StageID]) VALUES (42, 27, 6)
INSERT [dbo].[Form_Stage] ([ID], [FormID], [StageID]) VALUES (43, 27, 7)
INSERT [dbo].[Form_Stage] ([ID], [FormID], [StageID]) VALUES (44, 28, 3)
INSERT [dbo].[Form_Stage] ([ID], [FormID], [StageID]) VALUES (45, 28, 4)
INSERT [dbo].[Form_Stage] ([ID], [FormID], [StageID]) VALUES (46, 37, 2)
INSERT [dbo].[Form_Stage] ([ID], [FormID], [StageID]) VALUES (47, 38, 2)
INSERT [dbo].[Form_Stage] ([ID], [FormID], [StageID]) VALUES (48, 39, 2)
INSERT [dbo].[Form_Stage] ([ID], [FormID], [StageID]) VALUES (49, 40, 2)
INSERT [dbo].[Form_Stage] ([ID], [FormID], [StageID]) VALUES (50, 41, 2)
INSERT [dbo].[Form_Stage] ([ID], [FormID], [StageID]) VALUES (51, 42, 2)
INSERT [dbo].[Form_Stage] ([ID], [FormID], [StageID]) VALUES (52, 43, 2)
INSERT [dbo].[Form_Stage] ([ID], [FormID], [StageID]) VALUES (54, 44, 3)
INSERT [dbo].[Form_Stage] ([ID], [FormID], [StageID]) VALUES (55, 44, 4)
INSERT [dbo].[Form_Stage] ([ID], [FormID], [StageID]) VALUES (56, 45, 2)
INSERT [dbo].[Form_Stage] ([ID], [FormID], [StageID]) VALUES (57, 46, 2)
INSERT [dbo].[Form_Stage] ([ID], [FormID], [StageID]) VALUES (58, 47, 2)
INSERT [dbo].[Form_Stage] ([ID], [FormID], [StageID]) VALUES (59, 48, 2)
INSERT [dbo].[Form_Stage] ([ID], [FormID], [StageID]) VALUES (60, 49, 2)
INSERT [dbo].[Form_Stage] ([ID], [FormID], [StageID]) VALUES (61, 50, 2)
INSERT [dbo].[Form_Stage] ([ID], [FormID], [StageID]) VALUES (62, 51, 2)
INSERT [dbo].[Form_Stage] ([ID], [FormID], [StageID]) VALUES (63, 52, 2)
INSERT [dbo].[Form_Stage] ([ID], [FormID], [StageID]) VALUES (64, 53, 2)
INSERT [dbo].[Form_Stage] ([ID], [FormID], [StageID]) VALUES (65, 54, 2)
INSERT [dbo].[Form_Stage] ([ID], [FormID], [StageID]) VALUES (66, 55, 2)
INSERT [dbo].[Form_Stage] ([ID], [FormID], [StageID]) VALUES (67, 56, 2)
INSERT [dbo].[Form_Stage] ([ID], [FormID], [StageID]) VALUES (68, 57, 2)
INSERT [dbo].[Form_Stage] ([ID], [FormID], [StageID]) VALUES (69, 58, 2)
INSERT [dbo].[Form_Stage] ([ID], [FormID], [StageID]) VALUES (70, 59, 2)
INSERT [dbo].[Form_Stage] ([ID], [FormID], [StageID]) VALUES (71, 60, 2)
INSERT [dbo].[Form_Stage] ([ID], [FormID], [StageID]) VALUES (72, 61, 2)
INSERT [dbo].[Form_Stage] ([ID], [FormID], [StageID]) VALUES (73, 62, 2)
INSERT [dbo].[Form_Stage] ([ID], [FormID], [StageID]) VALUES (74, 63, 2)
INSERT [dbo].[Form_Stage] ([ID], [FormID], [StageID]) VALUES (75, 64, 2)
INSERT [dbo].[Form_Stage] ([ID], [FormID], [StageID]) VALUES (76, 65, 2)
INSERT [dbo].[Form_Stage] ([ID], [FormID], [StageID]) VALUES (77, 66, 2)
INSERT [dbo].[Form_Stage] ([ID], [FormID], [StageID]) VALUES (78, 67, 2)
INSERT [dbo].[Form_Stage] ([ID], [FormID], [StageID]) VALUES (79, 68, 2)
INSERT [dbo].[Form_Stage] ([ID], [FormID], [StageID]) VALUES (80, 69, 2)
INSERT [dbo].[Form_Stage] ([ID], [FormID], [StageID]) VALUES (81, 70, 2)
INSERT [dbo].[Form_Stage] ([ID], [FormID], [StageID]) VALUES (82, 71, 2)
INSERT [dbo].[Form_Stage] ([ID], [FormID], [StageID]) VALUES (83, 72, 2)
INSERT [dbo].[Form_Stage] ([ID], [FormID], [StageID]) VALUES (104, 2, 8)
INSERT [dbo].[Form_Stage] ([ID], [FormID], [StageID]) VALUES (105, 73, 2)
INSERT [dbo].[Form_Stage] ([ID], [FormID], [StageID]) VALUES (106, 74, 2)
INSERT [dbo].[Form_Stage] ([ID], [FormID], [StageID]) VALUES (107, 75, 2)
INSERT [dbo].[Form_Stage] ([ID], [FormID], [StageID]) VALUES (108, 76, 2)
INSERT [dbo].[Form_Stage] ([ID], [FormID], [StageID]) VALUES (109, 77, 2)
INSERT [dbo].[Form_Stage] ([ID], [FormID], [StageID]) VALUES (110, 78, 2)
INSERT [dbo].[Form_Stage] ([ID], [FormID], [StageID]) VALUES (111, 79, 2)
INSERT [dbo].[Form_Stage] ([ID], [FormID], [StageID]) VALUES (112, 80, 2)
INSERT [dbo].[Form_Stage] ([ID], [FormID], [StageID]) VALUES (113, 81, 2)
INSERT [dbo].[Form_Stage] ([ID], [FormID], [StageID]) VALUES (114, 82, 2)
INSERT [dbo].[Form_Stage] ([ID], [FormID], [StageID]) VALUES (115, 83, 2)
INSERT [dbo].[Form_Stage] ([ID], [FormID], [StageID]) VALUES (116, 84, 2)
INSERT [dbo].[Form_Stage] ([ID], [FormID], [StageID]) VALUES (117, 85, 2)
INSERT [dbo].[Form_Stage] ([ID], [FormID], [StageID]) VALUES (118, 86, 2)
INSERT [dbo].[Form_Stage] ([ID], [FormID], [StageID]) VALUES (119, 87, 2)
SET IDENTITY_INSERT [dbo].[Form_Stage] OFF
SET IDENTITY_INSERT [dbo].[Inventory_Type] ON 

INSERT [dbo].[Inventory_Type] ([ID], [Description]) VALUES (1, N'無限')
INSERT [dbo].[Inventory_Type] ([ID], [Description]) VALUES (2, N'完売')
INSERT [dbo].[Inventory_Type] ([ID], [Description]) VALUES (3, N'自社＋メーカー')
INSERT [dbo].[Inventory_Type] ([ID], [Description]) VALUES (4, N'自社在庫のみ')
INSERT [dbo].[Inventory_Type] ([ID], [Description]) VALUES (5, N'変更なし')
SET IDENTITY_INSERT [dbo].[Inventory_Type] OFF
SET IDENTITY_INSERT [dbo].[Menu] ON 

INSERT [dbo].[Menu] ([ID], [MenuID], [Description], [ParentID]) VALUES (1, 1, N'Home', 0)
INSERT [dbo].[Menu] ([ID], [MenuID], [Description], [ParentID]) VALUES (2, 2, N'SalePrice Category', 0)
INSERT [dbo].[Menu] ([ID], [MenuID], [Description], [ParentID]) VALUES (3, 3, N'Price List', 2)
INSERT [dbo].[Menu] ([ID], [MenuID], [Description], [ParentID]) VALUES (4, 4, N'Price Change', 2)
INSERT [dbo].[Menu] ([ID], [MenuID], [Description], [ParentID]) VALUES (5, 5, N'User Authorization', 0)
INSERT [dbo].[Menu] ([ID], [MenuID], [Description], [ParentID]) VALUES (6, 6, N'User List', 5)
INSERT [dbo].[Menu] ([ID], [MenuID], [Description], [ParentID]) VALUES (7, 7, N'User Entry', 5)
INSERT [dbo].[Menu] ([ID], [MenuID], [Description], [ParentID]) VALUES (8, 8, N'User Menu', 5)
INSERT [dbo].[Menu] ([ID], [MenuID], [Description], [ParentID]) VALUES (9, 9, N'Stage Mode', 0)
INSERT [dbo].[Menu] ([ID], [MenuID], [Description], [ParentID]) VALUES (10, 10, N'Stage Setting', 9)
INSERT [dbo].[Menu] ([ID], [MenuID], [Description], [ParentID]) VALUES (11, 11, N'About Software', 0)
SET IDENTITY_INSERT [dbo].[Menu] OFF
SET IDENTITY_INSERT [dbo].[SalesPriceDetail] ON 

INSERT [dbo].[SalesPriceDetail] ([ID], [FormNo], [ApplyDate], [ApplyType_ID], [StartDate], [EndDate], [Suppliers_ID], [Brand_ID], [Shipping], [Selling_Date], [Selling_Discount1], [Selling_Discount2], [Purchase_Date], [Purchase_Discount1], [Purchase_Discount2], [SpecialPriceType_ID], [InventoryType_ID], [Attachment], [ProductNoUnit], [ColorUnit], [Hot], [SaleBanner], [SaleText], [Header], [Side], [Remark], [Stage1Comment], [Stage1Status], [Stage2Comment], [Stage2Status], [Stage3Comment], [Stage3Status], [Stage4Comment], [Stage4Status], [Stage5Comment], [Stage5Status], [Stage6Comment], [Stage6Status], [Stage7Comment], [Stage7Status], [CreatedUserID], [CreatedDate], [UpdatedUserID], [UpdatedDate]) VALUES (1, N'2017-00001', CAST(N'2017-04-04' AS Date), 3, NULL, NULL, 3, 2, N'1', NULL, -1, -1, NULL, -1, -1, 1, 1, 0, 1, 0, 0, 0, 0, 0, 0, NULL, N'test', 1, N'test', 1, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, 1, CAST(N'2017-04-04 08:54:08.000' AS DateTime), 1, CAST(N'2017-04-04 09:25:51.000' AS DateTime))
INSERT [dbo].[SalesPriceDetail] ([ID], [FormNo], [ApplyDate], [ApplyType_ID], [StartDate], [EndDate], [Suppliers_ID], [Brand_ID], [Shipping], [Selling_Date], [Selling_Discount1], [Selling_Discount2], [Purchase_Date], [Purchase_Discount1], [Purchase_Discount2], [SpecialPriceType_ID], [InventoryType_ID], [Attachment], [ProductNoUnit], [ColorUnit], [Hot], [SaleBanner], [SaleText], [Header], [Side], [Remark], [Stage1Comment], [Stage1Status], [Stage2Comment], [Stage2Status], [Stage3Comment], [Stage3Status], [Stage4Comment], [Stage4Status], [Stage5Comment], [Stage5Status], [Stage6Comment], [Stage6Status], [Stage7Comment], [Stage7Status], [CreatedUserID], [CreatedDate], [UpdatedUserID], [UpdatedDate]) VALUES (2, N'2017-00002', CAST(N'2017-04-04' AS Date), 3, NULL, NULL, 1, 1, NULL, NULL, -1, -1, NULL, -1, -1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, NULL, N'test', 1, N'test', 1, N'test', 1, N'test', 1, N'test', 1, N'test', 1, N'test', 1, 1, CAST(N'2017-04-04 08:54:14.000' AS DateTime), 1, CAST(N'2017-04-07 12:52:10.000' AS DateTime))
INSERT [dbo].[SalesPriceDetail] ([ID], [FormNo], [ApplyDate], [ApplyType_ID], [StartDate], [EndDate], [Suppliers_ID], [Brand_ID], [Shipping], [Selling_Date], [Selling_Discount1], [Selling_Discount2], [Purchase_Date], [Purchase_Discount1], [Purchase_Discount2], [SpecialPriceType_ID], [InventoryType_ID], [Attachment], [ProductNoUnit], [ColorUnit], [Hot], [SaleBanner], [SaleText], [Header], [Side], [Remark], [Stage1Comment], [Stage1Status], [Stage2Comment], [Stage2Status], [Stage3Comment], [Stage3Status], [Stage4Comment], [Stage4Status], [Stage5Comment], [Stage5Status], [Stage6Comment], [Stage6Status], [Stage7Comment], [Stage7Status], [CreatedUserID], [CreatedDate], [UpdatedUserID], [UpdatedDate]) VALUES (3, N'2017-00003', CAST(N'2017-04-04' AS Date), 5, NULL, NULL, 1, 1, NULL, NULL, -1, -1, NULL, -1, -1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, NULL, N'test', 1, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, 1, CAST(N'2017-04-04 08:54:23.000' AS DateTime), 1, CAST(N'2017-04-04 08:58:32.000' AS DateTime))
INSERT [dbo].[SalesPriceDetail] ([ID], [FormNo], [ApplyDate], [ApplyType_ID], [StartDate], [EndDate], [Suppliers_ID], [Brand_ID], [Shipping], [Selling_Date], [Selling_Discount1], [Selling_Discount2], [Purchase_Date], [Purchase_Discount1], [Purchase_Discount2], [SpecialPriceType_ID], [InventoryType_ID], [Attachment], [ProductNoUnit], [ColorUnit], [Hot], [SaleBanner], [SaleText], [Header], [Side], [Remark], [Stage1Comment], [Stage1Status], [Stage2Comment], [Stage2Status], [Stage3Comment], [Stage3Status], [Stage4Comment], [Stage4Status], [Stage5Comment], [Stage5Status], [Stage6Comment], [Stage6Status], [Stage7Comment], [Stage7Status], [CreatedUserID], [CreatedDate], [UpdatedUserID], [UpdatedDate]) VALUES (4, N'2017-00004', CAST(N'2017-04-03' AS Date), 2, NULL, NULL, 1, 1, NULL, NULL, -1, -1, NULL, -1, -1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, NULL, N'test', 1, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, 1, CAST(N'2017-04-04 08:54:33.000' AS DateTime), NULL, NULL)
INSERT [dbo].[SalesPriceDetail] ([ID], [FormNo], [ApplyDate], [ApplyType_ID], [StartDate], [EndDate], [Suppliers_ID], [Brand_ID], [Shipping], [Selling_Date], [Selling_Discount1], [Selling_Discount2], [Purchase_Date], [Purchase_Discount1], [Purchase_Discount2], [SpecialPriceType_ID], [InventoryType_ID], [Attachment], [ProductNoUnit], [ColorUnit], [Hot], [SaleBanner], [SaleText], [Header], [Side], [Remark], [Stage1Comment], [Stage1Status], [Stage2Comment], [Stage2Status], [Stage3Comment], [Stage3Status], [Stage4Comment], [Stage4Status], [Stage5Comment], [Stage5Status], [Stage6Comment], [Stage6Status], [Stage7Comment], [Stage7Status], [CreatedUserID], [CreatedDate], [UpdatedUserID], [UpdatedDate]) VALUES (5, N'2017-00005', CAST(N'2017-04-03' AS Date), 5, NULL, NULL, 1, 1, NULL, NULL, -1, -1, NULL, -1, -1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, NULL, N'test', 1, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, 1, CAST(N'2017-04-04 08:54:48.000' AS DateTime), NULL, NULL)
INSERT [dbo].[SalesPriceDetail] ([ID], [FormNo], [ApplyDate], [ApplyType_ID], [StartDate], [EndDate], [Suppliers_ID], [Brand_ID], [Shipping], [Selling_Date], [Selling_Discount1], [Selling_Discount2], [Purchase_Date], [Purchase_Discount1], [Purchase_Discount2], [SpecialPriceType_ID], [InventoryType_ID], [Attachment], [ProductNoUnit], [ColorUnit], [Hot], [SaleBanner], [SaleText], [Header], [Side], [Remark], [Stage1Comment], [Stage1Status], [Stage2Comment], [Stage2Status], [Stage3Comment], [Stage3Status], [Stage4Comment], [Stage4Status], [Stage5Comment], [Stage5Status], [Stage6Comment], [Stage6Status], [Stage7Comment], [Stage7Status], [CreatedUserID], [CreatedDate], [UpdatedUserID], [UpdatedDate]) VALUES (6, N'2017-00006', CAST(N'2017-04-03' AS Date), 4, NULL, NULL, 1, 1, NULL, NULL, -1, -1, NULL, -1, -1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, NULL, N'test', 1, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, 1, CAST(N'2017-04-04 08:55:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[SalesPriceDetail] ([ID], [FormNo], [ApplyDate], [ApplyType_ID], [StartDate], [EndDate], [Suppliers_ID], [Brand_ID], [Shipping], [Selling_Date], [Selling_Discount1], [Selling_Discount2], [Purchase_Date], [Purchase_Discount1], [Purchase_Discount2], [SpecialPriceType_ID], [InventoryType_ID], [Attachment], [ProductNoUnit], [ColorUnit], [Hot], [SaleBanner], [SaleText], [Header], [Side], [Remark], [Stage1Comment], [Stage1Status], [Stage2Comment], [Stage2Status], [Stage3Comment], [Stage3Status], [Stage4Comment], [Stage4Status], [Stage5Comment], [Stage5Status], [Stage6Comment], [Stage6Status], [Stage7Comment], [Stage7Status], [CreatedUserID], [CreatedDate], [UpdatedUserID], [UpdatedDate]) VALUES (7, N'2017-00007', CAST(N'2017-04-03' AS Date), 4, NULL, NULL, 1, 1, NULL, NULL, -1, -1, NULL, -1, -1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, NULL, N'test', 1, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, 1, CAST(N'2017-04-04 08:55:30.000' AS DateTime), NULL, NULL)
INSERT [dbo].[SalesPriceDetail] ([ID], [FormNo], [ApplyDate], [ApplyType_ID], [StartDate], [EndDate], [Suppliers_ID], [Brand_ID], [Shipping], [Selling_Date], [Selling_Discount1], [Selling_Discount2], [Purchase_Date], [Purchase_Discount1], [Purchase_Discount2], [SpecialPriceType_ID], [InventoryType_ID], [Attachment], [ProductNoUnit], [ColorUnit], [Hot], [SaleBanner], [SaleText], [Header], [Side], [Remark], [Stage1Comment], [Stage1Status], [Stage2Comment], [Stage2Status], [Stage3Comment], [Stage3Status], [Stage4Comment], [Stage4Status], [Stage5Comment], [Stage5Status], [Stage6Comment], [Stage6Status], [Stage7Comment], [Stage7Status], [CreatedUserID], [CreatedDate], [UpdatedUserID], [UpdatedDate]) VALUES (8, N'2017-00008', CAST(N'2017-04-03' AS Date), 7, NULL, NULL, 1, 1, NULL, NULL, -1, -1, NULL, -1, -1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, NULL, N'test', 1, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, 1, CAST(N'2017-04-04 08:55:40.000' AS DateTime), NULL, NULL)
INSERT [dbo].[SalesPriceDetail] ([ID], [FormNo], [ApplyDate], [ApplyType_ID], [StartDate], [EndDate], [Suppliers_ID], [Brand_ID], [Shipping], [Selling_Date], [Selling_Discount1], [Selling_Discount2], [Purchase_Date], [Purchase_Discount1], [Purchase_Discount2], [SpecialPriceType_ID], [InventoryType_ID], [Attachment], [ProductNoUnit], [ColorUnit], [Hot], [SaleBanner], [SaleText], [Header], [Side], [Remark], [Stage1Comment], [Stage1Status], [Stage2Comment], [Stage2Status], [Stage3Comment], [Stage3Status], [Stage4Comment], [Stage4Status], [Stage5Comment], [Stage5Status], [Stage6Comment], [Stage6Status], [Stage7Comment], [Stage7Status], [CreatedUserID], [CreatedDate], [UpdatedUserID], [UpdatedDate]) VALUES (9, N'2017-00009', CAST(N'2017-04-04' AS Date), 1, NULL, NULL, 1, 1, NULL, NULL, -1, -1, NULL, -1, -1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, 1, CAST(N'2017-04-04 08:55:53.000' AS DateTime), NULL, NULL)
INSERT [dbo].[SalesPriceDetail] ([ID], [FormNo], [ApplyDate], [ApplyType_ID], [StartDate], [EndDate], [Suppliers_ID], [Brand_ID], [Shipping], [Selling_Date], [Selling_Discount1], [Selling_Discount2], [Purchase_Date], [Purchase_Discount1], [Purchase_Discount2], [SpecialPriceType_ID], [InventoryType_ID], [Attachment], [ProductNoUnit], [ColorUnit], [Hot], [SaleBanner], [SaleText], [Header], [Side], [Remark], [Stage1Comment], [Stage1Status], [Stage2Comment], [Stage2Status], [Stage3Comment], [Stage3Status], [Stage4Comment], [Stage4Status], [Stage5Comment], [Stage5Status], [Stage6Comment], [Stage6Status], [Stage7Comment], [Stage7Status], [CreatedUserID], [CreatedDate], [UpdatedUserID], [UpdatedDate]) VALUES (10, N'2017-00010', CAST(N'2017-04-03' AS Date), 5, NULL, NULL, 1, 1, NULL, NULL, -1, -1, NULL, -1, -1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, NULL, N'test', 1, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, 1, CAST(N'2017-04-04 08:55:50.000' AS DateTime), NULL, NULL)
INSERT [dbo].[SalesPriceDetail] ([ID], [FormNo], [ApplyDate], [ApplyType_ID], [StartDate], [EndDate], [Suppliers_ID], [Brand_ID], [Shipping], [Selling_Date], [Selling_Discount1], [Selling_Discount2], [Purchase_Date], [Purchase_Discount1], [Purchase_Discount2], [SpecialPriceType_ID], [InventoryType_ID], [Attachment], [ProductNoUnit], [ColorUnit], [Hot], [SaleBanner], [SaleText], [Header], [Side], [Remark], [Stage1Comment], [Stage1Status], [Stage2Comment], [Stage2Status], [Stage3Comment], [Stage3Status], [Stage4Comment], [Stage4Status], [Stage5Comment], [Stage5Status], [Stage6Comment], [Stage6Status], [Stage7Comment], [Stage7Status], [CreatedUserID], [CreatedDate], [UpdatedUserID], [UpdatedDate]) VALUES (11, N'2017-00011', CAST(N'2017-04-03' AS Date), 8, NULL, NULL, 1, 1, NULL, NULL, -1, -1, NULL, -1, -1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, NULL, N'test', 1, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, 1, CAST(N'2017-04-04 08:56:01.000' AS DateTime), NULL, NULL)
INSERT [dbo].[SalesPriceDetail] ([ID], [FormNo], [ApplyDate], [ApplyType_ID], [StartDate], [EndDate], [Suppliers_ID], [Brand_ID], [Shipping], [Selling_Date], [Selling_Discount1], [Selling_Discount2], [Purchase_Date], [Purchase_Discount1], [Purchase_Discount2], [SpecialPriceType_ID], [InventoryType_ID], [Attachment], [ProductNoUnit], [ColorUnit], [Hot], [SaleBanner], [SaleText], [Header], [Side], [Remark], [Stage1Comment], [Stage1Status], [Stage2Comment], [Stage2Status], [Stage3Comment], [Stage3Status], [Stage4Comment], [Stage4Status], [Stage5Comment], [Stage5Status], [Stage6Comment], [Stage6Status], [Stage7Comment], [Stage7Status], [CreatedUserID], [CreatedDate], [UpdatedUserID], [UpdatedDate]) VALUES (20, N'2017-00012', CAST(N'2017-04-04' AS Date), 5, NULL, NULL, 1, 1, NULL, NULL, -1, -1, NULL, -1, -1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, NULL, N'test', 1, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, 1, CAST(N'2017-04-04 12:41:05.000' AS DateTime), NULL, NULL)
INSERT [dbo].[SalesPriceDetail] ([ID], [FormNo], [ApplyDate], [ApplyType_ID], [StartDate], [EndDate], [Suppliers_ID], [Brand_ID], [Shipping], [Selling_Date], [Selling_Discount1], [Selling_Discount2], [Purchase_Date], [Purchase_Discount1], [Purchase_Discount2], [SpecialPriceType_ID], [InventoryType_ID], [Attachment], [ProductNoUnit], [ColorUnit], [Hot], [SaleBanner], [SaleText], [Header], [Side], [Remark], [Stage1Comment], [Stage1Status], [Stage2Comment], [Stage2Status], [Stage3Comment], [Stage3Status], [Stage4Comment], [Stage4Status], [Stage5Comment], [Stage5Status], [Stage6Comment], [Stage6Status], [Stage7Comment], [Stage7Status], [CreatedUserID], [CreatedDate], [UpdatedUserID], [UpdatedDate]) VALUES (21, N'2017-00013', CAST(N'2017-04-04' AS Date), 4, NULL, NULL, 1, 1, NULL, NULL, -1, -1, NULL, -1, -1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, NULL, N'test', 1, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, 1, CAST(N'2017-04-04 12:41:12.000' AS DateTime), NULL, NULL)
INSERT [dbo].[SalesPriceDetail] ([ID], [FormNo], [ApplyDate], [ApplyType_ID], [StartDate], [EndDate], [Suppliers_ID], [Brand_ID], [Shipping], [Selling_Date], [Selling_Discount1], [Selling_Discount2], [Purchase_Date], [Purchase_Discount1], [Purchase_Discount2], [SpecialPriceType_ID], [InventoryType_ID], [Attachment], [ProductNoUnit], [ColorUnit], [Hot], [SaleBanner], [SaleText], [Header], [Side], [Remark], [Stage1Comment], [Stage1Status], [Stage2Comment], [Stage2Status], [Stage3Comment], [Stage3Status], [Stage4Comment], [Stage4Status], [Stage5Comment], [Stage5Status], [Stage6Comment], [Stage6Status], [Stage7Comment], [Stage7Status], [CreatedUserID], [CreatedDate], [UpdatedUserID], [UpdatedDate]) VALUES (22, N'2017-00014', CAST(N'2017-04-04' AS Date), 4, NULL, NULL, 1, 1, NULL, NULL, -1, -1, NULL, -1, -1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, NULL, N'test', 1, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, 1, CAST(N'2017-04-04 12:41:32.000' AS DateTime), NULL, NULL)
INSERT [dbo].[SalesPriceDetail] ([ID], [FormNo], [ApplyDate], [ApplyType_ID], [StartDate], [EndDate], [Suppliers_ID], [Brand_ID], [Shipping], [Selling_Date], [Selling_Discount1], [Selling_Discount2], [Purchase_Date], [Purchase_Discount1], [Purchase_Discount2], [SpecialPriceType_ID], [InventoryType_ID], [Attachment], [ProductNoUnit], [ColorUnit], [Hot], [SaleBanner], [SaleText], [Header], [Side], [Remark], [Stage1Comment], [Stage1Status], [Stage2Comment], [Stage2Status], [Stage3Comment], [Stage3Status], [Stage4Comment], [Stage4Status], [Stage5Comment], [Stage5Status], [Stage6Comment], [Stage6Status], [Stage7Comment], [Stage7Status], [CreatedUserID], [CreatedDate], [UpdatedUserID], [UpdatedDate]) VALUES (23, N'2017-00015', CAST(N'2017-04-04' AS Date), 4, NULL, NULL, 1, 1, NULL, NULL, -1, -1, NULL, -1, -1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, NULL, N'test', 1, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, 1, CAST(N'2017-04-04 12:42:14.000' AS DateTime), NULL, NULL)
INSERT [dbo].[SalesPriceDetail] ([ID], [FormNo], [ApplyDate], [ApplyType_ID], [StartDate], [EndDate], [Suppliers_ID], [Brand_ID], [Shipping], [Selling_Date], [Selling_Discount1], [Selling_Discount2], [Purchase_Date], [Purchase_Discount1], [Purchase_Discount2], [SpecialPriceType_ID], [InventoryType_ID], [Attachment], [ProductNoUnit], [ColorUnit], [Hot], [SaleBanner], [SaleText], [Header], [Side], [Remark], [Stage1Comment], [Stage1Status], [Stage2Comment], [Stage2Status], [Stage3Comment], [Stage3Status], [Stage4Comment], [Stage4Status], [Stage5Comment], [Stage5Status], [Stage6Comment], [Stage6Status], [Stage7Comment], [Stage7Status], [CreatedUserID], [CreatedDate], [UpdatedUserID], [UpdatedDate]) VALUES (24, N'2017-00016', CAST(N'2017-04-04' AS Date), 2, NULL, NULL, 1, 1, NULL, NULL, -1, -1, NULL, -1, -1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, NULL, N'test', 1, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, 1, CAST(N'2017-04-04 12:43:41.000' AS DateTime), NULL, NULL)
INSERT [dbo].[SalesPriceDetail] ([ID], [FormNo], [ApplyDate], [ApplyType_ID], [StartDate], [EndDate], [Suppliers_ID], [Brand_ID], [Shipping], [Selling_Date], [Selling_Discount1], [Selling_Discount2], [Purchase_Date], [Purchase_Discount1], [Purchase_Discount2], [SpecialPriceType_ID], [InventoryType_ID], [Attachment], [ProductNoUnit], [ColorUnit], [Hot], [SaleBanner], [SaleText], [Header], [Side], [Remark], [Stage1Comment], [Stage1Status], [Stage2Comment], [Stage2Status], [Stage3Comment], [Stage3Status], [Stage4Comment], [Stage4Status], [Stage5Comment], [Stage5Status], [Stage6Comment], [Stage6Status], [Stage7Comment], [Stage7Status], [CreatedUserID], [CreatedDate], [UpdatedUserID], [UpdatedDate]) VALUES (25, N'2017-00017', CAST(N'2017-04-04' AS Date), 1, NULL, NULL, 1, 1, NULL, NULL, -1, -1, NULL, -1, -1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, NULL, N'test', 1, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, 1, CAST(N'2017-04-04 13:16:52.000' AS DateTime), NULL, NULL)
INSERT [dbo].[SalesPriceDetail] ([ID], [FormNo], [ApplyDate], [ApplyType_ID], [StartDate], [EndDate], [Suppliers_ID], [Brand_ID], [Shipping], [Selling_Date], [Selling_Discount1], [Selling_Discount2], [Purchase_Date], [Purchase_Discount1], [Purchase_Discount2], [SpecialPriceType_ID], [InventoryType_ID], [Attachment], [ProductNoUnit], [ColorUnit], [Hot], [SaleBanner], [SaleText], [Header], [Side], [Remark], [Stage1Comment], [Stage1Status], [Stage2Comment], [Stage2Status], [Stage3Comment], [Stage3Status], [Stage4Comment], [Stage4Status], [Stage5Comment], [Stage5Status], [Stage6Comment], [Stage6Status], [Stage7Comment], [Stage7Status], [CreatedUserID], [CreatedDate], [UpdatedUserID], [UpdatedDate]) VALUES (26, N'2017-00018', CAST(N'2017-04-04' AS Date), 1, NULL, NULL, 1, 1, NULL, NULL, -1, -1, NULL, -1, -1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, NULL, N'test', 1, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, 1, CAST(N'2017-04-04 13:19:14.000' AS DateTime), NULL, NULL)
INSERT [dbo].[SalesPriceDetail] ([ID], [FormNo], [ApplyDate], [ApplyType_ID], [StartDate], [EndDate], [Suppliers_ID], [Brand_ID], [Shipping], [Selling_Date], [Selling_Discount1], [Selling_Discount2], [Purchase_Date], [Purchase_Discount1], [Purchase_Discount2], [SpecialPriceType_ID], [InventoryType_ID], [Attachment], [ProductNoUnit], [ColorUnit], [Hot], [SaleBanner], [SaleText], [Header], [Side], [Remark], [Stage1Comment], [Stage1Status], [Stage2Comment], [Stage2Status], [Stage3Comment], [Stage3Status], [Stage4Comment], [Stage4Status], [Stage5Comment], [Stage5Status], [Stage6Comment], [Stage6Status], [Stage7Comment], [Stage7Status], [CreatedUserID], [CreatedDate], [UpdatedUserID], [UpdatedDate]) VALUES (27, N'2017-00019', CAST(N'2017-04-04' AS Date), 1, NULL, NULL, 1, 1, NULL, CAST(N'2017-04-05' AS Date), 50, 50, CAST(N'2017-04-05' AS Date), 50, 50, 4, 4, 1, 0, 0, 0, 0, 0, 0, 0, NULL, N'test', 1, N'test', 1, N'test', 1, N'test', 1, N'test', 1, NULL, 0, NULL, 0, 1, CAST(N'2017-04-04 13:20:37.000' AS DateTime), 1, CAST(N'2017-04-05 15:08:27.000' AS DateTime))
INSERT [dbo].[SalesPriceDetail] ([ID], [FormNo], [ApplyDate], [ApplyType_ID], [StartDate], [EndDate], [Suppliers_ID], [Brand_ID], [Shipping], [Selling_Date], [Selling_Discount1], [Selling_Discount2], [Purchase_Date], [Purchase_Discount1], [Purchase_Discount2], [SpecialPriceType_ID], [InventoryType_ID], [Attachment], [ProductNoUnit], [ColorUnit], [Hot], [SaleBanner], [SaleText], [Header], [Side], [Remark], [Stage1Comment], [Stage1Status], [Stage2Comment], [Stage2Status], [Stage3Comment], [Stage3Status], [Stage4Comment], [Stage4Status], [Stage5Comment], [Stage5Status], [Stage6Comment], [Stage6Status], [Stage7Comment], [Stage7Status], [CreatedUserID], [CreatedDate], [UpdatedUserID], [UpdatedDate]) VALUES (28, N'2017-00020', CAST(N'2017-04-04' AS Date), 1, NULL, NULL, 3, 3, N'1', NULL, -1, -1, NULL, -1, -1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, NULL, N'test', 1, N'test', 1, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, 1, CAST(N'2017-04-04 13:20:46.000' AS DateTime), 1, CAST(N'2017-04-05 15:09:56.000' AS DateTime))
INSERT [dbo].[SalesPriceDetail] ([ID], [FormNo], [ApplyDate], [ApplyType_ID], [StartDate], [EndDate], [Suppliers_ID], [Brand_ID], [Shipping], [Selling_Date], [Selling_Discount1], [Selling_Discount2], [Purchase_Date], [Purchase_Discount1], [Purchase_Discount2], [SpecialPriceType_ID], [InventoryType_ID], [Attachment], [ProductNoUnit], [ColorUnit], [Hot], [SaleBanner], [SaleText], [Header], [Side], [Remark], [Stage1Comment], [Stage1Status], [Stage2Comment], [Stage2Status], [Stage3Comment], [Stage3Status], [Stage4Comment], [Stage4Status], [Stage5Comment], [Stage5Status], [Stage6Comment], [Stage6Status], [Stage7Comment], [Stage7Status], [CreatedUserID], [CreatedDate], [UpdatedUserID], [UpdatedDate]) VALUES (29, N'2017-00021', CAST(N'2017-04-04' AS Date), 4, NULL, NULL, 1, 1, NULL, NULL, -1, -1, NULL, -1, -1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, NULL, N'test', 1, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, 1, CAST(N'2017-04-04 14:29:56.000' AS DateTime), NULL, NULL)
INSERT [dbo].[SalesPriceDetail] ([ID], [FormNo], [ApplyDate], [ApplyType_ID], [StartDate], [EndDate], [Suppliers_ID], [Brand_ID], [Shipping], [Selling_Date], [Selling_Discount1], [Selling_Discount2], [Purchase_Date], [Purchase_Discount1], [Purchase_Discount2], [SpecialPriceType_ID], [InventoryType_ID], [Attachment], [ProductNoUnit], [ColorUnit], [Hot], [SaleBanner], [SaleText], [Header], [Side], [Remark], [Stage1Comment], [Stage1Status], [Stage2Comment], [Stage2Status], [Stage3Comment], [Stage3Status], [Stage4Comment], [Stage4Status], [Stage5Comment], [Stage5Status], [Stage6Comment], [Stage6Status], [Stage7Comment], [Stage7Status], [CreatedUserID], [CreatedDate], [UpdatedUserID], [UpdatedDate]) VALUES (30, N'2017-00022', CAST(N'2017-04-04' AS Date), 6, NULL, NULL, 1, 1, NULL, NULL, -1, -1, NULL, -1, -1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, NULL, N'test', 1, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, 1, CAST(N'2017-04-04 14:30:05.000' AS DateTime), NULL, NULL)
INSERT [dbo].[SalesPriceDetail] ([ID], [FormNo], [ApplyDate], [ApplyType_ID], [StartDate], [EndDate], [Suppliers_ID], [Brand_ID], [Shipping], [Selling_Date], [Selling_Discount1], [Selling_Discount2], [Purchase_Date], [Purchase_Discount1], [Purchase_Discount2], [SpecialPriceType_ID], [InventoryType_ID], [Attachment], [ProductNoUnit], [ColorUnit], [Hot], [SaleBanner], [SaleText], [Header], [Side], [Remark], [Stage1Comment], [Stage1Status], [Stage2Comment], [Stage2Status], [Stage3Comment], [Stage3Status], [Stage4Comment], [Stage4Status], [Stage5Comment], [Stage5Status], [Stage6Comment], [Stage6Status], [Stage7Comment], [Stage7Status], [CreatedUserID], [CreatedDate], [UpdatedUserID], [UpdatedDate]) VALUES (31, N'2017-00023', CAST(N'2017-04-04' AS Date), 2, NULL, NULL, 1, 1, NULL, NULL, -1, -1, NULL, -1, -1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, NULL, N'test', 1, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, 1, CAST(N'2017-04-04 14:33:55.000' AS DateTime), NULL, NULL)
INSERT [dbo].[SalesPriceDetail] ([ID], [FormNo], [ApplyDate], [ApplyType_ID], [StartDate], [EndDate], [Suppliers_ID], [Brand_ID], [Shipping], [Selling_Date], [Selling_Discount1], [Selling_Discount2], [Purchase_Date], [Purchase_Discount1], [Purchase_Discount2], [SpecialPriceType_ID], [InventoryType_ID], [Attachment], [ProductNoUnit], [ColorUnit], [Hot], [SaleBanner], [SaleText], [Header], [Side], [Remark], [Stage1Comment], [Stage1Status], [Stage2Comment], [Stage2Status], [Stage3Comment], [Stage3Status], [Stage4Comment], [Stage4Status], [Stage5Comment], [Stage5Status], [Stage6Comment], [Stage6Status], [Stage7Comment], [Stage7Status], [CreatedUserID], [CreatedDate], [UpdatedUserID], [UpdatedDate]) VALUES (32, N'2017-00024', CAST(N'2017-04-04' AS Date), 6, NULL, NULL, 1, 1, NULL, NULL, -1, -1, NULL, -1, -1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, NULL, N'test', 1, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, 1, CAST(N'2017-04-04 14:34:07.000' AS DateTime), NULL, NULL)
INSERT [dbo].[SalesPriceDetail] ([ID], [FormNo], [ApplyDate], [ApplyType_ID], [StartDate], [EndDate], [Suppliers_ID], [Brand_ID], [Shipping], [Selling_Date], [Selling_Discount1], [Selling_Discount2], [Purchase_Date], [Purchase_Discount1], [Purchase_Discount2], [SpecialPriceType_ID], [InventoryType_ID], [Attachment], [ProductNoUnit], [ColorUnit], [Hot], [SaleBanner], [SaleText], [Header], [Side], [Remark], [Stage1Comment], [Stage1Status], [Stage2Comment], [Stage2Status], [Stage3Comment], [Stage3Status], [Stage4Comment], [Stage4Status], [Stage5Comment], [Stage5Status], [Stage6Comment], [Stage6Status], [Stage7Comment], [Stage7Status], [CreatedUserID], [CreatedDate], [UpdatedUserID], [UpdatedDate]) VALUES (33, N'2017-00025', CAST(N'2017-04-04' AS Date), 3, NULL, NULL, 1, 1, NULL, NULL, -1, -1, NULL, -1, -1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, NULL, N'test', 1, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, 1, CAST(N'2017-04-04 14:37:52.000' AS DateTime), NULL, NULL)
INSERT [dbo].[SalesPriceDetail] ([ID], [FormNo], [ApplyDate], [ApplyType_ID], [StartDate], [EndDate], [Suppliers_ID], [Brand_ID], [Shipping], [Selling_Date], [Selling_Discount1], [Selling_Discount2], [Purchase_Date], [Purchase_Discount1], [Purchase_Discount2], [SpecialPriceType_ID], [InventoryType_ID], [Attachment], [ProductNoUnit], [ColorUnit], [Hot], [SaleBanner], [SaleText], [Header], [Side], [Remark], [Stage1Comment], [Stage1Status], [Stage2Comment], [Stage2Status], [Stage3Comment], [Stage3Status], [Stage4Comment], [Stage4Status], [Stage5Comment], [Stage5Status], [Stage6Comment], [Stage6Status], [Stage7Comment], [Stage7Status], [CreatedUserID], [CreatedDate], [UpdatedUserID], [UpdatedDate]) VALUES (34, N'2017-00026', CAST(N'2017-04-04' AS Date), 5, NULL, NULL, 1, 1, NULL, NULL, -1, -1, NULL, -1, -1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, NULL, N'test', 1, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, 1, CAST(N'2017-04-04 14:38:23.000' AS DateTime), NULL, NULL)
INSERT [dbo].[SalesPriceDetail] ([ID], [FormNo], [ApplyDate], [ApplyType_ID], [StartDate], [EndDate], [Suppliers_ID], [Brand_ID], [Shipping], [Selling_Date], [Selling_Discount1], [Selling_Discount2], [Purchase_Date], [Purchase_Discount1], [Purchase_Discount2], [SpecialPriceType_ID], [InventoryType_ID], [Attachment], [ProductNoUnit], [ColorUnit], [Hot], [SaleBanner], [SaleText], [Header], [Side], [Remark], [Stage1Comment], [Stage1Status], [Stage2Comment], [Stage2Status], [Stage3Comment], [Stage3Status], [Stage4Comment], [Stage4Status], [Stage5Comment], [Stage5Status], [Stage6Comment], [Stage6Status], [Stage7Comment], [Stage7Status], [CreatedUserID], [CreatedDate], [UpdatedUserID], [UpdatedDate]) VALUES (35, N'2017-00027', CAST(N'2017-04-04' AS Date), 5, NULL, NULL, 1, 1, NULL, NULL, -1, -1, NULL, -1, -1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, NULL, N'test', 1, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, 1, CAST(N'2017-04-04 14:39:24.000' AS DateTime), NULL, NULL)
INSERT [dbo].[SalesPriceDetail] ([ID], [FormNo], [ApplyDate], [ApplyType_ID], [StartDate], [EndDate], [Suppliers_ID], [Brand_ID], [Shipping], [Selling_Date], [Selling_Discount1], [Selling_Discount2], [Purchase_Date], [Purchase_Discount1], [Purchase_Discount2], [SpecialPriceType_ID], [InventoryType_ID], [Attachment], [ProductNoUnit], [ColorUnit], [Hot], [SaleBanner], [SaleText], [Header], [Side], [Remark], [Stage1Comment], [Stage1Status], [Stage2Comment], [Stage2Status], [Stage3Comment], [Stage3Status], [Stage4Comment], [Stage4Status], [Stage5Comment], [Stage5Status], [Stage6Comment], [Stage6Status], [Stage7Comment], [Stage7Status], [CreatedUserID], [CreatedDate], [UpdatedUserID], [UpdatedDate]) VALUES (36, N'2017-00028', CAST(N'2017-04-05' AS Date), 6, NULL, CAST(N'2017-04-05' AS Date), 1, 1, NULL, NULL, -1, -1, NULL, -1, -1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, NULL, N'test', 1, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, 1, CAST(N'2017-04-05 13:03:21.000' AS DateTime), NULL, NULL)
INSERT [dbo].[SalesPriceDetail] ([ID], [FormNo], [ApplyDate], [ApplyType_ID], [StartDate], [EndDate], [Suppliers_ID], [Brand_ID], [Shipping], [Selling_Date], [Selling_Discount1], [Selling_Discount2], [Purchase_Date], [Purchase_Discount1], [Purchase_Discount2], [SpecialPriceType_ID], [InventoryType_ID], [Attachment], [ProductNoUnit], [ColorUnit], [Hot], [SaleBanner], [SaleText], [Header], [Side], [Remark], [Stage1Comment], [Stage1Status], [Stage2Comment], [Stage2Status], [Stage3Comment], [Stage3Status], [Stage4Comment], [Stage4Status], [Stage5Comment], [Stage5Status], [Stage6Comment], [Stage6Status], [Stage7Comment], [Stage7Status], [CreatedUserID], [CreatedDate], [UpdatedUserID], [UpdatedDate]) VALUES (37, N'2017-00029', CAST(N'2017-04-06' AS Date), 4, NULL, NULL, 1, 1, NULL, NULL, -1, -1, NULL, -1, -1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, NULL, N'test', 1, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, 1, CAST(N'2017-04-06 10:08:05.000' AS DateTime), NULL, NULL)
INSERT [dbo].[SalesPriceDetail] ([ID], [FormNo], [ApplyDate], [ApplyType_ID], [StartDate], [EndDate], [Suppliers_ID], [Brand_ID], [Shipping], [Selling_Date], [Selling_Discount1], [Selling_Discount2], [Purchase_Date], [Purchase_Discount1], [Purchase_Discount2], [SpecialPriceType_ID], [InventoryType_ID], [Attachment], [ProductNoUnit], [ColorUnit], [Hot], [SaleBanner], [SaleText], [Header], [Side], [Remark], [Stage1Comment], [Stage1Status], [Stage2Comment], [Stage2Status], [Stage3Comment], [Stage3Status], [Stage4Comment], [Stage4Status], [Stage5Comment], [Stage5Status], [Stage6Comment], [Stage6Status], [Stage7Comment], [Stage7Status], [CreatedUserID], [CreatedDate], [UpdatedUserID], [UpdatedDate]) VALUES (38, N'2017-00030', CAST(N'2017-04-06' AS Date), 1, NULL, NULL, 1, 1, NULL, NULL, -1, -1, NULL, -1, -1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, NULL, N'test', 1, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, 1, CAST(N'2017-04-06 10:08:19.000' AS DateTime), NULL, NULL)
INSERT [dbo].[SalesPriceDetail] ([ID], [FormNo], [ApplyDate], [ApplyType_ID], [StartDate], [EndDate], [Suppliers_ID], [Brand_ID], [Shipping], [Selling_Date], [Selling_Discount1], [Selling_Discount2], [Purchase_Date], [Purchase_Discount1], [Purchase_Discount2], [SpecialPriceType_ID], [InventoryType_ID], [Attachment], [ProductNoUnit], [ColorUnit], [Hot], [SaleBanner], [SaleText], [Header], [Side], [Remark], [Stage1Comment], [Stage1Status], [Stage2Comment], [Stage2Status], [Stage3Comment], [Stage3Status], [Stage4Comment], [Stage4Status], [Stage5Comment], [Stage5Status], [Stage6Comment], [Stage6Status], [Stage7Comment], [Stage7Status], [CreatedUserID], [CreatedDate], [UpdatedUserID], [UpdatedDate]) VALUES (39, N'2017-00031', CAST(N'2017-04-06' AS Date), 1, NULL, NULL, 1, 1, NULL, NULL, -1, -1, NULL, -1, -1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, NULL, N'test', 1, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, 1, CAST(N'2017-04-06 10:10:20.000' AS DateTime), NULL, NULL)
INSERT [dbo].[SalesPriceDetail] ([ID], [FormNo], [ApplyDate], [ApplyType_ID], [StartDate], [EndDate], [Suppliers_ID], [Brand_ID], [Shipping], [Selling_Date], [Selling_Discount1], [Selling_Discount2], [Purchase_Date], [Purchase_Discount1], [Purchase_Discount2], [SpecialPriceType_ID], [InventoryType_ID], [Attachment], [ProductNoUnit], [ColorUnit], [Hot], [SaleBanner], [SaleText], [Header], [Side], [Remark], [Stage1Comment], [Stage1Status], [Stage2Comment], [Stage2Status], [Stage3Comment], [Stage3Status], [Stage4Comment], [Stage4Status], [Stage5Comment], [Stage5Status], [Stage6Comment], [Stage6Status], [Stage7Comment], [Stage7Status], [CreatedUserID], [CreatedDate], [UpdatedUserID], [UpdatedDate]) VALUES (40, N'2017-00032', CAST(N'2017-04-06' AS Date), 1, NULL, NULL, 1, 1, NULL, NULL, -1, -1, NULL, -1, -1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, NULL, N'test', 1, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, 1, CAST(N'2017-04-06 10:54:19.000' AS DateTime), NULL, NULL)
INSERT [dbo].[SalesPriceDetail] ([ID], [FormNo], [ApplyDate], [ApplyType_ID], [StartDate], [EndDate], [Suppliers_ID], [Brand_ID], [Shipping], [Selling_Date], [Selling_Discount1], [Selling_Discount2], [Purchase_Date], [Purchase_Discount1], [Purchase_Discount2], [SpecialPriceType_ID], [InventoryType_ID], [Attachment], [ProductNoUnit], [ColorUnit], [Hot], [SaleBanner], [SaleText], [Header], [Side], [Remark], [Stage1Comment], [Stage1Status], [Stage2Comment], [Stage2Status], [Stage3Comment], [Stage3Status], [Stage4Comment], [Stage4Status], [Stage5Comment], [Stage5Status], [Stage6Comment], [Stage6Status], [Stage7Comment], [Stage7Status], [CreatedUserID], [CreatedDate], [UpdatedUserID], [UpdatedDate]) VALUES (41, N'2017-00033', CAST(N'2017-04-06' AS Date), 1, NULL, NULL, 1, 1, NULL, NULL, -1, -1, NULL, -1, -1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, NULL, N'test', 1, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, 1, CAST(N'2017-04-06 10:54:28.000' AS DateTime), NULL, NULL)
INSERT [dbo].[SalesPriceDetail] ([ID], [FormNo], [ApplyDate], [ApplyType_ID], [StartDate], [EndDate], [Suppliers_ID], [Brand_ID], [Shipping], [Selling_Date], [Selling_Discount1], [Selling_Discount2], [Purchase_Date], [Purchase_Discount1], [Purchase_Discount2], [SpecialPriceType_ID], [InventoryType_ID], [Attachment], [ProductNoUnit], [ColorUnit], [Hot], [SaleBanner], [SaleText], [Header], [Side], [Remark], [Stage1Comment], [Stage1Status], [Stage2Comment], [Stage2Status], [Stage3Comment], [Stage3Status], [Stage4Comment], [Stage4Status], [Stage5Comment], [Stage5Status], [Stage6Comment], [Stage6Status], [Stage7Comment], [Stage7Status], [CreatedUserID], [CreatedDate], [UpdatedUserID], [UpdatedDate]) VALUES (42, N'2017-00034', CAST(N'2017-04-06' AS Date), 6, NULL, NULL, 1, 1, NULL, NULL, -1, -1, NULL, -1, -1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, NULL, N'test', 1, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, 1, CAST(N'2017-04-06 10:54:51.000' AS DateTime), NULL, NULL)
INSERT [dbo].[SalesPriceDetail] ([ID], [FormNo], [ApplyDate], [ApplyType_ID], [StartDate], [EndDate], [Suppliers_ID], [Brand_ID], [Shipping], [Selling_Date], [Selling_Discount1], [Selling_Discount2], [Purchase_Date], [Purchase_Discount1], [Purchase_Discount2], [SpecialPriceType_ID], [InventoryType_ID], [Attachment], [ProductNoUnit], [ColorUnit], [Hot], [SaleBanner], [SaleText], [Header], [Side], [Remark], [Stage1Comment], [Stage1Status], [Stage2Comment], [Stage2Status], [Stage3Comment], [Stage3Status], [Stage4Comment], [Stage4Status], [Stage5Comment], [Stage5Status], [Stage6Comment], [Stage6Status], [Stage7Comment], [Stage7Status], [CreatedUserID], [CreatedDate], [UpdatedUserID], [UpdatedDate]) VALUES (43, N'2017-00035', CAST(N'2017-04-06' AS Date), 6, NULL, NULL, 1, 1, NULL, NULL, -1, -1, NULL, -1, -1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, NULL, N'test', 1, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, 1, CAST(N'2017-04-06 10:58:01.000' AS DateTime), NULL, NULL)
INSERT [dbo].[SalesPriceDetail] ([ID], [FormNo], [ApplyDate], [ApplyType_ID], [StartDate], [EndDate], [Suppliers_ID], [Brand_ID], [Shipping], [Selling_Date], [Selling_Discount1], [Selling_Discount2], [Purchase_Date], [Purchase_Discount1], [Purchase_Discount2], [SpecialPriceType_ID], [InventoryType_ID], [Attachment], [ProductNoUnit], [ColorUnit], [Hot], [SaleBanner], [SaleText], [Header], [Side], [Remark], [Stage1Comment], [Stage1Status], [Stage2Comment], [Stage2Status], [Stage3Comment], [Stage3Status], [Stage4Comment], [Stage4Status], [Stage5Comment], [Stage5Status], [Stage6Comment], [Stage6Status], [Stage7Comment], [Stage7Status], [CreatedUserID], [CreatedDate], [UpdatedUserID], [UpdatedDate]) VALUES (44, N'2017-00036', CAST(N'2017-04-06' AS Date), 6, NULL, NULL, 1, 1, NULL, NULL, -1, -1, NULL, -1, -1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, NULL, N'test', 1, N'test', 1, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, 1, CAST(N'2017-04-06 10:58:09.000' AS DateTime), 1, CAST(N'2017-04-06 13:27:50.000' AS DateTime))
INSERT [dbo].[SalesPriceDetail] ([ID], [FormNo], [ApplyDate], [ApplyType_ID], [StartDate], [EndDate], [Suppliers_ID], [Brand_ID], [Shipping], [Selling_Date], [Selling_Discount1], [Selling_Discount2], [Purchase_Date], [Purchase_Discount1], [Purchase_Discount2], [SpecialPriceType_ID], [InventoryType_ID], [Attachment], [ProductNoUnit], [ColorUnit], [Hot], [SaleBanner], [SaleText], [Header], [Side], [Remark], [Stage1Comment], [Stage1Status], [Stage2Comment], [Stage2Status], [Stage3Comment], [Stage3Status], [Stage4Comment], [Stage4Status], [Stage5Comment], [Stage5Status], [Stage6Comment], [Stage6Status], [Stage7Comment], [Stage7Status], [CreatedUserID], [CreatedDate], [UpdatedUserID], [UpdatedDate]) VALUES (45, N'2017-00037', CAST(N'2017-04-06' AS Date), 1, NULL, NULL, 1, 1, NULL, NULL, -1, -1, NULL, -1, -1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, NULL, N'test', 1, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, 1, CAST(N'2017-04-06 14:58:43.000' AS DateTime), NULL, NULL)
INSERT [dbo].[SalesPriceDetail] ([ID], [FormNo], [ApplyDate], [ApplyType_ID], [StartDate], [EndDate], [Suppliers_ID], [Brand_ID], [Shipping], [Selling_Date], [Selling_Discount1], [Selling_Discount2], [Purchase_Date], [Purchase_Discount1], [Purchase_Discount2], [SpecialPriceType_ID], [InventoryType_ID], [Attachment], [ProductNoUnit], [ColorUnit], [Hot], [SaleBanner], [SaleText], [Header], [Side], [Remark], [Stage1Comment], [Stage1Status], [Stage2Comment], [Stage2Status], [Stage3Comment], [Stage3Status], [Stage4Comment], [Stage4Status], [Stage5Comment], [Stage5Status], [Stage6Comment], [Stage6Status], [Stage7Comment], [Stage7Status], [CreatedUserID], [CreatedDate], [UpdatedUserID], [UpdatedDate]) VALUES (46, N'2017-00038', CAST(N'2017-04-03' AS Date), 1, NULL, NULL, 1, 1, NULL, NULL, -1, -1, NULL, -1, -1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, NULL, N'test', 1, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, 1, CAST(N'2017-04-06 14:58:54.000' AS DateTime), NULL, NULL)
INSERT [dbo].[SalesPriceDetail] ([ID], [FormNo], [ApplyDate], [ApplyType_ID], [StartDate], [EndDate], [Suppliers_ID], [Brand_ID], [Shipping], [Selling_Date], [Selling_Discount1], [Selling_Discount2], [Purchase_Date], [Purchase_Discount1], [Purchase_Discount2], [SpecialPriceType_ID], [InventoryType_ID], [Attachment], [ProductNoUnit], [ColorUnit], [Hot], [SaleBanner], [SaleText], [Header], [Side], [Remark], [Stage1Comment], [Stage1Status], [Stage2Comment], [Stage2Status], [Stage3Comment], [Stage3Status], [Stage4Comment], [Stage4Status], [Stage5Comment], [Stage5Status], [Stage6Comment], [Stage6Status], [Stage7Comment], [Stage7Status], [CreatedUserID], [CreatedDate], [UpdatedUserID], [UpdatedDate]) VALUES (47, N'2017-00039', CAST(N'2017-04-02' AS Date), 1, NULL, NULL, 1, 1, NULL, NULL, -1, -1, NULL, -1, -1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, NULL, N'test', 1, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, 1, CAST(N'2017-04-06 14:59:03.000' AS DateTime), NULL, NULL)
INSERT [dbo].[SalesPriceDetail] ([ID], [FormNo], [ApplyDate], [ApplyType_ID], [StartDate], [EndDate], [Suppliers_ID], [Brand_ID], [Shipping], [Selling_Date], [Selling_Discount1], [Selling_Discount2], [Purchase_Date], [Purchase_Discount1], [Purchase_Discount2], [SpecialPriceType_ID], [InventoryType_ID], [Attachment], [ProductNoUnit], [ColorUnit], [Hot], [SaleBanner], [SaleText], [Header], [Side], [Remark], [Stage1Comment], [Stage1Status], [Stage2Comment], [Stage2Status], [Stage3Comment], [Stage3Status], [Stage4Comment], [Stage4Status], [Stage5Comment], [Stage5Status], [Stage6Comment], [Stage6Status], [Stage7Comment], [Stage7Status], [CreatedUserID], [CreatedDate], [UpdatedUserID], [UpdatedDate]) VALUES (48, N'2017-00040', CAST(N'2017-04-01' AS Date), 1, NULL, NULL, 1, 1, NULL, NULL, -1, -1, NULL, -1, -1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, NULL, N'test', 1, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, 1, CAST(N'2017-04-06 14:59:11.000' AS DateTime), NULL, NULL)
INSERT [dbo].[SalesPriceDetail] ([ID], [FormNo], [ApplyDate], [ApplyType_ID], [StartDate], [EndDate], [Suppliers_ID], [Brand_ID], [Shipping], [Selling_Date], [Selling_Discount1], [Selling_Discount2], [Purchase_Date], [Purchase_Discount1], [Purchase_Discount2], [SpecialPriceType_ID], [InventoryType_ID], [Attachment], [ProductNoUnit], [ColorUnit], [Hot], [SaleBanner], [SaleText], [Header], [Side], [Remark], [Stage1Comment], [Stage1Status], [Stage2Comment], [Stage2Status], [Stage3Comment], [Stage3Status], [Stage4Comment], [Stage4Status], [Stage5Comment], [Stage5Status], [Stage6Comment], [Stage6Status], [Stage7Comment], [Stage7Status], [CreatedUserID], [CreatedDate], [UpdatedUserID], [UpdatedDate]) VALUES (49, N'2017-00041', CAST(N'2017-03-31' AS Date), 1, NULL, NULL, 1, 1, NULL, NULL, -1, -1, NULL, -1, -1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, NULL, N'test', 1, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, 1, CAST(N'2017-04-06 14:59:34.000' AS DateTime), NULL, NULL)
INSERT [dbo].[SalesPriceDetail] ([ID], [FormNo], [ApplyDate], [ApplyType_ID], [StartDate], [EndDate], [Suppliers_ID], [Brand_ID], [Shipping], [Selling_Date], [Selling_Discount1], [Selling_Discount2], [Purchase_Date], [Purchase_Discount1], [Purchase_Discount2], [SpecialPriceType_ID], [InventoryType_ID], [Attachment], [ProductNoUnit], [ColorUnit], [Hot], [SaleBanner], [SaleText], [Header], [Side], [Remark], [Stage1Comment], [Stage1Status], [Stage2Comment], [Stage2Status], [Stage3Comment], [Stage3Status], [Stage4Comment], [Stage4Status], [Stage5Comment], [Stage5Status], [Stage6Comment], [Stage6Status], [Stage7Comment], [Stage7Status], [CreatedUserID], [CreatedDate], [UpdatedUserID], [UpdatedDate]) VALUES (50, N'2017-00042', CAST(N'2017-03-29' AS Date), 1, NULL, NULL, 1, 1, NULL, NULL, -1, -1, NULL, -1, -1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, NULL, N'test', 1, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, 1, CAST(N'2017-04-06 14:59:46.000' AS DateTime), NULL, NULL)
INSERT [dbo].[SalesPriceDetail] ([ID], [FormNo], [ApplyDate], [ApplyType_ID], [StartDate], [EndDate], [Suppliers_ID], [Brand_ID], [Shipping], [Selling_Date], [Selling_Discount1], [Selling_Discount2], [Purchase_Date], [Purchase_Discount1], [Purchase_Discount2], [SpecialPriceType_ID], [InventoryType_ID], [Attachment], [ProductNoUnit], [ColorUnit], [Hot], [SaleBanner], [SaleText], [Header], [Side], [Remark], [Stage1Comment], [Stage1Status], [Stage2Comment], [Stage2Status], [Stage3Comment], [Stage3Status], [Stage4Comment], [Stage4Status], [Stage5Comment], [Stage5Status], [Stage6Comment], [Stage6Status], [Stage7Comment], [Stage7Status], [CreatedUserID], [CreatedDate], [UpdatedUserID], [UpdatedDate]) VALUES (51, N'2017-00043', CAST(N'2017-03-28' AS Date), 1, NULL, NULL, 1, 1, NULL, NULL, -1, -1, NULL, -1, -1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, NULL, N'test', 1, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, 1, CAST(N'2017-04-06 15:00:08.000' AS DateTime), NULL, NULL)
INSERT [dbo].[SalesPriceDetail] ([ID], [FormNo], [ApplyDate], [ApplyType_ID], [StartDate], [EndDate], [Suppliers_ID], [Brand_ID], [Shipping], [Selling_Date], [Selling_Discount1], [Selling_Discount2], [Purchase_Date], [Purchase_Discount1], [Purchase_Discount2], [SpecialPriceType_ID], [InventoryType_ID], [Attachment], [ProductNoUnit], [ColorUnit], [Hot], [SaleBanner], [SaleText], [Header], [Side], [Remark], [Stage1Comment], [Stage1Status], [Stage2Comment], [Stage2Status], [Stage3Comment], [Stage3Status], [Stage4Comment], [Stage4Status], [Stage5Comment], [Stage5Status], [Stage6Comment], [Stage6Status], [Stage7Comment], [Stage7Status], [CreatedUserID], [CreatedDate], [UpdatedUserID], [UpdatedDate]) VALUES (52, N'2017-00044', CAST(N'2017-04-06' AS Date), 1, NULL, NULL, 1, 1, NULL, NULL, -1, -1, NULL, -1, -1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, NULL, N'test', 1, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, 1, CAST(N'2017-04-06 15:01:16.000' AS DateTime), NULL, NULL)
INSERT [dbo].[SalesPriceDetail] ([ID], [FormNo], [ApplyDate], [ApplyType_ID], [StartDate], [EndDate], [Suppliers_ID], [Brand_ID], [Shipping], [Selling_Date], [Selling_Discount1], [Selling_Discount2], [Purchase_Date], [Purchase_Discount1], [Purchase_Discount2], [SpecialPriceType_ID], [InventoryType_ID], [Attachment], [ProductNoUnit], [ColorUnit], [Hot], [SaleBanner], [SaleText], [Header], [Side], [Remark], [Stage1Comment], [Stage1Status], [Stage2Comment], [Stage2Status], [Stage3Comment], [Stage3Status], [Stage4Comment], [Stage4Status], [Stage5Comment], [Stage5Status], [Stage6Comment], [Stage6Status], [Stage7Comment], [Stage7Status], [CreatedUserID], [CreatedDate], [UpdatedUserID], [UpdatedDate]) VALUES (53, N'2017-00045', CAST(N'2017-03-22' AS Date), 4, NULL, NULL, 1, 1, NULL, NULL, -1, -1, NULL, -1, -1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, NULL, N'test', 1, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, 1, CAST(N'2017-04-06 15:02:34.000' AS DateTime), NULL, NULL)
INSERT [dbo].[SalesPriceDetail] ([ID], [FormNo], [ApplyDate], [ApplyType_ID], [StartDate], [EndDate], [Suppliers_ID], [Brand_ID], [Shipping], [Selling_Date], [Selling_Discount1], [Selling_Discount2], [Purchase_Date], [Purchase_Discount1], [Purchase_Discount2], [SpecialPriceType_ID], [InventoryType_ID], [Attachment], [ProductNoUnit], [ColorUnit], [Hot], [SaleBanner], [SaleText], [Header], [Side], [Remark], [Stage1Comment], [Stage1Status], [Stage2Comment], [Stage2Status], [Stage3Comment], [Stage3Status], [Stage4Comment], [Stage4Status], [Stage5Comment], [Stage5Status], [Stage6Comment], [Stage6Status], [Stage7Comment], [Stage7Status], [CreatedUserID], [CreatedDate], [UpdatedUserID], [UpdatedDate]) VALUES (54, N'2017-00046', CAST(N'2017-04-06' AS Date), 1, NULL, NULL, 1, 1, NULL, NULL, -1, -1, NULL, -1, -1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, NULL, N'test', 1, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, 1, CAST(N'2017-04-06 15:06:57.000' AS DateTime), NULL, NULL)
INSERT [dbo].[SalesPriceDetail] ([ID], [FormNo], [ApplyDate], [ApplyType_ID], [StartDate], [EndDate], [Suppliers_ID], [Brand_ID], [Shipping], [Selling_Date], [Selling_Discount1], [Selling_Discount2], [Purchase_Date], [Purchase_Discount1], [Purchase_Discount2], [SpecialPriceType_ID], [InventoryType_ID], [Attachment], [ProductNoUnit], [ColorUnit], [Hot], [SaleBanner], [SaleText], [Header], [Side], [Remark], [Stage1Comment], [Stage1Status], [Stage2Comment], [Stage2Status], [Stage3Comment], [Stage3Status], [Stage4Comment], [Stage4Status], [Stage5Comment], [Stage5Status], [Stage6Comment], [Stage6Status], [Stage7Comment], [Stage7Status], [CreatedUserID], [CreatedDate], [UpdatedUserID], [UpdatedDate]) VALUES (55, N'2017-00047', CAST(N'2017-04-06' AS Date), 1, NULL, NULL, 1, 1, NULL, NULL, -1, -1, NULL, -1, -1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, NULL, N'test', 1, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, 1, CAST(N'2017-04-06 15:07:17.000' AS DateTime), NULL, NULL)
INSERT [dbo].[SalesPriceDetail] ([ID], [FormNo], [ApplyDate], [ApplyType_ID], [StartDate], [EndDate], [Suppliers_ID], [Brand_ID], [Shipping], [Selling_Date], [Selling_Discount1], [Selling_Discount2], [Purchase_Date], [Purchase_Discount1], [Purchase_Discount2], [SpecialPriceType_ID], [InventoryType_ID], [Attachment], [ProductNoUnit], [ColorUnit], [Hot], [SaleBanner], [SaleText], [Header], [Side], [Remark], [Stage1Comment], [Stage1Status], [Stage2Comment], [Stage2Status], [Stage3Comment], [Stage3Status], [Stage4Comment], [Stage4Status], [Stage5Comment], [Stage5Status], [Stage6Comment], [Stage6Status], [Stage7Comment], [Stage7Status], [CreatedUserID], [CreatedDate], [UpdatedUserID], [UpdatedDate]) VALUES (56, N'2017-00048', CAST(N'2017-04-06' AS Date), 1, NULL, NULL, 1, 1, NULL, NULL, -1, -1, NULL, -1, -1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, NULL, N'test', 1, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, 1, CAST(N'2017-04-06 16:05:21.000' AS DateTime), NULL, NULL)
INSERT [dbo].[SalesPriceDetail] ([ID], [FormNo], [ApplyDate], [ApplyType_ID], [StartDate], [EndDate], [Suppliers_ID], [Brand_ID], [Shipping], [Selling_Date], [Selling_Discount1], [Selling_Discount2], [Purchase_Date], [Purchase_Discount1], [Purchase_Discount2], [SpecialPriceType_ID], [InventoryType_ID], [Attachment], [ProductNoUnit], [ColorUnit], [Hot], [SaleBanner], [SaleText], [Header], [Side], [Remark], [Stage1Comment], [Stage1Status], [Stage2Comment], [Stage2Status], [Stage3Comment], [Stage3Status], [Stage4Comment], [Stage4Status], [Stage5Comment], [Stage5Status], [Stage6Comment], [Stage6Status], [Stage7Comment], [Stage7Status], [CreatedUserID], [CreatedDate], [UpdatedUserID], [UpdatedDate]) VALUES (57, N'2017-00049', CAST(N'2017-04-06' AS Date), 4, NULL, NULL, 1, 1, NULL, NULL, -1, -1, NULL, -1, -1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, NULL, N'test', 1, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, 1, CAST(N'2017-04-06 16:06:38.000' AS DateTime), NULL, NULL)
INSERT [dbo].[SalesPriceDetail] ([ID], [FormNo], [ApplyDate], [ApplyType_ID], [StartDate], [EndDate], [Suppliers_ID], [Brand_ID], [Shipping], [Selling_Date], [Selling_Discount1], [Selling_Discount2], [Purchase_Date], [Purchase_Discount1], [Purchase_Discount2], [SpecialPriceType_ID], [InventoryType_ID], [Attachment], [ProductNoUnit], [ColorUnit], [Hot], [SaleBanner], [SaleText], [Header], [Side], [Remark], [Stage1Comment], [Stage1Status], [Stage2Comment], [Stage2Status], [Stage3Comment], [Stage3Status], [Stage4Comment], [Stage4Status], [Stage5Comment], [Stage5Status], [Stage6Comment], [Stage6Status], [Stage7Comment], [Stage7Status], [CreatedUserID], [CreatedDate], [UpdatedUserID], [UpdatedDate]) VALUES (58, N'2017-00050', CAST(N'2017-04-06' AS Date), 1, NULL, NULL, 1, 1, NULL, NULL, -1, -1, NULL, -1, -1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, NULL, N'test', 1, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, 1, CAST(N'2017-04-06 16:07:35.000' AS DateTime), NULL, NULL)
INSERT [dbo].[SalesPriceDetail] ([ID], [FormNo], [ApplyDate], [ApplyType_ID], [StartDate], [EndDate], [Suppliers_ID], [Brand_ID], [Shipping], [Selling_Date], [Selling_Discount1], [Selling_Discount2], [Purchase_Date], [Purchase_Discount1], [Purchase_Discount2], [SpecialPriceType_ID], [InventoryType_ID], [Attachment], [ProductNoUnit], [ColorUnit], [Hot], [SaleBanner], [SaleText], [Header], [Side], [Remark], [Stage1Comment], [Stage1Status], [Stage2Comment], [Stage2Status], [Stage3Comment], [Stage3Status], [Stage4Comment], [Stage4Status], [Stage5Comment], [Stage5Status], [Stage6Comment], [Stage6Status], [Stage7Comment], [Stage7Status], [CreatedUserID], [CreatedDate], [UpdatedUserID], [UpdatedDate]) VALUES (59, N'2017-00051', CAST(N'2017-04-06' AS Date), 1, NULL, NULL, 1, 1, NULL, NULL, -1, -1, NULL, -1, -1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, NULL, N'test', 1, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, 1, CAST(N'2017-04-06 16:20:30.000' AS DateTime), NULL, NULL)
INSERT [dbo].[SalesPriceDetail] ([ID], [FormNo], [ApplyDate], [ApplyType_ID], [StartDate], [EndDate], [Suppliers_ID], [Brand_ID], [Shipping], [Selling_Date], [Selling_Discount1], [Selling_Discount2], [Purchase_Date], [Purchase_Discount1], [Purchase_Discount2], [SpecialPriceType_ID], [InventoryType_ID], [Attachment], [ProductNoUnit], [ColorUnit], [Hot], [SaleBanner], [SaleText], [Header], [Side], [Remark], [Stage1Comment], [Stage1Status], [Stage2Comment], [Stage2Status], [Stage3Comment], [Stage3Status], [Stage4Comment], [Stage4Status], [Stage5Comment], [Stage5Status], [Stage6Comment], [Stage6Status], [Stage7Comment], [Stage7Status], [CreatedUserID], [CreatedDate], [UpdatedUserID], [UpdatedDate]) VALUES (60, N'2017-00052', CAST(N'2017-04-06' AS Date), 1, NULL, NULL, 1, 1, NULL, NULL, -1, -1, NULL, -1, -1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, NULL, N'test', 1, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, 1, CAST(N'2017-04-06 16:21:03.000' AS DateTime), NULL, NULL)
INSERT [dbo].[SalesPriceDetail] ([ID], [FormNo], [ApplyDate], [ApplyType_ID], [StartDate], [EndDate], [Suppliers_ID], [Brand_ID], [Shipping], [Selling_Date], [Selling_Discount1], [Selling_Discount2], [Purchase_Date], [Purchase_Discount1], [Purchase_Discount2], [SpecialPriceType_ID], [InventoryType_ID], [Attachment], [ProductNoUnit], [ColorUnit], [Hot], [SaleBanner], [SaleText], [Header], [Side], [Remark], [Stage1Comment], [Stage1Status], [Stage2Comment], [Stage2Status], [Stage3Comment], [Stage3Status], [Stage4Comment], [Stage4Status], [Stage5Comment], [Stage5Status], [Stage6Comment], [Stage6Status], [Stage7Comment], [Stage7Status], [CreatedUserID], [CreatedDate], [UpdatedUserID], [UpdatedDate]) VALUES (61, N'2017-00053', CAST(N'2017-04-06' AS Date), 1, NULL, NULL, 1, 1, NULL, NULL, -1, -1, NULL, -1, -1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, NULL, N'test', 1, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, 1, CAST(N'2017-04-06 16:33:42.000' AS DateTime), NULL, NULL)
INSERT [dbo].[SalesPriceDetail] ([ID], [FormNo], [ApplyDate], [ApplyType_ID], [StartDate], [EndDate], [Suppliers_ID], [Brand_ID], [Shipping], [Selling_Date], [Selling_Discount1], [Selling_Discount2], [Purchase_Date], [Purchase_Discount1], [Purchase_Discount2], [SpecialPriceType_ID], [InventoryType_ID], [Attachment], [ProductNoUnit], [ColorUnit], [Hot], [SaleBanner], [SaleText], [Header], [Side], [Remark], [Stage1Comment], [Stage1Status], [Stage2Comment], [Stage2Status], [Stage3Comment], [Stage3Status], [Stage4Comment], [Stage4Status], [Stage5Comment], [Stage5Status], [Stage6Comment], [Stage6Status], [Stage7Comment], [Stage7Status], [CreatedUserID], [CreatedDate], [UpdatedUserID], [UpdatedDate]) VALUES (62, N'2017-00054', CAST(N'2017-04-06' AS Date), 1, NULL, NULL, 1, 1, NULL, NULL, -1, -1, NULL, -1, -1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, NULL, N'test', 1, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, 1, CAST(N'2017-04-06 16:33:56.000' AS DateTime), NULL, NULL)
INSERT [dbo].[SalesPriceDetail] ([ID], [FormNo], [ApplyDate], [ApplyType_ID], [StartDate], [EndDate], [Suppliers_ID], [Brand_ID], [Shipping], [Selling_Date], [Selling_Discount1], [Selling_Discount2], [Purchase_Date], [Purchase_Discount1], [Purchase_Discount2], [SpecialPriceType_ID], [InventoryType_ID], [Attachment], [ProductNoUnit], [ColorUnit], [Hot], [SaleBanner], [SaleText], [Header], [Side], [Remark], [Stage1Comment], [Stage1Status], [Stage2Comment], [Stage2Status], [Stage3Comment], [Stage3Status], [Stage4Comment], [Stage4Status], [Stage5Comment], [Stage5Status], [Stage6Comment], [Stage6Status], [Stage7Comment], [Stage7Status], [CreatedUserID], [CreatedDate], [UpdatedUserID], [UpdatedDate]) VALUES (63, N'2017-00055', CAST(N'2017-04-06' AS Date), 1, NULL, NULL, 1, 1, NULL, NULL, -1, -1, NULL, -1, -1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, NULL, N'test', 1, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, 1, CAST(N'2017-04-06 16:36:07.000' AS DateTime), NULL, NULL)
INSERT [dbo].[SalesPriceDetail] ([ID], [FormNo], [ApplyDate], [ApplyType_ID], [StartDate], [EndDate], [Suppliers_ID], [Brand_ID], [Shipping], [Selling_Date], [Selling_Discount1], [Selling_Discount2], [Purchase_Date], [Purchase_Discount1], [Purchase_Discount2], [SpecialPriceType_ID], [InventoryType_ID], [Attachment], [ProductNoUnit], [ColorUnit], [Hot], [SaleBanner], [SaleText], [Header], [Side], [Remark], [Stage1Comment], [Stage1Status], [Stage2Comment], [Stage2Status], [Stage3Comment], [Stage3Status], [Stage4Comment], [Stage4Status], [Stage5Comment], [Stage5Status], [Stage6Comment], [Stage6Status], [Stage7Comment], [Stage7Status], [CreatedUserID], [CreatedDate], [UpdatedUserID], [UpdatedDate]) VALUES (64, N'2017-00056', CAST(N'2017-04-06' AS Date), 1, NULL, NULL, 1, 1, NULL, NULL, -1, -1, NULL, -1, -1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, NULL, N'test', 1, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, 1, CAST(N'2017-04-06 16:36:49.000' AS DateTime), NULL, NULL)
INSERT [dbo].[SalesPriceDetail] ([ID], [FormNo], [ApplyDate], [ApplyType_ID], [StartDate], [EndDate], [Suppliers_ID], [Brand_ID], [Shipping], [Selling_Date], [Selling_Discount1], [Selling_Discount2], [Purchase_Date], [Purchase_Discount1], [Purchase_Discount2], [SpecialPriceType_ID], [InventoryType_ID], [Attachment], [ProductNoUnit], [ColorUnit], [Hot], [SaleBanner], [SaleText], [Header], [Side], [Remark], [Stage1Comment], [Stage1Status], [Stage2Comment], [Stage2Status], [Stage3Comment], [Stage3Status], [Stage4Comment], [Stage4Status], [Stage5Comment], [Stage5Status], [Stage6Comment], [Stage6Status], [Stage7Comment], [Stage7Status], [CreatedUserID], [CreatedDate], [UpdatedUserID], [UpdatedDate]) VALUES (65, N'2017-00057', CAST(N'2017-04-06' AS Date), 1, NULL, NULL, 1, 1, NULL, NULL, -1, -1, NULL, -1, -1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, NULL, N'test', 1, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, 1, CAST(N'2017-04-06 16:40:51.000' AS DateTime), NULL, NULL)
INSERT [dbo].[SalesPriceDetail] ([ID], [FormNo], [ApplyDate], [ApplyType_ID], [StartDate], [EndDate], [Suppliers_ID], [Brand_ID], [Shipping], [Selling_Date], [Selling_Discount1], [Selling_Discount2], [Purchase_Date], [Purchase_Discount1], [Purchase_Discount2], [SpecialPriceType_ID], [InventoryType_ID], [Attachment], [ProductNoUnit], [ColorUnit], [Hot], [SaleBanner], [SaleText], [Header], [Side], [Remark], [Stage1Comment], [Stage1Status], [Stage2Comment], [Stage2Status], [Stage3Comment], [Stage3Status], [Stage4Comment], [Stage4Status], [Stage5Comment], [Stage5Status], [Stage6Comment], [Stage6Status], [Stage7Comment], [Stage7Status], [CreatedUserID], [CreatedDate], [UpdatedUserID], [UpdatedDate]) VALUES (66, N'2017-00058', CAST(N'2017-04-06' AS Date), 1, NULL, NULL, 1, 1, NULL, NULL, -1, -1, NULL, -1, -1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, NULL, N'test', 1, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, 1, CAST(N'2017-04-06 16:41:04.000' AS DateTime), NULL, NULL)
INSERT [dbo].[SalesPriceDetail] ([ID], [FormNo], [ApplyDate], [ApplyType_ID], [StartDate], [EndDate], [Suppliers_ID], [Brand_ID], [Shipping], [Selling_Date], [Selling_Discount1], [Selling_Discount2], [Purchase_Date], [Purchase_Discount1], [Purchase_Discount2], [SpecialPriceType_ID], [InventoryType_ID], [Attachment], [ProductNoUnit], [ColorUnit], [Hot], [SaleBanner], [SaleText], [Header], [Side], [Remark], [Stage1Comment], [Stage1Status], [Stage2Comment], [Stage2Status], [Stage3Comment], [Stage3Status], [Stage4Comment], [Stage4Status], [Stage5Comment], [Stage5Status], [Stage6Comment], [Stage6Status], [Stage7Comment], [Stage7Status], [CreatedUserID], [CreatedDate], [UpdatedUserID], [UpdatedDate]) VALUES (67, N'2017-00059', CAST(N'2017-04-06' AS Date), 1, NULL, NULL, 1, 1, NULL, NULL, -1, -1, NULL, -1, -1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, NULL, N'test', 1, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, 1, CAST(N'2017-04-06 16:42:40.000' AS DateTime), NULL, NULL)
INSERT [dbo].[SalesPriceDetail] ([ID], [FormNo], [ApplyDate], [ApplyType_ID], [StartDate], [EndDate], [Suppliers_ID], [Brand_ID], [Shipping], [Selling_Date], [Selling_Discount1], [Selling_Discount2], [Purchase_Date], [Purchase_Discount1], [Purchase_Discount2], [SpecialPriceType_ID], [InventoryType_ID], [Attachment], [ProductNoUnit], [ColorUnit], [Hot], [SaleBanner], [SaleText], [Header], [Side], [Remark], [Stage1Comment], [Stage1Status], [Stage2Comment], [Stage2Status], [Stage3Comment], [Stage3Status], [Stage4Comment], [Stage4Status], [Stage5Comment], [Stage5Status], [Stage6Comment], [Stage6Status], [Stage7Comment], [Stage7Status], [CreatedUserID], [CreatedDate], [UpdatedUserID], [UpdatedDate]) VALUES (68, N'2017-00060', CAST(N'2017-04-06' AS Date), 1, NULL, NULL, 1, 1, NULL, NULL, -1, -1, NULL, -1, -1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, NULL, N'test', 1, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, 1, CAST(N'2017-04-06 16:43:13.000' AS DateTime), NULL, NULL)
INSERT [dbo].[SalesPriceDetail] ([ID], [FormNo], [ApplyDate], [ApplyType_ID], [StartDate], [EndDate], [Suppliers_ID], [Brand_ID], [Shipping], [Selling_Date], [Selling_Discount1], [Selling_Discount2], [Purchase_Date], [Purchase_Discount1], [Purchase_Discount2], [SpecialPriceType_ID], [InventoryType_ID], [Attachment], [ProductNoUnit], [ColorUnit], [Hot], [SaleBanner], [SaleText], [Header], [Side], [Remark], [Stage1Comment], [Stage1Status], [Stage2Comment], [Stage2Status], [Stage3Comment], [Stage3Status], [Stage4Comment], [Stage4Status], [Stage5Comment], [Stage5Status], [Stage6Comment], [Stage6Status], [Stage7Comment], [Stage7Status], [CreatedUserID], [CreatedDate], [UpdatedUserID], [UpdatedDate]) VALUES (69, N'2017-00061', CAST(N'2017-04-06' AS Date), 1, NULL, NULL, 1, 1, NULL, NULL, -1, -1, NULL, -1, -1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, NULL, N'test', 1, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, 1, CAST(N'2017-04-06 16:46:17.000' AS DateTime), NULL, NULL)
INSERT [dbo].[SalesPriceDetail] ([ID], [FormNo], [ApplyDate], [ApplyType_ID], [StartDate], [EndDate], [Suppliers_ID], [Brand_ID], [Shipping], [Selling_Date], [Selling_Discount1], [Selling_Discount2], [Purchase_Date], [Purchase_Discount1], [Purchase_Discount2], [SpecialPriceType_ID], [InventoryType_ID], [Attachment], [ProductNoUnit], [ColorUnit], [Hot], [SaleBanner], [SaleText], [Header], [Side], [Remark], [Stage1Comment], [Stage1Status], [Stage2Comment], [Stage2Status], [Stage3Comment], [Stage3Status], [Stage4Comment], [Stage4Status], [Stage5Comment], [Stage5Status], [Stage6Comment], [Stage6Status], [Stage7Comment], [Stage7Status], [CreatedUserID], [CreatedDate], [UpdatedUserID], [UpdatedDate]) VALUES (70, N'2017-00062', CAST(N'2017-04-06' AS Date), 1, NULL, NULL, 1, 1, NULL, NULL, -1, -1, NULL, -1, -1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, NULL, N'test', 1, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, 1, CAST(N'2017-04-06 16:46:29.000' AS DateTime), NULL, NULL)
INSERT [dbo].[SalesPriceDetail] ([ID], [FormNo], [ApplyDate], [ApplyType_ID], [StartDate], [EndDate], [Suppliers_ID], [Brand_ID], [Shipping], [Selling_Date], [Selling_Discount1], [Selling_Discount2], [Purchase_Date], [Purchase_Discount1], [Purchase_Discount2], [SpecialPriceType_ID], [InventoryType_ID], [Attachment], [ProductNoUnit], [ColorUnit], [Hot], [SaleBanner], [SaleText], [Header], [Side], [Remark], [Stage1Comment], [Stage1Status], [Stage2Comment], [Stage2Status], [Stage3Comment], [Stage3Status], [Stage4Comment], [Stage4Status], [Stage5Comment], [Stage5Status], [Stage6Comment], [Stage6Status], [Stage7Comment], [Stage7Status], [CreatedUserID], [CreatedDate], [UpdatedUserID], [UpdatedDate]) VALUES (71, N'2017-00063', CAST(N'2017-04-07' AS Date), 5, NULL, NULL, 1, 1, NULL, NULL, -1, -1, NULL, -1, -1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, NULL, N'test', 1, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, 1, CAST(N'2017-04-07 11:11:08.000' AS DateTime), NULL, NULL)
INSERT [dbo].[SalesPriceDetail] ([ID], [FormNo], [ApplyDate], [ApplyType_ID], [StartDate], [EndDate], [Suppliers_ID], [Brand_ID], [Shipping], [Selling_Date], [Selling_Discount1], [Selling_Discount2], [Purchase_Date], [Purchase_Discount1], [Purchase_Discount2], [SpecialPriceType_ID], [InventoryType_ID], [Attachment], [ProductNoUnit], [ColorUnit], [Hot], [SaleBanner], [SaleText], [Header], [Side], [Remark], [Stage1Comment], [Stage1Status], [Stage2Comment], [Stage2Status], [Stage3Comment], [Stage3Status], [Stage4Comment], [Stage4Status], [Stage5Comment], [Stage5Status], [Stage6Comment], [Stage6Status], [Stage7Comment], [Stage7Status], [CreatedUserID], [CreatedDate], [UpdatedUserID], [UpdatedDate]) VALUES (72, N'2017-00064', CAST(N'2017-04-07' AS Date), 3, NULL, CAST(N'2017-04-07' AS Date), 1, 1, NULL, NULL, -1, -1, NULL, -1, -1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, NULL, N'test', 1, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, 1, CAST(N'2017-04-07 11:12:19.000' AS DateTime), NULL, NULL)
INSERT [dbo].[SalesPriceDetail] ([ID], [FormNo], [ApplyDate], [ApplyType_ID], [StartDate], [EndDate], [Suppliers_ID], [Brand_ID], [Shipping], [Selling_Date], [Selling_Discount1], [Selling_Discount2], [Purchase_Date], [Purchase_Discount1], [Purchase_Discount2], [SpecialPriceType_ID], [InventoryType_ID], [Attachment], [ProductNoUnit], [ColorUnit], [Hot], [SaleBanner], [SaleText], [Header], [Side], [Remark], [Stage1Comment], [Stage1Status], [Stage2Comment], [Stage2Status], [Stage3Comment], [Stage3Status], [Stage4Comment], [Stage4Status], [Stage5Comment], [Stage5Status], [Stage6Comment], [Stage6Status], [Stage7Comment], [Stage7Status], [CreatedUserID], [CreatedDate], [UpdatedUserID], [UpdatedDate]) VALUES (73, N'2017-00065', CAST(N'2017-04-07' AS Date), 1, NULL, NULL, 1, 1, NULL, NULL, -1, -1, NULL, -1, -1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, NULL, N'test', 1, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, 1, CAST(N'2017-04-07 12:57:25.000' AS DateTime), NULL, NULL)
INSERT [dbo].[SalesPriceDetail] ([ID], [FormNo], [ApplyDate], [ApplyType_ID], [StartDate], [EndDate], [Suppliers_ID], [Brand_ID], [Shipping], [Selling_Date], [Selling_Discount1], [Selling_Discount2], [Purchase_Date], [Purchase_Discount1], [Purchase_Discount2], [SpecialPriceType_ID], [InventoryType_ID], [Attachment], [ProductNoUnit], [ColorUnit], [Hot], [SaleBanner], [SaleText], [Header], [Side], [Remark], [Stage1Comment], [Stage1Status], [Stage2Comment], [Stage2Status], [Stage3Comment], [Stage3Status], [Stage4Comment], [Stage4Status], [Stage5Comment], [Stage5Status], [Stage6Comment], [Stage6Status], [Stage7Comment], [Stage7Status], [CreatedUserID], [CreatedDate], [UpdatedUserID], [UpdatedDate]) VALUES (74, N'2017-00066', CAST(N'2017-04-07' AS Date), 1, NULL, NULL, 1, 1, NULL, NULL, -1, -1, NULL, -1, -1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, NULL, N'test', 1, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, 1, CAST(N'2017-04-07 12:57:37.000' AS DateTime), NULL, NULL)
INSERT [dbo].[SalesPriceDetail] ([ID], [FormNo], [ApplyDate], [ApplyType_ID], [StartDate], [EndDate], [Suppliers_ID], [Brand_ID], [Shipping], [Selling_Date], [Selling_Discount1], [Selling_Discount2], [Purchase_Date], [Purchase_Discount1], [Purchase_Discount2], [SpecialPriceType_ID], [InventoryType_ID], [Attachment], [ProductNoUnit], [ColorUnit], [Hot], [SaleBanner], [SaleText], [Header], [Side], [Remark], [Stage1Comment], [Stage1Status], [Stage2Comment], [Stage2Status], [Stage3Comment], [Stage3Status], [Stage4Comment], [Stage4Status], [Stage5Comment], [Stage5Status], [Stage6Comment], [Stage6Status], [Stage7Comment], [Stage7Status], [CreatedUserID], [CreatedDate], [UpdatedUserID], [UpdatedDate]) VALUES (75, N'2017-00067', CAST(N'2017-04-07' AS Date), 1, NULL, NULL, 1, 1, NULL, NULL, -1, -1, NULL, -1, -1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, NULL, N'test', 1, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, 1, CAST(N'2017-04-07 12:57:42.000' AS DateTime), NULL, NULL)
INSERT [dbo].[SalesPriceDetail] ([ID], [FormNo], [ApplyDate], [ApplyType_ID], [StartDate], [EndDate], [Suppliers_ID], [Brand_ID], [Shipping], [Selling_Date], [Selling_Discount1], [Selling_Discount2], [Purchase_Date], [Purchase_Discount1], [Purchase_Discount2], [SpecialPriceType_ID], [InventoryType_ID], [Attachment], [ProductNoUnit], [ColorUnit], [Hot], [SaleBanner], [SaleText], [Header], [Side], [Remark], [Stage1Comment], [Stage1Status], [Stage2Comment], [Stage2Status], [Stage3Comment], [Stage3Status], [Stage4Comment], [Stage4Status], [Stage5Comment], [Stage5Status], [Stage6Comment], [Stage6Status], [Stage7Comment], [Stage7Status], [CreatedUserID], [CreatedDate], [UpdatedUserID], [UpdatedDate]) VALUES (76, N'2017-00068', CAST(N'2017-04-07' AS Date), 1, NULL, NULL, 1, 1, NULL, NULL, -1, -1, NULL, -1, -1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, NULL, N'test', 1, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, 5, CAST(N'2017-04-07 12:58:07.000' AS DateTime), NULL, NULL)
INSERT [dbo].[SalesPriceDetail] ([ID], [FormNo], [ApplyDate], [ApplyType_ID], [StartDate], [EndDate], [Suppliers_ID], [Brand_ID], [Shipping], [Selling_Date], [Selling_Discount1], [Selling_Discount2], [Purchase_Date], [Purchase_Discount1], [Purchase_Discount2], [SpecialPriceType_ID], [InventoryType_ID], [Attachment], [ProductNoUnit], [ColorUnit], [Hot], [SaleBanner], [SaleText], [Header], [Side], [Remark], [Stage1Comment], [Stage1Status], [Stage2Comment], [Stage2Status], [Stage3Comment], [Stage3Status], [Stage4Comment], [Stage4Status], [Stage5Comment], [Stage5Status], [Stage6Comment], [Stage6Status], [Stage7Comment], [Stage7Status], [CreatedUserID], [CreatedDate], [UpdatedUserID], [UpdatedDate]) VALUES (77, N'2017-00069', CAST(N'2017-04-07' AS Date), 1, NULL, NULL, 1, 1, NULL, NULL, -1, -1, NULL, -1, -1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, NULL, N'test', 1, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, 5, CAST(N'2017-04-07 12:58:12.000' AS DateTime), NULL, NULL)
INSERT [dbo].[SalesPriceDetail] ([ID], [FormNo], [ApplyDate], [ApplyType_ID], [StartDate], [EndDate], [Suppliers_ID], [Brand_ID], [Shipping], [Selling_Date], [Selling_Discount1], [Selling_Discount2], [Purchase_Date], [Purchase_Discount1], [Purchase_Discount2], [SpecialPriceType_ID], [InventoryType_ID], [Attachment], [ProductNoUnit], [ColorUnit], [Hot], [SaleBanner], [SaleText], [Header], [Side], [Remark], [Stage1Comment], [Stage1Status], [Stage2Comment], [Stage2Status], [Stage3Comment], [Stage3Status], [Stage4Comment], [Stage4Status], [Stage5Comment], [Stage5Status], [Stage6Comment], [Stage6Status], [Stage7Comment], [Stage7Status], [CreatedUserID], [CreatedDate], [UpdatedUserID], [UpdatedDate]) VALUES (78, N'2017-00070', CAST(N'2017-04-07' AS Date), 1, NULL, NULL, 1, 1, NULL, NULL, -1, -1, NULL, -1, -1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, NULL, N'test', 1, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, 5, CAST(N'2017-04-07 12:58:16.000' AS DateTime), NULL, NULL)
INSERT [dbo].[SalesPriceDetail] ([ID], [FormNo], [ApplyDate], [ApplyType_ID], [StartDate], [EndDate], [Suppliers_ID], [Brand_ID], [Shipping], [Selling_Date], [Selling_Discount1], [Selling_Discount2], [Purchase_Date], [Purchase_Discount1], [Purchase_Discount2], [SpecialPriceType_ID], [InventoryType_ID], [Attachment], [ProductNoUnit], [ColorUnit], [Hot], [SaleBanner], [SaleText], [Header], [Side], [Remark], [Stage1Comment], [Stage1Status], [Stage2Comment], [Stage2Status], [Stage3Comment], [Stage3Status], [Stage4Comment], [Stage4Status], [Stage5Comment], [Stage5Status], [Stage6Comment], [Stage6Status], [Stage7Comment], [Stage7Status], [CreatedUserID], [CreatedDate], [UpdatedUserID], [UpdatedDate]) VALUES (79, N'2017-00071', CAST(N'2017-04-07' AS Date), 1, NULL, NULL, 1, 1, NULL, NULL, -1, -1, NULL, -1, -1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, NULL, N'test', 1, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, 5, CAST(N'2017-04-07 12:58:21.000' AS DateTime), NULL, NULL)
INSERT [dbo].[SalesPriceDetail] ([ID], [FormNo], [ApplyDate], [ApplyType_ID], [StartDate], [EndDate], [Suppliers_ID], [Brand_ID], [Shipping], [Selling_Date], [Selling_Discount1], [Selling_Discount2], [Purchase_Date], [Purchase_Discount1], [Purchase_Discount2], [SpecialPriceType_ID], [InventoryType_ID], [Attachment], [ProductNoUnit], [ColorUnit], [Hot], [SaleBanner], [SaleText], [Header], [Side], [Remark], [Stage1Comment], [Stage1Status], [Stage2Comment], [Stage2Status], [Stage3Comment], [Stage3Status], [Stage4Comment], [Stage4Status], [Stage5Comment], [Stage5Status], [Stage6Comment], [Stage6Status], [Stage7Comment], [Stage7Status], [CreatedUserID], [CreatedDate], [UpdatedUserID], [UpdatedDate]) VALUES (80, N'2017-00072', CAST(N'2017-04-07' AS Date), 1, NULL, NULL, 1, 1, NULL, NULL, -1, -1, NULL, -1, -1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, NULL, N'test', 1, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, 5, CAST(N'2017-04-07 12:58:28.000' AS DateTime), NULL, NULL)
INSERT [dbo].[SalesPriceDetail] ([ID], [FormNo], [ApplyDate], [ApplyType_ID], [StartDate], [EndDate], [Suppliers_ID], [Brand_ID], [Shipping], [Selling_Date], [Selling_Discount1], [Selling_Discount2], [Purchase_Date], [Purchase_Discount1], [Purchase_Discount2], [SpecialPriceType_ID], [InventoryType_ID], [Attachment], [ProductNoUnit], [ColorUnit], [Hot], [SaleBanner], [SaleText], [Header], [Side], [Remark], [Stage1Comment], [Stage1Status], [Stage2Comment], [Stage2Status], [Stage3Comment], [Stage3Status], [Stage4Comment], [Stage4Status], [Stage5Comment], [Stage5Status], [Stage6Comment], [Stage6Status], [Stage7Comment], [Stage7Status], [CreatedUserID], [CreatedDate], [UpdatedUserID], [UpdatedDate]) VALUES (81, N'2017-00073', CAST(N'2017-04-07' AS Date), 1, NULL, NULL, 1, 1, NULL, NULL, -1, -1, NULL, -1, -1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, NULL, N'test', 1, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, 5, CAST(N'2017-04-07 12:58:35.000' AS DateTime), NULL, NULL)
INSERT [dbo].[SalesPriceDetail] ([ID], [FormNo], [ApplyDate], [ApplyType_ID], [StartDate], [EndDate], [Suppliers_ID], [Brand_ID], [Shipping], [Selling_Date], [Selling_Discount1], [Selling_Discount2], [Purchase_Date], [Purchase_Discount1], [Purchase_Discount2], [SpecialPriceType_ID], [InventoryType_ID], [Attachment], [ProductNoUnit], [ColorUnit], [Hot], [SaleBanner], [SaleText], [Header], [Side], [Remark], [Stage1Comment], [Stage1Status], [Stage2Comment], [Stage2Status], [Stage3Comment], [Stage3Status], [Stage4Comment], [Stage4Status], [Stage5Comment], [Stage5Status], [Stage6Comment], [Stage6Status], [Stage7Comment], [Stage7Status], [CreatedUserID], [CreatedDate], [UpdatedUserID], [UpdatedDate]) VALUES (82, N'2017-00074', CAST(N'2017-04-07' AS Date), 1, NULL, NULL, 1, 1, NULL, NULL, -1, -1, NULL, -1, -1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, NULL, N'test', 1, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, 5, CAST(N'2017-04-07 12:58:40.000' AS DateTime), NULL, NULL)
INSERT [dbo].[SalesPriceDetail] ([ID], [FormNo], [ApplyDate], [ApplyType_ID], [StartDate], [EndDate], [Suppliers_ID], [Brand_ID], [Shipping], [Selling_Date], [Selling_Discount1], [Selling_Discount2], [Purchase_Date], [Purchase_Discount1], [Purchase_Discount2], [SpecialPriceType_ID], [InventoryType_ID], [Attachment], [ProductNoUnit], [ColorUnit], [Hot], [SaleBanner], [SaleText], [Header], [Side], [Remark], [Stage1Comment], [Stage1Status], [Stage2Comment], [Stage2Status], [Stage3Comment], [Stage3Status], [Stage4Comment], [Stage4Status], [Stage5Comment], [Stage5Status], [Stage6Comment], [Stage6Status], [Stage7Comment], [Stage7Status], [CreatedUserID], [CreatedDate], [UpdatedUserID], [UpdatedDate]) VALUES (83, N'2017-00075', CAST(N'2017-04-07' AS Date), 1, NULL, NULL, 1, 1, NULL, NULL, -1, -1, NULL, -1, -1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, NULL, N'test', 1, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, 5, CAST(N'2017-04-07 12:58:45.000' AS DateTime), NULL, NULL)
INSERT [dbo].[SalesPriceDetail] ([ID], [FormNo], [ApplyDate], [ApplyType_ID], [StartDate], [EndDate], [Suppliers_ID], [Brand_ID], [Shipping], [Selling_Date], [Selling_Discount1], [Selling_Discount2], [Purchase_Date], [Purchase_Discount1], [Purchase_Discount2], [SpecialPriceType_ID], [InventoryType_ID], [Attachment], [ProductNoUnit], [ColorUnit], [Hot], [SaleBanner], [SaleText], [Header], [Side], [Remark], [Stage1Comment], [Stage1Status], [Stage2Comment], [Stage2Status], [Stage3Comment], [Stage3Status], [Stage4Comment], [Stage4Status], [Stage5Comment], [Stage5Status], [Stage6Comment], [Stage6Status], [Stage7Comment], [Stage7Status], [CreatedUserID], [CreatedDate], [UpdatedUserID], [UpdatedDate]) VALUES (84, N'2017-00076', CAST(N'2017-04-07' AS Date), 1, NULL, NULL, 1, 1, NULL, NULL, -1, -1, NULL, -1, -1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, NULL, N'test', 1, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, 5, CAST(N'2017-04-07 13:04:10.000' AS DateTime), NULL, NULL)
INSERT [dbo].[SalesPriceDetail] ([ID], [FormNo], [ApplyDate], [ApplyType_ID], [StartDate], [EndDate], [Suppliers_ID], [Brand_ID], [Shipping], [Selling_Date], [Selling_Discount1], [Selling_Discount2], [Purchase_Date], [Purchase_Discount1], [Purchase_Discount2], [SpecialPriceType_ID], [InventoryType_ID], [Attachment], [ProductNoUnit], [ColorUnit], [Hot], [SaleBanner], [SaleText], [Header], [Side], [Remark], [Stage1Comment], [Stage1Status], [Stage2Comment], [Stage2Status], [Stage3Comment], [Stage3Status], [Stage4Comment], [Stage4Status], [Stage5Comment], [Stage5Status], [Stage6Comment], [Stage6Status], [Stage7Comment], [Stage7Status], [CreatedUserID], [CreatedDate], [UpdatedUserID], [UpdatedDate]) VALUES (85, N'2017-00077', CAST(N'2017-04-07' AS Date), 1, NULL, NULL, 1, 1, NULL, NULL, -1, -1, NULL, -1, -1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, NULL, N'test', 1, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, 5, CAST(N'2017-04-07 13:04:15.000' AS DateTime), NULL, NULL)
INSERT [dbo].[SalesPriceDetail] ([ID], [FormNo], [ApplyDate], [ApplyType_ID], [StartDate], [EndDate], [Suppliers_ID], [Brand_ID], [Shipping], [Selling_Date], [Selling_Discount1], [Selling_Discount2], [Purchase_Date], [Purchase_Discount1], [Purchase_Discount2], [SpecialPriceType_ID], [InventoryType_ID], [Attachment], [ProductNoUnit], [ColorUnit], [Hot], [SaleBanner], [SaleText], [Header], [Side], [Remark], [Stage1Comment], [Stage1Status], [Stage2Comment], [Stage2Status], [Stage3Comment], [Stage3Status], [Stage4Comment], [Stage4Status], [Stage5Comment], [Stage5Status], [Stage6Comment], [Stage6Status], [Stage7Comment], [Stage7Status], [CreatedUserID], [CreatedDate], [UpdatedUserID], [UpdatedDate]) VALUES (86, N'2017-00078', CAST(N'2017-04-07' AS Date), 1, NULL, NULL, 1, 1, NULL, NULL, -1, -1, NULL, -1, -1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, NULL, N'test', 1, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, 5, CAST(N'2017-04-07 13:04:20.000' AS DateTime), NULL, NULL)
INSERT [dbo].[SalesPriceDetail] ([ID], [FormNo], [ApplyDate], [ApplyType_ID], [StartDate], [EndDate], [Suppliers_ID], [Brand_ID], [Shipping], [Selling_Date], [Selling_Discount1], [Selling_Discount2], [Purchase_Date], [Purchase_Discount1], [Purchase_Discount2], [SpecialPriceType_ID], [InventoryType_ID], [Attachment], [ProductNoUnit], [ColorUnit], [Hot], [SaleBanner], [SaleText], [Header], [Side], [Remark], [Stage1Comment], [Stage1Status], [Stage2Comment], [Stage2Status], [Stage3Comment], [Stage3Status], [Stage4Comment], [Stage4Status], [Stage5Comment], [Stage5Status], [Stage6Comment], [Stage6Status], [Stage7Comment], [Stage7Status], [CreatedUserID], [CreatedDate], [UpdatedUserID], [UpdatedDate]) VALUES (87, N'2017-00079', CAST(N'2017-04-07' AS Date), 1, NULL, NULL, 1, 1, NULL, NULL, -1, -1, NULL, -1, -1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, NULL, N'test', 1, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, 5, CAST(N'2017-04-07 13:04:24.000' AS DateTime), NULL, NULL)
SET IDENTITY_INSERT [dbo].[SalesPriceDetail] OFF
SET IDENTITY_INSERT [dbo].[SpecialPrice_Type] ON 

INSERT [dbo].[SpecialPrice_Type] ([ID], [Description]) VALUES (1, N'★（追加発注不可）')
INSERT [dbo].[SpecialPrice_Type] ([ID], [Description]) VALUES (2, N'■（特価）')
INSERT [dbo].[SpecialPrice_Type] ([ID], [Description]) VALUES (3, N'【Ｆ】（FAX発注）')
INSERT [dbo].[SpecialPrice_Type] ([ID], [Description]) VALUES (4, N'□（別発注）')
INSERT [dbo].[SpecialPrice_Type] ([ID], [Description]) VALUES (5, N'変更なし')
INSERT [dbo].[SpecialPrice_Type] ([ID], [Description]) VALUES (6, N'特記なし')
SET IDENTITY_INSERT [dbo].[SpecialPrice_Type] OFF
SET IDENTITY_INSERT [dbo].[Stage] ON 

INSERT [dbo].[Stage] ([ID], [StageID], [Description]) VALUES (1, 1, N'仕入管理チーム >> 申請 >> 申請者')
INSERT [dbo].[Stage] ([ID], [StageID], [Description]) VALUES (2, 2, N'仕入管理チーム >> 申請 >> チェック')
INSERT [dbo].[Stage] ([ID], [StageID], [Description]) VALUES (3, 3, N'制作チーム >> 商品管理価格訂正 >> 仕入価格')
INSERT [dbo].[Stage] ([ID], [StageID], [Description]) VALUES (4, 4, N'制作チーム >> 商品管理価格訂正 >> 販売価格')
INSERT [dbo].[Stage] ([ID], [StageID], [Description]) VALUES (5, 5, N'制作チーム >> 商品管理価格訂正 >> チェック')
INSERT [dbo].[Stage] ([ID], [StageID], [Description]) VALUES (6, 6, N'制作チーム >> サイト反映 >> SKS取込')
INSERT [dbo].[Stage] ([ID], [StageID], [Description]) VALUES (7, 7, N'制作チーム >> サイト反映 >> 商品UP')
SET IDENTITY_INSERT [dbo].[Stage] OFF
SET IDENTITY_INSERT [dbo].[Stage_Setting] ON 

INSERT [dbo].[Stage_Setting] ([ID], [StageID], [RowID]) VALUES (66, 1, 1)
INSERT [dbo].[Stage_Setting] ([ID], [StageID], [RowID]) VALUES (67, 1, 2)
INSERT [dbo].[Stage_Setting] ([ID], [StageID], [RowID]) VALUES (68, 1, 11)
INSERT [dbo].[Stage_Setting] ([ID], [StageID], [RowID]) VALUES (69, 2, 3)
INSERT [dbo].[Stage_Setting] ([ID], [StageID], [RowID]) VALUES (70, 2, 4)
INSERT [dbo].[Stage_Setting] ([ID], [StageID], [RowID]) VALUES (71, 2, 5)
INSERT [dbo].[Stage_Setting] ([ID], [StageID], [RowID]) VALUES (72, 3, 6)
INSERT [dbo].[Stage_Setting] ([ID], [StageID], [RowID]) VALUES (76, 4, 7)
INSERT [dbo].[Stage_Setting] ([ID], [StageID], [RowID]) VALUES (78, 6, 9)
INSERT [dbo].[Stage_Setting] ([ID], [StageID], [RowID]) VALUES (80, 7, 9)
INSERT [dbo].[Stage_Setting] ([ID], [StageID], [RowID]) VALUES (81, 7, 10)
INSERT [dbo].[Stage_Setting] ([ID], [StageID], [RowID]) VALUES (82, 5, 8)
INSERT [dbo].[Stage_Setting] ([ID], [StageID], [RowID]) VALUES (83, 5, 11)
SET IDENTITY_INSERT [dbo].[Stage_Setting] OFF
SET IDENTITY_INSERT [dbo].[Suppliers] ON 

INSERT [dbo].[Suppliers] ([ID], [Description]) VALUES (1, N'Mg Mg')
INSERT [dbo].[Suppliers] ([ID], [Description]) VALUES (2, N'Ag Ag')
INSERT [dbo].[Suppliers] ([ID], [Description]) VALUES (3, N'Kyaw Kyaw')
INSERT [dbo].[Suppliers] ([ID], [Description]) VALUES (4, N'Hla Hl')
SET IDENTITY_INSERT [dbo].[Suppliers] OFF
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([ID], [UserID], [Password]) VALUES (1, N'sa', N'KFS6Z2Oj9RUHC/MQ9voAJg==')
INSERT [dbo].[Users] ([ID], [UserID], [Password]) VALUES (5, N'ptk', N'KFS6Z2Oj9RUHC/MQ9voAJg==')
INSERT [dbo].[Users] ([ID], [UserID], [Password]) VALUES (57, N'phyo', N'KFS6Z2Oj9RUHC/MQ9voAJg==')
INSERT [dbo].[Users] ([ID], [UserID], [Password]) VALUES (60, N'ymo', N'KFS6Z2Oj9RUHC/MQ9voAJg==')
SET IDENTITY_INSERT [dbo].[Users] OFF
SET IDENTITY_INSERT [dbo].[Users_Menu] ON 

INSERT [dbo].[Users_Menu] ([ID], [UserID], [MenuID]) VALUES (13, 4, N'0')
INSERT [dbo].[Users_Menu] ([ID], [UserID], [MenuID]) VALUES (14, 4, N'1')
INSERT [dbo].[Users_Menu] ([ID], [UserID], [MenuID]) VALUES (15, 4, N'2')
INSERT [dbo].[Users_Menu] ([ID], [UserID], [MenuID]) VALUES (16, 4, N'3')
INSERT [dbo].[Users_Menu] ([ID], [UserID], [MenuID]) VALUES (17, 4, N'4')
INSERT [dbo].[Users_Menu] ([ID], [UserID], [MenuID]) VALUES (18, 4, N'5')
INSERT [dbo].[Users_Menu] ([ID], [UserID], [MenuID]) VALUES (19, 4, N'6')
INSERT [dbo].[Users_Menu] ([ID], [UserID], [MenuID]) VALUES (20, 4, N'7')
INSERT [dbo].[Users_Menu] ([ID], [UserID], [MenuID]) VALUES (21, 4, N'8')
INSERT [dbo].[Users_Menu] ([ID], [UserID], [MenuID]) VALUES (22, 4, N'9')
INSERT [dbo].[Users_Menu] ([ID], [UserID], [MenuID]) VALUES (23, 4, N'10')
INSERT [dbo].[Users_Menu] ([ID], [UserID], [MenuID]) VALUES (24, 4, N'11')
INSERT [dbo].[Users_Menu] ([ID], [UserID], [MenuID]) VALUES (25, 7, N'0')
INSERT [dbo].[Users_Menu] ([ID], [UserID], [MenuID]) VALUES (26, 7, N'1')
INSERT [dbo].[Users_Menu] ([ID], [UserID], [MenuID]) VALUES (27, 7, N'2')
INSERT [dbo].[Users_Menu] ([ID], [UserID], [MenuID]) VALUES (28, 7, N'3')
INSERT [dbo].[Users_Menu] ([ID], [UserID], [MenuID]) VALUES (29, 7, N'4')
INSERT [dbo].[Users_Menu] ([ID], [UserID], [MenuID]) VALUES (30, 7, N'9')
INSERT [dbo].[Users_Menu] ([ID], [UserID], [MenuID]) VALUES (31, 7, N'10')
INSERT [dbo].[Users_Menu] ([ID], [UserID], [MenuID]) VALUES (32, 8, N'0')
INSERT [dbo].[Users_Menu] ([ID], [UserID], [MenuID]) VALUES (33, 8, N'1')
INSERT [dbo].[Users_Menu] ([ID], [UserID], [MenuID]) VALUES (34, 8, N'2')
INSERT [dbo].[Users_Menu] ([ID], [UserID], [MenuID]) VALUES (35, 8, N'3')
INSERT [dbo].[Users_Menu] ([ID], [UserID], [MenuID]) VALUES (36, 8, N'4')
INSERT [dbo].[Users_Menu] ([ID], [UserID], [MenuID]) VALUES (37, 8, N'5')
INSERT [dbo].[Users_Menu] ([ID], [UserID], [MenuID]) VALUES (38, 8, N'6')
INSERT [dbo].[Users_Menu] ([ID], [UserID], [MenuID]) VALUES (39, 8, N'7')
INSERT [dbo].[Users_Menu] ([ID], [UserID], [MenuID]) VALUES (40, 8, N'8')
INSERT [dbo].[Users_Menu] ([ID], [UserID], [MenuID]) VALUES (41, 8, N'9')
INSERT [dbo].[Users_Menu] ([ID], [UserID], [MenuID]) VALUES (42, 8, N'10')
INSERT [dbo].[Users_Menu] ([ID], [UserID], [MenuID]) VALUES (50, 10, N'0')
INSERT [dbo].[Users_Menu] ([ID], [UserID], [MenuID]) VALUES (51, 10, N'1')
INSERT [dbo].[Users_Menu] ([ID], [UserID], [MenuID]) VALUES (52, 10, N'2')
INSERT [dbo].[Users_Menu] ([ID], [UserID], [MenuID]) VALUES (53, 10, N'3')
INSERT [dbo].[Users_Menu] ([ID], [UserID], [MenuID]) VALUES (54, 10, N'4')
INSERT [dbo].[Users_Menu] ([ID], [UserID], [MenuID]) VALUES (55, 10, N'9')
INSERT [dbo].[Users_Menu] ([ID], [UserID], [MenuID]) VALUES (56, 10, N'10')
INSERT [dbo].[Users_Menu] ([ID], [UserID], [MenuID]) VALUES (131, 2, N'0')
INSERT [dbo].[Users_Menu] ([ID], [UserID], [MenuID]) VALUES (132, 2, N'2')
INSERT [dbo].[Users_Menu] ([ID], [UserID], [MenuID]) VALUES (133, 2, N'3')
INSERT [dbo].[Users_Menu] ([ID], [UserID], [MenuID]) VALUES (134, 2, N'4')
INSERT [dbo].[Users_Menu] ([ID], [UserID], [MenuID]) VALUES (135, 2, N'5')
INSERT [dbo].[Users_Menu] ([ID], [UserID], [MenuID]) VALUES (136, 2, N'7')
INSERT [dbo].[Users_Menu] ([ID], [UserID], [MenuID]) VALUES (137, 2, N'8')
INSERT [dbo].[Users_Menu] ([ID], [UserID], [MenuID]) VALUES (185, 12, N'0')
INSERT [dbo].[Users_Menu] ([ID], [UserID], [MenuID]) VALUES (186, 12, N'2')
INSERT [dbo].[Users_Menu] ([ID], [UserID], [MenuID]) VALUES (187, 12, N'4')
INSERT [dbo].[Users_Menu] ([ID], [UserID], [MenuID]) VALUES (188, 12, N'5')
INSERT [dbo].[Users_Menu] ([ID], [UserID], [MenuID]) VALUES (189, 12, N'7')
INSERT [dbo].[Users_Menu] ([ID], [UserID], [MenuID]) VALUES (202, 6, N'0')
INSERT [dbo].[Users_Menu] ([ID], [UserID], [MenuID]) VALUES (203, 6, N'1')
INSERT [dbo].[Users_Menu] ([ID], [UserID], [MenuID]) VALUES (204, 6, N'2')
INSERT [dbo].[Users_Menu] ([ID], [UserID], [MenuID]) VALUES (205, 6, N'3')
INSERT [dbo].[Users_Menu] ([ID], [UserID], [MenuID]) VALUES (206, 6, N'4')
INSERT [dbo].[Users_Menu] ([ID], [UserID], [MenuID]) VALUES (207, 6, N'5')
INSERT [dbo].[Users_Menu] ([ID], [UserID], [MenuID]) VALUES (208, 6, N'6')
INSERT [dbo].[Users_Menu] ([ID], [UserID], [MenuID]) VALUES (209, 6, N'7')
INSERT [dbo].[Users_Menu] ([ID], [UserID], [MenuID]) VALUES (210, 6, N'8')
INSERT [dbo].[Users_Menu] ([ID], [UserID], [MenuID]) VALUES (211, 6, N'9')
INSERT [dbo].[Users_Menu] ([ID], [UserID], [MenuID]) VALUES (212, 6, N'10')
INSERT [dbo].[Users_Menu] ([ID], [UserID], [MenuID]) VALUES (213, 6, N'11')
INSERT [dbo].[Users_Menu] ([ID], [UserID], [MenuID]) VALUES (424, 9, N'0')
INSERT [dbo].[Users_Menu] ([ID], [UserID], [MenuID]) VALUES (425, 9, N'1')
INSERT [dbo].[Users_Menu] ([ID], [UserID], [MenuID]) VALUES (426, 9, N'2')
INSERT [dbo].[Users_Menu] ([ID], [UserID], [MenuID]) VALUES (427, 9, N'3')
INSERT [dbo].[Users_Menu] ([ID], [UserID], [MenuID]) VALUES (428, 9, N'4')
INSERT [dbo].[Users_Menu] ([ID], [UserID], [MenuID]) VALUES (429, 9, N'9')
INSERT [dbo].[Users_Menu] ([ID], [UserID], [MenuID]) VALUES (430, 9, N'10')
INSERT [dbo].[Users_Menu] ([ID], [UserID], [MenuID]) VALUES (475, 11, N'0')
INSERT [dbo].[Users_Menu] ([ID], [UserID], [MenuID]) VALUES (476, 11, N'1')
INSERT [dbo].[Users_Menu] ([ID], [UserID], [MenuID]) VALUES (477, 11, N'2')
INSERT [dbo].[Users_Menu] ([ID], [UserID], [MenuID]) VALUES (478, 11, N'3')
INSERT [dbo].[Users_Menu] ([ID], [UserID], [MenuID]) VALUES (479, 11, N'4')
INSERT [dbo].[Users_Menu] ([ID], [UserID], [MenuID]) VALUES (480, 11, N'5')
INSERT [dbo].[Users_Menu] ([ID], [UserID], [MenuID]) VALUES (481, 11, N'6')
INSERT [dbo].[Users_Menu] ([ID], [UserID], [MenuID]) VALUES (482, 11, N'7')
INSERT [dbo].[Users_Menu] ([ID], [UserID], [MenuID]) VALUES (483, 11, N'8')
INSERT [dbo].[Users_Menu] ([ID], [UserID], [MenuID]) VALUES (484, 11, N'9')
INSERT [dbo].[Users_Menu] ([ID], [UserID], [MenuID]) VALUES (485, 11, N'10')
INSERT [dbo].[Users_Menu] ([ID], [UserID], [MenuID]) VALUES (486, 11, N'11')
INSERT [dbo].[Users_Menu] ([ID], [UserID], [MenuID]) VALUES (499, 15, N'0')
INSERT [dbo].[Users_Menu] ([ID], [UserID], [MenuID]) VALUES (500, 15, N'1')
INSERT [dbo].[Users_Menu] ([ID], [UserID], [MenuID]) VALUES (501, 15, N'2')
INSERT [dbo].[Users_Menu] ([ID], [UserID], [MenuID]) VALUES (502, 15, N'3')
INSERT [dbo].[Users_Menu] ([ID], [UserID], [MenuID]) VALUES (503, 15, N'4')
INSERT [dbo].[Users_Menu] ([ID], [UserID], [MenuID]) VALUES (504, 15, N'5')
INSERT [dbo].[Users_Menu] ([ID], [UserID], [MenuID]) VALUES (505, 15, N'6')
INSERT [dbo].[Users_Menu] ([ID], [UserID], [MenuID]) VALUES (506, 15, N'7')
INSERT [dbo].[Users_Menu] ([ID], [UserID], [MenuID]) VALUES (507, 15, N'8')
INSERT [dbo].[Users_Menu] ([ID], [UserID], [MenuID]) VALUES (508, 15, N'9')
INSERT [dbo].[Users_Menu] ([ID], [UserID], [MenuID]) VALUES (509, 15, N'10')
INSERT [dbo].[Users_Menu] ([ID], [UserID], [MenuID]) VALUES (510, 15, N'11')
INSERT [dbo].[Users_Menu] ([ID], [UserID], [MenuID]) VALUES (522, 18, N'0')
INSERT [dbo].[Users_Menu] ([ID], [UserID], [MenuID]) VALUES (523, 18, N'2')
INSERT [dbo].[Users_Menu] ([ID], [UserID], [MenuID]) VALUES (524, 18, N'4')
INSERT [dbo].[Users_Menu] ([ID], [UserID], [MenuID]) VALUES (525, 18, N'5')
INSERT [dbo].[Users_Menu] ([ID], [UserID], [MenuID]) VALUES (526, 18, N'7')
INSERT [dbo].[Users_Menu] ([ID], [UserID], [MenuID]) VALUES (542, 21, N'0')
INSERT [dbo].[Users_Menu] ([ID], [UserID], [MenuID]) VALUES (543, 21, N'2')
GO
INSERT [dbo].[Users_Menu] ([ID], [UserID], [MenuID]) VALUES (544, 21, N'3')
INSERT [dbo].[Users_Menu] ([ID], [UserID], [MenuID]) VALUES (545, 21, N'4')
INSERT [dbo].[Users_Menu] ([ID], [UserID], [MenuID]) VALUES (546, 21, N'5')
INSERT [dbo].[Users_Menu] ([ID], [UserID], [MenuID]) VALUES (547, 21, N'6')
INSERT [dbo].[Users_Menu] ([ID], [UserID], [MenuID]) VALUES (548, 21, N'7')
INSERT [dbo].[Users_Menu] ([ID], [UserID], [MenuID]) VALUES (549, 21, N'8')
INSERT [dbo].[Users_Menu] ([ID], [UserID], [MenuID]) VALUES (550, 19, N'0')
INSERT [dbo].[Users_Menu] ([ID], [UserID], [MenuID]) VALUES (551, 19, N'2')
INSERT [dbo].[Users_Menu] ([ID], [UserID], [MenuID]) VALUES (552, 19, N'3')
INSERT [dbo].[Users_Menu] ([ID], [UserID], [MenuID]) VALUES (553, 19, N'4')
INSERT [dbo].[Users_Menu] ([ID], [UserID], [MenuID]) VALUES (554, 19, N'5')
INSERT [dbo].[Users_Menu] ([ID], [UserID], [MenuID]) VALUES (555, 19, N'7')
INSERT [dbo].[Users_Menu] ([ID], [UserID], [MenuID]) VALUES (556, 19, N'8')
INSERT [dbo].[Users_Menu] ([ID], [UserID], [MenuID]) VALUES (557, 19, N'9')
INSERT [dbo].[Users_Menu] ([ID], [UserID], [MenuID]) VALUES (558, 19, N'10')
INSERT [dbo].[Users_Menu] ([ID], [UserID], [MenuID]) VALUES (587, 1, N'0')
INSERT [dbo].[Users_Menu] ([ID], [UserID], [MenuID]) VALUES (588, 1, N'1')
INSERT [dbo].[Users_Menu] ([ID], [UserID], [MenuID]) VALUES (589, 1, N'2')
INSERT [dbo].[Users_Menu] ([ID], [UserID], [MenuID]) VALUES (590, 1, N'3')
INSERT [dbo].[Users_Menu] ([ID], [UserID], [MenuID]) VALUES (591, 1, N'4')
INSERT [dbo].[Users_Menu] ([ID], [UserID], [MenuID]) VALUES (592, 1, N'5')
INSERT [dbo].[Users_Menu] ([ID], [UserID], [MenuID]) VALUES (593, 1, N'6')
INSERT [dbo].[Users_Menu] ([ID], [UserID], [MenuID]) VALUES (594, 1, N'7')
INSERT [dbo].[Users_Menu] ([ID], [UserID], [MenuID]) VALUES (595, 1, N'8')
INSERT [dbo].[Users_Menu] ([ID], [UserID], [MenuID]) VALUES (596, 1, N'9')
INSERT [dbo].[Users_Menu] ([ID], [UserID], [MenuID]) VALUES (597, 1, N'10')
INSERT [dbo].[Users_Menu] ([ID], [UserID], [MenuID]) VALUES (598, 1, N'11')
INSERT [dbo].[Users_Menu] ([ID], [UserID], [MenuID]) VALUES (611, 5, N'0')
INSERT [dbo].[Users_Menu] ([ID], [UserID], [MenuID]) VALUES (612, 5, N'1')
INSERT [dbo].[Users_Menu] ([ID], [UserID], [MenuID]) VALUES (613, 5, N'2')
INSERT [dbo].[Users_Menu] ([ID], [UserID], [MenuID]) VALUES (614, 5, N'3')
INSERT [dbo].[Users_Menu] ([ID], [UserID], [MenuID]) VALUES (615, 5, N'4')
INSERT [dbo].[Users_Menu] ([ID], [UserID], [MenuID]) VALUES (616, 5, N'5')
INSERT [dbo].[Users_Menu] ([ID], [UserID], [MenuID]) VALUES (617, 5, N'6')
INSERT [dbo].[Users_Menu] ([ID], [UserID], [MenuID]) VALUES (618, 5, N'7')
INSERT [dbo].[Users_Menu] ([ID], [UserID], [MenuID]) VALUES (619, 5, N'8')
INSERT [dbo].[Users_Menu] ([ID], [UserID], [MenuID]) VALUES (620, 5, N'9')
INSERT [dbo].[Users_Menu] ([ID], [UserID], [MenuID]) VALUES (621, 5, N'10')
INSERT [dbo].[Users_Menu] ([ID], [UserID], [MenuID]) VALUES (622, 5, N'11')
INSERT [dbo].[Users_Menu] ([ID], [UserID], [MenuID]) VALUES (623, 60, N'0')
INSERT [dbo].[Users_Menu] ([ID], [UserID], [MenuID]) VALUES (624, 60, N'2')
INSERT [dbo].[Users_Menu] ([ID], [UserID], [MenuID]) VALUES (625, 60, N'3')
INSERT [dbo].[Users_Menu] ([ID], [UserID], [MenuID]) VALUES (626, 60, N'4')
INSERT [dbo].[Users_Menu] ([ID], [UserID], [MenuID]) VALUES (627, 60, N'5')
INSERT [dbo].[Users_Menu] ([ID], [UserID], [MenuID]) VALUES (628, 60, N'6')
SET IDENTITY_INSERT [dbo].[Users_Menu] OFF
SET IDENTITY_INSERT [dbo].[Users_Stage] ON 

INSERT [dbo].[Users_Stage] ([ID], [UsersID], [StageID]) VALUES (324, 5, 1)
INSERT [dbo].[Users_Stage] ([ID], [UsersID], [StageID]) VALUES (325, 5, 2)
INSERT [dbo].[Users_Stage] ([ID], [UsersID], [StageID]) VALUES (326, 5, 3)
INSERT [dbo].[Users_Stage] ([ID], [UsersID], [StageID]) VALUES (327, 5, 4)
INSERT [dbo].[Users_Stage] ([ID], [UsersID], [StageID]) VALUES (328, 5, 5)
INSERT [dbo].[Users_Stage] ([ID], [UsersID], [StageID]) VALUES (329, 5, 6)
INSERT [dbo].[Users_Stage] ([ID], [UsersID], [StageID]) VALUES (330, 5, 7)
INSERT [dbo].[Users_Stage] ([ID], [UsersID], [StageID]) VALUES (524, 57, 1)
INSERT [dbo].[Users_Stage] ([ID], [UsersID], [StageID]) VALUES (525, 57, 2)
INSERT [dbo].[Users_Stage] ([ID], [UsersID], [StageID]) VALUES (526, 57, 3)
INSERT [dbo].[Users_Stage] ([ID], [UsersID], [StageID]) VALUES (527, 57, 4)
INSERT [dbo].[Users_Stage] ([ID], [UsersID], [StageID]) VALUES (534, 1, 1)
INSERT [dbo].[Users_Stage] ([ID], [UsersID], [StageID]) VALUES (535, 1, 2)
INSERT [dbo].[Users_Stage] ([ID], [UsersID], [StageID]) VALUES (536, 1, 3)
INSERT [dbo].[Users_Stage] ([ID], [UsersID], [StageID]) VALUES (537, 1, 4)
INSERT [dbo].[Users_Stage] ([ID], [UsersID], [StageID]) VALUES (538, 1, 5)
INSERT [dbo].[Users_Stage] ([ID], [UsersID], [StageID]) VALUES (539, 1, 6)
INSERT [dbo].[Users_Stage] ([ID], [UsersID], [StageID]) VALUES (540, 1, 7)
INSERT [dbo].[Users_Stage] ([ID], [UsersID], [StageID]) VALUES (541, 60, 3)
INSERT [dbo].[Users_Stage] ([ID], [UsersID], [StageID]) VALUES (542, 60, 4)
SET IDENTITY_INSERT [dbo].[Users_Stage] OFF
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'0 - blank, 1 - Approve' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SalesPriceDetail', @level2type=N'COLUMN',@level2name=N'Stage1Status'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'0 - blank, 1 - Approve, 2 - Reject' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SalesPriceDetail', @level2type=N'COLUMN',@level2name=N'Stage2Status'
GO

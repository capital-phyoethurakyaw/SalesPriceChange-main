USE [Qbei_Inventory]
GO
EXEC sys.sp_dropextendedproperty @name=N'MS_Description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Qbei_User', @level2type=N'COLUMN',@level2name=N'UserLevel'

GO
/****** Object:  StoredProcedure [dbo].[Time_Save]    Script Date: 12/7/2017 11:41:38 AM ******/
DROP PROCEDURE [dbo].[Time_Save]
GO
/****** Object:  StoredProcedure [dbo].[Starttime_Save]    Script Date: 12/7/2017 11:41:38 AM ******/
DROP PROCEDURE [dbo].[Starttime_Save]
GO
/****** Object:  StoredProcedure [dbo].[SelectFlag]    Script Date: 12/7/2017 11:41:38 AM ******/
DROP PROCEDURE [dbo].[SelectFlag]
GO
/****** Object:  StoredProcedure [dbo].[ResetFlag]    Script Date: 12/7/2017 11:41:38 AM ******/
DROP PROCEDURE [dbo].[ResetFlag]
GO
/****** Object:  StoredProcedure [dbo].[Qbeisetting_SelectAll]    Script Date: 12/7/2017 11:41:38 AM ******/
DROP PROCEDURE [dbo].[Qbeisetting_SelectAll]
GO
/****** Object:  StoredProcedure [dbo].[QbeiErrorLogBack_SiteIDSearch]    Script Date: 12/7/2017 11:41:38 AM ******/
DROP PROCEDURE [dbo].[QbeiErrorLogBack_SiteIDSearch]
GO
/****** Object:  StoredProcedure [dbo].[QbeiErrorLogBack_Select]    Script Date: 12/7/2017 11:41:38 AM ******/
DROP PROCEDURE [dbo].[QbeiErrorLogBack_Select]
GO
/****** Object:  StoredProcedure [dbo].[QbeiError_SiteSearch]    Script Date: 12/7/2017 11:41:38 AM ******/
DROP PROCEDURE [dbo].[QbeiError_SiteSearch]
GO
/****** Object:  StoredProcedure [dbo].[QbeiError_SiteNameSearch]    Script Date: 12/7/2017 11:41:38 AM ******/
DROP PROCEDURE [dbo].[QbeiError_SiteNameSearch]
GO
/****** Object:  StoredProcedure [dbo].[QbeiError_SiteIDSearch]    Script Date: 12/7/2017 11:41:38 AM ******/
DROP PROCEDURE [dbo].[QbeiError_SiteIDSearch]
GO
/****** Object:  StoredProcedure [dbo].[QbeiError_Search]    Script Date: 12/7/2017 11:41:38 AM ******/
DROP PROCEDURE [dbo].[QbeiError_Search]
GO
/****** Object:  StoredProcedure [dbo].[QbeiError_LogBackupSearch]    Script Date: 12/7/2017 11:41:38 AM ******/
DROP PROCEDURE [dbo].[QbeiError_LogBackupSearch]
GO
/****** Object:  StoredProcedure [dbo].[QbeiError_ErrorTypeSearch]    Script Date: 12/7/2017 11:41:38 AM ******/
DROP PROCEDURE [dbo].[QbeiError_ErrorTypeSearch]
GO
/****** Object:  StoredProcedure [dbo].[QbeiError_DateSearch]    Script Date: 12/7/2017 11:41:38 AM ******/
DROP PROCEDURE [dbo].[QbeiError_DateSearch]
GO
/****** Object:  StoredProcedure [dbo].[Qbei_UserUpdate]    Script Date: 12/7/2017 11:41:38 AM ******/
DROP PROCEDURE [dbo].[Qbei_UserUpdate]
GO
/****** Object:  StoredProcedure [dbo].[Qbei_UserSelectAll]    Script Date: 12/7/2017 11:41:38 AM ******/
DROP PROCEDURE [dbo].[Qbei_UserSelectAll]
GO
/****** Object:  StoredProcedure [dbo].[Qbei_UserSave]    Script Date: 12/7/2017 11:41:38 AM ******/
DROP PROCEDURE [dbo].[Qbei_UserSave]
GO
/****** Object:  StoredProcedure [dbo].[Qbei_UserEdit]    Script Date: 12/7/2017 11:41:38 AM ******/
DROP PROCEDURE [dbo].[Qbei_UserEdit]
GO
/****** Object:  StoredProcedure [dbo].[Qbei_UserDelete]    Script Date: 12/7/2017 11:41:38 AM ******/
DROP PROCEDURE [dbo].[Qbei_UserDelete]
GO
/****** Object:  StoredProcedure [dbo].[Qbei_User_SelectbyUserID]    Script Date: 12/7/2017 11:41:38 AM ******/
DROP PROCEDURE [dbo].[Qbei_User_SelectbyUserID]
GO
/****** Object:  StoredProcedure [dbo].[Qbei_User_Select]    Script Date: 12/7/2017 11:41:38 AM ******/
DROP PROCEDURE [dbo].[Qbei_User_Select]
GO
/****** Object:  StoredProcedure [dbo].[Qbei_TransferData]    Script Date: 12/7/2017 11:41:38 AM ******/
DROP PROCEDURE [dbo].[Qbei_TransferData]
GO
/****** Object:  StoredProcedure [dbo].[Qbei_SiteData]    Script Date: 12/7/2017 11:41:38 AM ******/
DROP PROCEDURE [dbo].[Qbei_SiteData]
GO
/****** Object:  StoredProcedure [dbo].[Qbei_SiteCountTest]    Script Date: 12/7/2017 11:41:38 AM ******/
DROP PROCEDURE [dbo].[Qbei_SiteCountTest]
GO
/****** Object:  StoredProcedure [dbo].[Qbei_SettingUpdate]    Script Date: 12/7/2017 11:41:38 AM ******/
DROP PROCEDURE [dbo].[Qbei_SettingUpdate]
GO
/****** Object:  StoredProcedure [dbo].[Qbei_Setting_Update]    Script Date: 12/7/2017 11:41:38 AM ******/
DROP PROCEDURE [dbo].[Qbei_Setting_Update]
GO
/****** Object:  StoredProcedure [dbo].[Qbei_Setting_Select]    Script Date: 12/7/2017 11:41:38 AM ******/
DROP PROCEDURE [dbo].[Qbei_Setting_Select]
GO
/****** Object:  StoredProcedure [dbo].[Qbei_Setting_GetData]    Script Date: 12/7/2017 11:41:38 AM ******/
DROP PROCEDURE [dbo].[Qbei_Setting_GetData]
GO
/****** Object:  StoredProcedure [dbo].[Qbei_SelectForCsv]    Script Date: 12/7/2017 11:41:38 AM ******/
DROP PROCEDURE [dbo].[Qbei_SelectForCsv]
GO
/****** Object:  StoredProcedure [dbo].[Qbei_SelectEmail]    Script Date: 12/7/2017 11:41:38 AM ******/
DROP PROCEDURE [dbo].[Qbei_SelectEmail]
GO
/****** Object:  StoredProcedure [dbo].[Qbei_InsertXml]    Script Date: 12/7/2017 11:41:38 AM ******/
DROP PROCEDURE [dbo].[Qbei_InsertXml]
GO
/****** Object:  StoredProcedure [dbo].[Qbei_Insert_Xml_35]    Script Date: 12/7/2017 11:41:38 AM ******/
DROP PROCEDURE [dbo].[Qbei_Insert_Xml_35]
GO
/****** Object:  StoredProcedure [dbo].[Qbei_Insert_Xml_036]    Script Date: 12/7/2017 11:41:38 AM ******/
DROP PROCEDURE [dbo].[Qbei_Insert_Xml_036]
GO
/****** Object:  StoredProcedure [dbo].[Qbei_Insert_Xml_035]    Script Date: 12/7/2017 11:41:38 AM ******/
DROP PROCEDURE [dbo].[Qbei_Insert_Xml_035]
GO
/****** Object:  StoredProcedure [dbo].[Qbei_Insert_Xml_015]    Script Date: 12/7/2017 11:41:38 AM ******/
DROP PROCEDURE [dbo].[Qbei_Insert_Xml_015]
GO
/****** Object:  StoredProcedure [dbo].[Qbei_Insert_Xml]    Script Date: 12/7/2017 11:41:38 AM ******/
DROP PROCEDURE [dbo].[Qbei_Insert_Xml]
GO
/****** Object:  StoredProcedure [dbo].[Qbei_Insert]    Script Date: 12/7/2017 11:41:38 AM ******/
DROP PROCEDURE [dbo].[Qbei_Insert]
GO
/****** Object:  StoredProcedure [dbo].[Qbei_FindSiteName]    Script Date: 12/7/2017 11:41:38 AM ******/
DROP PROCEDURE [dbo].[Qbei_FindSiteName]
GO
/****** Object:  StoredProcedure [dbo].[Qbei_FindError]    Script Date: 12/7/2017 11:41:38 AM ******/
DROP PROCEDURE [dbo].[Qbei_FindError]
GO
/****** Object:  StoredProcedure [dbo].[Qbei_ErrorLog_InsertXml]    Script Date: 12/7/2017 11:41:38 AM ******/
DROP PROCEDURE [dbo].[Qbei_ErrorLog_InsertXml]
GO
/****** Object:  StoredProcedure [dbo].[Qbei_ErrorListSelect]    Script Date: 12/7/2017 11:41:38 AM ******/
DROP PROCEDURE [dbo].[Qbei_ErrorListSelect]
GO
/****** Object:  StoredProcedure [dbo].[Qbei_ErrorInsert]    Script Date: 12/7/2017 11:41:38 AM ******/
DROP PROCEDURE [dbo].[Qbei_ErrorInsert]
GO
/****** Object:  StoredProcedure [dbo].[Qbei_ErrorDetailCount]    Script Date: 12/7/2017 11:41:38 AM ******/
DROP PROCEDURE [dbo].[Qbei_ErrorDetailCount]
GO
/****** Object:  StoredProcedure [dbo].[Qbei_ErrorCount]    Script Date: 12/7/2017 11:41:38 AM ******/
DROP PROCEDURE [dbo].[Qbei_ErrorCount]
GO
/****** Object:  StoredProcedure [dbo].[Qbei_DeleteSiteData]    Script Date: 12/7/2017 11:41:38 AM ******/
DROP PROCEDURE [dbo].[Qbei_DeleteSiteData]
GO
/****** Object:  StoredProcedure [dbo].[Qbei_DeleteErrorLog]    Script Date: 12/7/2017 11:41:38 AM ******/
DROP PROCEDURE [dbo].[Qbei_DeleteErrorLog]
GO
/****** Object:  StoredProcedure [dbo].[Qbei_Delete]    Script Date: 12/7/2017 11:41:38 AM ******/
DROP PROCEDURE [dbo].[Qbei_Delete]
GO
/****** Object:  StoredProcedure [dbo].[Qbei_CountGet]    Script Date: 12/7/2017 11:41:38 AM ******/
DROP PROCEDURE [dbo].[Qbei_CountGet]
GO
/****** Object:  StoredProcedure [dbo].[Qbei_BackUp_Insert]    Script Date: 12/7/2017 11:41:38 AM ******/
DROP PROCEDURE [dbo].[Qbei_BackUp_Insert]
GO
/****** Object:  StoredProcedure [dbo].[get_Date]    Script Date: 12/7/2017 11:41:38 AM ******/
DROP PROCEDURE [dbo].[get_Date]
GO
/****** Object:  StoredProcedure [dbo].[ErrorSiteList]    Script Date: 12/7/2017 11:41:38 AM ******/
DROP PROCEDURE [dbo].[ErrorSiteList]
GO
/****** Object:  StoredProcedure [dbo].[EndTime_Save]    Script Date: 12/7/2017 11:41:38 AM ******/
DROP PROCEDURE [dbo].[EndTime_Save]
GO
/****** Object:  StoredProcedure [dbo].[DeleteData]    Script Date: 12/7/2017 11:41:38 AM ******/
DROP PROCEDURE [dbo].[DeleteData]
GO
/****** Object:  StoredProcedure [dbo].[Console_FlagChange]    Script Date: 12/7/2017 11:41:38 AM ******/
DROP PROCEDURE [dbo].[Console_FlagChange]
GO
/****** Object:  StoredProcedure [dbo].[Console_Check]    Script Date: 12/7/2017 11:41:38 AM ******/
DROP PROCEDURE [dbo].[Console_Check]
GO
/****** Object:  Table [dbo].[tempItem]    Script Date: 12/7/2017 11:41:38 AM ******/
DROP TABLE [dbo].[tempItem]
GO
/****** Object:  Table [dbo].[tempCSV]    Script Date: 12/7/2017 11:41:38 AM ******/
DROP TABLE [dbo].[tempCSV]
GO
/****** Object:  Table [dbo].[Site_Setting]    Script Date: 12/7/2017 11:41:38 AM ******/
DROP TABLE [dbo].[Site_Setting]
GO
/****** Object:  Table [dbo].[site_Count]    Script Date: 12/7/2017 11:41:38 AM ******/
DROP TABLE [dbo].[site_Count]
GO
/****** Object:  Table [dbo].[Qbei_User]    Script Date: 12/7/2017 11:41:38 AM ******/
DROP TABLE [dbo].[Qbei_User]
GO
/****** Object:  Table [dbo].[Qbei_ErrorLog_BackUp]    Script Date: 12/7/2017 11:41:38 AM ******/
DROP TABLE [dbo].[Qbei_ErrorLog_BackUp]
GO
/****** Object:  Table [dbo].[Qbei_ErrorLog]    Script Date: 12/7/2017 11:41:38 AM ******/
DROP TABLE [dbo].[Qbei_ErrorLog]
GO
/****** Object:  Table [dbo].[Qbei_Backup]    Script Date: 12/7/2017 11:41:38 AM ******/
DROP TABLE [dbo].[Qbei_Backup]
GO
/****** Object:  Table [dbo].[Qbei]    Script Date: 12/7/2017 11:41:38 AM ******/
DROP TABLE [dbo].[Qbei]
GO
/****** Object:  Table [dbo].[MainCsv]    Script Date: 12/7/2017 11:41:38 AM ******/
DROP TABLE [dbo].[MainCsv]
GO
/****** Object:  Table [dbo].[ErrorType]    Script Date: 12/7/2017 11:41:38 AM ******/
DROP TABLE [dbo].[ErrorType]
GO
/****** Object:  Table [dbo].[ErrorType]    Script Date: 12/7/2017 11:41:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ErrorType](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Type] [int] NULL,
	[Description] [nvarchar](200) NULL,
 CONSTRAINT [PK_ErrorType] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MainCsv]    Script Date: 12/7/2017 11:41:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MainCsv](
	[JanCode] [nvarchar](100) NULL,
	[OrderCode] [nvarchar](100) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Qbei]    Script Date: 12/7/2017 11:41:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Qbei](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[siteID] [int] NULL,
	[jancode] [nvarchar](20) NULL,
	[orderCode] [nvarchar](50) NULL,
	[quantity] [nvarchar](50) NULL,
	[stockDate] [nvarchar](50) NULL,
	[price] [nvarchar](50) NULL,
	[purchaserURL] [nvarchar](200) NULL,
	[partNo] [nvarchar](50) NULL,
	[makerDate] [date] NULL,
	[reflectDate] [date] NULL,
	[Updated_Date] [datetime] NULL,
	[sitecode] [varchar](5) NULL,
 CONSTRAINT [PK_maruiltd] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Qbei_Backup]    Script Date: 12/7/2017 11:41:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Qbei_Backup](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[siteID] [int] NULL,
	[sitename] [nvarchar](200) NULL,
	[jancode] [nvarchar](20) NULL,
	[quantity] [nvarchar](50) NULL,
	[stockDate] [nvarchar](50) NULL,
	[partNo] [nvarchar](50) NULL,
	[makerDate] [date] NULL,
	[reflectDate] [date] NULL,
	[Updated_Date] [datetime] NULL,
	[sitecode] [varchar](5) NULL,
 CONSTRAINT [PK_Qbei_BackupID] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Qbei_ErrorLog]    Script Date: 12/7/2017 11:41:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Qbei_ErrorLog](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[SiteID] [int] NULL,
	[sitename] [nvarchar](200) NULL,
	[JanCode] [nvarchar](20) NULL,
	[OrderCode] [nvarchar](100) NULL,
	[ErrorType] [int] NULL,
	[Description] [nvarchar](200) NULL,
	[Date] [date] NULL,
	[SiteCode] [varchar](5) NULL,
 CONSTRAINT [PK_Qbei_ErrorLog] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Qbei_ErrorLog_BackUp]    Script Date: 12/7/2017 11:41:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Qbei_ErrorLog_BackUp](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[SiteID] [int] NULL,
	[SiteName] [nvarchar](200) NULL,
	[JanCode] [nvarchar](20) NULL,
	[OrderCode] [nvarchar](100) NULL,
	[ErrorType] [int] NULL,
	[Description] [nvarchar](200) NULL,
	[Date] [date] NULL,
	[SiteCode] [varchar](5) NULL,
 CONSTRAINT [PK_Qbei_ErrorLog_BackUp] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Qbei_User]    Script Date: 12/7/2017 11:41:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Qbei_User](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [nvarchar](20) NULL,
	[Password] [nvarchar](30) NULL,
	[UserLevel] [int] NULL,
 CONSTRAINT [PK_Qbei_User] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[site_Count]    Script Date: 12/7/2017 11:41:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[site_Count](
	[ID] [int] NULL,
	[siteID] [nvarchar](50) NULL,
	[siteCount] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Site_Setting]    Script Date: 12/7/2017 11:41:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Site_Setting](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[SiteName] [nvarchar](50) NULL,
	[SiteID] [varchar](5) NULL,
	[UserName] [nvarchar](50) NULL,
	[Password] [nvarchar](100) NULL,
	[Url] [nvarchar](100) NULL,
	[SiteCode] [varchar](5) NULL,
	[FlagIsFinished] [smallint] NULL,
	[TotalCount] [int] NULL,
	[Start_time] [datetime] NULL,
	[End_time] [datetime] NULL,
 CONSTRAINT [PK_dbo.Site_Setting] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tempCSV]    Script Date: 12/7/2017 11:41:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tempCSV](
	[Csv] [nvarchar](100) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tempItem]    Script Date: 12/7/2017 11:41:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tempItem](
	[Item] [nvarchar](100) NULL
) ON [PRIMARY]

GO
/****** Object:  StoredProcedure [dbo].[Console_Check]    Script Date: 12/7/2017 11:41:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Console_Check]
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	IF EXISTS (SELECT * FROM Console WHERE status = 0)
		RETURN 0
	ELSE
		RETURN 1
END

GO
/****** Object:  StoredProcedure [dbo].[Console_FlagChange]    Script Date: 12/7/2017 11:41:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Console_FlagChange]
	-- Add the parameters for the stored procedure here
	@Start_time datetime,
	@End_time datetime,
	@flag AS smallint,
	@site AS int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
		UPDATE dbo.Site_Setting
		SET FlagIsFinished = @flag,Start_time=@Start_time,End_time=@End_time
		WHERE SiteID = @site
END

GO
/****** Object:  StoredProcedure [dbo].[DeleteData]    Script Date: 12/7/2017 11:41:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[DeleteData]
	-- Add the parameters for the stored procedure here
	@site int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	delete from dbo.Qbei where siteID = @site
END

GO
/****** Object:  StoredProcedure [dbo].[EndTime_Save]    Script Date: 12/7/2017 11:41:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[EndTime_Save]
	-- Add the parameters for the stored procedure here
	@End_time datetime,
	@flag AS smallint,
	@site AS int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
		UPDATE dbo.Site_Setting
		SET FlagIsFinished = @flag,End_time=@End_time
		WHERE SiteID = @site
END

GO
/****** Object:  StoredProcedure [dbo].[ErrorSiteList]    Script Date: 12/7/2017 11:41:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[ErrorSiteList] 
	-- Add the parameters for the stored procedure here
	@siteID int,
	@description nvarchar(200)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	--SET NOCOUNT ON;
    -- Insert statements for procedure here
select qe.ID,SiteID,JanCode,OrderCode,ErrorType,e.Description,Date
 from dbo.Qbei_ErrorLog qe
inner join
ErrorType e ON qe.ErrorType = e.Type where SiteID = @siteID and e.Description = @description
END

GO
/****** Object:  StoredProcedure [dbo].[get_Date]    Script Date: 12/7/2017 11:41:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[get_Date]
	-- Add the parameters for the stored procedure here


AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	--SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT max(Date) FROM Qbei_ErrorLog_BackUp

END


GO
/****** Object:  StoredProcedure [dbo].[Qbei_BackUp_Insert]    Script Date: 12/7/2017 11:41:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Qbei_BackUp_Insert]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

INSERT INTO Qbei_BackUp (makerBrand,item,itemCode,itemName,retail_price,price,date,status,site,Updated_Date,jancode, partNo,makerDate,reflectDate, stockDate)
SELECT makerBrand,item,itemCode,itemName,retail_price,price,date,status,site,Updated_Date,jancode, partNo,makerDate,reflectDate, stockDate FROM Qbei
END

GO
/****** Object:  StoredProcedure [dbo].[Qbei_CountGet]    Script Date: 12/7/2017 11:41:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Qbei_CountGet] 
	-- Add the parameters for the stored procedure here
	@siteID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
select count(*)as Count from dbo.Qbei where siteID = @siteID

select siteCount from dbo.site_Count where siteID = @siteID
END

GO
/****** Object:  StoredProcedure [dbo].[Qbei_Delete]    Script Date: 12/7/2017 11:41:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Qbei_Delete]
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

   TRUNCATE table Qbei;
END

GO
/****** Object:  StoredProcedure [dbo].[Qbei_DeleteErrorLog]    Script Date: 12/7/2017 11:41:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Qbei_DeleteErrorLog]
	@site int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO Qbei_ErrorLog_BackUp(SiteID,SiteName,SiteCode, JanCode,OrderCode, ErrorType, Description, Date)
    SELECT SiteID,SiteName,SiteCode,JanCode,OrderCode, ErrorType, Description, Date from Qbei_ErrorLog where SiteID = @site
    
    -- Insert statements for procedure here
	DELETE FROM Qbei_ErrorLog WHERE SiteID=@site
	Delete from Qbei_ErrorLog_BackUp where SiteID = @site AND Date < GETDATE()-14
END

GO
/****** Object:  StoredProcedure [dbo].[Qbei_DeleteSiteData]    Script Date: 12/7/2017 11:41:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Qbei_DeleteSiteData]
	-- Add the parameters for the stored procedure here
	@site int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	INSERT INTO Qbei_Backup(siteID, jancode,quantity , stockDate, partNo, makerDate , reflectDate,Updated_Date)
    SELECT siteID,jancode,quantity,stockDate,partNo,makerDate,reflectDate,Updated_Date from Qbei where siteID = @site
    
    -- Insert statements for procedure here
	DELETE FROM Qbei WHERE siteID = @site
	Delete from Qbei_BackUp where siteID = @site AND Updated_Date < GETDATE()-14
END

GO
/****** Object:  StoredProcedure [dbo].[Qbei_ErrorCount]    Script Date: 12/7/2017 11:41:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Qbei_ErrorCount] 
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	

    -- Insert statements for procedure here
	--select SiteID, Description ,count(Description)as ErrorCount from dbo.qbei_errorlog
 --   group by Description,SiteID,Description
    
     select DISTINCT t1.SiteID,t1.SiteName,Convert(varchar(20),t1.Date,111)as Date,t2.siteID, t2.TotalCount as TotalCount
     from 
    (Select DISTINCT SiteID,SiteName,Convert(varchar(20),Date,111)as Date
     FROM dbo.Qbei_ErrorLog) t1
     left join
    (SELECT siteID, COUNT(*) AS TotalCount FROM dbo.qbei GROUP BY siteID ) t2
     on
    t1.SiteID = t2.siteID
    

END


GO
/****** Object:  StoredProcedure [dbo].[Qbei_ErrorDetailCount]    Script Date: 12/7/2017 11:41:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Qbei_ErrorDetailCount] 
	-- Add the parameters for the stored procedure here
	@site int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	

    -- Insert statements for procedure here
	
SELECT e.Description,count(ErrorType)as Error,qe.ErrorType from dbo.qbei_errorlog qe
INNER JOIN ErrorType e ON qe.ErrorType = e.Type 
WHERE SiteID=@site
GROUP BY ErrorType,SiteID,e.Description
END

GO
/****** Object:  StoredProcedure [dbo].[Qbei_ErrorInsert]    Script Date: 12/7/2017 11:41:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE  [dbo].[Qbei_ErrorInsert]
@site	int,
@jancode	nvarchar(20),
@ordercode nvarchar(100),
@sitename nvarchar(200),
@description nvarchar(200),
@ErrorType int,
@date Date,
@sitecode varchar(5)

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	 INSERT INTO Qbei_ErrorLog(SiteID,SiteName, JanCode, OrderCode, Description,ErrorType, Date,SiteCode) 
    VALUES(@site,@sitename,@jancode,@ordercode,@description,@ErrorType,@date,@sitecode)
END

GO
/****** Object:  StoredProcedure [dbo].[Qbei_ErrorListSelect]    Script Date: 12/7/2017 11:41:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Qbei_ErrorListSelect]
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * FROM Qbei_ErrorLog
END

GO
/****** Object:  StoredProcedure [dbo].[Qbei_ErrorLog_InsertXml]    Script Date: 12/7/2017 11:41:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Qbei_ErrorLog_InsertXml]
	-- Add the parameters for the stored procedure here
   @xml AS XML,
   @SiteCode varchar(5)
 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

 DECLARE @DocHandle int   
	
	EXEC sp_xml_preparedocument @DocHandle OUTPUT, @xml
	
	SELECT * INTO #temp FROM OPENXML (@DocHandle, '/NewDataSet/test',2)
  	WITH (代理店ID nvarchar(200),SiteName nvarchar(200),JANコード NVARCHAR(200))

	EXEC sp_xml_removedocument @DocHandle
	
    INSERT INTO Qbei_ErrorLog(SiteID,sitename, JanCode,OrderCode,Description,ErrorType,Date,SiteCode) 
	SELECT 代理店ID,SiteName,JANコード,'','Order Code Not Found','3',CONVERT(CHAR(23),CONVERT(DATETIME,getdate(),101),121),@SiteCode
	FROM #temp
	
END

GO
/****** Object:  StoredProcedure [dbo].[Qbei_FindError]    Script Date: 12/7/2017 11:41:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Qbei_FindError] 
	-- Add the parameters for the stored procedure here
	@errorType int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select * from dbo.ErrorType where Type=@errorType
END

GO
/****** Object:  StoredProcedure [dbo].[Qbei_FindSiteName]    Script Date: 12/7/2017 11:41:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Qbei_FindSiteName] 
	-- Add the parameters for the stored procedure here
	@SiteName  nvarchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select * from dbo.Site_Setting where ID=@SiteName
END


GO
/****** Object:  StoredProcedure [dbo].[Qbei_Insert]    Script Date: 12/7/2017 11:41:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE  [dbo].[Qbei_Insert]
@site	varchar(5),
@siteID int,
@jancode	nvarchar(20),
@orderCode  nvarchar(50),
@quantity	nvarchar(50),
@stockDate	nvarchar(50),
@price  nvarchar(50),
@purchaseURL nvarchar(200)=null,
@partNo	nvarchar(50),
@makerDate	date,
@reflectDate	date,
@Updated_Date	datetime
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
    INSERT INTO Qbei(sitecode,siteID, jancode,orderCode, quantity, stockDate,price,purchaserURL,partNo, makerDate, reflectDate, Updated_Date) 
    VALUES(@site,@siteID,@jancode,@orderCode,@quantity,@stockDate,@price,@purchaseURL,@partNo, @makerDate, @reflectDate,@Updated_Date)
END

GO
/****** Object:  StoredProcedure [dbo].[Qbei_Insert_Xml]    Script Date: 12/7/2017 11:41:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Qbei_Insert_Xml]
	-- Add the parameters for the stored procedure here
	@xmlCsv AS XML,
	@xmlItem AS XML
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	DECLARE @DocHandle int
	
	EXEC sp_xml_preparedocument @DocHandle OUTPUT, @xmlCsv
	
	SELECT * INTO #temp014 FROM OPENXML (@DocHandle, '/NewDataSet/test',2)
  	WITH (代理店ID nvarchar(200),JANコード NVARCHAR(200),在庫情報 NVARCHAR(100),入荷予定 NVARCHAR(50),発注コード NVARCHAR(50),自社品番 NVARCHAR(50),メーカー情報日 NVARCHAR(100),最終反映日 NVARCHAR(100),下代 NVARCHAR(20))

  	EXEC sp_xml_preparedocument @DocHandle OUTPUT, @xmlItem 

  	SELECT * INTO #tempItem FROM OPENXML (@DocHandle, '/NewDataSet/test',2)
  	WITH (商品コード nvarchar(200),現在庫数 NVARCHAR(100),卸価格 NVARCHAR(20))

  	EXEC sp_xml_removedocument @DocHandle
  			
    UPDATE #temp014
	SET 発注コード =replace(replace(replace(replace(replace(replace(replace(replace(replace(発注コード,N'在庫処分/empry/-',''),N'在庫処分/small/',''),N'empry/-',''),N'在庫処分/',''),N'empry/',''),N'在庫処分/empty/',''),N'在庫処分/empry/',''),N'在庫処分/inquiry/',''),N'データ登録し直すまで在庫更新しないで|','')
  	
	UPDATE #temp014
  	SET 在庫情報 = t2.現在庫数,
	下代 = t2.卸価格
  	FROM #temp014 t1
  	INNER JOIN #tempItem t2 ON t1.発注コード = t2.商品コード
  	
  	INSERT INTO Qbei_ErrorLog(SiteID,SiteName,JanCode,OrderCode,ErrorType,Description,Date,SiteCode)
	SELECT 代理店ID,N'イワイ',JANコード,発注コード,3,'OrderCode Not Found',CONVERT(CHAR(23),CONVERT(DATETIME,getdate(),101),121),'014'
	FROM #temp014
	WHERE  発注コード ='' OR 発注コード  IS  NULL
  	  	
  	INSERT INTO Qbei_ErrorLog(SiteID,SiteName,JanCode,OrderCode,ErrorType,Description,Date,SiteCode)
	SELECT 代理店ID,N'イワイ',JANコード,発注コード,3,'JanCode Not Found',CONVERT(CHAR(23),CONVERT(DATETIME,getdate(),101),121),'014'
	FROM #temp014
	WHERE JANコード NOT IN(SELECT 商品コード FROM #tempItem)
	AND 発注コード <>'' AND 発注コード  IS NOT  NULL
  	
   	UPDATE #temp014
  	SET 在庫情報 = 'small',
	入荷予定 = '2100-01-01'
  	WHERE 在庫情報 LIKE N'%○%'
  	
  	UPDATE #temp014
  	SET 在庫情報 = 'small',
	入荷予定 = '2100-01-01'
  	WHERE 在庫情報 LIKE N'%△%'
  	
  	UPDATE #temp014
  	SET 在庫情報 = 'empty',
	入荷予定 = '2100-01-01'
  	WHERE 在庫情報 LIKE N'%予%' OR 在庫情報 LIKE N'%予約%' OR 在庫情報 LIKE N'%×%'
  	
  	UPDATE #temp014
  	SET 在庫情報 = 'inquiry',
	入荷予定 = '2100-01-01'
  	WHERE 在庫情報 LIKE N'%取%' OR 在庫情報 LIKE N'%取寄%' OR 在庫情報 LIKE N'%問%'

	UPDATE #temp014
  	SET 在庫情報 = 'empty',
	入荷予定 = '2100-02-01'
  	WHERE 在庫情報 LIKE N'%終%' OR 在庫情報 LIKE N'%終了%'
  	
	INSERT INTO Qbei(siteID, jancode, quantity, stockDate,price,orderCode,purchaserURL, partNo, makerDate, reflectDate, Updated_Date,sitecode) 
	SELECT 代理店ID,JANコード,在庫情報,入荷予定,下代,発注コード,'https://edi.iwaishokai.co.jp　', 自社品番,メーカー情報日, 最終反映日, getdate(),'014' FROM #temp014
	WHERE JANコード IN(SELECT 商品コード FROM #tempItem)
	AND 発注コード <>'' AND 発注コード  IS NOT  NULL
   
  	DROP TABLE #temp014
  	DROP TABLE #tempItem

END

GO
/****** Object:  StoredProcedure [dbo].[Qbei_Insert_Xml_015]    Script Date: 12/7/2017 11:41:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Qbei_Insert_Xml_015]
	-- Add the parameters for the stored procedure here
	@xmlCsv AS XML,
	@xmlItem AS XML
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	DECLARE @DocHandle int
	
	EXEC sp_xml_preparedocument @DocHandle OUTPUT, @xmlCsv
	
	SELECT * INTO #temp015 FROM OPENXML (@DocHandle, '/NewDataSet/test',2)
  	WITH (代理店ID nvarchar(200),JANコード NVARCHAR(200),在庫情報 NVARCHAR(100),入荷予定 NVARCHAR(50),発注コード NVARCHAR(50),自社品番 NVARCHAR(50),メーカー情報日 NVARCHAR(100),最終反映日 NVARCHAR(100),下代 NVARCHAR(20))
  
  	EXEC sp_xml_preparedocument @DocHandle OUTPUT, @xmlItem 

  	SELECT * INTO #tempItem FROM OPENXML (@DocHandle, '/NewDataSet/test',2)
  	WITH (商品コード nvarchar(200),在庫数 NVARCHAR(100),単価 NVARCHAR(20),次回入荷 NVARCHAR(20))

  	EXEC sp_xml_removedocument @DocHandle
  	
  	UPDATE #temp015
	SET 発注コード = replace(replace(replace(replace(replace(replace(replace(replace(replace(replace(replace(replace(replace(replace(replace(replace(発注コード,N'在庫処分/empty/-',''),
	N'在庫処分/inquiry/-',''),N'データ登録し直すまで在庫更新しないで|',''),N'在庫処分/empry/-',''),N'在庫処分/empry/',''),N'在庫処分/empry/自動在庫更新停止/',''),
	N'在庫処分/empry/自動在庫更新停止/発注停止/',''),N'在庫処分/good/',''),N'在庫処分/small/',''),N'物流部は発注禁止/',''),N'自動在庫更新停止/-',''),
	N'自動在庫更新停止/',''),N'自動在庫更新停止/発注停止/',''),N'発注停止/',''),N'在庫処分/empty/',''),N'在庫処分/inquiry/','')

	INSERT INTO Qbei_ErrorLog(SiteID,SiteName,JanCode,OrderCode,ErrorType,Description,Date,SiteCode)
	SELECT 代理店ID,N'アキ',JANコード,発注コード,3,'Order Code Not Found',CONVERT(CHAR(23),CONVERT(DATETIME,getdate(),101),121),'015'
	FROM #temp015
	WHERE 発注コード = '' OR 発注コード IS NULL	

  	UPDATE #temp015
  	SET 在庫情報 = t2.在庫数,
  	下代 = t2.単価,
  	入荷予定 = t2.次回入荷
  	FROM #temp015 t1
  	INNER JOIN #tempItem t2 ON t1.発注コード = t2.商品コード
  	
  	UPDATE #temp015
  	SET 在庫情報 = 'good'
  	WHERE 在庫情報 LIKE N'%◎%' OR 在庫情報 LIKE N'%○%'
  	
  	UPDATE #temp015
  	SET 在庫情報 = 'small'
  	WHERE 在庫情報 LIKE N'%△%' OR 在庫情報 LIKE N'%[0-9]%'
  	
  	UPDATE #temp015
  	SET 在庫情報 = 'empty'
  	WHERE 在庫情報 LIKE N'%×%' 
  	
  	UPDATE #temp015
  	SET 入荷予定 = '2100-01-01'
  	WHERE 入荷予定 = '' OR 入荷予定 = '-' OR 入荷予定 is null
  	
  	UPDATE #temp015
  	SET 入荷予定 = '20' + replace(replace(入荷予定,'/','-'),N'上旬','-10')
  	WHERE 入荷予定 LIKE N'%上旬%'
  	
  	UPDATE #temp015
  	SET 入荷予定 = '20' + replace(replace(入荷予定,'/','-'),N'中旬','-20')
  	WHERE 入荷予定 LIKE N'%中旬%'
  	
  	UPDATE #temp015
  	SET 入荷予定 = '20' + replace(replace(入荷予定,'/','-'),N'下旬','-30')
  	WHERE 入荷予定 LIKE N'%下旬%'

	UPDATE #temp015
  	SET 入荷予定 = '2100/02/01'
  	WHERE 入荷予定 LIKE N'%在庫限り%'
  	
  	INSERT INTO Qbei(siteID, jancode, quantity, stockDate,price,orderCode,purchaserURL,partNo, makerDate, reflectDate, Updated_Date,sitecode) 
	SELECT 代理店ID,JANコード,在庫情報,入荷予定,下代,発注コード,'http://222.151.239.218/AKIWEB/USR_GYM/ORDER010.aspx?MODKB=1'+発注コード,自社品番,メーカー情報日,最終反映日,getdate(),'015' FROM #temp015
	WHERE 発注コード IN(SELECT 商品コード FROM #tempItem)
	AND 発注コード <> '' AND 発注コード  IS NOT NULL
	
	INSERT INTO Qbei_ErrorLog(SiteID,SiteName,JanCode,OrderCode,ErrorType,Description,Date,SiteCode)
	SELECT 代理店ID,N'アキ',JANコード,発注コード,2,'Item Doesn''t exists',CONVERT(CHAR(23),CONVERT(DATETIME,getdate(),101),121),'015'
	FROM #temp015
	WHERE 発注コード NOT IN(SELECT 商品コード FROM #tempItem)
	AND 発注コード <> '' AND 発注コード  IS NOT NULL
	
  	DROP TABLE #temp015
  	DROP TABLE #tempItem
  	
  	select * from Qbei_ErrorLog
  	
  
  	


END

GO
/****** Object:  StoredProcedure [dbo].[Qbei_Insert_Xml_035]    Script Date: 12/7/2017 11:41:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Qbei_Insert_Xml_035]
	-- Add the parameters for the stored procedure here
	@xmlCsv AS XML,
	@xmlItem AS XML
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	DECLARE @DocHandle int
	
	EXEC sp_xml_preparedocument @DocHandle OUTPUT, @xmlCsv
	
	SELECT * INTO #temp035 FROM OPENXML (@DocHandle, '/NewDataSet/test',2)
  	WITH (代理店ID nvarchar(200),JANコード NVARCHAR(200),在庫情報 NVARCHAR(100),入荷予定 NVARCHAR(50),発注コード NVARCHAR(50),自社品番 NVARCHAR(50),メーカー情報日 NVARCHAR(100),最終反映日 NVARCHAR(100),下代 NVARCHAR(20))
  
  	EXEC sp_xml_preparedocument @DocHandle OUTPUT, @xmlItem 

  	SELECT * INTO #tempItem FROM OPENXML (@DocHandle, '/NewDataSet/test',2)
  	WITH (商品コード nvarchar(200),JANコード NVARCHAR(100),在庫状況 NVARCHAR(100),Price NVARCHAR(20))

  	EXEC sp_xml_removedocument @DocHandle
  	
  	
  
  	
  	Update #tempItem
    SET JANコード = REPLACE(JANコード,'=','')
  	
  	Update #tempItem
    SET JANコード = REPLACE(JANコード,'"','')
  	
  	UPDATE #temp035
  	SET 在庫情報 = t2.在庫状況,
  	下代 = t2.Price,
  	入荷予定 = t2.在庫状況
    FROM #temp035 t1
  	INNER JOIN #tempItem t2 ON t1.JANコード = t2.JANコード
  	
  	UPDATE #temp035
  	SET 在庫情報 = 'good',
  	 入荷予定 = '2100-01-01'
  	WHERE 在庫情報 LIKE N'%○%'OR 在庫情報 LIKE N'%◎%'
  	
  	UPDATE #temp035
  	SET 在庫情報 = 'small',
  	入荷予定 = '2100-01-01'
  	WHERE 在庫情報 LIKE  N'%△%'OR 在庫情報 LIKE N'%数字%'
  	
  	UPDATE #temp035
  	SET 在庫情報 = 'empty',
  	入荷予定 = '2100-01-01'
  	WHERE 在庫情報 LIKE N'%完売%' OR 在庫情報 LIKE N'%入荷未定%' OR 在庫情報 LIKE N'%在庫切れ%' OR 在庫情報 LIKE N'%入荷待ち%'
  	
  	UPDATE #temp035
  	SET 在庫情報 = 'empty',
  	入荷予定 = Cast(year(getdate()) AS VARCHAR(4)) + '-' + replace(在庫情報,N'月下旬','') + '-' + '20'
  	WHERE 在庫情報 LIKE N'%下旬%' 
  	
    UPDATE #temp035
  	SET 在庫情報 = 'empty',
  	入荷予定 = Cast(year(getdate()) AS VARCHAR(4)) + '-' + replace(在庫情報,N'月上旬','') + '-' + '01'
  	WHERE 在庫情報 LIKE N'%上旬%' 
  	
  	UPDATE #temp035
  	SET 在庫情報 = 'empty',
  	入荷予定 = Cast(year(getdate()) AS VARCHAR(4)) + '-' + replace(在庫情報,N'中旬','') + '-' + '15'
  	WHERE 在庫情報 LIKE N'%中旬%' 
  	
  	UPDATE #temp035
  	SET 在庫情報 = 'small',
  	入荷予定 = '2100-01-01'
  	WHERE 在庫情報 NOT LIKE '%[^0-9]%'

  	UPDATE #temp035
	SET 発注コード =replace(replace(replace(replace(replace(発注コード,N'在庫処分/good/',''),N'在庫処分/inquiry/',''),N'在庫処分/small/',''),N'在庫処分/empry/',''),N'在庫処分/empty/','')

  	
    INSERT INTO Qbei(siteID, jancode, quantity, stockDate,price,orderCode,purchaserURL,partNo, makerDate, reflectDate, Updated_Date,sitecode) 
	SELECT 代理店ID,JANコード,在庫情報,入荷予定,下代,発注コード,'https://store.intertecinc.jp/intertec/mypage/main_page'+発注コード,自社品番,メーカー情報日,最終反映日,getdate(),'035' FROM #temp035
	WHERE  EXISTS(SELECT JANコード FROM #tempItem
	WHERE JANコード <> '' AND JANコード  IS NOT NULL)
	
	
    INSERT INTO Qbei_ErrorLog(SiteID,SiteName,JanCode,OrderCode,ErrorType,Description,Date,SiteCode)
	SELECT 代理店ID,N'インターテック(特殊)',JANコード,発注コード,2,'Item Doesn''t exists',CONVERT(CHAR(23),CONVERT(DATETIME,getdate(),101),121),'035'
	FROM #temp035
	WHERE JANコード NOT IN(SELECT JANコード FROM #tempItem)
	AND JANコード <> '' AND JANコード  IS NOT NULL	
	
	INSERT INTO Qbei_ErrorLog(SiteID,SiteName,JanCode,OrderCode,ErrorType,Description,Date,SiteCode)
	SELECT 代理店ID,N'インターテック(特殊)',JANコード,発注コード,9,'JanCode Not Found',CONVERT(CHAR(23),CONVERT(DATETIME,getdate(),101),121),'035'
	FROM #temp035
	WHERE JANコード = '' OR JANコード IS NULL	
	
  	DROP TABLE #temp035
  	DROP TABLE #tempItem
  	
END

GO
/****** Object:  StoredProcedure [dbo].[Qbei_Insert_Xml_036]    Script Date: 12/7/2017 11:41:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Qbei_Insert_Xml_036]
	-- Add the parameters for the stored procedure here
	@xmlCsv AS XML,
	@xmlItem AS XML
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	DECLARE @DocHandle int
	
	EXEC sp_xml_preparedocument @DocHandle OUTPUT, @xmlCsv
	
	SELECT * INTO #temp036 FROM OPENXML (@DocHandle, '/NewDataSet/test',2)
  	WITH (代理店ID nvarchar(200),JANコード NVARCHAR(200),発注コード NVARCHAR(200),在庫情報 NVARCHAR(100),入荷予定 NVARCHAR(50),自社品番 NVARCHAR(50),メーカー情報日 NVARCHAR(100),最終反映日 NVARCHAR(100),下代 NVARCHAR(20))

  	EXEC sp_xml_preparedocument @DocHandle OUTPUT, @xmlItem 

  	SELECT * INTO #tempItem FROM OPENXML (@DocHandle, '/NewDataSet/test',2)
  	WITH (OrderCode nvarchar(200),Qty NVARCHAR(100),Price NVARCHAR(20),StockDate NVARCHAR(100))

  	EXEC sp_xml_removedocument @DocHandle
  	
	DELETE
	FROM #temp036
	WHERE 発注コード = '' OR 発注コード IS NULL		

	UPDATE #temp036
	SET 発注コード =replace(replace(replace(replace(replace(replace(replace(replace(発注コード,N'在庫処分/empty/',''),N'在庫処分/inquiry/',''),N'データ登録し直すまで在庫更新しないで|',''),N'・ﾝ・ﾉ・・・ｪ/inquiry/',''),N'・f・[・^・o・^・ｵ・ｼ・ｷ・ﾜ・ﾅ・ﾝ・ﾉ・X・V・ｵ・ﾈ・｢・ﾅ|',''),N'・ﾝ・ﾉ・・・ｪ/empty/',''),N'・ﾝ・ﾉ・・・ｪ/empry/',''),N'在庫処分/empry/','')
					 
    INSERT INTO Qbei_ErrorLog(SiteID,sitename,JanCode,OrderCode,ErrorType,Description,Date,SiteCode)
	SELECT 代理店ID,N'PRインターナショナル',JANコード,発注コード,3,'OrderCode Not Found',CONVERT(CHAR(23),CONVERT(DATETIME,getdate(),101),121),'036'
	FROM #temp036
	WHERE 発注コード = '' OR 発注コード IS NULL			 
					 

  	UPDATE #temp036
  	SET 在庫情報 = t2.Qty,
	入荷予定 = t2.StockDate,
	下代 = t2.Price
  	FROM #temp036 t1
  	INNER JOIN #tempItem t2 ON t1.発注コード = t2.OrderCode
  	
  	INSERT INTO Qbei(siteID, jancode, quantity, stockDate,price,orderCode,purchaserURL, partNo, makerDate, reflectDate, Updated_Date,sitecode) 
	SELECT 代理店ID,JANコード,在庫情報,入荷予定,下代,発注コード,'http://www.g-style.ne.jp/shop/stock.php?brand_id=21', 自社品番,CONVERT(char(10), GetDate(),126),最終反映日, CONVERT(CHAR(23),CONVERT(DATETIME,getdate(),101),121),'036' FROM #temp036
	WHERE 発注コード IN(SELECT OrderCode FROM #tempItem)
	AND 発注コード <> '' AND 発注コード  IS NOT NULL

	INSERT INTO Qbei_ErrorLog(SiteID,sitename,JanCode,OrderCode,ErrorType,Description,Date,SiteCode)
	SELECT 代理店ID,N'PRインターナショナル',JANコード,発注コード,2,'Item Doesn''t exists',CONVERT(CHAR(23),CONVERT(DATETIME,getdate(),101),121),'036'
	FROM #temp036
	WHERE 発注コード NOT IN(SELECT OrderCode FROM #tempItem)
	AND 発注コード <> '' AND 発注コード  IS NOT NULL
	
  	DROP TABLE #temp036
  	DROP TABLE #tempItem
END

GO
/****** Object:  StoredProcedure [dbo].[Qbei_Insert_Xml_35]    Script Date: 12/7/2017 11:41:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Qbei_Insert_Xml_35]
	-- Add the parameters for the stored procedure here
	@xmlCsv AS XML,
	@xmlItem AS XML
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	DECLARE @DocHandle int
	
	EXEC sp_xml_preparedocument @DocHandle OUTPUT, @xmlCsv
	
	SELECT * INTO #temp035 FROM OPENXML (@DocHandle, '/NewDataSet/test',2)
  	WITH (代理店ID nvarchar(200),JANコード NVARCHAR(200),在庫情報 NVARCHAR(100),入荷予定 NVARCHAR(50),発注コード NVARCHAR(50),自社品番 NVARCHAR(50),メーカー情報日 NVARCHAR(100),最終反映日 NVARCHAR(100),下代 NVARCHAR(20))

  	EXEC sp_xml_preparedocument @DocHandle OUTPUT, @xmlItem 

  	SELECT * INTO #tempItem FROM OPENXML (@DocHandle, '/NewDataSet/test',2)
  	WITH (在庫記号 nvarchar(200),次回入荷予定日付 NVARCHAR(100))

  	EXEC sp_xml_removedocument @DocHandle
  			
    UPDATE #temp035
	SET 発注コード =replace(replace(replace(replace(replace(replace(発注コード,N'在庫処分/inquiry/',''),N'在庫処分/empry/',''),N'在庫処分/good/',''),N'在庫処分/small/',''),N'在庫処分/empty/',''),N'バラ注文できない為発注禁止/','')
  	
	UPDATE #temp035
  	SET 在庫情報 = t2.在庫記号,
	入荷予定 = t2.次回入荷予定日付
  	FROM #temp035 t1
  	INNER JOIN #tempItem t2 ON t1.発注コード = t2.商品コード
  	
  	INSERT INTO Qbei_ErrorLog(SiteID,SiteName,JanCode,OrderCode,ErrorType,Description,Date,SiteCode)
	SELECT 代理店ID,N'インターテック(特殊)',JANコード,発注コード,3,'OrderCode Not Found',CONVERT(CHAR(23),CONVERT(DATETIME,getdate(),101),121),'035'
	FROM #temp035
	WHERE  発注コード ='' OR 発注コード  IS  NULL
  	  	
  	INSERT INTO Qbei_ErrorLog(SiteID,SiteName,JanCode,OrderCode,ErrorType,Description,Date,SiteCode)
	SELECT 代理店ID,N'インターテック(特殊)',JANコード,発注コード,3,'JanCode Not Found',CONVERT(CHAR(23),CONVERT(DATETIME,getdate(),101),121),'035'
	FROM #temp035
	WHERE JANコード NOT IN(SELECT 商品コード FROM #tempItem)
	AND 発注コード <>'' AND 発注コード  IS NOT  NULL
  	
   	UPDATE #temp035
  	SET 在庫情報 = 'good'
  	WHERE 在庫情報 LIKE N'%○%'
  	
  	UPDATE #temp035
  	SET 在庫情報 = 'small'
  	WHERE 在庫情報 LIKE N'%△%'
  	
  	UPDATE #temp035
  	SET 在庫情報 = 'empty'
  	WHERE 在庫情報 LIKE N'%予%' OR 在庫情報 LIKE N'%予約%' OR 在庫情報 LIKE N'%×%'
  	
  	UPDATE #temp035
  	SET 在庫情報 = 'inquiry'
  	WHERE 在庫情報 LIKE N'%取%' OR 在庫情報 LIKE N'%取寄%' OR 在庫情報 LIKE N'%問%'

	UPDATE #temp035
  	SET 在庫情報 = 'empty'
  	WHERE 在庫情報 LIKE N'%終%' OR 在庫情報 LIKE N'%終了%'

    UPDATE #temp035
  	SET 入荷予定 = Cast(year(getdate()) AS VARCHAR(4)) + '-' + replace(入荷予定,N'中旬','') + '-' + '15'
  	WHERE 入荷予定 LIKE N'%中旬%' 

    UPDATE #temp035
  	SET  入荷予定 = Cast(year(getdate()) AS VARCHAR(4)) + '-' + replace(入荷予定,N'月下旬','') + '-' + '20'
  	WHERE 入荷予定 LIKE N'%下旬%' 
  	
    UPDATE #temp035
  	SET 入荷予定 = Cast(year(getdate()) AS VARCHAR(4)) + '-' + replace(入荷予定,N'月上旬','') + '-' + '01'
  	WHERE 入荷予定 LIKE N'%上旬%' 
  	

  	
  	
	INSERT INTO Qbei(siteID, jancode, quantity, stockDate,price,orderCode,purchaserURL, partNo, makerDate, reflectDate, Updated_Date,sitecode) 
	SELECT 代理店ID,JANコード,在庫情報,入荷予定,下代,発注コード,'https://edi.iwaishokai.co.jp　', 自社品番,メーカー情報日, 最終反映日, getdate(),'035' FROM #temp035
	WHERE JANコード IN(SELECT 商品コード FROM #tempItem)
	AND 発注コード <>'' AND 発注コード  IS NOT  NULL
   
  	DROP TABLE #temp035
  	DROP TABLE #tempItem

END

GO
/****** Object:  StoredProcedure [dbo].[Qbei_InsertXml]    Script Date: 12/7/2017 11:41:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Qbei_InsertXml]
	-- Add the parameters for the stored procedure here
   @xml AS XML
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

 DECLARE @DocHandle int   
	
	EXEC sp_xml_preparedocument @DocHandle OUTPUT, @xml
	
	SELECT * INTO #temp FROM OPENXML (@DocHandle, '/NewDataSet/test',2)
  	WITH (site nvarchar(50),jancode nvarchar(20),orderCode nvarchar(50),quantity nvarchar(50),stockDate nvarchar(50),price nvarchar(50),purchaserURL nvarchar(200),partNo nvarchar(50),makerDate date,reflectDate date,Updated_Date datetime)

	EXEC sp_xml_removedocument @DocHandle
	
    INSERT INTO Qbei(site,jancode,orderCode,quantity,stockDate,price,purchaserURL,partNo,makerDate,reflectDate,Updated_Date) 
	SELECT site,jancode,orderCode,quantity,stockDate,price,purchaserURL,partNo,makerDate,reflectDate,Updated_Date
	FROM #temp
	
END

GO
/****** Object:  StoredProcedure [dbo].[Qbei_SelectEmail]    Script Date: 12/7/2017 11:41:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Qbei_SelectEmail] 

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	--SET NOCOUNT ON;

    -- Insert statements for procedure here
select COUNT(ErrorType)as Error,e.Description,siteID from Qbei_ErrorLog qe
INNER JOIN ErrorType e ON qe.ErrorType = e.Type 
group by e.Description,SiteID order by SiteID


END

GO
/****** Object:  StoredProcedure [dbo].[Qbei_SelectForCsv]    Script Date: 12/7/2017 11:41:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Qbei_SelectForCsv]
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT site AS '代理店ID', jancode AS 'JANコード',quantity AS '在庫情報', CONVERT(CHAR(10), stockDate, 120) AS '入荷予定' ,
	partNo AS '自社品番', CONVERT(CHAR(10), makerDate, 120) AS 'メーカー情報日', CONVERT(CHAR(10), reflectDate, 120) AS '最終反映日'
	FROM Qbei
END

GO
/****** Object:  StoredProcedure [dbo].[Qbei_Setting_GetData]    Script Date: 12/7/2017 11:41:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Qbei_Setting_GetData] 
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select ID,Url,SiteName,SiteID,UserName,Password,TotalCount,Start_time,Duration from dbo.Site_Setting
END

GO
/****** Object:  StoredProcedure [dbo].[Qbei_Setting_Select]    Script Date: 12/7/2017 11:41:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Qbei_Setting_Select] 
	-- Add the parameters for the stored procedure here
	@ID  int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT ID,Url,SiteID,SiteName,UserName,Password,TotalCount,Start_time,End_time FROM Site_Setting
	WHERE (@ID IS NULL OR (SiteID = @ID))
	
END
GO
/****** Object:  StoredProcedure [dbo].[Qbei_Setting_Update]    Script Date: 12/7/2017 11:41:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Qbei_Setting_Update]
	-- Add the parameters for the stored procedure here
	
	@SiteName NVARCHAR(50),
	@SiteID VARCHAR(5),
	@UserName nvarchar(50),
	@Password nvarchar(100),
	@Url nvarchar(100),
	@TotalCount int,
	@Starttime datetime,
	@Duration datetime
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
		Update Site_Setting  SET SiteID=@SiteID,SiteName=@SiteName,UserName=@UserName,Password=@Password,Url=@Url,TotalCount=@TotalCount,Start_time=@Starttime,Duration=@Duration
		where SiteID=@SiteID
END

GO
/****** Object:  StoredProcedure [dbo].[Qbei_SettingUpdate]    Script Date: 12/7/2017 11:41:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Qbei_SettingUpdate]
	-- Add the parameters for the stored procedure here
	
	@SiteName NVARCHAR(50),
	@SiteID VARCHAR(5),
	@UserName nvarchar(50),
	@Password nvarchar(100)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
		Update Site_Setting  SET SiteID=@SiteID,SiteName=@SiteName,UserName=@UserName,Password=@Password
		where SiteID=@SiteID
END

GO
/****** Object:  StoredProcedure [dbo].[Qbei_SiteCountTest]    Script Date: 12/7/2017 11:41:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Qbei_SiteCountTest] 
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	
select distinct t2.UpdateDate,t1.siteID,t1.totalcount,t2.TotalCount,CASE WHEN t1.totalcount = t2.TotalCount THEN '1' ELSE '0' END AS MyDesiredResult from
(SELECT siteID,SUM(Total) as totalcount
		FROM
		(
		SELECT siteID AS siteID,COUNT(siteID) AS Total from Qbei
		Group BY siteID
		UNION
		SELECT SiteID AS siteID,COUNT(SiteID) AS Total from Qbei_ErrorLog
		Group BY SiteID) AS Temp
		GROUP BY siteID) t1
        left join
        (Select DISTINCT SiteID,TotalCount,CAST(End_time as date)as UpdateDate
        FROM dbo.Site_Setting) t2
        on t1.siteID = t2.siteID
END


GO
/****** Object:  StoredProcedure [dbo].[Qbei_SiteData]    Script Date: 12/7/2017 11:41:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Qbei_SiteData] 
	-- Add the parameters for the stored procedure here
	@SiteID  NVARCHAR(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select * from dbo.Qbei where siteID = @SiteID
END

GO
/****** Object:  StoredProcedure [dbo].[Qbei_TransferData]    Script Date: 12/7/2017 11:41:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Qbei_TransferData]
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	TRUNCATE TABLE Qbei_BackUp
	
	INSERT INTO Qbei_BackUp( site, jancode, quantity, stockDate, partNo, makerDate, reflectDate, Updated_Date)
	SELECT site, jancode, quantity, stockDate, partNo, makerDate, reflectDate, Updated_Date FROM Qbei
	
	TRUNCATE TABLE Qbei
END

GO
/****** Object:  StoredProcedure [dbo].[Qbei_User_Select]    Script Date: 12/7/2017 11:41:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Qbei_User_Select] 
	-- Add the parameters for the stored procedure here
	@ID INT,
	@UserID NVARCHAR(20),
	@Password NVARCHAR(30),
	@UserLevel INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * FROM Qbei_User
	WHERE (@ID IS NULL OR (ID = @ID))
	AND (@UserID IS NULL OR (UserID = @UserID))
	AND (@Password IS NULL OR (Password = @Password))
	AND (@UserLevel IS NULL OR (UserLevel = @UserLevel))
END

GO
/****** Object:  StoredProcedure [dbo].[Qbei_User_SelectbyUserID]    Script Date: 12/7/2017 11:41:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Qbei_User_SelectbyUserID]
	-- Add the parameters for the stored procedure here
	@UserID NVARCHAR(20)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * FROM Qbei_User
	WHERE UserID = @UserID
	
END

GO
/****** Object:  StoredProcedure [dbo].[Qbei_UserDelete]    Script Date: 12/7/2017 11:41:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Qbei_UserDelete]
	-- Add the parameters for the stored procedure here
	@id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	DELETE FROM [Qbei_User]    WHERE id = @id
END

GO
/****** Object:  StoredProcedure [dbo].[Qbei_UserEdit]    Script Date: 12/7/2017 11:41:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Qbei_UserEdit]
	-- Add the parameters for the stored procedure here
	@id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * FROM Qbei_User WHERE ID = @id
END

GO
/****** Object:  StoredProcedure [dbo].[Qbei_UserSave]    Script Date: 12/7/2017 11:41:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Qbei_UserSave]
	-- Add the parameters for the stored procedure here
	@UserID NVARCHAR(20),
	@Password NVARCHAR(30),
	@UserLevel int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO Qbei_User (UserID ,Password ,UserLevel) 
    VALUES(@UserID ,@Password,@UserLevel  )
END

GO
/****** Object:  StoredProcedure [dbo].[Qbei_UserSelectAll]    Script Date: 12/7/2017 11:41:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Qbei_UserSelectAll] 
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * FROM Qbei_User
	
END

GO
/****** Object:  StoredProcedure [dbo].[Qbei_UserUpdate]    Script Date: 12/7/2017 11:41:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Qbei_UserUpdate]
	-- Add the parameters for the stored procedure here
	@id int,
	@UserID NVARCHAR(20),
	@Password NVARCHAR(30),
	@UserLevel int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
		UPDATE [Qbei_User]  SET UserID  = @UserID ,Password = @password ,UserLevel  = @UserLevel  

      WHERE ID = @id
END

GO
/****** Object:  StoredProcedure [dbo].[QbeiError_DateSearch]    Script Date: 12/7/2017 11:41:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[QbeiError_DateSearch]
	-- Add the parameters for the stored procedure here
	@SiteID Nvarchar (50),
	@ErrorType Nvarchar (50),
	@Date Nvarchar (50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT *  FROM [Qbei_ErrorLog] where  
	(@SiteID IS NULL OR (SiteID = @SiteID))
	AND (@ErrorType IS NULL OR (ErrorType = @ErrorType))
	AND (@Date IS NULL OR (Date = @Date))
END

GO
/****** Object:  StoredProcedure [dbo].[QbeiError_ErrorTypeSearch]    Script Date: 12/7/2017 11:41:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[QbeiError_ErrorTypeSearch]
	-- Add the parameters for the stored procedure here
	
	@SiteID Nvarchar (50),
	@ErrorType Nvarchar (50),
	@Date Nvarchar (50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT *  FROM [Qbei_ErrorLog] where  
	(@SiteID IS NULL OR (SiteID = @SiteID))
	AND (@ErrorType IS NULL OR (ErrorType = @ErrorType))
	AND (@Date IS NULL OR (Date = @Date))
END

GO
/****** Object:  StoredProcedure [dbo].[QbeiError_LogBackupSearch]    Script Date: 12/7/2017 11:41:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[QbeiError_LogBackupSearch]
	-- Add the parameters for the stored procedure here
	@SiteID Nvarchar (50),
	@ErrorType Nvarchar (50),
	@Date Nvarchar (50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT *  FROM [Qbei_ErrorLog_BackUp] where  
	(@SiteID IS NULL OR (SiteID = @SiteID))
	AND (@ErrorType IS NULL OR (ErrorType = @ErrorType))
	AND (@Date IS NULL OR (Date = @Date))
END

GO
/****** Object:  StoredProcedure [dbo].[QbeiError_Search]    Script Date: 12/7/2017 11:41:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[QbeiError_Search]
		-- Add the parameters for the stored procedure here
	@SiteName Nvarchar (50),
	@ErrorType int,
	@Date date
AS
BEGIN


       -- Insert statements for procedure here
	--SELECT s.SiteName,qe.ID,qe.SiteID,qe.JanCode,qe.OrderCode,qe.ErrorType,qe.Description,qe.Date,qe.SiteCode FROM [Qbei_ErrorLog_BackUp] qe INNER JOIN Site_Setting s ON s.SiteID=qe.SiteID
	-- where  
	--(@SiteName IS NULL OR (s.SiteName = @SiteName))
	--AND (@ErrorType IS NULL OR (ErrorType = @ErrorType))
	--AND ( @Date IS NULL OR(Date = @Date))
	
	
  SELECT s.SiteName,qe.ID,qe.SiteID,qe.JanCode,qe.OrderCode,qe.ErrorType,qe.Description,qe.Date,qe.SiteCode FROM [Qbei_ErrorLog_BackUp] qe 
  INNER JOIN Site_Setting s ON s.SiteID=qe.SiteID
  where ( s.SiteName = @SiteName) AND
   ((qe.Date = @Date) )AND
   (@ErrorType IS  NULL OR (qe.ErrorType = @ErrorType))
  
  
END
GO
/****** Object:  StoredProcedure [dbo].[QbeiError_SiteIDSearch]    Script Date: 12/7/2017 11:41:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[QbeiError_SiteIDSearch]
		-- Add the parameters for the stored procedure here
	@SiteID int,
	@ErrorType int,
	@Date date
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	--SET NOCOUNT ON;

    -- Insert statements for procedure here
		SELECT * FROM [Qbei_ErrorLog] 
	 where  
	(@SiteID IS NULL OR (SiteID = @SiteID))
	AND (@ErrorType IS NULL OR (ErrorType = @ErrorType))
	AND ( @Date IS NULL OR(Date = @Date))
END

GO
/****** Object:  StoredProcedure [dbo].[QbeiError_SiteNameSearch]    Script Date: 12/7/2017 11:41:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[QbeiError_SiteNameSearch]
	-- Add the parameters for the stored procedure here
	@SiteName Nvarchar (50),
	@ErrorType Nvarchar (50),
	@Date Nvarchar (50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	--SET NOCOUNT ON;

    -- Insert statements for procedure here
		SELECT s.SiteName,qe.ID,qe.SiteID,qe.JanCode,qe.OrderCode,qe.ErrorType,qe.Description,qe.Date,qe.SiteCode FROM [Qbei_ErrorLog_BackUp] qe INNER JOIN Site_Setting s ON s.SiteID=qe.SiteID
	 where  
	( (s.SiteName = @SiteName))
	AND ( (ErrorType = @ErrorType))
	AND ( (Date = @Date))
END

GO
/****** Object:  StoredProcedure [dbo].[QbeiError_SiteSearch]    Script Date: 12/7/2017 11:41:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[QbeiError_SiteSearch]
		-- Add the parameters for the stored procedure here
	@SiteName Nvarchar (50),
	@ErrorType int,
	@Date date
AS
BEGIN
	

	
  SELECT s.SiteName,qe.ID,qe.SiteID,qe.JanCode,qe.OrderCode,qe.ErrorType,qe.Description,qe.Date,qe.SiteCode FROM [Qbei_ErrorLog_BackUp] qe 
  INNER JOIN Site_Setting s ON s.SiteID=qe.SiteID
  where ( s.SiteName = @SiteName) AND
   --(@Date IS NULL OR (qe.Date = @Date) )AND
   (@ErrorType IS  NULL OR (qe.ErrorType = @ErrorType))
  
  

	
END
GO
/****** Object:  StoredProcedure [dbo].[QbeiErrorLogBack_Select]    Script Date: 12/7/2017 11:41:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[QbeiErrorLogBack_Select]
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * FROM Qbei_ErrorLog_Backup
END
GO
/****** Object:  StoredProcedure [dbo].[QbeiErrorLogBack_SiteIDSearch]    Script Date: 12/7/2017 11:41:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[QbeiErrorLogBack_SiteIDSearch]
	-- Add the parameters for the stored procedure here
	@SiteName Nvarchar (50),
	@ErrorType Nvarchar (50),
	@Date Nvarchar (50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	--SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT *  FROM [Qbei_ErrorLog_BackUp] where  
	( @SiteName IS NULL OR (SiteName=@SiteName))
	AND (@ErrorType IS NULL OR(ErrorType = @ErrorType))
	AND (@Date IS NULL OR (Date = @Date))
END

GO
/****** Object:  StoredProcedure [dbo].[Qbeisetting_SelectAll]    Script Date: 12/7/2017 11:41:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Qbeisetting_SelectAll]
	-- Add the parameters for the stored procedure here
	
	@Url nvarchar(100)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT Url  From Site_Setting 
	WHERE (@Url IS NULL OR (Url = @Url))
	
END

GO
/****** Object:  StoredProcedure [dbo].[ResetFlag]    Script Date: 12/7/2017 11:41:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================

CREATE PROCEDURE [dbo].[ResetFlag] 
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	

    -- Insert statements for procedure here
	--select SiteID, Description ,count(Description)as ErrorCount from dbo.qbei_errorlog
 --   group by Description,SiteID,Description
    
    UPDATE Site_Setting
    SET FlagIsFinished=0

END
GO
/****** Object:  StoredProcedure [dbo].[SelectFlag]    Script Date: 12/7/2017 11:41:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SelectFlag]
	-- Add the parameters for the stored procedure here
	@site int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select FlagIsFinished from dbo.Site_Setting where SiteID= @site
END

GO
/****** Object:  StoredProcedure [dbo].[Starttime_Save]    Script Date: 12/7/2017 11:41:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Starttime_Save]
	-- Add the parameters for the stored procedure here
	@Start_time datetime,
	@SiteID   varchar(5)   
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	--INSERT INTO Site_Setting(Start_time ,Duration) 
    -- VALUES(@starttime ,@endtime)

      update Site_Setting set Start_time=@Start_time where siteID=@SiteID
END

GO
/****** Object:  StoredProcedure [dbo].[Time_Save]    Script Date: 12/7/2017 11:41:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Time_Save]
	-- Add the parameters for the stored procedure here
	@Start_time datetime,
	@End_time  datetime,
	@SiteID   varchar(5)   
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	--INSERT INTO Site_Setting(Start_time ,Duration) 
    -- VALUES(@starttime ,@endtime)

      update Site_Setting set Start_time=@Start_time,End_time=@End_time where siteID=@SiteID
END

GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'0-Admin,1-User' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Qbei_User', @level2type=N'COLUMN',@level2name=N'UserLevel'
GO

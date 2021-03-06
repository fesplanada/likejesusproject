USE [master]
GO
/****** Object:  Database [likejesusdb]    Script Date: 10/06/2015 8:32:01 PM ******/
CREATE DATABASE [likejesusdb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'likejesusdb', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQL2012\MSSQL\DATA\likejesusdb.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'likejesusdb_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQL2012\MSSQL\DATA\likejesusdb_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [likejesusdb] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [likejesusdb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [likejesusdb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [likejesusdb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [likejesusdb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [likejesusdb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [likejesusdb] SET ARITHABORT OFF 
GO
ALTER DATABASE [likejesusdb] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [likejesusdb] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [likejesusdb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [likejesusdb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [likejesusdb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [likejesusdb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [likejesusdb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [likejesusdb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [likejesusdb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [likejesusdb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [likejesusdb] SET  DISABLE_BROKER 
GO
ALTER DATABASE [likejesusdb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [likejesusdb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [likejesusdb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [likejesusdb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [likejesusdb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [likejesusdb] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [likejesusdb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [likejesusdb] SET RECOVERY FULL 
GO
ALTER DATABASE [likejesusdb] SET  MULTI_USER 
GO
ALTER DATABASE [likejesusdb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [likejesusdb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [likejesusdb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [likejesusdb] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'likejesusdb', N'ON'
GO
USE [likejesusdb]
GO
/****** Object:  Table [dbo].[BooksContent]    Script Date: 10/06/2015 8:32:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BooksContent](
	[BooksContentId] [int] IDENTITY(1,1) NOT NULL,
	[Book] [nvarchar](100) NULL,
	[UserId] [int] NULL,
	[ContributorId] [int] NULL,
 CONSTRAINT [PK_BooksContent] PRIMARY KEY CLUSTERED 
(
	[BooksContentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ContentType]    Script Date: 10/06/2015 8:32:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ContentType](
	[ContentTypeId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](20) NULL,
 CONSTRAINT [PK_ContentType] PRIMARY KEY CLUSTERED 
(
	[ContentTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Contributor]    Script Date: 10/06/2015 8:32:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contributor](
	[ContributorId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NULL,
	[LastContributionDate] [datetime] NULL,
 CONSTRAINT [PK_Contributor] PRIMARY KEY CLUSTERED 
(
	[ContributorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PrayerRequest]    Script Date: 10/06/2015 8:32:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PrayerRequest](
	[PrayerRequestId] [int] NOT NULL,
	[UserId] [int] NULL,
	[RequestedDate] [datetime] NULL,
	[ContributorId] [int] NULL,
 CONSTRAINT [PK_PrayerRequest] PRIMARY KEY CLUSTERED 
(
	[PrayerRequestId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PrayersContent]    Script Date: 10/06/2015 8:32:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PrayersContent](
	[PrayerId] [int] IDENTITY(1,1) NOT NULL,
	[Prayer] [nvarchar](100) NULL,
	[UserId] [int] NULL,
	[ContributorId] [int] NULL,
 CONSTRAINT [PK_PrayersContent] PRIMARY KEY CLUSTERED 
(
	[PrayerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserProfile]    Script Date: 10/06/2015 8:32:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UserProfile](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](56) NOT NULL,
	[FirstName] [nvarchar](30) NULL,
	[LastName] [nvarchar](30) NULL,
	[Address] [nvarchar](50) NULL,
	[Age] [tinyint] NULL,
	[Sex] [char](10) NULL,
	[Religion] [nvarchar](30) NULL,
	[Nationality] [nvarchar](50) NULL,
	[IsApproved] [bit] NULL,
 CONSTRAINT [PK__UserProf__1788CC4C8A626CC7] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UQ__UserProf__C9F28456199E7F12] UNIQUE NONCLUSTERED 
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[webpages_Membership]    Script Date: 10/06/2015 8:32:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[webpages_Membership](
	[UserId] [int] NOT NULL,
	[CreateDate] [datetime] NULL,
	[ConfirmationToken] [nvarchar](128) NULL,
	[IsConfirmed] [bit] NULL,
	[LastPasswordFailureDate] [datetime] NULL,
	[PasswordFailuresSinceLastSuccess] [int] NOT NULL,
	[Password] [nvarchar](128) NOT NULL,
	[PasswordChangedDate] [datetime] NULL,
	[PasswordSalt] [nvarchar](128) NOT NULL,
	[PasswordVerificationToken] [nvarchar](128) NULL,
	[PasswordVerificationTokenExpirationDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[webpages_OAuthMembership]    Script Date: 10/06/2015 8:32:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[webpages_OAuthMembership](
	[Provider] [nvarchar](30) NOT NULL,
	[ProviderUserId] [nvarchar](100) NOT NULL,
	[UserId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Provider] ASC,
	[ProviderUserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[webpages_Roles]    Script Date: 10/06/2015 8:32:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[webpages_Roles](
	[RoleId] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](256) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[RoleName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[webpages_UsersInRoles]    Script Date: 10/06/2015 8:32:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[webpages_UsersInRoles](
	[UserId] [int] NOT NULL,
	[RoleId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[webpages_Membership] ADD  DEFAULT ((0)) FOR [IsConfirmed]
GO
ALTER TABLE [dbo].[webpages_Membership] ADD  DEFAULT ((0)) FOR [PasswordFailuresSinceLastSuccess]
GO
ALTER TABLE [dbo].[BooksContent]  WITH CHECK ADD  CONSTRAINT [FK_BooksContent_Contributor] FOREIGN KEY([ContributorId])
REFERENCES [dbo].[Contributor] ([ContributorId])
GO
ALTER TABLE [dbo].[BooksContent] CHECK CONSTRAINT [FK_BooksContent_Contributor]
GO
ALTER TABLE [dbo].[BooksContent]  WITH CHECK ADD  CONSTRAINT [FK_BooksContent_UserProfile] FOREIGN KEY([UserId])
REFERENCES [dbo].[UserProfile] ([UserId])
GO
ALTER TABLE [dbo].[BooksContent] CHECK CONSTRAINT [FK_BooksContent_UserProfile]
GO
ALTER TABLE [dbo].[Contributor]  WITH CHECK ADD  CONSTRAINT [FK_Contributor_UserProfile] FOREIGN KEY([UserId])
REFERENCES [dbo].[UserProfile] ([UserId])
GO
ALTER TABLE [dbo].[Contributor] CHECK CONSTRAINT [FK_Contributor_UserProfile]
GO
ALTER TABLE [dbo].[PrayerRequest]  WITH CHECK ADD  CONSTRAINT [FK_PrayerRequest_Contributor] FOREIGN KEY([ContributorId])
REFERENCES [dbo].[Contributor] ([ContributorId])
GO
ALTER TABLE [dbo].[PrayerRequest] CHECK CONSTRAINT [FK_PrayerRequest_Contributor]
GO
ALTER TABLE [dbo].[PrayerRequest]  WITH CHECK ADD  CONSTRAINT [FK_PrayerRequest_UserProfile] FOREIGN KEY([UserId])
REFERENCES [dbo].[UserProfile] ([UserId])
GO
ALTER TABLE [dbo].[PrayerRequest] CHECK CONSTRAINT [FK_PrayerRequest_UserProfile]
GO
ALTER TABLE [dbo].[PrayersContent]  WITH CHECK ADD  CONSTRAINT [FK_PrayersContent_Contributor] FOREIGN KEY([ContributorId])
REFERENCES [dbo].[Contributor] ([ContributorId])
GO
ALTER TABLE [dbo].[PrayersContent] CHECK CONSTRAINT [FK_PrayersContent_Contributor]
GO
ALTER TABLE [dbo].[PrayersContent]  WITH CHECK ADD  CONSTRAINT [FK_PrayersContent_UserProfile] FOREIGN KEY([UserId])
REFERENCES [dbo].[UserProfile] ([UserId])
GO
ALTER TABLE [dbo].[PrayersContent] CHECK CONSTRAINT [FK_PrayersContent_UserProfile]
GO
ALTER TABLE [dbo].[webpages_UsersInRoles]  WITH CHECK ADD  CONSTRAINT [fk_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[webpages_Roles] ([RoleId])
GO
ALTER TABLE [dbo].[webpages_UsersInRoles] CHECK CONSTRAINT [fk_RoleId]
GO
ALTER TABLE [dbo].[webpages_UsersInRoles]  WITH CHECK ADD  CONSTRAINT [fk_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[UserProfile] ([UserId])
GO
ALTER TABLE [dbo].[webpages_UsersInRoles] CHECK CONSTRAINT [fk_UserId]
GO
USE [master]
GO
ALTER DATABASE [likejesusdb] SET  READ_WRITE 
GO

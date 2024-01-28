USE [master]
GO
/****** Object:  Database [Hunt]    Script Date: 17.12.2023 14:04:10 ******/
CREATE DATABASE [Hunt]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Hunt', FILENAME = N'C:\Users\Dvotch\Hunt.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Hunt_log', FILENAME = N'C:\Users\Dvotch\Hunt_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Hunt] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Hunt].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Hunt] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Hunt] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Hunt] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Hunt] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Hunt] SET ARITHABORT OFF 
GO
ALTER DATABASE [Hunt] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Hunt] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Hunt] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Hunt] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Hunt] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Hunt] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Hunt] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Hunt] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Hunt] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Hunt] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Hunt] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Hunt] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Hunt] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Hunt] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Hunt] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Hunt] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Hunt] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Hunt] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Hunt] SET  MULTI_USER 
GO
ALTER DATABASE [Hunt] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Hunt] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Hunt] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Hunt] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Hunt] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Hunt] SET QUERY_STORE = OFF
GO
USE [Hunt]
GO
/****** Object:  Table [dbo].[AccountingEvents]    Script Date: 17.12.2023 14:04:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AccountingEvents](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[ClientId] [int] NOT NULL,
	[HuntId] [int] NOT NULL,
	[Date] [date] NOT NULL,
 CONSTRAINT [PK_AccountingEvents] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Animal]    Script Date: 17.12.2023 14:04:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Animal](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](150) NOT NULL,
	[DifficultyId] [int] NOT NULL,
	[Image] [nvarchar](50) NULL,
 CONSTRAINT [PK_Animal] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Difficulty]    Script Date: 17.12.2023 14:04:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Difficulty](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](150) NOT NULL,
 CONSTRAINT [PK_Difficulty] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Gender]    Script Date: 17.12.2023 14:04:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Gender](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Gender] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[House]    Script Date: 17.12.2023 14:04:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[House](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](150) NOT NULL,
	[Image] [nvarchar](50) NULL,
 CONSTRAINT [PK_House] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Hunting]    Script Date: 17.12.2023 14:04:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Hunting](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[AnimalId] [int] NOT NULL,
	[HouseId] [int] NOT NULL,
	[AdminId] [int] NOT NULL,
	[Cost] [decimal](18, 0) NOT NULL,
 CONSTRAINT [PK_Hunting] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 17.12.2023 14:04:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 17.12.2023 14:04:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Surname] [nvarchar](50) NOT NULL,
	[Patronymic] [nvarchar](50) NULL,
	[Birthday] [date] NOT NULL,
	[RoleId] [int] NOT NULL,
	[GenderId] [int] NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[Login] [nvarchar](50) NOT NULL,
	[Experience] [int] NULL,
	[Image] [nvarchar](50) NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AccountingEvents]  WITH CHECK ADD  CONSTRAINT [FK_AccountingEvents_Hunting] FOREIGN KEY([HuntId])
REFERENCES [dbo].[Hunting] ([id])
GO
ALTER TABLE [dbo].[AccountingEvents] CHECK CONSTRAINT [FK_AccountingEvents_Hunting]
GO
ALTER TABLE [dbo].[AccountingEvents]  WITH CHECK ADD  CONSTRAINT [FK_AccountingEvents_User] FOREIGN KEY([ClientId])
REFERENCES [dbo].[User] ([id])
GO
ALTER TABLE [dbo].[AccountingEvents] CHECK CONSTRAINT [FK_AccountingEvents_User]
GO
ALTER TABLE [dbo].[Animal]  WITH CHECK ADD  CONSTRAINT [FK_Animal_Difficulty] FOREIGN KEY([DifficultyId])
REFERENCES [dbo].[Difficulty] ([id])
GO
ALTER TABLE [dbo].[Animal] CHECK CONSTRAINT [FK_Animal_Difficulty]
GO
ALTER TABLE [dbo].[Hunting]  WITH CHECK ADD  CONSTRAINT [FK_Hunting_Animal] FOREIGN KEY([AnimalId])
REFERENCES [dbo].[Animal] ([id])
GO
ALTER TABLE [dbo].[Hunting] CHECK CONSTRAINT [FK_Hunting_Animal]
GO
ALTER TABLE [dbo].[Hunting]  WITH CHECK ADD  CONSTRAINT [FK_Hunting_House] FOREIGN KEY([HouseId])
REFERENCES [dbo].[House] ([id])
GO
ALTER TABLE [dbo].[Hunting] CHECK CONSTRAINT [FK_Hunting_House]
GO
ALTER TABLE [dbo].[Hunting]  WITH CHECK ADD  CONSTRAINT [FK_Hunting_User] FOREIGN KEY([AdminId])
REFERENCES [dbo].[User] ([id])
GO
ALTER TABLE [dbo].[Hunting] CHECK CONSTRAINT [FK_Hunting_User]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Gender] FOREIGN KEY([GenderId])
REFERENCES [dbo].[Gender] ([id])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Gender]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Role] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Role] ([id])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Role]
GO
USE [master]
GO
ALTER DATABASE [Hunt] SET  READ_WRITE 
GO

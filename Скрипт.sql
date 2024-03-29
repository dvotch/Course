USE [master]
GO
/****** Object:  Database [Hunt]    Script Date: 23.12.2023 11:34:48 ******/
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
/****** Object:  Table [dbo].[AccountingEvents]    Script Date: 23.12.2023 11:34:49 ******/
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
/****** Object:  Table [dbo].[Animal]    Script Date: 23.12.2023 11:34:49 ******/
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
/****** Object:  Table [dbo].[Difficulty]    Script Date: 23.12.2023 11:34:49 ******/
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
/****** Object:  Table [dbo].[Gender]    Script Date: 23.12.2023 11:34:49 ******/
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
/****** Object:  Table [dbo].[House]    Script Date: 23.12.2023 11:34:49 ******/
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
/****** Object:  Table [dbo].[Hunting]    Script Date: 23.12.2023 11:34:49 ******/
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
/****** Object:  Table [dbo].[Role]    Script Date: 23.12.2023 11:34:49 ******/
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
/****** Object:  Table [dbo].[User]    Script Date: 23.12.2023 11:34:49 ******/
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
SET IDENTITY_INSERT [dbo].[AccountingEvents] ON 

INSERT [dbo].[AccountingEvents] ([id], [ClientId], [HuntId], [Date]) VALUES (5002, 2002, 3002, CAST(N'2023-07-07' AS Date))
INSERT [dbo].[AccountingEvents] ([id], [ClientId], [HuntId], [Date]) VALUES (5003, 2005, 3003, CAST(N'2024-01-01' AS Date))
INSERT [dbo].[AccountingEvents] ([id], [ClientId], [HuntId], [Date]) VALUES (5004, 2007, 3004, CAST(N'2022-03-08' AS Date))
INSERT [dbo].[AccountingEvents] ([id], [ClientId], [HuntId], [Date]) VALUES (5005, 2002, 3005, CAST(N'2023-09-22' AS Date))
INSERT [dbo].[AccountingEvents] ([id], [ClientId], [HuntId], [Date]) VALUES (5006, 2002, 3006, CAST(N'2024-02-28' AS Date))
SET IDENTITY_INSERT [dbo].[AccountingEvents] OFF
GO
SET IDENTITY_INSERT [dbo].[Animal] ON 

INSERT [dbo].[Animal] ([id], [Name], [Description], [DifficultyId], [Image]) VALUES (7002, N'Лось', N'Род парнокопытных млекопитающих, самые крупные представители семейства оленевых.', 1, N'1.jpg')
INSERT [dbo].[Animal] ([id], [Name], [Description], [DifficultyId], [Image]) VALUES (7003, N'Косуля', N'Косу́ли или козу́ли, или ди́кие ко́зы[1] (лат. Capreolus) — род оленей, обитающих на территории Евразии.', 1, N'2.jpg')
INSERT [dbo].[Animal] ([id], [Name], [Description], [DifficultyId], [Image]) VALUES (7005, N'Кабан', N'Каба́н (лат. Sus scrofa), или вепрь, или ди́кая свинья́, — парнокопытное млекопитающее из рода кабанов семейства свиных. ', 3, N'3.jpg')
INSERT [dbo].[Animal] ([id], [Name], [Description], [DifficultyId], [Image]) VALUES (7006, N'Медведь', N'млекопитающее семейства медвежьих; один из самых крупных наземных хищников и один из самых распространённых представителей семейства медвежьих.', 5, N'4.jpg')
INSERT [dbo].[Animal] ([id], [Name], [Description], [DifficultyId], [Image]) VALUES (7007, N'Волк', N'вид хищных млекопитающих из семейства псовых (Canidae).', 4, N'5.jpg')
SET IDENTITY_INSERT [dbo].[Animal] OFF
GO
SET IDENTITY_INSERT [dbo].[Difficulty] ON 

INSERT [dbo].[Difficulty] ([id], [Name], [Description]) VALUES (1, N'Любитель', N'Это самая простая сложность, предназначенная для игроков, которые только начали игру и постепенно осваивают механику.')
INSERT [dbo].[Difficulty] ([id], [Name], [Description]) VALUES (3, N'Средняя', N'Эта сложность предназначена для среднего игрока, который хорошо знаком с механикой игры.')
INSERT [dbo].[Difficulty] ([id], [Name], [Description]) VALUES (4, N'Профессионал', N'Эта сложность предназначена для опытных игроков, которые имеют относительно прочную основу в основных механиках')
INSERT [dbo].[Difficulty] ([id], [Name], [Description]) VALUES (5, N'Кошмар', N'Эта сложность - вызов, предназначенный исключительно для игроков, которые знают механику игры изнутри, имеют большой практический опыт в охоте')
SET IDENTITY_INSERT [dbo].[Difficulty] OFF
GO
SET IDENTITY_INSERT [dbo].[Gender] ON 

INSERT [dbo].[Gender] ([id], [Name]) VALUES (1, N'мужской')
INSERT [dbo].[Gender] ([id], [Name]) VALUES (2, N'женский')
SET IDENTITY_INSERT [dbo].[Gender] OFF
GO
SET IDENTITY_INSERT [dbo].[House] ON 

INSERT [dbo].[House] ([id], [Name], [Description], [Image]) VALUES (2004, N'Коттедж
', N'
индивидуальный городской или загородный дом для круглогодичного проживания
', N'1.jpg')
INSERT [dbo].[House] ([id], [Name], [Description], [Image]) VALUES (2005, N'Вилла
', N'дом с элементами средиземноморской архитектуры.
', N'2.jpg')
INSERT [dbo].[House] ([id], [Name], [Description], [Image]) VALUES (2006, N'Усадьба', N'достаточно большой земельный участок с «хозяйским» домом, гаражом, местом для отдыха
', N'3.jpeg')
INSERT [dbo].[House] ([id], [Name], [Description], [Image]) VALUES (2007, N'Таунхаус', N'Таунхаус представляет собой комплекс малоэтажных домов (в 2-3 этажа), совмещенные друг с другом посредством общих стен.
', N'4.jpg')
INSERT [dbo].[House] ([id], [Name], [Description], [Image]) VALUES (2008, N'Вилетта
', N'Вилетта – это своеобразный «итальянский таунхаус» с колоннами, отделкой светлым камнем и т. п.
', N'5.jpg')
SET IDENTITY_INSERT [dbo].[House] OFF
GO
SET IDENTITY_INSERT [dbo].[Hunting] ON 

INSERT [dbo].[Hunting] ([id], [Name], [AnimalId], [HouseId], [AdminId], [Cost]) VALUES (3002, N'Охота на лося в начале сезона', 7002, 2004, 2004, CAST(12000 AS Decimal(18, 0)))
INSERT [dbo].[Hunting] ([id], [Name], [AnimalId], [HouseId], [AdminId], [Cost]) VALUES (3003, N'Первые косули в этом году', 7003, 2005, 2005, CAST(10000 AS Decimal(18, 0)))
INSERT [dbo].[Hunting] ([id], [Name], [AnimalId], [HouseId], [AdminId], [Cost]) VALUES (3004, N'Самый быстрый кабан в России', 7005, 2006, 2004, CAST(9999 AS Decimal(18, 0)))
INSERT [dbo].[Hunting] ([id], [Name], [AnimalId], [HouseId], [AdminId], [Cost]) VALUES (3005, N'Самый опасный зверь лесов', 7006, 2007, 2006, CAST(89999 AS Decimal(18, 0)))
INSERT [dbo].[Hunting] ([id], [Name], [AnimalId], [HouseId], [AdminId], [Cost]) VALUES (3006, N'Не тот волк, кто волк', 7007, 2008, 2004, CAST(5321 AS Decimal(18, 0)))
SET IDENTITY_INSERT [dbo].[Hunting] OFF
GO
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([id], [Name]) VALUES (1, N'Клиент')
INSERT [dbo].[Role] ([id], [Name]) VALUES (2, N'Администратор')
SET IDENTITY_INSERT [dbo].[Role] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([id], [Name], [Surname], [Patronymic], [Birthday], [RoleId], [GenderId], [Email], [Password], [Login], [Experience], [Image]) VALUES (2002, N'Петро', N'Даманьский', N'Адамович', CAST(N'2000-09-26' AS Date), 1, 1, N'asd@mail.ru', N'111', N'111', 4, N'1.jpg')
INSERT [dbo].[User] ([id], [Name], [Surname], [Patronymic], [Birthday], [RoleId], [GenderId], [Email], [Password], [Login], [Experience], [Image]) VALUES (2004, N'Алла', N'Храброва', N'Сергеевна', CAST(N'1990-02-15' AS Date), 2, 2, N'allaHrabr@gmail.com', N'222', N'222', 10, N'2.jpg')
INSERT [dbo].[User] ([id], [Name], [Surname], [Patronymic], [Birthday], [RoleId], [GenderId], [Email], [Password], [Login], [Experience], [Image]) VALUES (2005, N'Ольга', N'Томина', N'Алексеевна', CAST(N'2003-05-21' AS Date), 1, 2, N'olya@mail.ru', N'Plyd2da', N'OlyaTom', 1, N'3.jpg')
INSERT [dbo].[User] ([id], [Name], [Surname], [Patronymic], [Birthday], [RoleId], [GenderId], [Email], [Password], [Login], [Experience], [Image]) VALUES (2006, N'Ирина', N'Петрова', N'Варфоломеева', CAST(N'1997-01-08' AS Date), 2, 2, N'irina@out.su', N'Irina1', N'Irinchik', 4, N'4.jpg')
INSERT [dbo].[User] ([id], [Name], [Surname], [Patronymic], [Birthday], [RoleId], [GenderId], [Email], [Password], [Login], [Experience], [Image]) VALUES (2007, N'Олег', N'Громов', N'Андреевич', CAST(N'2001-04-18' AS Date), 1, 1, N'olega@mail.ru', N'Olegenka', N'Olegun', 14, N'5.jpg')
SET IDENTITY_INSERT [dbo].[User] OFF
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

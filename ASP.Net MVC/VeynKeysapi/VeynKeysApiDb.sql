USE [master]
GO
/****** Object:  Database [VeynKeysApiDb]    Script Date: 26.01.2024 23:13:01 ******/
CREATE DATABASE [VeynKeysApiDb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'VeynKeysApiDb', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\VeynKeysApiDb.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'VeynKeysApiDb_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\VeynKeysApiDb_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [VeynKeysApiDb] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [VeynKeysApiDb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [VeynKeysApiDb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [VeynKeysApiDb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [VeynKeysApiDb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [VeynKeysApiDb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [VeynKeysApiDb] SET ARITHABORT OFF 
GO
ALTER DATABASE [VeynKeysApiDb] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [VeynKeysApiDb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [VeynKeysApiDb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [VeynKeysApiDb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [VeynKeysApiDb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [VeynKeysApiDb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [VeynKeysApiDb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [VeynKeysApiDb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [VeynKeysApiDb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [VeynKeysApiDb] SET  ENABLE_BROKER 
GO
ALTER DATABASE [VeynKeysApiDb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [VeynKeysApiDb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [VeynKeysApiDb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [VeynKeysApiDb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [VeynKeysApiDb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [VeynKeysApiDb] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [VeynKeysApiDb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [VeynKeysApiDb] SET RECOVERY FULL 
GO
ALTER DATABASE [VeynKeysApiDb] SET  MULTI_USER 
GO
ALTER DATABASE [VeynKeysApiDb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [VeynKeysApiDb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [VeynKeysApiDb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [VeynKeysApiDb] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [VeynKeysApiDb] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [VeynKeysApiDb] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'VeynKeysApiDb', N'ON'
GO
ALTER DATABASE [VeynKeysApiDb] SET QUERY_STORE = ON
GO
ALTER DATABASE [VeynKeysApiDb] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [VeynKeysApiDb]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 26.01.2024 23:13:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CartItems]    Script Date: 26.01.2024 23:13:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CartItems](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CartId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[IsStatus] [bit] NOT NULL,
 CONSTRAINT [PK_CartItems] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Carts]    Script Date: 26.01.2024 23:13:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Carts](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
 CONSTRAINT [PK_Carts] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 26.01.2024 23:13:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 26.01.2024 23:13:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Surname] [nvarchar](max) NULL,
	[Address1] [nvarchar](max) NULL,
	[City] [nvarchar](max) NULL,
	[Street] [nvarchar](max) NULL,
	[PostCode] [nvarchar](max) NULL,
	[Phone] [nvarchar](max) NULL,
	[Email] [nvarchar](max) NULL,
	[Date] [datetime2](7) NOT NULL,
	[IsArrived] [bit] NOT NULL,
	[IsStatus] [bit] NOT NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderProduct]    Script Date: 26.01.2024 23:13:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderProduct](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
 CONSTRAINT [PK_OrderProduct] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 26.01.2024 23:13:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Price] [int] NULL,
	[Image] [nvarchar](max) NULL,
	[CategoryId] [int] NOT NULL,
	[Description] [nvarchar](max) NULL,
	[IsStatus] [bit] NOT NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 26.01.2024 23:13:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](max) NULL,
	[Password] [nvarchar](max) NULL,
	[Email] [nvarchar](max) NULL,
	[IsStatus] [bit] NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240124201210_createDb', N'6.0.25')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240124201256_create', N'6.0.25')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240124212942_StatusPropsAdded', N'6.0.25')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240124213406_CategoryFix', N'6.0.25')
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([Id], [CategoryName], [Description]) VALUES (1, N'Q Pro Series', N'Full Metal Keyboards')
INSERT [dbo].[Category] ([Id], [CategoryName], [Description]) VALUES (2, N'Q Series', N'Full Metal Keyboards')
INSERT [dbo].[Category] ([Id], [CategoryName], [Description]) VALUES (3, N'K Pro Series', N'Full Metal Keyboards')
INSERT [dbo].[Category] ([Id], [CategoryName], [Description]) VALUES (4, N'Q Max Series', N'Full Metal Keyboards')
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([Id], [Name], [Price], [Image], [CategoryId], [Description], [IsStatus]) VALUES (2, N'Q1 Max', 2200, N'https://www.keychron.com/cdn/shop/products/Keychron-K2-wireless-mechanical-keyboard-for-Mac-Windows-iOS-Gateron-switch-blue-with-type-C-RGB-white-backlight_7247ac65-e246-451e-b367-cd6c5b6411be.jpg?v=1650445595&width=900', 4, NULL, 0)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Image], [CategoryId], [Description], [IsStatus]) VALUES (3, N'Q5 Max', 3150, N'https://www.keychron.com/cdn/shop/products/Keychron-K2-wireless-mechanical-keyboard-for-Mac-Windows-iOS-Gateron-switch-blue-with-type-C-RGB-white-backlight_7247ac65-e246-451e-b367-cd6c5b6411be.jpg?v=1650445595&width=900', 4, NULL, 0)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Image], [CategoryId], [Description], [IsStatus]) VALUES (4, N'Q60 Max', 3220, N'https://www.keychron.com/cdn/shop/products/Keychron-K2-wireless-mechanical-keyboard-for-Mac-Windows-iOS-Gateron-switch-blue-with-type-C-RGB-white-backlight_7247ac65-e246-451e-b367-cd6c5b6411be.jpg?v=1650445595&width=900', 4, NULL, 0)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Image], [CategoryId], [Description], [IsStatus]) VALUES (5, N'Q65 Max', 3000, N'https://www.keychron.com/cdn/shop/products/Keychron-K2-wireless-mechanical-keyboard-for-Mac-Windows-iOS-Gateron-switch-blue-with-type-C-RGB-white-backlight_7247ac65-e246-451e-b367-cd6c5b6411be.jpg?v=1650445595&width=900', 4, NULL, 0)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Image], [CategoryId], [Description], [IsStatus]) VALUES (6, N'Q1 Pro', 3650, N'https://www.keychron.com/cdn/shop/products/Keychron-K2-wireless-mechanical-keyboard-for-Mac-Windows-iOS-Gateron-switch-blue-with-type-C-RGB-white-backlight_7247ac65-e246-451e-b367-cd6c5b6411be.jpg?v=1650445595&width=900', 1, NULL, 0)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Image], [CategoryId], [Description], [IsStatus]) VALUES (7, N'Q2 Pro', 30, N'https://www.keychron.com/cdn/shop/products/Keychron-K2-wireless-mechanical-keyboard-for-Mac-Windows-iOS-Gateron-switch-blue-with-type-C-RGB-white-backlight_7247ac65-e246-451e-b367-cd6c5b6411be.jpg?v=1650445595&width=900', 1, NULL, 0)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Image], [CategoryId], [Description], [IsStatus]) VALUES (8, N'Q3 Pro', 3780, N'https://www.keychron.com/cdn/shop/products/Keychron-K2-wireless-mechanical-keyboard-for-Mac-Windows-iOS-Gateron-switch-blue-with-type-C-RGB-white-backlight_7247ac65-e246-451e-b367-cd6c5b6411be.jpg?v=1650445595&width=900', 1, NULL, 0)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Image], [CategoryId], [Description], [IsStatus]) VALUES (9, N'Q4 Pro', 3240, N'https://www.keychron.com/cdn/shop/products/Keychron-K2-wireless-mechanical-keyboard-for-Mac-Windows-iOS-Gateron-switch-blue-with-type-C-RGB-white-backlight_7247ac65-e246-451e-b367-cd6c5b6411be.jpg?v=1650445595&width=900', 1, NULL, 0)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Image], [CategoryId], [Description], [IsStatus]) VALUES (10, N'Q5 Pro', 3250, N'https://www.keychron.com/cdn/shop/products/Keychron-K2-wireless-mechanical-keyboard-for-Mac-Windows-iOS-Gateron-switch-blue-with-type-C-RGB-white-backlight_7247ac65-e246-451e-b367-cd6c5b6411be.jpg?v=1650445595&width=900', 1, NULL, 0)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Image], [CategoryId], [Description], [IsStatus]) VALUES (11, N'Q6 Pro', 4520, N'https://www.keychron.com/cdn/shop/products/Keychron-K2-wireless-mechanical-keyboard-for-Mac-Windows-iOS-Gateron-switch-blue-with-type-C-RGB-white-backlight_7247ac65-e246-451e-b367-cd6c5b6411be.jpg?v=1650445595&width=900', 1, NULL, 0)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Image], [CategoryId], [Description], [IsStatus]) VALUES (12, N'Q8 Pro', 4510, N'https://www.keychron.com/cdn/shop/products/Keychron-K2-wireless-mechanical-keyboard-for-Mac-Windows-iOS-Gateron-switch-blue-with-type-C-RGB-white-backlight_7247ac65-e246-451e-b367-cd6c5b6411be.jpg?v=1650445595&width=900', 1, NULL, 0)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Image], [CategoryId], [Description], [IsStatus]) VALUES (13, N'Q10 Pro', 4210, N'https://www.keychron.com/cdn/shop/products/Keychron-K2-wireless-mechanical-keyboard-for-Mac-Windows-iOS-Gateron-switch-blue-with-type-C-RGB-white-backlight_7247ac65-e246-451e-b367-cd6c5b6411be.jpg?v=1650445595&width=900', 1, NULL, 0)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Image], [CategoryId], [Description], [IsStatus]) VALUES (14, N'Q13 Pro', 4320, N'https://www.keychron.com/cdn/shop/products/Keychron-K2-wireless-mechanical-keyboard-for-Mac-Windows-iOS-Gateron-switch-blue-with-type-C-RGB-white-backlight_7247ac65-e246-451e-b367-cd6c5b6411be.jpg?v=1650445595&width=900', 1, NULL, 0)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Image], [CategoryId], [Description], [IsStatus]) VALUES (15, N'Q14 Pro', 4800, N'https://www.keychron.com/cdn/shop/products/Keychron-K2-wireless-mechanical-keyboard-for-Mac-Windows-iOS-Gateron-switch-blue-with-type-C-RGB-white-backlight_7247ac65-e246-451e-b367-cd6c5b6411be.jpg?v=1650445595&width=900', 1, NULL, 0)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Image], [CategoryId], [Description], [IsStatus]) VALUES (16, N'Q1 Version 1', 2800, N'https://www.keychron.com/cdn/shop/products/Keychron-K2-wireless-mechanical-keyboard-for-Mac-Windows-iOS-Gateron-switch-blue-with-type-C-RGB-white-backlight_7247ac65-e246-451e-b367-cd6c5b6411be.jpg?v=1650445595&width=900', 2, NULL, 0)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Image], [CategoryId], [Description], [IsStatus]) VALUES (17, N'Q1 Version 2', 3200, N'https://www.keychron.com/cdn/shop/products/Keychron-K2-wireless-mechanical-keyboard-for-Mac-Windows-iOS-Gateron-switch-blue-with-type-C-RGB-white-backlight_7247ac65-e246-451e-b367-cd6c5b6411be.jpg?v=1650445595&width=900', 2, NULL, 0)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Image], [CategoryId], [Description], [IsStatus]) VALUES (18, N'Q2', 3300, N'https://www.keychron.com/cdn/shop/products/Keychron-K2-wireless-mechanical-keyboard-for-Mac-Windows-iOS-Gateron-switch-blue-with-type-C-RGB-white-backlight_7247ac65-e246-451e-b367-cd6c5b6411be.jpg?v=1650445595&width=900', 2, NULL, 0)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Image], [CategoryId], [Description], [IsStatus]) VALUES (19, N'Q3', 3420, N'https://www.keychron.com/cdn/shop/products/Keychron-K2-wireless-mechanical-keyboard-for-Mac-Windows-iOS-Gateron-switch-blue-with-type-C-RGB-white-backlight_7247ac65-e246-451e-b367-cd6c5b6411be.jpg?v=1650445595&width=900', 2, NULL, 0)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Image], [CategoryId], [Description], [IsStatus]) VALUES (20, N'Q4', 4800, N'https://www.keychron.com/cdn/shop/products/Keychron-K2-wireless-mechanical-keyboard-for-Mac-Windows-iOS-Gateron-switch-blue-with-type-C-RGB-white-backlight_7247ac65-e246-451e-b367-cd6c5b6411be.jpg?v=1650445595&width=900', 2, NULL, 0)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Image], [CategoryId], [Description], [IsStatus]) VALUES (21, N'Q5', 3800, N'https://www.keychron.com/cdn/shop/products/Keychron-K2-wireless-mechanical-keyboard-for-Mac-Windows-iOS-Gateron-switch-blue-with-type-C-RGB-white-backlight_7247ac65-e246-451e-b367-cd6c5b6411be.jpg?v=1650445595&width=900', 2, NULL, 0)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Image], [CategoryId], [Description], [IsStatus]) VALUES (22, N'Q6', 4000, N'https://www.keychron.com/cdn/shop/products/Keychron-K2-wireless-mechanical-keyboard-for-Mac-Windows-iOS-Gateron-switch-blue-with-type-C-RGB-white-backlight_7247ac65-e246-451e-b367-cd6c5b6411be.jpg?v=1650445595&width=900', 2, NULL, 0)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Image], [CategoryId], [Description], [IsStatus]) VALUES (23, N'Q7', 4200, N'https://www.keychron.com/cdn/shop/products/Keychron-K2-wireless-mechanical-keyboard-for-Mac-Windows-iOS-Gateron-switch-blue-with-type-C-RGB-white-backlight_7247ac65-e246-451e-b367-cd6c5b6411be.jpg?v=1650445595&width=900', 2, NULL, 0)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Image], [CategoryId], [Description], [IsStatus]) VALUES (24, N'Q8', 2900, N'https://www.keychron.com/cdn/shop/products/Keychron-K2-wireless-mechanical-keyboard-for-Mac-Windows-iOS-Gateron-switch-blue-with-type-C-RGB-white-backlight_7247ac65-e246-451e-b367-cd6c5b6411be.jpg?v=1650445595&width=900', 2, NULL, 0)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Image], [CategoryId], [Description], [IsStatus]) VALUES (25, N'Q9', 1800, N'https://www.keychron.com/cdn/shop/products/Keychron-K2-wireless-mechanical-keyboard-for-Mac-Windows-iOS-Gateron-switch-blue-with-type-C-RGB-white-backlight_7247ac65-e246-451e-b367-cd6c5b6411be.jpg?v=1650445595&width=900', 2, NULL, 0)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Image], [CategoryId], [Description], [IsStatus]) VALUES (26, N'Q10', 3245, N'https://www.keychron.com/cdn/shop/products/Keychron-K2-wireless-mechanical-keyboard-for-Mac-Windows-iOS-Gateron-switch-blue-with-type-C-RGB-white-backlight_7247ac65-e246-451e-b367-cd6c5b6411be.jpg?v=1650445595&width=900', 2, NULL, 0)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Image], [CategoryId], [Description], [IsStatus]) VALUES (27, N'Q11', 3445, N'https://www.keychron.com/cdn/shop/products/Keychron-K2-wireless-mechanical-keyboard-for-Mac-Windows-iOS-Gateron-switch-blue-with-type-C-RGB-white-backlight_7247ac65-e246-451e-b367-cd6c5b6411be.jpg?v=1650445595&width=900', 2, NULL, 0)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Image], [CategoryId], [Description], [IsStatus]) VALUES (28, N'Q12', 3245, N'https://www.keychron.com/cdn/shop/products/Keychron-K2-wireless-mechanical-keyboard-for-Mac-Windows-iOS-Gateron-switch-blue-with-type-C-RGB-white-backlight_7247ac65-e246-451e-b367-cd6c5b6411be.jpg?v=1650445595&width=900', 2, NULL, 0)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Image], [CategoryId], [Description], [IsStatus]) VALUES (29, N'Q0 Numpad', 1245, N'https://www.keychron.com/cdn/shop/products/Keychron-K2-wireless-mechanical-keyboard-for-Mac-Windows-iOS-Gateron-switch-blue-with-type-C-RGB-white-backlight_7247ac65-e246-451e-b367-cd6c5b6411be.jpg?v=1650445595&width=900', 2, NULL, 0)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Image], [CategoryId], [Description], [IsStatus]) VALUES (30, N'Q0 Plus', 1445, N'https://www.keychron.com/cdn/shop/products/Keychron-K2-wireless-mechanical-keyboard-for-Mac-Windows-iOS-Gateron-switch-blue-with-type-C-RGB-white-backlight_7247ac65-e246-451e-b367-cd6c5b6411be.jpg?v=1650445595&width=900', 2, NULL, 0)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Image], [CategoryId], [Description], [IsStatus]) VALUES (31, N'Q60', 3245, N'https://www.keychron.com/cdn/shop/products/Keychron-K2-wireless-mechanical-keyboard-for-Mac-Windows-iOS-Gateron-switch-blue-with-type-C-RGB-white-backlight_7247ac65-e246-451e-b367-cd6c5b6411be.jpg?v=1650445595&width=900', 2, NULL, 0)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Image], [CategoryId], [Description], [IsStatus]) VALUES (32, N'Q65', 3845, N'https://www.keychron.com/cdn/shop/products/Keychron-K2-wireless-mechanical-keyboard-for-Mac-Windows-iOS-Gateron-switch-blue-with-type-C-RGB-white-backlight_7247ac65-e246-451e-b367-cd6c5b6411be.jpg?v=1650445595&width=900', 2, NULL, 0)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Image], [CategoryId], [Description], [IsStatus]) VALUES (33, N'K1 Pro', 3825, N'https://www.keychron.com/cdn/shop/products/Keychron-K2-wireless-mechanical-keyboard-for-Mac-Windows-iOS-Gateron-switch-blue-with-type-C-RGB-white-backlight_7247ac65-e246-451e-b367-cd6c5b6411be.jpg?v=1650445595&width=900', 3, NULL, 0)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Image], [CategoryId], [Description], [IsStatus]) VALUES (34, N'K2 Pro', 3325, N'https://www.keychron.com/cdn/shop/products/Keychron-K2-wireless-mechanical-keyboard-for-Mac-Windows-iOS-Gateron-switch-blue-with-type-C-RGB-white-backlight_7247ac65-e246-451e-b367-cd6c5b6411be.jpg?v=1650445595&width=900', 3, NULL, 0)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Image], [CategoryId], [Description], [IsStatus]) VALUES (35, N'K3 Pro', 4825, N'https://www.keychron.com/cdn/shop/products/Keychron-K2-wireless-mechanical-keyboard-for-Mac-Windows-iOS-Gateron-switch-blue-with-type-C-RGB-white-backlight_7247ac65-e246-451e-b367-cd6c5b6411be.jpg?v=1650445595&width=900', 3, NULL, 0)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Image], [CategoryId], [Description], [IsStatus]) VALUES (36, N'K4 Pro', 5125, N'https://www.keychron.com/cdn/shop/products/Keychron-K2-wireless-mechanical-keyboard-for-Mac-Windows-iOS-Gateron-switch-blue-with-type-C-RGB-white-backlight_7247ac65-e246-451e-b367-cd6c5b6411be.jpg?v=1650445595&width=900', 3, NULL, 0)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Image], [CategoryId], [Description], [IsStatus]) VALUES (37, N'K5 Pro', 5825, N'https://www.keychron.com/cdn/shop/products/Keychron-K2-wireless-mechanical-keyboard-for-Mac-Windows-iOS-Gateron-switch-blue-with-type-C-RGB-white-backlight_7247ac65-e246-451e-b367-cd6c5b6411be.jpg?v=1650445595&width=900', 3, NULL, 0)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Image], [CategoryId], [Description], [IsStatus]) VALUES (38, N'K6 Pro', 3825, N'https://www.keychron.com/cdn/shop/products/Keychron-K2-wireless-mechanical-keyboard-for-Mac-Windows-iOS-Gateron-switch-blue-with-type-C-RGB-white-backlight_7247ac65-e246-451e-b367-cd6c5b6411be.jpg?v=1650445595&width=900', 3, NULL, 0)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Image], [CategoryId], [Description], [IsStatus]) VALUES (39, N'K8 Pro', 4225, N'https://www.keychron.com/cdn/shop/products/Keychron-K2-wireless-mechanical-keyboard-for-Mac-Windows-iOS-Gateron-switch-blue-with-type-C-RGB-white-backlight_7247ac65-e246-451e-b367-cd6c5b6411be.jpg?v=1650445595&width=900', 3, NULL, 0)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Image], [CategoryId], [Description], [IsStatus]) VALUES (40, N'K9 Pro', 3425, N'https://www.keychron.com/cdn/shop/products/Keychron-K2-wireless-mechanical-keyboard-for-Mac-Windows-iOS-Gateron-switch-blue-with-type-C-RGB-white-backlight_7247ac65-e246-451e-b367-cd6c5b6411be.jpg?v=1650445595&width=900', 3, NULL, 0)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Image], [CategoryId], [Description], [IsStatus]) VALUES (41, N'K10 Pro', 6825, N'https://www.keychron.com/cdn/shop/products/Keychron-K2-wireless-mechanical-keyboard-for-Mac-Windows-iOS-Gateron-switch-blue-with-type-C-RGB-white-backlight_7247ac65-e246-451e-b367-cd6c5b6411be.jpg?v=1650445595&width=900', 3, NULL, 0)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Image], [CategoryId], [Description], [IsStatus]) VALUES (42, N'K11 Pro', 4845, N'https://www.keychron.com/cdn/shop/products/Keychron-K2-wireless-mechanical-keyboard-for-Mac-Windows-iOS-Gateron-switch-blue-with-type-C-RGB-white-backlight_7247ac65-e246-451e-b367-cd6c5b6411be.jpg?v=1650445595&width=900', 3, NULL, 0)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Image], [CategoryId], [Description], [IsStatus]) VALUES (43, N'K12 Pro', 3565, N'https://www.keychron.com/cdn/shop/products/Keychron-K2-wireless-mechanical-keyboard-for-Mac-Windows-iOS-Gateron-switch-blue-with-type-C-RGB-white-backlight_7247ac65-e246-451e-b367-cd6c5b6411be.jpg?v=1650445595&width=900', 3, NULL, 0)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Image], [CategoryId], [Description], [IsStatus]) VALUES (44, N'K13 Pro', 4845, N'https://www.keychron.com/cdn/shop/products/Keychron-K2-wireless-mechanical-keyboard-for-Mac-Windows-iOS-Gateron-switch-blue-with-type-C-RGB-white-backlight_7247ac65-e246-451e-b367-cd6c5b6411be.jpg?v=1650445595&width=900', 3, NULL, 0)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Image], [CategoryId], [Description], [IsStatus]) VALUES (45, N'K14 Pro', 4825, N'https://www.keychron.com/cdn/shop/products/Keychron-K2-wireless-mechanical-keyboard-for-Mac-Windows-iOS-Gateron-switch-blue-with-type-C-RGB-white-backlight_7247ac65-e246-451e-b367-cd6c5b6411be.jpg?v=1650445595&width=900', 3, NULL, 0)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Image], [CategoryId], [Description], [IsStatus]) VALUES (46, N'K15 Pro', 4800, N'https://www.keychron.com/cdn/shop/products/Keychron-K2-wireless-mechanical-keyboard-for-Mac-Windows-iOS-Gateron-switch-blue-with-type-C-RGB-white-backlight_7247ac65-e246-451e-b367-cd6c5b6411be.jpg?v=1650445595&width=900', 3, NULL, 0)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Image], [CategoryId], [Description], [IsStatus]) VALUES (47, N'K17 Pro', 4600, N'https://www.keychron.com/cdn/shop/products/Keychron-K2-wireless-mechanical-keyboard-for-Mac-Windows-iOS-Gateron-switch-blue-with-type-C-RGB-white-backlight_7247ac65-e246-451e-b367-cd6c5b6411be.jpg?v=1650445595&width=900', 3, NULL, 0)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Image], [CategoryId], [Description], [IsStatus]) VALUES (48, N'K7 Pro', 3400, N'https://www.keychron.com/cdn/shop/products/Keychron-K2-wireless-mechanical-keyboard-for-Mac-Windows-iOS-Gateron-switch-blue-with-type-C-RGB-white-backlight_7247ac65-e246-451e-b367-cd6c5b6411be.jpg?v=1650445595&width=900', 3, NULL, 0)
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([Id], [Username], [Password], [Email], [IsStatus]) VALUES (1, N'emrullahyabasun', N'123', N'emrullah@user.com', 1)
INSERT [dbo].[User] ([Id], [Username], [Password], [Email], [IsStatus]) VALUES (2, N'erhankaya', N'123', N'erhan@user.com', 1)
SET IDENTITY_INSERT [dbo].[User] OFF
GO
/****** Object:  Index [IX_CartItems_CartId]    Script Date: 26.01.2024 23:13:01 ******/
CREATE NONCLUSTERED INDEX [IX_CartItems_CartId] ON [dbo].[CartItems]
(
	[CartId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_CartItems_ProductId]    Script Date: 26.01.2024 23:13:01 ******/
CREATE NONCLUSTERED INDEX [IX_CartItems_ProductId] ON [dbo].[CartItems]
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Carts_UserId]    Script Date: 26.01.2024 23:13:01 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Carts_UserId] ON [dbo].[Carts]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Order_UserId]    Script Date: 26.01.2024 23:13:01 ******/
CREATE NONCLUSTERED INDEX [IX_Order_UserId] ON [dbo].[Order]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_OrderProduct_OrderId]    Script Date: 26.01.2024 23:13:01 ******/
CREATE NONCLUSTERED INDEX [IX_OrderProduct_OrderId] ON [dbo].[OrderProduct]
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_OrderProduct_ProductId]    Script Date: 26.01.2024 23:13:01 ******/
CREATE NONCLUSTERED INDEX [IX_OrderProduct_ProductId] ON [dbo].[OrderProduct]
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Product_CategoryId]    Script Date: 26.01.2024 23:13:01 ******/
CREATE NONCLUSTERED INDEX [IX_Product_CategoryId] ON [dbo].[Product]
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CartItems] ADD  DEFAULT (CONVERT([bit],(0))) FOR [IsStatus]
GO
ALTER TABLE [dbo].[Order] ADD  DEFAULT (CONVERT([bit],(0))) FOR [IsArrived]
GO
ALTER TABLE [dbo].[Order] ADD  DEFAULT (CONVERT([bit],(0))) FOR [IsStatus]
GO
ALTER TABLE [dbo].[Product] ADD  DEFAULT (CONVERT([bit],(0))) FOR [IsStatus]
GO
ALTER TABLE [dbo].[User] ADD  DEFAULT (CONVERT([bit],(0))) FOR [IsStatus]
GO
ALTER TABLE [dbo].[CartItems]  WITH CHECK ADD  CONSTRAINT [FK_CartItems_Carts_CartId] FOREIGN KEY([CartId])
REFERENCES [dbo].[Carts] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CartItems] CHECK CONSTRAINT [FK_CartItems_Carts_CartId]
GO
ALTER TABLE [dbo].[CartItems]  WITH CHECK ADD  CONSTRAINT [FK_CartItems_Product_ProductId] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CartItems] CHECK CONSTRAINT [FK_CartItems_Product_ProductId]
GO
ALTER TABLE [dbo].[Carts]  WITH CHECK ADD  CONSTRAINT [FK_Carts_User_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Carts] CHECK CONSTRAINT [FK_Carts_User_UserId]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_User_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_User_UserId]
GO
ALTER TABLE [dbo].[OrderProduct]  WITH CHECK ADD  CONSTRAINT [FK_OrderProduct_Order_OrderId] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Order] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrderProduct] CHECK CONSTRAINT [FK_OrderProduct_Order_OrderId]
GO
ALTER TABLE [dbo].[OrderProduct]  WITH CHECK ADD  CONSTRAINT [FK_OrderProduct_Product_ProductId] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrderProduct] CHECK CONSTRAINT [FK_OrderProduct_Product_ProductId]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Category_CategoryId] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Category] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Category_CategoryId]
GO
USE [master]
GO
ALTER DATABASE [VeynKeysApiDb] SET  READ_WRITE 
GO

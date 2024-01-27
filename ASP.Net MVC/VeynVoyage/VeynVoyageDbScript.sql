USE [master]
GO
/****** Object:  Database [VeynVoyage]    Script Date: 26.01.2024 23:02:44 ******/
CREATE DATABASE [VeynVoyage]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'VeynVoyage', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\VeynVoyage.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'VeynVoyage_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\VeynVoyage_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [VeynVoyage] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [VeynVoyage].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [VeynVoyage] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [VeynVoyage] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [VeynVoyage] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [VeynVoyage] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [VeynVoyage] SET ARITHABORT OFF 
GO
ALTER DATABASE [VeynVoyage] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [VeynVoyage] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [VeynVoyage] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [VeynVoyage] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [VeynVoyage] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [VeynVoyage] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [VeynVoyage] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [VeynVoyage] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [VeynVoyage] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [VeynVoyage] SET  ENABLE_BROKER 
GO
ALTER DATABASE [VeynVoyage] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [VeynVoyage] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [VeynVoyage] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [VeynVoyage] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [VeynVoyage] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [VeynVoyage] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [VeynVoyage] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [VeynVoyage] SET RECOVERY FULL 
GO
ALTER DATABASE [VeynVoyage] SET  MULTI_USER 
GO
ALTER DATABASE [VeynVoyage] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [VeynVoyage] SET DB_CHAINING OFF 
GO
ALTER DATABASE [VeynVoyage] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [VeynVoyage] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [VeynVoyage] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [VeynVoyage] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'VeynVoyage', N'ON'
GO
ALTER DATABASE [VeynVoyage] SET QUERY_STORE = ON
GO
ALTER DATABASE [VeynVoyage] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [VeynVoyage]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 26.01.2024 23:02:44 ******/
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
/****** Object:  Table [dbo].[AspNetRoleClaims]    Script Date: 26.01.2024 23:02:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoleClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoleClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 26.01.2024 23:02:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](256) NULL,
	[NormalizedName] [nvarchar](256) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 26.01.2024 23:02:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 26.01.2024 23:02:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](128) NOT NULL,
	[ProviderDisplayName] [nvarchar](max) NULL,
	[UserId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 26.01.2024 23:02:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](450) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 26.01.2024 23:02:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](450) NOT NULL,
	[UserName] [nvarchar](256) NULL,
	[NormalizedUserName] [nvarchar](256) NULL,
	[Email] [nvarchar](256) NULL,
	[NormalizedEmail] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEnd] [datetimeoffset](7) NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
 CONSTRAINT [PK_AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserTokens]    Script Date: 26.01.2024 23:02:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserTokens](
	[UserId] [nvarchar](450) NOT NULL,
	[LoginProvider] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](128) NOT NULL,
	[Value] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserTokens] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[LoginProvider] ASC,
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ReservationDetails]    Script Date: 26.01.2024 23:02:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReservationDetails](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ReservationId] [int] NOT NULL,
	[RoomId] [int] NOT NULL,
 CONSTRAINT [PK_ReservationDetails] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reservations]    Script Date: 26.01.2024 23:02:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reservations](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CheckInDate] [datetime2](7) NOT NULL,
	[CheckOutDate] [datetime2](7) NOT NULL,
	[TotalPrice] [int] NOT NULL,
	[Image] [nvarchar](max) NULL,
	[IsActive] [bit] NOT NULL,
	[UserId] [nvarchar](450) NULL,
 CONSTRAINT [PK_Reservations] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rooms]    Script Date: 26.01.2024 23:02:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rooms](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Space] [int] NOT NULL,
	[Capacity] [int] NOT NULL,
	[Price] [int] NOT NULL,
	[Description] [nvarchar](max) NULL,
	[Image] [nvarchar](max) NULL,
 CONSTRAINT [PK_Rooms] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'00000000000000_CreateIdentitySchema', N'6.0.25')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240125195611_createDb', N'6.0.25')
GO
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'b78c925b-b5de-4504-8efa-c07f496a7156', N'User', N'USER', N'd1349bbe-aae9-4086-81af-0d318056bc57')
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'b9723586-ed0f-4e10-9d7f-6ba75d16b403', N'Admin', N'ADMIN', N'587df5ee-8290-4c25-a7c1-a2218e5b3aac')
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'ee914491-9426-42c0-a371-11a8c3103b35', N'edittestedit', N'EDITTESTEDIT', N'a56159ff-f0b9-44d6-9f37-176fef481e55')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'cf63c984-0ca4-4ef9-9be5-442bbdb7e1a3', N'b78c925b-b5de-4504-8efa-c07f496a7156')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'7cc7cf64-f666-4b6a-be35-34bed2b34e19', N'b9723586-ed0f-4e10-9d7f-6ba75d16b403')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'885cfb27-8014-4563-a2d6-70661644a67e', N'b9723586-ed0f-4e10-9d7f-6ba75d16b403')
GO
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'7cc7cf64-f666-4b6a-be35-34bed2b34e19', N'testuser2@test.com', N'TESTUSER2@TEST.COM', N'testuser2@test.com', N'TESTUSER2@TEST.COM', 0, N'AQAAAAEAACcQAAAAEJncA6AC6lHFojB5Q5d7nenlPT3EGtqaf8CPf1durTWfsnn5Ke4VUhOQ21KGzncRZA==', N'K3UDXZPIA4FKHWOTYHO7CQB27FIYJI5H', N'787b8248-1a95-432e-87e1-3c4ad2018325', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'885cfb27-8014-4563-a2d6-70661644a67e', N'emrullah@admin.com', N'EMRULLAH@ADMIN.COM', N'emrullah@admin.com', N'EMRULLAH@ADMIN.COM', 0, N'AQAAAAEAACcQAAAAEGiEoRwCk8U5pTIy8xr2d8s0U+Ox19rcW9DjnVE6QaCu7q/VRXXNA4ptrEIaMYo59Q==', N'GWSBLF2TGUU743ZL2AHMD7X3VTNZBYFI', N'eaca0cd6-72d6-4cf5-b75b-412d8455dcdf', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'cf63c984-0ca4-4ef9-9be5-442bbdb7e1a3', N'emrullah@user.com', N'EMRULLAH@USER.COM', N'emrullah@user.com', N'EMRULLAH@USER.COM', 0, N'AQAAAAEAACcQAAAAEBvNOAoMmQVta6/Kqr90dhiQha1hhpyV6a+Q3JZ7V8EqGA0TqUo6mCUsEkSH2s6qMA==', N'YNH7QYFB7SZ5VT275QANTAXPORFKHKNA', N'0459d6af-a560-49f8-99f1-e2dc6c0bebe6', NULL, 0, 0, NULL, 1, 0)
GO
SET IDENTITY_INSERT [dbo].[Rooms] ON 

INSERT [dbo].[Rooms] ([Id], [Name], [Space], [Capacity], [Price], [Description], [Image]) VALUES (1, N'Standart Oda', 25, 2, 400, N'Rahat ve şık standart bir oda.', N'https://img.freepik.com/free-photo/luxury-classic-modern-bedroom-suite-hotel_105762-1787.jpg?w=1800&t=st=1706219264~exp=1706219864~hmac=ed92b23c6d0f65f18460a5edea938f45316f75187fb7070ad5e337d70329f3e7')
INSERT [dbo].[Rooms] ([Id], [Name], [Space], [Capacity], [Price], [Description], [Image]) VALUES (2, N'Deluxe Oda', 35, 2, 600, N'Geniş ve lüks bir konaklama deneyimi sunan deluxe oda.', N'https://img.freepik.com/free-photo/luxury-bedroom-hotel_1150-10836.jpg?w=1800&t=st=1706219266~exp=1706219866~hmac=97ecbe6f138570342de412b6e4d2d0c30ee5e06f598a01653485d24556a508e9')
INSERT [dbo].[Rooms] ([Id], [Name], [Space], [Capacity], [Price], [Description], [Image]) VALUES (3, N'Süit Oda', 50, 2, 800, N'Ayrı yaşama alanı ile geniş ve konforlu bir süit oda.', N'https://img.freepik.com/free-photo/luxury-classic-modern-bedroom-suite-hotel_105762-1787.jpg?w=1800&t=st=1706219264~exp=1706219864~hmac=ed92b23c6d0f65f18460a5edea938f45316f75187fb7070ad5e337d70329f3e7')
INSERT [dbo].[Rooms] ([Id], [Name], [Space], [Capacity], [Price], [Description], [Image]) VALUES (4, N'Aile Odası', 40, 4, 700, N'Aileler için uygun büyük bir oda.', N'https://img.freepik.com/free-photo/interior-design-bedroom-with-modern-decoration_181624-46706.jpg?w=1800&t=st=1706219279~exp=1706219879~hmac=808a3470d88af8357819a5ca20ca8f50f64c6eabb0ca59f416f043406ce8b5f0')
INSERT [dbo].[Rooms] ([Id], [Name], [Space], [Capacity], [Price], [Description], [Image]) VALUES (5, N'Jakuzili Oda', 45, 2, 750, N'Lüks bir jakuzi içeren romantik bir oda.', N'https://img.freepik.com/free-photo/white-comfortable-pillow-blanket-bed-with-light-lamp_74190-12074.jpg?w=1800&t=st=1706219281~exp=1706219881~hmac=0f965751732d1dc4ed4cf7716f37fd9b05e8f83850ae02655bc8eb805f2cceee')
INSERT [dbo].[Rooms] ([Id], [Name], [Space], [Capacity], [Price], [Description], [Image]) VALUES (6, N'Manzara Odası', 30, 2, 550, N'Şehir manzaralı lüks bir oda.', N'https://img.freepik.com/free-photo/double-bed-with-wall-lamp_1203-22.jpg?w=1800&t=st=1706219284~exp=1706219884~hmac=6c989cce6eac92badbcfd9cff0c87dca9dfc31d20deff60d86413960519c2c1f')
INSERT [dbo].[Rooms] ([Id], [Name], [Space], [Capacity], [Price], [Description], [Image]) VALUES (7, N'Çatı Katı Süiti', 60, 2, 1000, N'Otelin en üst katında yer alan özel bir süit.', N'https://img.freepik.com/free-photo/luxury-classic-modern-bedroom-suite-hotel_105762-1787.jpg?w=1800&t=st=1706219264~exp=1706219864~hmac=ed92b23c6d0f65f18460a5edea938f45316f75187fb7070ad5e337d70329f3e7')
INSERT [dbo].[Rooms] ([Id], [Name], [Space], [Capacity], [Price], [Description], [Image]) VALUES (8, N'İş Seyahati Odası', 20, 1, 300, N'İş seyahati için ideal kompakt bir oda.', N'https://img.freepik.com/free-photo/luxury-bedroom-hotel_1150-10836.jpg?w=1800&t=st=1706219266~exp=1706219866~hmac=97ecbe6f138570342de412b6e4d2d0c30ee5e06f598a01653485d24556a508e9')
INSERT [dbo].[Rooms] ([Id], [Name], [Space], [Capacity], [Price], [Description], [Image]) VALUES (9, N'Özel Balkonlu Oda', 35, 2, 650, N'Özel bir balkon sunan oda.', N'https://img.freepik.com/free-photo/double-bed-with-wall-lamp_1203-22.jpg?w=1800&t=st=1706219284~exp=1706219884~hmac=6c989cce6eac92badbcfd9cff0c87dca9dfc31d20deff60d86413960519c2c1f')
INSERT [dbo].[Rooms] ([Id], [Name], [Space], [Capacity], [Price], [Description], [Image]) VALUES (10, N'Engelli Dostu Oda', 40, 2, 500, N'Engelliler için uygun özel bir oda.', N'https://img.freepik.com/free-photo/double-bed-with-wall-lamp_1203-22.jpg?w=1800&t=st=1706219284~exp=1706219884~hmac=6c989cce6eac92badbcfd9cff0c87dca9dfc31d20deff60d86413960519c2c1f')
SET IDENTITY_INSERT [dbo].[Rooms] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetRoleClaims_RoleId]    Script Date: 26.01.2024 23:02:44 ******/
CREATE NONCLUSTERED INDEX [IX_AspNetRoleClaims_RoleId] ON [dbo].[AspNetRoleClaims]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [RoleNameIndex]    Script Date: 26.01.2024 23:02:44 ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
(
	[NormalizedName] ASC
)
WHERE ([NormalizedName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserClaims_UserId]    Script Date: 26.01.2024 23:02:44 ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserClaims_UserId] ON [dbo].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserLogins_UserId]    Script Date: 26.01.2024 23:02:44 ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserLogins_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserRoles_RoleId]    Script Date: 26.01.2024 23:02:44 ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserRoles_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [EmailIndex]    Script Date: 26.01.2024 23:02:44 ******/
CREATE NONCLUSTERED INDEX [EmailIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedEmail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UserNameIndex]    Script Date: 26.01.2024 23:02:44 ******/
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedUserName] ASC
)
WHERE ([NormalizedUserName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ReservationDetails_ReservationId]    Script Date: 26.01.2024 23:02:44 ******/
CREATE NONCLUSTERED INDEX [IX_ReservationDetails_ReservationId] ON [dbo].[ReservationDetails]
(
	[ReservationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ReservationDetails_RoomId]    Script Date: 26.01.2024 23:02:44 ******/
CREATE NONCLUSTERED INDEX [IX_ReservationDetails_RoomId] ON [dbo].[ReservationDetails]
(
	[RoomId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Reservations_UserId]    Script Date: 26.01.2024 23:02:44 ******/
CREATE NONCLUSTERED INDEX [IX_Reservations_UserId] ON [dbo].[Reservations]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AspNetRoleClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetRoleClaims] CHECK CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserTokens]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserTokens] CHECK CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[ReservationDetails]  WITH CHECK ADD  CONSTRAINT [FK_ReservationDetails_Reservations_ReservationId] FOREIGN KEY([ReservationId])
REFERENCES [dbo].[Reservations] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ReservationDetails] CHECK CONSTRAINT [FK_ReservationDetails_Reservations_ReservationId]
GO
ALTER TABLE [dbo].[ReservationDetails]  WITH CHECK ADD  CONSTRAINT [FK_ReservationDetails_Rooms_RoomId] FOREIGN KEY([RoomId])
REFERENCES [dbo].[Rooms] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ReservationDetails] CHECK CONSTRAINT [FK_ReservationDetails_Rooms_RoomId]
GO
ALTER TABLE [dbo].[Reservations]  WITH CHECK ADD  CONSTRAINT [FK_Reservations_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Reservations] CHECK CONSTRAINT [FK_Reservations_AspNetUsers_UserId]
GO
USE [master]
GO
ALTER DATABASE [VeynVoyage] SET  READ_WRITE 
GO

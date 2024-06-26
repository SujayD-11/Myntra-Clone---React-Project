USE [master]
GO
/****** Object:  Database [MyntraDB]    Script Date: 3/25/2024 9:58:33 AM ******/
CREATE DATABASE [MyntraDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MyntraDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\MyntraDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'MyntraDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\MyntraDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [MyntraDB] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MyntraDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MyntraDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MyntraDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MyntraDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MyntraDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MyntraDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [MyntraDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [MyntraDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MyntraDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MyntraDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MyntraDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MyntraDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MyntraDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MyntraDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MyntraDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MyntraDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [MyntraDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MyntraDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MyntraDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MyntraDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MyntraDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MyntraDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MyntraDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MyntraDB] SET RECOVERY FULL 
GO
ALTER DATABASE [MyntraDB] SET  MULTI_USER 
GO
ALTER DATABASE [MyntraDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MyntraDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MyntraDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MyntraDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [MyntraDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [MyntraDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'MyntraDB', N'ON'
GO
ALTER DATABASE [MyntraDB] SET QUERY_STORE = ON
GO
ALTER DATABASE [MyntraDB] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [MyntraDB]
GO
/****** Object:  Table [dbo].[Admins]    Script Date: 3/25/2024 9:58:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Admins](
	[AdminID] [int] NOT NULL,
	[Username] [varchar](50) NULL,
	[Password] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[AdminID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customers]    Script Date: 3/25/2024 9:58:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[Email] [varchar](30) NULL,
	[Password] [varchar](15) NULL,
	[HouseNo] [varchar](15) NULL,
	[StreetName] [varchar](20) NULL,
	[City] [varchar](20) NULL,
	[State] [varchar](20) NULL,
	[Pincode] [int] NULL,
	[CustomersID] [int] IDENTITY(1,1) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CustomersID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 3/25/2024 9:58:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[PName] [varchar](50) NOT NULL,
	[Category] [varchar](30) NULL,
	[SubCategory] [varchar](50) NULL,
	[Brand] [varchar](50) NOT NULL,
	[Price] [money] NOT NULL,
	[ProductPicture] [varchar](300) NULL,
	[ProductID] [int] IDENTITY(1,1) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Admins] ([AdminID], [Username], [Password]) VALUES (1, N'sujay11', N'sujay123')
INSERT [dbo].[Admins] ([AdminID], [Username], [Password]) VALUES (2, N'shruti10', N'shruti123')
INSERT [dbo].[Admins] ([AdminID], [Username], [Password]) VALUES (3, N'sneh18', N'sneh123')
INSERT [dbo].[Admins] ([AdminID], [Username], [Password]) VALUES (4, N'aditi20', N'aditi123')
INSERT [dbo].[Admins] ([AdminID], [Username], [Password]) VALUES (5, N'sourit00', N'sourit123')
INSERT [dbo].[Admins] ([AdminID], [Username], [Password]) VALUES (6, N'dheeresh00', N'dheeresh123')
GO
SET IDENTITY_INSERT [dbo].[Customers] ON 

INSERT [dbo].[Customers] ([Email], [Password], [HouseNo], [StreetName], [City], [State], [Pincode], [CustomersID]) VALUES (N'sujay@gmail.com', N'sujay123', NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Customers] ([Email], [Password], [HouseNo], [StreetName], [City], [State], [Pincode], [CustomersID]) VALUES (N'shruti@gmail.com', N'shruti123', NULL, NULL, NULL, NULL, NULL, 2)
INSERT [dbo].[Customers] ([Email], [Password], [HouseNo], [StreetName], [City], [State], [Pincode], [CustomersID]) VALUES (N'ssg@gmail.com', N'meow', N'string', N'string', N'string', N'string', 0, 6)
SET IDENTITY_INSERT [dbo].[Customers] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([PName], [Category], [SubCategory], [Brand], [Price], [ProductPicture], [ProductID]) VALUES (N'SlipOns', N'Unisex', N'Casuals', N'Sketchers', 1500.0000, N'https://tse1.mm.bing.net/th/id/OIP.0wmWi_HFBL3dMgr2E1-7PQHaHa?rs=1&pid=ImgDetMain', 1)
INSERT [dbo].[Products] ([PName], [Category], [SubCategory], [Brand], [Price], [ProductPicture], [ProductID]) VALUES (N'Spikes', N'Unisex', N'Sports', N'Sketchers', 2300.0000, N'https://www.for-sale.co.uk/sh-img/zoom-rival-s-8-sprint-spike_2__mens%2Bsprint%2Bspikes.jpg', 2)
INSERT [dbo].[Products] ([PName], [Category], [SubCategory], [Brand], [Price], [ProductPicture], [ProductID]) VALUES (N'Sneaker', N'Unisex', N'Sneakers', N'Puma', 3400.0000, N'https://tse2.mm.bing.net/th/id/OIP.2SPIY-DN9ofnKGZZCahlvAHaE0?w=286&h=186&c=7&r=0&o=5&dpr=1.5&pid=1.7', 3)
INSERT [dbo].[Products] ([PName], [Category], [SubCategory], [Brand], [Price], [ProductPicture], [ProductID]) VALUES (N'Loafer', N'Men', N'Formals', N'AllenSolly', 2500.0000, N'https://tse1.mm.bing.net/th/id/OIP.DvBSnfnK2NTKQCmbriXptgHaHa?w=185&h=185&c=7&r=0&o=5&dpr=1.5&pid=1.7', 4)
INSERT [dbo].[Products] ([PName], [Category], [SubCategory], [Brand], [Price], [ProductPicture], [ProductID]) VALUES (N'Pumps', N'Women', N'Formals', N'AllenSolly', 1300.0000, N'https://tse3.mm.bing.net/th/id/OIP.xoy3PmEJMqQSH7dmb6BxTQHaLW?w=115&h=180&c=7&r=0&o=5&dpr=1.5&pid=1.7', 5)
INSERT [dbo].[Products] ([PName], [Category], [SubCategory], [Brand], [Price], [ProductPicture], [ProductID]) VALUES (N'Crocs', N'Unisex', N'Sandals', N'Crocs', 1400.0000, N'https://tse2.mm.bing.net/th/id/OIP.PfYw64ppOuszXyOKNXZmsQHaHa?w=176&h=180&c=7&r=0&o=5&dpr=1.5&pid=1.7', 6)
INSERT [dbo].[Products] ([PName], [Category], [SubCategory], [Brand], [Price], [ProductPicture], [ProductID]) VALUES (N'Brown Slippers', N'Men', N'Slippers', N'Bata', 1200.0000, N'https://tse3.mm.bing.net/th/id/OIP.hT36cyfgy8MwmyGf_Z8NiAHaJb?w=148&h=189&c=7&r=0&o=5&dpr=1.5&pid=1.7', 7)
INSERT [dbo].[Products] ([PName], [Category], [SubCategory], [Brand], [Price], [ProductPicture], [ProductID]) VALUES (N'Red Heels', N'Women', N'Heels', N'Elle', 1674.0000, N'https://tse1.mm.bing.net/th/id/OIP.IKHQ7D_lCuzg1v6XQS862wHaF7?w=254&h=203&c=7&r=0&o=5&dpr=1.5&pid=1.7', 8)
INSERT [dbo].[Products] ([PName], [Category], [SubCategory], [Brand], [Price], [ProductPicture], [ProductID]) VALUES (N'Pink Crocs', N'Women', N'Crocs', N'Crocs', 5500.0000, N'https://tse2.mm.bing.net/th/id/OIP.lf0c5Qf8r8uaWX0RUmZrlgHaHa?w=205&h=205&c=7&r=0&o=5&dpr=1.5&pid=1.7', 9)
INSERT [dbo].[Products] ([PName], [Category], [SubCategory], [Brand], [Price], [ProductPicture], [ProductID]) VALUES (N'Black Boots', N'Unisex', N'Boots', N'Roadster', 3470.0000, N'https://tse3.mm.bing.net/th/id/OIP.vE0HuXvivHeGDqh4nAuUSAHaJ4?w=202&h=269&c=7&r=0&o=5&dpr=1.5&pid=1.7', 10)
INSERT [dbo].[Products] ([PName], [Category], [SubCategory], [Brand], [Price], [ProductPicture], [ProductID]) VALUES (N'Orthotic Shoes', N'Unisex', N'Orthopedic Shoes', N'Adidas', 1200.0000, N'https://tse2.mm.bing.net/th/id/OIP.CpHc-suCvLVBU3GdWPOl7AHaHa?w=230&h=220&c=7&r=0&o=5&dpr=1.5&pid=1.7', 11)
INSERT [dbo].[Products] ([PName], [Category], [SubCategory], [Brand], [Price], [ProductPicture], [ProductID]) VALUES (N'Brown Wallet', N'Men', N'Wallet', N'Van Heusen', 2300.0000, N'https://tse1.mm.bing.net/th/id/OIP.1eIqRebwtv1RXvCZYITKDAAAAA?w=202&h=303&c=7&r=0&o=5&dpr=1.5&pid=1.7', 12)
INSERT [dbo].[Products] ([PName], [Category], [SubCategory], [Brand], [Price], [ProductPicture], [ProductID]) VALUES (N'Black Watch', N'Women', N'Analog Watches', N'Boat', 7890.0000, N'https://tse4.mm.bing.net/th/id/OIP.deaz8mNFHgOj14DKc1JebQHaI4?w=165&h=198&c=7&r=0&o=5&dpr=1.5&pid=1.7', 13)
INSERT [dbo].[Products] ([PName], [Category], [SubCategory], [Brand], [Price], [ProductPicture], [ProductID]) VALUES (N'Purple Socks', N'Unisex', N'Socks', N'Miniso', 230.0000, N'https://tse3.mm.bing.net/th/id/OIP.4otXRTBgrxia0OFzAp1zZQHaHa?w=204&h=204&c=7&r=0&o=5&dpr=1.5&pid=1.7', 14)
INSERT [dbo].[Products] ([PName], [Category], [SubCategory], [Brand], [Price], [ProductPicture], [ProductID]) VALUES (N'Blue Cap', N'Women', N'Caps', N'Decathlon', 430.0000, N'https://tse1.mm.bing.net/th/id/OIP.-_Y8LHanXpHu4herY-HMlQHaHa?w=199&h=199&c=7&r=0&o=5&dpr=1.5&pid=1.7', 15)
INSERT [dbo].[Products] ([PName], [Category], [SubCategory], [Brand], [Price], [ProductPicture], [ProductID]) VALUES (N'White Handkerchief', N'Men', N'Handkerchiefs', N'AllenSolly', 150.0000, N'https://tse1.mm.bing.net/th/id/OIP.fX63Iir-6Bl6yampjOd9GgHaJ4?w=158&h=211&c=7&r=0&o=5&dpr=1.5&pid=1.7', 16)
INSERT [dbo].[Products] ([PName], [Category], [SubCategory], [Brand], [Price], [ProductPicture], [ProductID]) VALUES (N'Striped Tie', N'Men', N'Tie', N'Raymond', 560.0000, N'https://tse3.mm.bing.net/th/id/OIP.5bdOi4S-uF2wBK-tUbVlcwHaHa?w=197&h=197&c=7&r=0&o=5&dpr=1.5&pid=1.7', 17)
INSERT [dbo].[Products] ([PName], [Category], [SubCategory], [Brand], [Price], [ProductPicture], [ProductID]) VALUES (N'White Headband', N'Women', N'Headbands', N'Patagonia', 340.0000, N'https://tse2.mm.bing.net/th/id/OIP.7MYJDoRT8D-hC49lKWTIlQHaLW?w=136&h=209&c=7&r=0&o=5&dpr=1.5&pid=1.7', 18)
INSERT [dbo].[Products] ([PName], [Category], [SubCategory], [Brand], [Price], [ProductPicture], [ProductID]) VALUES (N'UV Protection Sunglasses', N'Unisex', N'Sunglasses', N'Rayban', 3400.0000, N'https://tse3.mm.bing.net/th/id/OIP._3_y6SKpF3EY8zY5RcBkhQHaLW?w=201&h=309&c=7&r=0&o=5&dpr=1.5&pid=1.7', 19)
INSERT [dbo].[Products] ([PName], [Category], [SubCategory], [Brand], [Price], [ProductPicture], [ProductID]) VALUES (N'Woolen Gloves', N'Women', N'Gloves', N'Decathlon', 569.0000, N'https://tse2.mm.bing.net/th/id/OIP.VVVp7-qp6yHVNlM3bksWkQHaHa?w=197&h=196&c=7&r=0&o=5&dpr=1.5&pid=1.7', 20)
INSERT [dbo].[Products] ([PName], [Category], [SubCategory], [Brand], [Price], [ProductPicture], [ProductID]) VALUES (N'Leather Suspenders', N'Women', N'Suspenders', N'Kastner', 678.0000, N'https://tse2.mm.bing.net/th/id/OIP.ZCm5igZuo98aD1F3RI2CpwHaLH?w=202&h=303&c=7&r=0&o=5&dpr=1.5&pid=1.7', 21)
INSERT [dbo].[Products] ([PName], [Category], [SubCategory], [Brand], [Price], [ProductPicture], [ProductID]) VALUES (N'Matte Lipstick', N'Women', N'Lipsticks', N'Nykaa', 340.0000, N'https://tse2.mm.bing.net/th/id/OIP.puSiA2ONJ1T0SXvEvdbOFgHaEK?w=322&h=181&c=7&r=0&o=5&dpr=1.5&pid=1.7', 22)
INSERT [dbo].[Products] ([PName], [Category], [SubCategory], [Brand], [Price], [ProductPicture], [ProductID]) VALUES (N'Sheet Mask', N'Unisex', N'Face', N'Garnier', 150.0000, N'https://tse4.mm.bing.net/th/id/OIP.J7utD2xYbSltdcKw0k1FcgHaHa?w=172&h=180&c=7&r=0&o=5&dpr=1.5&pid=1.7', 23)
INSERT [dbo].[Products] ([PName], [Category], [SubCategory], [Brand], [Price], [ProductPicture], [ProductID]) VALUES (N'NailPaint', N'Women', N'Nails', N'Maybelline', 230.0000, N'https://tse4.mm.bing.net/th/id/OIP.UC2pSSLAYfI7BgkBf9Ft9AHaGX?w=153&h=180&c=7&r=0&o=5&dpr=1.5&pid=1.7', 24)
INSERT [dbo].[Products] ([PName], [Category], [SubCategory], [Brand], [Price], [ProductPicture], [ProductID]) VALUES (N'Mascara', N'Women', N'Eyes', N'Maybelline Sky High', 760.0000, N'https://tse4.mm.bing.net/th/id/OIP.tvP3irqmPD-ktoqsRew7vAHaHa?w=167&h=180&c=7&r=0&o=5&dpr=1.5&pid=1.7', 25)
INSERT [dbo].[Products] ([PName], [Category], [SubCategory], [Brand], [Price], [ProductPicture], [ProductID]) VALUES (N'Guasha', N'Unisex', N'Skincare', N'Nykaa', 260.0000, N'https://tse4.mm.bing.net/th/id/OIP.Zm9ZiyPNo-juZFOCIVdVTQHaHa?w=191&h=191&c=7&r=0&o=5&dpr=1.5&pid=1.7', 26)
INSERT [dbo].[Products] ([PName], [Category], [SubCategory], [Brand], [Price], [ProductPicture], [ProductID]) VALUES (N'Vitamin C Sunscreen', N'Unisex', N'Sunscreen', N'Derma', 500.0000, N'https://tse3.mm.bing.net/th/id/OIP.35WmQo2brSj1q7V462CsUgHaIZ?w=177&h=201&c=7&r=0&o=5&dpr=1.5&pid=1.7', 27)
INSERT [dbo].[Products] ([PName], [Category], [SubCategory], [Brand], [Price], [ProductPicture], [ProductID]) VALUES (N'Winter Blazer', N'Men', N'Blazers', N'Monte Carlo', 2300.0000, N'https://tse1.mm.bing.net/th/id/OIP.DXXJwBrc6TmN1FARBEJrZQHaJ4?w=202&h=269&c=7&r=0&o=5&dpr=1.5&pid=1.7', 28)
INSERT [dbo].[Products] ([PName], [Category], [SubCategory], [Brand], [Price], [ProductPicture], [ProductID]) VALUES (N'Denim Jeans', N'Men', N'Jeans', N'Levis', 5700.0000, N'https://tse3.mm.bing.net/th/id/OIP.8UxgRx-ajtIy6E4OIO-sPgHaJ4?w=202&h=337&c=7&r=0&o=5&dpr=1.5&pid=1.7', 29)
INSERT [dbo].[Products] ([PName], [Category], [SubCategory], [Brand], [Price], [ProductPicture], [ProductID]) VALUES (N'Sundress', N'Women', N'Dresses', N'BerryLush', 630.0000, N'https://tse2.mm.bing.net/th/id/OIP.QHkQbFfpI_J-4bkRJsOJHQHaNT?w=186&h=335&c=7&r=0&o=5&dpr=1.5&pid=1.7', 30)
INSERT [dbo].[Products] ([PName], [Category], [SubCategory], [Brand], [Price], [ProductPicture], [ProductID]) VALUES (N'White JumpSuit', N'Women', N'Jumpsuits', N'Zudio', 1600.0000, N'https://tse2.mm.bing.net/th/id/OIP.tUUmwicISo6rMHQhKwxHDgHaLH?w=202&h=303&c=7&r=0&o=5&dpr=1.5&pid=1.7', 31)
INSERT [dbo].[Products] ([PName], [Category], [SubCategory], [Brand], [Price], [ProductPicture], [ProductID]) VALUES (N'Sports Shorts', N'Unisex', N'Shorts', N'HRX', 1700.0000, N'https://tse2.mm.bing.net/th/id/OIP.p3om9F8SlmRevT83zMmEJAHaJ4?w=202&h=269&c=7&r=0&o=5&dpr=1.5&pid=1.7', 32)
INSERT [dbo].[Products] ([PName], [Category], [SubCategory], [Brand], [Price], [ProductPicture], [ProductID]) VALUES (N'BodySuit', N'Unisex', N'T Shirts', N'Nike', 3400.0000, N'https://tse3.mm.bing.net/th/id/OIP.h2ZyHrrDeyRzCcVZbiSrCAHaIa?w=202&h=230&c=7&r=0&o=5&dpr=1.5&pid=1.7', 33)
INSERT [dbo].[Products] ([PName], [Category], [SubCategory], [Brand], [Price], [ProductPicture], [ProductID]) VALUES (N'Denim Skirt', N'Women', N'Skirt', N'Max', 1500.0000, N'https://tse4.mm.bing.net/th/id/OIP.8r3ty60OoCaWji3BEnDNlAHaHa?w=202&h=202&c=7&r=0&o=5&dpr=1.5&pid=1.7', 34)
INSERT [dbo].[Products] ([PName], [Category], [SubCategory], [Brand], [Price], [ProductPicture], [ProductID]) VALUES (N'Long Kurta', N'Men', N'Kurtas', N'Biba', 5000.0000, N'https://tse4.mm.bing.net/th/id/OIP.Cb5TsbLeZO48ZQvxXUcybgHaJ4?w=202&h=269&c=7&r=0&o=5&dpr=1.5&pid=1.7', 35)
INSERT [dbo].[Products] ([PName], [Category], [SubCategory], [Brand], [Price], [ProductPicture], [ProductID]) VALUES (N'Salwar Kurta', N'Women', N'Salvar Suit', N'Akina', 2400.0000, N'https://tse4.mm.bing.net/th/id/OIP.RHxMMWI_qYaBVAZ57b1DkwHaL2?w=197&h=316&c=7&r=0&o=5&dpr=1.5&pid=1.7', 36)
INSERT [dbo].[Products] ([PName], [Category], [SubCategory], [Brand], [Price], [ProductPicture], [ProductID]) VALUES (N'Lehenga Set', N'Women', N'Lehenga Choli', N'Libas', 4300.0000, N'https://tse1.mm.bing.net/th/id/OIP.9ILXvDZ9j8s1hLPgjgd1HwHaLH?w=202&h=303&c=7&r=0&o=5&dpr=1.5&pid=1.7', 37)
INSERT [dbo].[Products] ([PName], [Category], [SubCategory], [Brand], [Price], [ProductPicture], [ProductID]) VALUES (N'Chiffon Saree', N'Women', N'Saree', N'Anouk', 1800.0000, N'https://tse2.mm.bing.net/th/id/OIP.2nnsVsj6-JcE__key7UdsQHaJ4?w=202&h=269&c=7&r=0&o=5&dpr=1.5&pid=1.7', 38)
INSERT [dbo].[Products] ([PName], [Category], [SubCategory], [Brand], [Price], [ProductPicture], [ProductID]) VALUES (N'Oxidised Earrings', N'Women', N'Earings', N'GIVA', 12000.0000, N'https://tse3.mm.bing.net/th/id/OIP.F6XAk3Zp2mtab8CGRuphuQHaHa?w=163&h=180&c=7&r=0&o=5&dpr=1.5&pid=1.7', 39)
INSERT [dbo].[Products] ([PName], [Category], [SubCategory], [Brand], [Price], [ProductPicture], [ProductID]) VALUES (N'Gold Bangles', N'Women', N'Bangles', N'Caratlane', 15000.0000, N'https://tse3.mm.bing.net/th/id/OIP.h8PccsFC5E0P49WJ9fo25AHaGn?w=192&h=180&c=7&r=0&o=5&dpr=1.5&pid=1.7', 40)
INSERT [dbo].[Products] ([PName], [Category], [SubCategory], [Brand], [Price], [ProductPicture], [ProductID]) VALUES (N'Diamond Bracelet', N'Men', N'Bracelet', N'Swarovski', 11000.0000, N'https://tse2.mm.bing.net/th/id/OIP.3e84qipXFOP6j2Mic8nemgHaHa?w=208&h=209&c=7&r=0&o=5&dpr=1.5&pid=1.7', 41)
INSERT [dbo].[Products] ([PName], [Category], [SubCategory], [Brand], [Price], [ProductPicture], [ProductID]) VALUES (N'Silver Anklet', N'Women', N'Anklet', N'Heera', 9000.0000, N'https://tse3.mm.bing.net/th/id/OIP.Oum_valxkR7zpgdZbLFiagHaFZ?w=265&h=192&c=7&r=0&o=5&dpr=1.5&pid=1.7', 42)
INSERT [dbo].[Products] ([PName], [Category], [SubCategory], [Brand], [Price], [ProductPicture], [ProductID]) VALUES (N'Gold Set', N'Women', N'Jewellery Set', N'Tanishq', 45000.0000, N'https://tse2.mm.bing.net/th/id/OIP.mJOs6aQziMP3v6v-vfbnhAHaHP?w=216&h=212&c=7&r=0&o=5&dpr=1.5&pid=1.7', 43)
INSERT [dbo].[Products] ([PName], [Category], [SubCategory], [Brand], [Price], [ProductPicture], [ProductID]) VALUES (N'Rose Pendant', N'Women', N'Pendants', N'CaratLane', 13000.0000, N'https://tse4.mm.bing.net/th/id/OIP.zPnyonNF1CPbNJQJPes7RQHaHa?w=190&h=192&c=7&r=0&o=5&dpr=1.5&pid=1.7', 44)
INSERT [dbo].[Products] ([PName], [Category], [SubCategory], [Brand], [Price], [ProductPicture], [ProductID]) VALUES (N'White Gold Ring', N'Unisex', N'Rings', N'Tanishq', 15000.0000, N'https://tse4.mm.bing.net/th/id/OIP.vgEKj6r_hkxnNMAqlpjsCgHaHa?w=215&h=215&c=7&r=0&o=5&dpr=1.5&pid=1.7', 45)
INSERT [dbo].[Products] ([PName], [Category], [SubCategory], [Brand], [Price], [ProductPicture], [ProductID]) VALUES (N'Gym Bag', N'Unisex', N'Duffel Bag', N'Jockey', 490.0000, N'https://tse4.mm.bing.net/th/id/OIP.YcnvJEFiro66nGf0aDQ_-gHaHa?w=181&h=181&c=7&r=0&o=5&dpr=1.5&pid=1.7', 46)
INSERT [dbo].[Products] ([PName], [Category], [SubCategory], [Brand], [Price], [ProductPicture], [ProductID]) VALUES (N'Travel Suitcase', N'Unisex', N'Suitcase', N'American Tourister', 6000.0000, N'https://tse2.mm.bing.net/th/id/OIP.QA2vr_ZmC7R38rUnwKU8agHaHa?w=191&h=191&c=7&r=0&o=5&dpr=1.5&pid=1.7', 47)
INSERT [dbo].[Products] ([PName], [Category], [SubCategory], [Brand], [Price], [ProductPicture], [ProductID]) VALUES (N'Backpack', N'Men', N'Backpacks', N'WildCraft', 2500.0000, N'https://tse4.mm.bing.net/th/id/OIP.b_H6VDrBUVmR2frrbm_ptAHaIq?w=171&h=200&c=7&r=0&o=5&dpr=1.5&pid=1.7', 48)
INSERT [dbo].[Products] ([PName], [Category], [SubCategory], [Brand], [Price], [ProductPicture], [ProductID]) VALUES (N'Black Laptop Bag', N'Unisex', N'Laptop Bags', N'H&M', 1400.0000, N'https://tse4.mm.bing.net/th/id/OIP.ySz_QTakFKfgbKExSlCftwHaHa?w=190&h=190&c=7&r=0&o=5&dpr=1.5&pid=1.7', 49)
INSERT [dbo].[Products] ([PName], [Category], [SubCategory], [Brand], [Price], [ProductPicture], [ProductID]) VALUES (N'Shopping Bag', N'Women', N'Handbags', N'Elle', 4400.0000, N'https://tse1.mm.bing.net/th/id/OIP.RzuB-OPp3F8LN6Gf6vr3YwHaHa?w=202&h=202&c=7&r=0&o=5&dpr=1.5&pid=1.7', 50)
INSERT [dbo].[Products] ([PName], [Category], [SubCategory], [Brand], [Price], [ProductPicture], [ProductID]) VALUES (N'Office Shirt', N'Women', N'Shirt', N'Azorte', 1200.0000, N'https://tse1.mm.bing.net/th/id/OIP.xNHHwzglmGv1gPBztT_QOwHaHa?w=199&h=198&c=7&r=0&o=5&dpr=1.5&pid=1.7', 51)
INSERT [dbo].[Products] ([PName], [Category], [SubCategory], [Brand], [Price], [ProductPicture], [ProductID]) VALUES (N'Three Piece Office Suit', N'Men', N'Suits', N'AllenSolly', 9900.0000, N'https://tse1.mm.bing.net/th/id/OIP.jFjsdZmZqeQ22MzIHXSGlwAAAA?w=202&h=303&c=7&r=0&o=5&dpr=1.5&pid=1.7', 52)
INSERT [dbo].[Products] ([PName], [Category], [SubCategory], [Brand], [Price], [ProductPicture], [ProductID]) VALUES (N'Pencil Jean Skirt ', N'Women', N'Pencil Skirt', N'Levis', 4000.0000, N'https://tse4.mm.bing.net/th/id/OIP.aBHImTHaj3sF7PyrkXvyDwHaJC?w=202&h=247&c=7&r=0&o=5&dpr=1.5&pid=1.7', 53)
INSERT [dbo].[Products] ([PName], [Category], [SubCategory], [Brand], [Price], [ProductPicture], [ProductID]) VALUES (N'Beige Trousers', N'Men', N'Trouser', N'Van Heusen', 4500.0000, N'https://tse1.mm.bing.net/th/id/OIP.-bhECaWc-Py_7v7GTtBB4gHaJ4?w=202&h=269&c=7&r=0&o=5&dpr=1.5&pid=1.7', 54)
INSERT [dbo].[Products] ([PName], [Category], [SubCategory], [Brand], [Price], [ProductPicture], [ProductID]) VALUES (N'BodySpray', N'Women', N'Feminine Hygiene', N'Loreal', 590.0000, N'https://tse1.mm.bing.net/th/id/OIP.OYi0KfURhpWl7BTucp1mlAAAAA?w=202&h=202&c=7&r=0&o=5&dpr=1.5&pid=1.7', 55)
INSERT [dbo].[Products] ([PName], [Category], [SubCategory], [Brand], [Price], [ProductPicture], [ProductID]) VALUES (N'Women''s Perfume', N'Women', N'Perfumes & Deos', N'zara', 1500.0000, N'https://tse1.mm.bing.net/th/id/OIP.SmnZXzEerSv0LJyiFQBrcAHaHa?w=202&h=202&c=7&r=0&o=5&dpr=1.5&pid=1.7', 56)
INSERT [dbo].[Products] ([PName], [Category], [SubCategory], [Brand], [Price], [ProductPicture], [ProductID]) VALUES (N'Roll On Deo', N'Women', N'Feminine Hygine', N'Nivea', 230.0000, N'https://tse2.mm.bing.net/th/id/OIP.F4Q9t_gBxETNigzO_I_6AgHaHa?w=186&h=186&c=7&r=0&o=5&dpr=1.5&pid=1.7', 57)
INSERT [dbo].[Products] ([PName], [Category], [SubCategory], [Brand], [Price], [ProductPicture], [ProductID]) VALUES (N'Shaving Cream', N'Men', N'Shaving Kit', N'Dove men', 300.0000, N'https://tse4.mm.bing.net/th/id/OIP.xAQDlJsNbCGIU0aGji0UiwHaHa?w=181&h=180&c=7&r=0&o=5&dpr=1.5&pid=1.7', 58)
INSERT [dbo].[Products] ([PName], [Category], [SubCategory], [Brand], [Price], [ProductPicture], [ProductID]) VALUES (N'Red Hair Colour', N'Unisex', N'Hair Colour', N'Loreal', 450.0000, N'https://tse3.mm.bing.net/th/id/OIP.K5qmbs5jk2WMcxYzu0fMtgHaHa?w=191&h=192&c=7&r=0&o=5&dpr=1.5&pid=1.7', 59)
INSERT [dbo].[Products] ([PName], [Category], [SubCategory], [Brand], [Price], [ProductPicture], [ProductID]) VALUES (N'Ankle length Boots', N'Women', N'Boots', N'Roadster', 3200.0000, N'https://tse4.mm.bing.net/th/id/OIP.r5LpSTNBXIqlLtXLTrMc1AHaJ4?w=202&h=270&c=7&r=0&o=5&dpr=1.5&pid=1.7', 60)
INSERT [dbo].[Products] ([PName], [Category], [SubCategory], [Brand], [Price], [ProductPicture], [ProductID]) VALUES (N'Black orthopedic shoes', N'Men', N'Orthopedic Shoes', N'Nike', 3200.0000, N'https://tse3.mm.bing.net/th/id/OIP.78frvLoFrMRuESfVz9zmsgHaHa?w=186&h=186&c=7&r=0&o=5&dpr=1.5&pid=1.7', 61)
INSERT [dbo].[Products] ([PName], [Category], [SubCategory], [Brand], [Price], [ProductPicture], [ProductID]) VALUES (N'White Orthopedic Shoes', N'Unisex', N'Orthopedic Shoes', N'Nike', 2100.0000, N'https://tse3.mm.bing.net/th/id/OIP.IA9rxyk54pEvhmuPSrTC8wHaFc?w=227&h=180&c=7&r=0&o=5&dpr=1.5&pid=1.7', 62)
INSERT [dbo].[Products] ([PName], [Category], [SubCategory], [Brand], [Price], [ProductPicture], [ProductID]) VALUES (N'Leather Wallet', N'Men', N'Wallet', N'Raymond', 3300.0000, N'https://tse4.mm.bing.net/th/id/OIP.8JdyZhk0nj1Guqxah7DMQAHaHa?w=268&h=202&c=7&r=0&o=5&dpr=1.5&pid=1.7', 63)
INSERT [dbo].[Products] ([PName], [Category], [SubCategory], [Brand], [Price], [ProductPicture], [ProductID]) VALUES (N'Women''s Wallet', N'Women', N'Wallet', N'Elle', 3214.0000, N'https://tse3.mm.bing.net/th/id/OIP.KrQUVxUD4FahXFsZU5aixQHaJ4?w=158&h=211&c=7&r=0&o=5&dpr=1.5&pid=1.7', 64)
INSERT [dbo].[Products] ([PName], [Category], [SubCategory], [Brand], [Price], [ProductPicture], [ProductID]) VALUES (N'Party Wallet ', N'Women', N'Wallet', N'Caprese', 2190.0000, N'https://tse2.mm.bing.net/th/id/OIP.qj5hri0bjQkxFkKNsaAEXQHaIq?w=187&h=219&c=7&r=0&o=5&dpr=1.5&pid=1.7', 65)
INSERT [dbo].[Products] ([PName], [Category], [SubCategory], [Brand], [Price], [ProductPicture], [ProductID]) VALUES (N'White Analog Watch', N'Unisex', N'Analog Watches', N'Nikon', 7780.0000, N'https://tse2.mm.bing.net/th/id/OIP.XZFodO_SZT6lTJUcwDHlmAHaIx?w=183&h=219&c=7&r=0&o=5&dpr=1.5&pid=1.7', 66)
INSERT [dbo].[Products] ([PName], [Category], [SubCategory], [Brand], [Price], [ProductPicture], [ProductID]) VALUES (N'Yellow Analog Watch', N'Men', N'Analog Watches', N'Yepme', 4311.0000, N'https://tse2.mm.bing.net/th/id/OIP.ilRv301rup1cRs4ncb3yCgHaIq?w=168&h=196&c=7&r=0&o=5&dpr=1.5&pid=1.7', 67)
INSERT [dbo].[Products] ([PName], [Category], [SubCategory], [Brand], [Price], [ProductPicture], [ProductID]) VALUES (N'Blue Watch', N'Women', N'Analog Watches', N'Titan', 9800.0000, N'https://tse3.mm.bing.net/th/id/OIP.ZV9_xXswRf6pTCy9DdQ6QAHaHa?w=208&h=208&c=7&r=0&o=5&dpr=1.5&pid=1.7', 68)
INSERT [dbo].[Products] ([PName], [Category], [SubCategory], [Brand], [Price], [ProductPicture], [ProductID]) VALUES (N'Woollen Socks', N'Unisex', N'Socks', N'Monte Carlo', 340.0000, N'https://tse4.mm.bing.net/th/id/OIP.Kko2B3FnVlktT6Zd-2u6SAHaHa?w=184&h=184&c=7&r=0&o=5&dpr=1.5&pid=1.7', 69)
INSERT [dbo].[Products] ([PName], [Category], [SubCategory], [Brand], [Price], [ProductPicture], [ProductID]) VALUES (N'Cotton Socks', N'Women', N'Socks', N'Miniso', 210.0000, N'https://tse4.mm.bing.net/th/id/OIP.jKBd6vh7yTWabDXT-4SH3QHaHa?w=193&h=193&c=7&r=0&o=5&dpr=1.5&pid=1.7', 70)
INSERT [dbo].[Products] ([PName], [Category], [SubCategory], [Brand], [Price], [ProductPicture], [ProductID]) VALUES (N' Red Cap', N'Men', N'Caps', N'Nike', 345.0000, N'https://tse2.mm.bing.net/th/id/OIP.oOpQJs2TqmPbhYxIPebEhgHaHu?w=184&h=192&c=7&r=0&o=5&dpr=1.5&pid=1.7', 71)
INSERT [dbo].[Products] ([PName], [Category], [SubCategory], [Brand], [Price], [ProductPicture], [ProductID]) VALUES (N'White Cap', N'Men', N'Caps', N'Adidas ', 440.0000, N'https://tse2.mm.bing.net/th/id/OIP.glXQvKcQdpmbYApdHKBYpQHaHa?w=191&h=191&c=7&r=0&o=5&dpr=1.5&pid=1.7', 72)
INSERT [dbo].[Products] ([PName], [Category], [SubCategory], [Brand], [Price], [ProductPicture], [ProductID]) VALUES (N'Grey Cap', N'Unisex', N'Caps', N'Nike', 670.0000, N'https://tse3.mm.bing.net/th/id/OIP.fFYVoUA-_gAcMJvRtFnmOgHaE7?w=264&h=180&c=7&r=0&o=5&dpr=1.5&pid=1.7', 73)
INSERT [dbo].[Products] ([PName], [Category], [SubCategory], [Brand], [Price], [ProductPicture], [ProductID]) VALUES (N'Grey HandkerChief', N'Men', N'Handkerchiefs', N'Raymond', 430.0000, N'https://tse2.mm.bing.net/th/id/OIP.mQMObKovne9qlEimz0s89wHaHa?w=210&h=210&c=7&r=0&o=5&dpr=1.5&pid=1.7', 74)
INSERT [dbo].[Products] ([PName], [Category], [SubCategory], [Brand], [Price], [ProductPicture], [ProductID]) VALUES (N'Printed Handkerchief', N'Women', N'Handkerchiefs', N'Raymond', 560.0000, N'https://tse2.mm.bing.net/th/id/OIP.YEIqX8Cn7CapnWPBBm3dsgHaHa?w=210&h=210&c=7&r=0&o=5&dpr=1.5&pid=1.7', 75)
INSERT [dbo].[Products] ([PName], [Category], [SubCategory], [Brand], [Price], [ProductPicture], [ProductID]) VALUES (N'Plain Work Tie', N'Men', N'Tie', N'Allen Solly', 880.0000, N'https://tse3.mm.bing.net/th/id/OIP.fiY0Fuk4RzA-Lw5AK5vdTQHaHa?w=202&h=202&c=7&r=0&o=5&dpr=1.5&pid=1.7', 76)
INSERT [dbo].[Products] ([PName], [Category], [SubCategory], [Brand], [Price], [ProductPicture], [ProductID]) VALUES (N'Printed Work Tie ', N'Men', N'Tie', N'Allen Solly', 980.0000, N'https://tse1.mm.bing.net/th/id/OIP.1TmTaEWDt5L22e88u1SmJgHaHa?w=185&h=185&c=7&r=0&o=5&dpr=1.5&pid=1.7', 77)
INSERT [dbo].[Products] ([PName], [Category], [SubCategory], [Brand], [Price], [ProductPicture], [ProductID]) VALUES (N'Pink Tie', N'Women', N'Tie', N'Raymond', 760.0000, N'https://tse1.mm.bing.net/th/id/OIP.wOYQ_4OCRoA8gyP8LKKcAwHaHa?w=181&h=181&c=7&r=0&o=5&dpr=1.5&pid=1.7', 78)
INSERT [dbo].[Products] ([PName], [Category], [SubCategory], [Brand], [Price], [ProductPicture], [ProductID]) VALUES (N'Sports Headband', N'Unisex', N'Headbands', N'Decathlon', 660.0000, N'https://tse4.mm.bing.net/th/id/OIP.jluwxc8oTQse2qEN5tUR9AHaHa?w=206&h=205&c=7&r=0&o=5&dpr=1.5&pid=1.7', 79)
INSERT [dbo].[Products] ([PName], [Category], [SubCategory], [Brand], [Price], [ProductPicture], [ProductID]) VALUES (N'Diamond Anklet', N'Women', N'Anklet', N'Tanishq', 15000.0000, N'https://tse4.mm.bing.net/th/id/OIP.FqnOvabjOhGsv2pe8mr-GgHaIT?w=174&h=195&c=7&r=0&o=5&dpr=1.5&pid=1.7', 80)
INSERT [dbo].[Products] ([PName], [Category], [SubCategory], [Brand], [Price], [ProductPicture], [ProductID]) VALUES (N'Oxidised Anklet', N'Women', N'Anklet', N'CaratLane', 12000.0000, N'https://tse2.mm.bing.net/th/id/OIP.HJokUiW8kFEPa_TRjVI_SgHaHa?w=188&h=188&c=7&r=0&o=5&dpr=1.5&pid=1.7', 81)
INSERT [dbo].[Products] ([PName], [Category], [SubCategory], [Brand], [Price], [ProductPicture], [ProductID]) VALUES (N'Silver Anklet', N'Women', N'Anklet', N'Giva', 7000.0000, N'https://tse2.mm.bing.net/th/id/OIP.hfbsPhzp0bGdbiVwUg3UTwHaHa?w=209&h=209&c=7&r=0&o=5&dpr=1.5&pid=1.7', 82)
INSERT [dbo].[Products] ([PName], [Category], [SubCategory], [Brand], [Price], [ProductPicture], [ProductID]) VALUES (N'Diamond Set', N'Women', N'Jewellery Set', N'Kalyan Jewellers', 45000.0000, N'https://tse3.mm.bing.net/th/id/OIP.B197ZO_c2RIejHDgY_LoiAHaGl?w=225&h=199&c=7&r=0&o=5&dpr=1.5&pid=1.7', 83)
INSERT [dbo].[Products] ([PName], [Category], [SubCategory], [Brand], [Price], [ProductPicture], [ProductID]) VALUES (N'Silver Set', N'Women', N'Jewellery Set', N'P.C. Chandra', 32000.0000, N'https://tse3.mm.bing.net/th/id/OIP.hNJLXpCw3xEMWQsQua-5PgHaHa?w=195&h=196&c=7&r=0&o=5&dpr=1.5&pid=1.7', 84)
INSERT [dbo].[Products] ([PName], [Category], [SubCategory], [Brand], [Price], [ProductPicture], [ProductID]) VALUES (N'Platinum Set', N'Women', N'Jewellery Set', N'Candere', 50000.0000, N'https://tse2.mm.bing.net/th/id/OIP.HUshuDn4g2azX9STeOpfuQHaHa?w=218&h=218&c=7&r=0&o=5&dpr=1.5&pid=1.7', 85)
INSERT [dbo].[Products] ([PName], [Category], [SubCategory], [Brand], [Price], [ProductPicture], [ProductID]) VALUES (N'Butterfly Pendant', N'Women', N'Pendants', N'Swarovski', 2000.0000, N'https://tse1.mm.bing.net/th/id/OIP.mXzgAvGiOG3BAMpqqerZBQHaHa?w=215&h=215&c=7&r=0&o=5&dpr=1.5&pid=1.7', 86)
INSERT [dbo].[Products] ([PName], [Category], [SubCategory], [Brand], [Price], [ProductPicture], [ProductID]) VALUES (N'Moon Pendant', N'Women', N'Pendants', N'Lulu and Sky', 1000.0000, N'https://tse2.mm.bing.net/th/id/OIP._ijs_aqBCOXESdxOexq3CQHaJ4?w=156&h=208&c=7&r=0&o=5&dpr=1.5&pid=1.7', 87)
INSERT [dbo].[Products] ([PName], [Category], [SubCategory], [Brand], [Price], [ProductPicture], [ProductID]) VALUES (N'Star Pendant', N'Women', N'Pendants', N'EverStylish', 800.0000, N'https://tse4.mm.bing.net/th/id/OIP.Z7gKnRWN81sCffry11z5iQHaJk?w=147&h=191&c=7&r=0&o=5&dpr=1.5&pid=1.7', 88)
INSERT [dbo].[Products] ([PName], [Category], [SubCategory], [Brand], [Price], [ProductPicture], [ProductID]) VALUES (N'Rose Gold', N'Unisex', N'Rings', N'Tira', 1200.0000, N'https://tse1.mm.bing.net/th/id/OIP.WCciDMxa_XaHdKDDqr8cJQHaHg?w=202&h=204&c=7&r=0&o=5&dpr=1.5&pid=1.7', 89)
INSERT [dbo].[Products] ([PName], [Category], [SubCategory], [Brand], [Price], [ProductPicture], [ProductID]) VALUES (N'Silver', N'Men', N'Rings', N'Chandrani Pearls', 2200.0000, N'https://tse3.mm.bing.net/th/id/OIP.VrBWfiYz4dO-wzKw_-AvSgHaIQ?w=177&h=197&c=7&r=0&o=5&dpr=1.5&pid=1.7', 90)
INSERT [dbo].[Products] ([PName], [Category], [SubCategory], [Brand], [Price], [ProductPicture], [ProductID]) VALUES (N'Gold', N'Men', N'Rings', N'Malabar Golds', 14000.0000, N'https://tse2.mm.bing.net/th/id/OIP.3fAb1QxE3uJyR1DH8bKLfAHaHa?w=170&h=180&c=7&r=0&o=5&dpr=1.5&pid=1.7', 91)
INSERT [dbo].[Products] ([PName], [Category], [SubCategory], [Brand], [Price], [ProductPicture], [ProductID]) VALUES (N'Wheeled Bags', N'Men', N'Duffel Bag', N'American Touristor', 3000.0000, N'https://tse1.mm.bing.net/th/id/OIP.eF5ByEJLSWWM_hPrdDV2dQHaHa?w=180&h=180&c=7&r=0&o=5&dpr=1.5&pid=1.7', 92)
INSERT [dbo].[Products] ([PName], [Category], [SubCategory], [Brand], [Price], [ProductPicture], [ProductID]) VALUES (N'Travel Bags', N'Unisex', N'Duffel Bag', N'Decathlon', 2500.0000, N'https://tse2.mm.bing.net/th/id/OIP.iuhvAQEOTcwEDeoKu4cFKgHaHl?w=184&h=189&c=7&r=0&o=5&dpr=1.5&pid=1.7', 93)
INSERT [dbo].[Products] ([PName], [Category], [SubCategory], [Brand], [Price], [ProductPicture], [ProductID]) VALUES (N'Foldable Bags', N'Unisex', N'Duffel Bag', N'Wildcraft', 1500.0000, N'https://tse1.mm.bing.net/th/id/OIP.cfJPL0aDbPObtMRoywUUFgHaHa?w=194&h=194&c=7&r=0&o=5&dpr=1.5&pid=1.7', 94)
INSERT [dbo].[Products] ([PName], [Category], [SubCategory], [Brand], [Price], [ProductPicture], [ProductID]) VALUES (N'Office Suitcase', N'Unisex', N'Suitcase', N'Samsonite', 4000.0000, N'https://tse1.mm.bing.net/th/id/OIP.-lrlD_UIJauVwCT1wWyvIgHaIl?w=158&h=183&c=7&r=0&o=5&dpr=1.5&pid=1.7', 95)
INSERT [dbo].[Products] ([PName], [Category], [SubCategory], [Brand], [Price], [ProductPicture], [ProductID]) VALUES (N'Hard Case Suitcase', N'Unisex', N'Suitcase', N'Samsonite', 3500.0000, N'https://tse3.mm.bing.net/th/id/OIP.hMc7uNUOj_E2tRvvqaAXsQHaJ4?w=140&h=185&c=7&r=0&o=5&dpr=1.5&pid=1.7', 96)
INSERT [dbo].[Products] ([PName], [Category], [SubCategory], [Brand], [Price], [ProductPicture], [ProductID]) VALUES (N'Blue Backpack', N'Men', N'Backpacks', N'Decathlon', 1500.0000, N'https://tse3.mm.bing.net/th/id/OIP.g44zT5fPtRn0NuVsNgzA3gHaKD?w=158&h=215&c=7&r=0&o=5&dpr=1.5&pid=1.7', 97)
INSERT [dbo].[Products] ([PName], [Category], [SubCategory], [Brand], [Price], [ProductPicture], [ProductID]) VALUES (N'Black Backpack', N'Women', N'Backpacks', N'Delsey', 2000.0000, N'https://tse2.mm.bing.net/th/id/OIP.SYJd5Ms1gDgW0eMZckv3_gHaJ4?w=139&h=185&c=7&r=0&o=5&dpr=1.5&pid=1.7', 98)
INSERT [dbo].[Products] ([PName], [Category], [SubCategory], [Brand], [Price], [ProductPicture], [ProductID]) VALUES (N'Grey Laptop Bag', N'Unisex', N'Laptop Bags', N'HP', 600.0000, N'https://tse1.mm.bing.net/th/id/OIP.chCH7M1PG3Q4Cql6uymZMgHaGk?w=188&h=180&c=7&r=0&o=5&dpr=1.5&pid=1.7', 99)
GO
INSERT [dbo].[Products] ([PName], [Category], [SubCategory], [Brand], [Price], [ProductPicture], [ProductID]) VALUES (N'Blue Laptop Bag', N'Unisex', N'Laptop Bags', N'Vangody', 850.0000, N'https://tse1.mm.bing.net/th/id/OIP.I92zOQiQRfN3_XB3Y-Sw6gHaHa?w=186&h=186&c=7&r=0&o=5&dpr=1.5&pid=1.7', 100)
INSERT [dbo].[Products] ([PName], [Category], [SubCategory], [Brand], [Price], [ProductPicture], [ProductID]) VALUES (N'Brown Laptop Bag', N'Unisex', N'Laptop Bags', N'OakYard', 900.0000, N'https://tse3.mm.bing.net/th/id/OIP.ilQnDRZupqPEqC7WyPnJWAHaHa?w=182&h=182&c=7&r=0&o=5&dpr=1.5&pid=1.7', 101)
INSERT [dbo].[Products] ([PName], [Category], [SubCategory], [Brand], [Price], [ProductPicture], [ProductID]) VALUES (N'Women Handbag', N'Women', N'Handbags', N'Lavie', 2200.0000, N'https://tse2.mm.bing.net/th/id/OIP.vTj8skjJnaqf8fcBYHhEuQHaHa?w=216&h=215&c=7&r=0&o=5&dpr=1.5&pid=1.7', 102)
INSERT [dbo].[Products] ([PName], [Category], [SubCategory], [Brand], [Price], [ProductPicture], [ProductID]) VALUES (N'Tote Bags', N'Women', N'Handbags', N'H&M', 3300.0000, N'https://tse1.mm.bing.net/th/id/OIP.qinWno9rgSTsUheN6qXsEgHaMf?w=118&h=199&c=7&r=0&o=5&dpr=1.5&pid=1.7', 103)
INSERT [dbo].[Products] ([PName], [Category], [SubCategory], [Brand], [Price], [ProductPicture], [ProductID]) VALUES (N'Purse', N'Women', N'Handbags', N'Max Fashion', 1200.0000, N'https://tse1.mm.bing.net/th/id/OIP.9e_iolROF6ZC05_IkSDlAwHaHa?w=202&h=202&c=7&r=0&o=5&dpr=1.5&pid=1.7', 104)
INSERT [dbo].[Products] ([PName], [Category], [SubCategory], [Brand], [Price], [ProductPicture], [ProductID]) VALUES (N'Collar Shirt', N'Men', N'Shirt', N'Allen Solly', 1200.0000, N'https://tse1.mm.bing.net/th/id/OIP.EBtSaDeo8fhd4EaGbWxTGwHaLH?w=202&h=303&c=7&r=0&o=5&dpr=1.5&pid=1.7', 105)
INSERT [dbo].[Products] ([PName], [Category], [SubCategory], [Brand], [Price], [ProductPicture], [ProductID]) VALUES (N'Polo Shirt', N'Women', N'Shirt', N'Raymond', 899.0000, N'https://tse1.mm.bing.net/th/id/OIP.sjSACurDEFFCFMTvtrPa2gHaJQ?w=202&h=253&c=7&r=0&o=5&dpr=1.5&pid=1.7', 106)
INSERT [dbo].[Products] ([PName], [Category], [SubCategory], [Brand], [Price], [ProductPicture], [ProductID]) VALUES (N'Chequered Shirt', N'Men', N'Shirt', N'Van Huesen', 799.0000, N'https://tse3.mm.bing.net/th/id/OIP.4dYMTfzc2YBey_fKHXpAXgHaHa?w=202&h=202&c=7&r=0&o=5&dpr=1.5&pid=1.7', 107)
INSERT [dbo].[Products] ([PName], [Category], [SubCategory], [Brand], [Price], [ProductPicture], [ProductID]) VALUES (N'Coat Pant Style', N'Men', N'Suits', N'Allen Solly', 5999.0000, N'https://tse1.mm.bing.net/th/id/OIP.qZuexySOX6YsFUL2BCV-kQHaLH?w=202&h=303&c=7&r=0&o=5&dpr=1.5&pid=1.7', 108)
INSERT [dbo].[Products] ([PName], [Category], [SubCategory], [Brand], [Price], [ProductPicture], [ProductID]) VALUES (N'Grey Suit', N'Men', N'Suits', N'Blackberry', 7999.0000, N'https://tse2.mm.bing.net/th/id/OIP.YQpaxWLbGGuudLihMq-yvwHaJR?w=202&h=253&c=7&r=0&o=5&dpr=1.5&pid=1.7', 109)
INSERT [dbo].[Products] ([PName], [Category], [SubCategory], [Brand], [Price], [ProductPicture], [ProductID]) VALUES (N'Blue Suit', N'Men', N'Suits', N'Success', 6999.0000, N'https://tse1.mm.bing.net/th/id/OIP.hJOTPRMetXZx0tifJH3azQHaLH?w=136&h=204&c=7&r=0&o=5&dpr=1.5&pid=1.7', 110)
INSERT [dbo].[Products] ([PName], [Category], [SubCategory], [Brand], [Price], [ProductPicture], [ProductID]) VALUES (N'Formal Skirt', N'Women', N'Pencil Skirt', N'Only', 2899.0000, N'https://tse1.mm.bing.net/th/id/OIP.zfdMxGkGaRGl36BFXCTyYgHaLH?w=202&h=303&c=7&r=0&o=5&dpr=1.5&pid=1.7', 111)
INSERT [dbo].[Products] ([PName], [Category], [SubCategory], [Brand], [Price], [ProductPicture], [ProductID]) VALUES (N'Bias Cut Skirt', N'Women', N'Pencil Skirt', N'AND', 1589.0000, N'https://tse3.mm.bing.net/th/id/OIP.WD-SZEZ3NrPYkwmHt_O7OQHaKX?w=202&h=282&c=7&r=0&o=5&dpr=1.5&pid=1.7', 112)
INSERT [dbo].[Products] ([PName], [Category], [SubCategory], [Brand], [Price], [ProductPicture], [ProductID]) VALUES (N'Mini Skirt', N'Women', N'Pencil Skirt', N'Vero Moda', 1200.0000, N'https://tse3.mm.bing.net/th/id/OIP.5p7zETnYw-NI3taB2z53MQHaJ4?w=202&h=269&c=7&r=0&o=5&dpr=1.5&pid=1.7', 113)
INSERT [dbo].[Products] ([PName], [Category], [SubCategory], [Brand], [Price], [ProductPicture], [ProductID]) VALUES (N'Black Trouser', N'Men', N'Trouser', N'Kraus', 2399.0000, N'https://tse3.mm.bing.net/th/id/OIP.THxHyW6k3Z1nVxnHrfdZAQHaLH?w=202&h=303&c=7&r=0&o=5&dpr=1.5&pid=1.7', 114)
INSERT [dbo].[Products] ([PName], [Category], [SubCategory], [Brand], [Price], [ProductPicture], [ProductID]) VALUES (N'Casual Trouser', N'Unisex', N'Trouser', N'Levi', 1299.0000, N'https://tse2.mm.bing.net/th/id/OIP.2pXOX7emOzwnfHjomASMPAHaJb?w=202&h=258&c=7&r=0&o=5&dpr=1.5&pid=1.7', 115)
INSERT [dbo].[Products] ([PName], [Category], [SubCategory], [Brand], [Price], [ProductPicture], [ProductID]) VALUES (N'Grey Trouser', N'Unisex', N'Trouser', N'Wrangler', 1199.0000, N'https://tse4.mm.bing.net/th/id/OIP.XnUlddQD9XM4l3N7krJwEgHaLH?w=202&h=303&c=7&r=0&o=5&dpr=1.5&pid=1.7', 116)
INSERT [dbo].[Products] ([PName], [Category], [SubCategory], [Brand], [Price], [ProductPicture], [ProductID]) VALUES (N'Swimming Headband ', N'Men', N'Headbands', N'Decathlon', 340.0000, N'https://tse2.mm.bing.net/th/id/OIP.XnuhiECQfpd7EoX1dLDKpwHaH-?w=179&h=192&c=7&r=0&o=5&dpr=1.5&pid=1.7', 117)
INSERT [dbo].[Products] ([PName], [Category], [SubCategory], [Brand], [Price], [ProductPicture], [ProductID]) VALUES (N'Pink Shade Sunglasses', N'Unisex', N'Sunglasses', N'Rayban', 870.0000, N'https://tse3.mm.bing.net/th/id/OIP.sj8XzVg7vzuyreFociN_MAHaHa?w=191&h=191&c=7&r=0&o=5&dpr=1.5&pid=1.7', 118)
INSERT [dbo].[Products] ([PName], [Category], [SubCategory], [Brand], [Price], [ProductPicture], [ProductID]) VALUES (N'Daylight Sunglasses', N'Unisex', N'Sunglasses', N'Rayban', 990.0000, N'https://tse2.mm.bing.net/th/id/OIP.G-kZKPrbJHuQteAGqpZBfwHaHa?w=222&h=220&c=7&r=0&o=5&dpr=1.5&pid=1.7', 119)
INSERT [dbo].[Products] ([PName], [Category], [SubCategory], [Brand], [Price], [ProductPicture], [ProductID]) VALUES (N'Yellow Shade Sunglasses', N'Unisex', N'Sunglasses', N'Titan', 870.0000, N'https://tse1.mm.bing.net/th/id/OIP.aZ5E4knxy4yC5jL9TZ4QUQHaIb?w=175&h=199&c=7&r=0&o=5&dpr=1.5&pid=1.7', 120)
INSERT [dbo].[Products] ([PName], [Category], [SubCategory], [Brand], [Price], [ProductPicture], [ProductID]) VALUES (N'Bikers Gloves', N'Unisex', N'Gloves', N'Decathlon', 990.0000, N'https://tse4.mm.bing.net/th/id/OIP.jvTXkpc2c_lsGmdsOq5CngHaHa?w=193&h=193&c=7&r=0&o=5&dpr=1.5&pid=1.7', 121)
INSERT [dbo].[Products] ([PName], [Category], [SubCategory], [Brand], [Price], [ProductPicture], [ProductID]) VALUES (N'Cotton Gloves', N'Unisex', N'Gloves', N'Nike', 760.0000, N'https://tse1.mm.bing.net/th/id/OIP.wkYeYFQKiXwtT1cCcB4QGgHaHa?w=210&h=210&c=7&r=0&o=5&dpr=1.5&pid=1.7', 122)
INSERT [dbo].[Products] ([PName], [Category], [SubCategory], [Brand], [Price], [ProductPicture], [ProductID]) VALUES (N'Brown Gloves', N'Unisex', N'Gloves', N'Adidas', 880.0000, N'https://tse2.mm.bing.net/th/id/OIP.38ZmmFxeaa7loEi3PwlRRgHaHa?w=194&h=194&c=7&r=0&o=5&dpr=1.5&pid=1.7', 123)
INSERT [dbo].[Products] ([PName], [Category], [SubCategory], [Brand], [Price], [ProductPicture], [ProductID]) VALUES (N'Black Suspenders ', N'Men', N'Suspenders', N'Raymond', 1200.0000, N'https://tse4.mm.bing.net/th/id/OIP.YhBVCOnUHL47KNp8UJwC-QHaIZ?w=189&h=215&c=7&r=0&o=5&dpr=1.5&pid=1.7', 124)
INSERT [dbo].[Products] ([PName], [Category], [SubCategory], [Brand], [Price], [ProductPicture], [ProductID]) VALUES (N'Women Suit Suspenders', N'Women', N'Suspenders', N'JAKIMAC', 1500.0000, N'https://tse1.mm.bing.net/th/id/OIP.XP4WgZ-iIv71uOogs0yckQHaHa?w=202&h=202&c=7&r=0&o=5&dpr=1.5&pid=1.7', 125)
INSERT [dbo].[Products] ([PName], [Category], [SubCategory], [Brand], [Price], [ProductPicture], [ProductID]) VALUES (N'Brown Lipstick', N'Women', N'Lipsticks', N'Maybelline', 340.0000, N'https://tse4.mm.bing.net/th/id/OIP.p4Mkl1Hf25HUWwaQJIYrsgHaHa?w=135&h=180&c=7&r=0&o=5&dpr=1.5&pid=1.7', 126)
INSERT [dbo].[Products] ([PName], [Category], [SubCategory], [Brand], [Price], [ProductPicture], [ProductID]) VALUES (N'Pink Lipstick', N'Women', N'Lipsticks', N'Mama Earth', 290.0000, N'https://tse2.mm.bing.net/th/id/OIP.oDMHg30hf594JYdO_Cw6aAHaOX?w=115&h=210&c=7&r=0&o=5&dpr=1.5&pid=1.7', 127)
INSERT [dbo].[Products] ([PName], [Category], [SubCategory], [Brand], [Price], [ProductPicture], [ProductID]) VALUES (N'Liquid Matte Lipstick', N'Women', N'Lipsticks', N'Lakme', 345.0000, N'https://tse1.mm.bing.net/th/id/OIP.7JqRXjHCWJkgFK4b5gHm8AHaEK?w=315&h=180&c=7&r=0&o=5&dpr=1.5&pid=1.7', 128)
INSERT [dbo].[Products] ([PName], [Category], [SubCategory], [Brand], [Price], [ProductPicture], [ProductID]) VALUES (N'Clay Mask', N'Unisex', N'Face', N'Dot & Key', 650.0000, N'https://tse1.mm.bing.net/th/id/OIP.2xAvXq50jiOpRStSjf5WTAHaHa?w=178&h=180&c=7&r=0&o=5&dpr=1.5&pid=1.7', 129)
INSERT [dbo].[Products] ([PName], [Category], [SubCategory], [Brand], [Price], [ProductPicture], [ProductID]) VALUES (N'Blush', N'Unisex', N'Face', N'Maybelline', 760.0000, N'https://tse1.mm.bing.net/th/id/OIP.8EvupjhvF5EVlbHjW9IcfQHaHZ?w=185&h=184&c=7&r=0&o=5&dpr=1.5&pid=1.7', 130)
INSERT [dbo].[Products] ([PName], [Category], [SubCategory], [Brand], [Price], [ProductPicture], [ProductID]) VALUES (N'Eyebrow Gel', N'Unisex', N'Face', N'Elf', 870.0000, N'https://tse1.mm.bing.net/th/id/OIP.u_ChUEpQnIUMGuSRBZUupQHaJ4?w=142&h=189&c=7&r=0&o=5&dpr=1.5&pid=1.7', 131)
INSERT [dbo].[Products] ([PName], [Category], [SubCategory], [Brand], [Price], [ProductPicture], [ProductID]) VALUES (N'Nailpaint Remover', N'Women', N'Nails', N'Elf', 150.0000, N'https://tse3.mm.bing.net/th/id/OIP.Q6mRZvhfxKcf29O2BU6sTgHaEK?w=264&h=180&c=7&r=0&o=5&dpr=1.5&pid=1.7', 132)
INSERT [dbo].[Products] ([PName], [Category], [SubCategory], [Brand], [Price], [ProductPicture], [ProductID]) VALUES (N'Matte Nailpaint', N'Women', N'Nails', N'Lakme', 230.0000, N'https://tse4.mm.bing.net/th/id/OIP.s3rZImrxaq86McWrZDGXCAHaIy?w=171&h=203&c=7&r=0&o=5&dpr=1.5&pid=1.7', 133)
INSERT [dbo].[Products] ([PName], [Category], [SubCategory], [Brand], [Price], [ProductPicture], [ProductID]) VALUES (N'Eyeshadow', N'Women', N'Eyes', N'Lakme', 330.0000, N'https://tse4.mm.bing.net/th/id/OIP.gktXI2bLm_yk6ikp1UeYTgHaIa?w=163&h=185&c=7&r=0&o=5&dpr=1.5&pid=1.7', 134)
INSERT [dbo].[Products] ([PName], [Category], [SubCategory], [Brand], [Price], [ProductPicture], [ProductID]) VALUES (N'Kajal', N'Women', N'Eyes', N'Lakme', 450.0000, N'https://tse1.mm.bing.net/th/id/OIP.L3xeXKZ5yX0AeDNjlIKg7AHaHa?w=185&h=185&c=7&r=0&o=5&dpr=1.5&pid=1.7', 135)
INSERT [dbo].[Products] ([PName], [Category], [SubCategory], [Brand], [Price], [ProductPicture], [ProductID]) VALUES (N'Coloured Lens', N'Women', N'Eyes', N'Lenskart', 7890.0000, N'https://tse3.mm.bing.net/th/id/OIP.8r6fL_PaA77W40QPaRs2zwHaE6?w=227&h=180&c=7&r=0&o=5&dpr=1.5&pid=1.7', 136)
INSERT [dbo].[Products] ([PName], [Category], [SubCategory], [Brand], [Price], [ProductPicture], [ProductID]) VALUES (N'Eye Patches', N'Unisex', N'Skin Care', N'Dot & Key', 890.0000, N'https://tse3.mm.bing.net/th/id/OIP.8r6fL_PaA77W40QPaRs2zwHaE6?w=227&h=180&c=7&r=0&o=5&dpr=1.5&pid=1.7', 137)
INSERT [dbo].[Products] ([PName], [Category], [SubCategory], [Brand], [Price], [ProductPicture], [ProductID]) VALUES (N'Body Cream', N'Unisex', N'Skin Care', N'Nivea', 340.0000, N'https://tse2.mm.bing.net/th/id/OIP.YhtsTpQ1Fh3Ov3PSTjhoKAHaJu?w=145&h=190&c=7&r=0&o=5&dpr=1.5&pid=1.7', 138)
INSERT [dbo].[Products] ([PName], [Category], [SubCategory], [Brand], [Price], [ProductPicture], [ProductID]) VALUES (N'Eye Cream', N'Unisex', N'Skin Care', N'Mama Earth', 540.0000, N'https://tse4.mm.bing.net/th/id/OIP.BuWy5EfiOWKBzHXLNPg_rwHaJ4?w=131&h=180&c=7&r=0&o=5&dpr=1.5&pid=1.7', 139)
INSERT [dbo].[Products] ([PName], [Category], [SubCategory], [Brand], [Price], [ProductPicture], [ProductID]) VALUES (N'Tinted Sunscreen', N'Unisex', N'Sunscreen', N'Lakme', 670.0000, N'https://tse2.mm.bing.net/th/id/OIP.3HnRQSHWYU0TL36BlUGTKAAAAA?w=131&h=218&c=7&r=0&o=5&dpr=1.5&pid=1.7', 140)
INSERT [dbo].[Products] ([PName], [Category], [SubCategory], [Brand], [Price], [ProductPicture], [ProductID]) VALUES (N'UV Protection', N'Unisex', N'Sunscreen', N'Dot & Key', 880.0000, N'https://tse2.mm.bing.net/th/id/OIP.3HnRQSHWYU0TL36BlUGTKAAAAA?w=131&h=218&c=7&r=0&o=5&dpr=1.5&pid=1.7', 141)
INSERT [dbo].[Products] ([PName], [Category], [SubCategory], [Brand], [Price], [ProductPicture], [ProductID]) VALUES (N'Black Helmet', N'Unisex', N'Helmets & Gears', N'Reevu', 11000.0000, N'https://tse2.mm.bing.net/th/id/OIP.EbutQGRI8_x1z7k67NswngHaHa?w=181&h=181&c=7&r=0&o=5&dpr=1.5&pid=1.7', 142)
INSERT [dbo].[Products] ([PName], [Category], [SubCategory], [Brand], [Price], [ProductPicture], [ProductID]) VALUES (N'Red Helmet', N'Men', N'Helmets & Gears', N'Reevu', 10000.0000, N'https://tse2.mm.bing.net/th/id/OIP.EbutQGRI8_x1z7k67NswngHaHa?w=181&h=181&c=7&r=0&o=5&dpr=1.5&pid=1.7', 143)
INSERT [dbo].[Products] ([PName], [Category], [SubCategory], [Brand], [Price], [ProductPicture], [ProductID]) VALUES (N'Blue Helmet', N'Unisex', N'Helmets & Gears', N'Hercules', 13000.0000, N'https://tse2.mm.bing.net/th/id/OIP.aOiioPprAaflCK9RX-WWOwHaH7?w=178&h=191&c=7&r=0&o=5&dpr=1.5&pid=1.7', 144)
INSERT [dbo].[Products] ([PName], [Category], [SubCategory], [Brand], [Price], [ProductPicture], [ProductID]) VALUES (N'Blue Yoga Mat', N'Unisex', N'Yoga', N'Energetics', 1200.0000, N'https://tse3.mm.bing.net/th/id/OIP.Fz1lAr4C9FQV6qovvAAScQHaHa?w=199&h=199&c=7&r=0&o=5&dpr=1.5&pid=1.7', 145)
INSERT [dbo].[Products] ([PName], [Category], [SubCategory], [Brand], [Price], [ProductPicture], [ProductID]) VALUES (N'Red Yoga Mat', N'Unisex', N'Yoga', N'Energetics', 1100.0000, N'https://tse4.mm.bing.net/th/id/OIP.jOnbH65h2fwEJzKamsYzWwHaHa?w=182&h=182&c=7&r=0&o=5&dpr=1.5&pid=1.7', 146)
INSERT [dbo].[Products] ([PName], [Category], [SubCategory], [Brand], [Price], [ProductPicture], [ProductID]) VALUES (N'Office Blazer White', N'Women', N'Blazers', N'Van Heusen', 3400.0000, N'https://tse1.mm.bing.net/th/id/OIP.qoZkM8TM8eUTkpHe5q0gGQHaHa?w=208&h=208&c=7&r=0&o=5&dpr=1.5&pid=1.7', 147)
INSERT [dbo].[Products] ([PName], [Category], [SubCategory], [Brand], [Price], [ProductPicture], [ProductID]) VALUES (N'Grey Office Blazer', N'Men', N'Blazers', N'Allen Solly', 3200.0000, N'https://tse3.mm.bing.net/th/id/OIP.bNV6CJ9CJhLPC8HKfdsVdQHaLH?w=202&h=303&c=7&r=0&o=5&dpr=1.5&pid=1.7', 148)
INSERT [dbo].[Products] ([PName], [Category], [SubCategory], [Brand], [Price], [ProductPicture], [ProductID]) VALUES (N'Women''s Blazer', N'Women', N'Blazers', N'Elle', 2100.0000, N'https://tse3.mm.bing.net/th/id/OIP.bNV6CJ9CJhLPC8HKfdsVdQHaLH?w=202&h=303&c=7&r=0&o=5&dpr=1.5&pid=1.7', 149)
INSERT [dbo].[Products] ([PName], [Category], [SubCategory], [Brand], [Price], [ProductPicture], [ProductID]) VALUES (N'Ripped Jeans', N'Men', N'Jeans', N'Wrangler', 4300.0000, N'https://tse3.mm.bing.net/th/id/OIP.bNV6CJ9CJhLPC8HKfdsVdQHaLH?w=202&h=303&c=7&r=0&o=5&dpr=1.5&pid=1.7', 150)
INSERT [dbo].[Products] ([PName], [Category], [SubCategory], [Brand], [Price], [ProductPicture], [ProductID]) VALUES (N'Black Jeans', N'Women', N'Jeans', N'Levis', 4200.0000, N'https://tse3.mm.bing.net/th/id/OIP.bNV6CJ9CJhLPC8HKfdsVdQHaLH?w=202&h=303&c=7&r=0&o=5&dpr=1.5&pid=1.7', 151)
INSERT [dbo].[Products] ([PName], [Category], [SubCategory], [Brand], [Price], [ProductPicture], [ProductID]) VALUES (N'Bodycon Dress', N'Women', N'Dresses', N'BerryLush', 1100.0000, N'https://tse3.mm.bing.net/th/id/OIP.bNV6CJ9CJhLPC8HKfdsVdQHaLH?w=202&h=303&c=7&r=0&o=5&dpr=1.5&pid=1.7', 152)
INSERT [dbo].[Products] ([PName], [Category], [SubCategory], [Brand], [Price], [ProductPicture], [ProductID]) VALUES (N'Party Dress', N'Women', N'Dresses', N'Max', 2100.0000, N'https://tse4.mm.bing.net/th/id/OIP.T_RvM0nUkRpeJ6CdtHMRZAHaLH?w=202&h=303&c=7&r=0&o=5&dpr=1.5&pid=1.7', 153)
INSERT [dbo].[Products] ([PName], [Category], [SubCategory], [Brand], [Price], [ProductPicture], [ProductID]) VALUES (N'Red Dress', N'Women', N'Dresses', N'WestSide', 1100.0000, N'https://tse3.mm.bing.net/th/id/OIP.uOU5QCs0eP20Qm0sVqfY9QHaLz?w=197&h=315&c=7&r=0&o=5&dpr=1.5&pid=1.7', 154)
INSERT [dbo].[Products] ([PName], [Category], [SubCategory], [Brand], [Price], [ProductPicture], [ProductID]) VALUES (N'Red Jump Suit', N'Women', N'Jump Suits', N'Max', 1300.0000, N'https://th.bing.com/th/id/OIP.IFbCDfjfqZPV3YMlVUZB5AHaLH?w=202&h=303&c=7&r=0&o=5&dpr=1.5&pid=1.7', 155)
INSERT [dbo].[Products] ([PName], [Category], [SubCategory], [Brand], [Price], [ProductPicture], [ProductID]) VALUES (N'Green Jump Suit', N'Women', N'Jump Suits', N'Mango', 6500.0000, N'https://th.bing.com/th/id/OIP.O7JC9hJXLEys4g0DcHsnbAHaLH?w=202&h=303&c=7&r=0&o=5&dpr=1.5&pid=1.7', 156)
INSERT [dbo].[Products] ([PName], [Category], [SubCategory], [Brand], [Price], [ProductPicture], [ProductID]) VALUES (N'Swimming Shorts', N'Women', N'Shorts', N'HRX', 1300.0000, N'https://th.bing.com/th/id/OIP.PP7SkWBqFsHjRXBlNt2LLAHaJ4?w=202&h=269&c=7&r=0&o=5&dpr=1.5&pid=1.7', 157)
INSERT [dbo].[Products] ([PName], [Category], [SubCategory], [Brand], [Price], [ProductPicture], [ProductID]) VALUES (N'Jeans Shorts', N'Women', N'Shorts', N'Levis', 1500.0000, N'https://th.bing.com/th/id/OIP.-oEXxhBCpPnewXNeMkLMlgHaJ4?w=202&h=269&c=7&r=0&o=5&dpr=1.5&pid=1.7', 158)
INSERT [dbo].[Products] ([PName], [Category], [SubCategory], [Brand], [Price], [ProductPicture], [ProductID]) VALUES (N'Black Shorts', N'Women', N'Shorts', N'Berrylush', 1600.0000, N'https://th.bing.com/th/id/OIP.Qf4LugBicpoiibgMJvuqywHaJQ?w=202&h=253&c=7&r=0&o=5&dpr=1.5&pid=1.7', 159)
INSERT [dbo].[Products] ([PName], [Category], [SubCategory], [Brand], [Price], [ProductPicture], [ProductID]) VALUES (N'Black T-Shirt', N'Men', N'T Shirts', N'Mango', 3200.0000, N'https://th.bing.com/th/id/OIP.Z5-tnD5ono1apYF2Rg5gdgHaHa?w=180&h=180&c=7&r=0&o=5&dpr=1.5&pid=1.7', 160)
INSERT [dbo].[Products] ([PName], [Category], [SubCategory], [Brand], [Price], [ProductPicture], [ProductID]) VALUES (N'Pink T-Shirt', N'Women', N'T Shirts', N'Puma', 3100.0000, N'https://th.bing.com/th/id/OIP.181yiw3RgVwohh0wbVNCwgHaJT?w=158&h=198&c=7&r=0&o=5&dpr=1.5&pid=1.7', 161)
INSERT [dbo].[Products] ([PName], [Category], [SubCategory], [Brand], [Price], [ProductPicture], [ProductID]) VALUES (N'Swimming Shirt', N'Unisex', N'T Shirts', N'Adidas', 2100.0000, N'https://th.bing.com/th/id/OIP.XCq_6jHA-_Eq-_tRRoBNagHaHa?w=200&h=200&c=7&r=0&o=5&dpr=1.5&pid=1.7', 162)
INSERT [dbo].[Products] ([PName], [Category], [SubCategory], [Brand], [Price], [ProductPicture], [ProductID]) VALUES (N'Red Skirt', N'Women', N'Skirt', N'Berrylush', 1200.0000, N'https://th.bing.com/th/id/OIP.S9id4Cl5DAWu1-TDuul92AHaIf?w=202&h=232&c=7&r=0&o=5&dpr=1.5&pid=1.7', 163)
INSERT [dbo].[Products] ([PName], [Category], [SubCategory], [Brand], [Price], [ProductPicture], [ProductID]) VALUES (N'White Skirt', N'Women', N'Skirt', N'Mango', 1100.0000, N'https://th.bing.com/th/id/OIP.Ge0IFMrxaV7DA7QjOPUQ4AHaLH?w=202&h=303&c=7&r=0&o=5&dpr=1.5&pid=1.7', 164)
INSERT [dbo].[Products] ([PName], [Category], [SubCategory], [Brand], [Price], [ProductPicture], [ProductID]) VALUES (N'Striped Skirt', N'Women', N'Skirt', N'Mango', 3200.0000, N'https://tse4.mm.bing.net/th/id/OIP.4a2zP2zPdIQWXekB53ru3wHaIX?w=202&h=228&c=7&r=0&o=5&dpr=1.5&pid=1.7', 165)
INSERT [dbo].[Products] ([PName], [Category], [SubCategory], [Brand], [Price], [ProductPicture], [ProductID]) VALUES (N'Holi White Kurta', N'Men', N'Kurtas', N'Akina', 1300.0000, N'https://tse3.mm.bing.net/th/id/OIP.9xYbobiEzx2lqu_gGr3iiQHaKL?w=202&h=278&c=7&r=0&o=5&dpr=1.5&pid=1.7', 166)
INSERT [dbo].[Products] ([PName], [Category], [SubCategory], [Brand], [Price], [ProductPicture], [ProductID]) VALUES (N'Yellow Kurta', N'Women', N'Kurtas', N'Biba', 3200.0000, N'https://www.bing.com/th/id/OIP.AJQPWkmI15wHV2fP4p6DZwHaLI?w=202&h=304&c=7&r=0&o=5&dpr=1.5&pid=1.7', 167)
INSERT [dbo].[Products] ([PName], [Category], [SubCategory], [Brand], [Price], [ProductPicture], [ProductID]) VALUES (N'Diwali Salwar Suit', N'Women', N'Salvar Suit', N'Biba', 5100.0000, N'https://tse1.mm.bing.net/th/id/OIP.uG1ArWjPz0I7mIt0TR_IRwHaJQ?w=202&h=253&c=7&r=0&o=5&dpr=1.5&pid=1.7', 168)
INSERT [dbo].[Products] ([PName], [Category], [SubCategory], [Brand], [Price], [ProductPicture], [ProductID]) VALUES (N'Holi Kurta Set', N'Women', N'Salvar Suit', N'Akina', 3200.0000, N'https://tse2.mm.bing.net/th/id/OIP.yxMho21pAIROHw7gy75NxgHaJ4?w=202&h=269&c=7&r=0&o=5&dpr=1.5&pid=1.7', 169)
INSERT [dbo].[Products] ([PName], [Category], [SubCategory], [Brand], [Price], [ProductPicture], [ProductID]) VALUES (N'Purple Lehenga', N'Women', N'Lehenga Choli', N'Libas', 1600.0000, N'https://th.bing.com/th/id/OIP.aTgrSPT2SI7B3yI1bIQfGAHaKt?w=202&h=293&c=7&r=0&o=5&dpr=1.5&pid=1.7', 170)
INSERT [dbo].[Products] ([PName], [Category], [SubCategory], [Brand], [Price], [ProductPicture], [ProductID]) VALUES (N'Red Lehenga', N'Women', N'Lehenga Choli', N'Biba', 1800.0000, N'https://th.bing.com/th/id/OIP.lk6EBC557T13epCxjpgYYAHaKT?w=202&h=281&c=7&r=0&o=5&dpr=1.5&pid=1.7', 171)
INSERT [dbo].[Products] ([PName], [Category], [SubCategory], [Brand], [Price], [ProductPicture], [ProductID]) VALUES (N'Chiffon Lehenga', N'Women', N'Lehenga Choli', N'Libas', 2000.0000, N'https://th.bing.com/th/id/OIP.Y1fNy4UoqYItEK5L1CAzlgHaKa?w=202&h=285&c=7&r=0&o=5&dpr=1.5&pid=1.7', 172)
INSERT [dbo].[Products] ([PName], [Category], [SubCategory], [Brand], [Price], [ProductPicture], [ProductID]) VALUES (N'Madrasi Saree', N'Women', N'Saree', N'Manduka', 2100.0000, N'https://th.bing.com/th/id/OIP.7t8E4AEuzIS7_dPvB5ldiAHaJQ?w=202&h=253&c=7&r=0&o=5&dpr=1.5&pid=1.7', 173)
INSERT [dbo].[Products] ([PName], [Category], [SubCategory], [Brand], [Price], [ProductPicture], [ProductID]) VALUES (N'Black Saree', N'Wpmen', N'Saree', N'Libas', 2300.0000, N'https://th.bing.com/th/id/OIP.it44jeSQ24PpG_b7wFGpWwHaKL?w=202&h=278&c=7&r=0&o=5&dpr=1.5&pid=1.7', 174)
INSERT [dbo].[Products] ([PName], [Category], [SubCategory], [Brand], [Price], [ProductPicture], [ProductID]) VALUES (N'Diamond Earrings', N'Women', N'Earings', N'Tanishq', 76000.0000, N'https://th.bing.com/th/id/OIP.g2vH8e8QHJbXv38-puyyigHaHa?w=216&h=215&c=7&r=0&o=5&dpr=1.5&pid=1.7', 175)
INSERT [dbo].[Products] ([PName], [Category], [SubCategory], [Brand], [Price], [ProductPicture], [ProductID]) VALUES (N'Silver Earrings', N'Women', N'Earings', N'Caratlane', 32000.0000, N'https://th.bing.com/th/id/OIP.mhyeSB_Jj2_9BlDR0J4PrAHaHa?w=189&h=189&c=7&r=0&o=5&dpr=1.5&pid=1.7', 176)
INSERT [dbo].[Products] ([PName], [Category], [SubCategory], [Brand], [Price], [ProductPicture], [ProductID]) VALUES (N'Red Bangles', N'Women', N'Bangles', N'GIVA', 43000.0000, N'https://th.bing.com/th/id/OIP.KIa4oSe71FW0bpM9AuB5zwHaKs?w=147&h=212&c=7&r=0&o=5&dpr=1.5&pid=1.7', 177)
INSERT [dbo].[Products] ([PName], [Category], [SubCategory], [Brand], [Price], [ProductPicture], [ProductID]) VALUES (N'White Bangles', N'Women', N'Bangles', N'Tanishq', 21000.0000, N'https://th.bing.com/th/id/OIP.RVP2_AYH0hKmgk9o7ciXFgHaHa?w=201&h=201&c=7&r=0&o=5&dpr=1.5&pid=1.7', 178)
INSERT [dbo].[Products] ([PName], [Category], [SubCategory], [Brand], [Price], [ProductPicture], [ProductID]) VALUES (N'Green Bangles', N'Women', N'Bangles', N'Caratlane', 16000.0000, N'https://th.bing.com/th/id/OIP.8J9OOh-9i20x7ePqlOvmzgAAAA?w=276&h=198&c=7&r=0&o=5&dpr=1.5&pid=1.7', 179)
INSERT [dbo].[Products] ([PName], [Category], [SubCategory], [Brand], [Price], [ProductPicture], [ProductID]) VALUES (N'Silver Bracelet', N'Men', N'Bracelet', N'Caratlane', 45000.0000, N'https://th.bing.com/th/id/OIP._dslW_bRNFjXOoSqQyznewHaFv?w=276&h=215&c=7&r=0&o=5&dpr=1.5&pid=1.7', 181)
INSERT [dbo].[Products] ([PName], [Category], [SubCategory], [Brand], [Price], [ProductPicture], [ProductID]) VALUES (N'Oxidised Bracelet', N'Women', N'Bracelet', N'Tanishq', 31000.0000, N'https://th.bing.com/th/id/OIP.q8foINjkf2lPEB1bUgwanQHaHa?w=202&h=202&c=7&r=0&o=5&dpr=1.5&pid=1.7', 182)
INSERT [dbo].[Products] ([PName], [Category], [SubCategory], [Brand], [Price], [ProductPicture], [ProductID]) VALUES (N'Orange Saree', N'Women', N'Saree', N'Akina', 32000.0000, N'https://th.bing.com/th/id/OIP.EmTDWIEfxdzq83M4Y1Y2WQHaQm?w=156&h=350&c=7&r=0&o=5&dpr=1.5&pid=1.7', 183)
INSERT [dbo].[Products] ([PName], [Category], [SubCategory], [Brand], [Price], [ProductPicture], [ProductID]) VALUES (N'Chiffon Kurta Set', N'Women', N'Salvar Suit', N'Libas', 2300.0000, N'https://tse3.mm.bing.net/th/id/OIP.wZmffUUPStcua19GcoSzWAHaJQ?w=202&h=253&c=7&r=0&o=5&dpr=1.5&pid=1.7', 184)
INSERT [dbo].[Products] ([PName], [Category], [SubCategory], [Brand], [Price], [ProductPicture], [ProductID]) VALUES (N'Magenta Kurta', N'Women', N'Kurtas', N'Akina', 1300.0000, N'https://th.bing.com/th/id/OIP.2Uen1m2CB02ZO4xfvxR91AHaJh?w=202&h=260&c=7&r=0&o=5&dpr=1.5&pid=1.7', 185)
INSERT [dbo].[Products] ([PName], [Category], [SubCategory], [Brand], [Price], [ProductPicture], [ProductID]) VALUES (N'Non Leather Suspenders', N'Women', N'Suspenders', N'Raymond', 1300.0000, N'https://th.bing.com/th/id/OIP.gMQOvuhwEO85hyRWWMhrlwHaHa?w=220&h=220&c=7&r=0&o=5&dpr=1.5&pid=1.7', 186)
INSERT [dbo].[Products] ([PName], [Category], [SubCategory], [Brand], [Price], [ProductPicture], [ProductID]) VALUES (N'Liquid Matte Lipstick Pink', N'Women', N'Lipsticks', N'Lakme', 235.0000, N'https://th.bing.com/th/id/OIP.DE6leB8j-RyMSPoxPD8U8wHaI1?w=167&h=199&c=7&r=0&o=5&dpr=1.5&pid=1.7', 187)
INSERT [dbo].[Products] ([PName], [Category], [SubCategory], [Brand], [Price], [ProductPicture], [ProductID]) VALUES (N'Grey T-Shirt ', N'Unisex', N'T Shirts', N'HRX', 430.0000, N'https://th.bing.com/th/id/OIP.GSrZFrsW4tN7DP-VPf2RvwHaHa?w=212&h=212&c=7&r=0&o=5&dpr=1.5&pid=1.7', 188)
INSERT [dbo].[Products] ([PName], [Category], [SubCategory], [Brand], [Price], [ProductPicture], [ProductID]) VALUES (N'Zara Perfume', N'Women', N'Perfumes & Deos', N'Zara', 2389.0000, N'https://tse3.mm.bing.net/th/id/OIP.3qRQyLp-Hm788A6iviMRzgHaHc?w=205&h=206&c=7&r=0&o=5&dpr=1.5&pid=1.7', 189)
INSERT [dbo].[Products] ([PName], [Category], [SubCategory], [Brand], [Price], [ProductPicture], [ProductID]) VALUES (N'Floral Aura', N'Women', N'Perfumes & Deos', N'Engage', 670.0000, N'https://tse2.mm.bing.net/th/id/OIP.G0GIRmyBkNqcG0VvA0wDIQHaHa?w=226&h=220&c=7&r=0&o=5&dpr=1.5&pid=1.7', 190)
INSERT [dbo].[Products] ([PName], [Category], [SubCategory], [Brand], [Price], [ProductPicture], [ProductID]) VALUES (N'Beach vibe', N'Men', N'Perfumes & Deos', N'Westside', 899.0000, N'https://tse1.mm.bing.net/th/id/OIP.AI3mJSSdrxoQzQKZ16YdEAHaHa?w=202&h=202&c=7&r=0&o=5&dpr=1.5&pid=1.7', 191)
INSERT [dbo].[Products] ([PName], [Category], [SubCategory], [Brand], [Price], [ProductPicture], [ProductID]) VALUES (N'Shaving Cream', N'Men', N'Shaving Kit', N'Park Avenue', 355.0000, N'https://tse2.mm.bing.net/th/id/OIP.RfMKpd1PfJgOTDHJ4njv5QHaHa?w=250&h=188&c=7&r=0&o=5&dpr=1.5&pid=1.7', 192)
INSERT [dbo].[Products] ([PName], [Category], [SubCategory], [Brand], [Price], [ProductPicture], [ProductID]) VALUES (N'Trimmer', N'Men', N'Shaving Kit', N'Gillete', 450.0000, N'https://tse4.mm.bing.net/th/id/OIP.0EJz03zFQ2pzci3LORwf1AHaKA?w=130&h=180&c=7&r=0&o=5&dpr=1.5&pid=1.7', 193)
INSERT [dbo].[Products] ([PName], [Category], [SubCategory], [Brand], [Price], [ProductPicture], [ProductID]) VALUES (N'Razor', N'Men', N'Shaving Kit', N'Gillete', 299.0000, N'https://tse4.mm.bing.net/th/id/OIP.6qiR_cvR_2DSTCn0QmB3eAHaHZ?w=193&h=191&c=7&r=0&o=5&dpr=1.5&pid=1.7', 194)
INSERT [dbo].[Products] ([PName], [Category], [SubCategory], [Brand], [Price], [ProductPicture], [ProductID]) VALUES (N'Red color', N'Unisex', N'Hair Colour', N'Streax', 699.0000, N'https://tse3.mm.bing.net/th/id/OIP.4QHq_zpl0DFVqwsisAypCgAAAA?w=202&h=202&c=7&r=0&o=5&dpr=1.5&pid=1.7', 195)
INSERT [dbo].[Products] ([PName], [Category], [SubCategory], [Brand], [Price], [ProductPicture], [ProductID]) VALUES (N'Blonde color', N'Unisex', N'Hair Colour', N'BBlunt', 799.0000, N'https://tse4.mm.bing.net/th/id/OIP.pag2QvLNs_MwE2arCm5gMwHaHa?w=202&h=202&c=7&r=0&o=5&dpr=1.5&pid=1.7', 196)
INSERT [dbo].[Products] ([PName], [Category], [SubCategory], [Brand], [Price], [ProductPicture], [ProductID]) VALUES (N'Blue color', N'Unisex', N'Hair Colour', N'Loreal', 789.0000, N'https://tse3.mm.bing.net/th/id/OIP.g9QpzxyKhwq0DDlmxD2_ywHaJ4?w=157&h=209&c=7&r=0&o=5&dpr=1.5&pid=1.7', 197)
INSERT [dbo].[Products] ([PName], [Category], [SubCategory], [Brand], [Price], [ProductPicture], [ProductID]) VALUES (N'Wax Strips', N'Women', N'Razor & Trimmer', N'Veet', 259.0000, N'https://tse1.mm.bing.net/th/id/OIP.rJw14H0IsN5AREE1w1UtOwHaHa?w=190&h=190&c=7&r=0&o=5&dpr=1.5&pid=1.7', 198)
INSERT [dbo].[Products] ([PName], [Category], [SubCategory], [Brand], [Price], [ProductPicture], [ProductID]) VALUES (N'Women razor', N'Women', N'Razor & Trimmer', N'Veet', 89.0000, N'https://tse4.mm.bing.net/th/id/OIP.HE5DDafdiVI8PzNfqH-AxQHaHa?w=188&h=188&c=7&r=0&o=5&dpr=1.5&pid=1.7', 199)
INSERT [dbo].[Products] ([PName], [Category], [SubCategory], [Brand], [Price], [ProductPicture], [ProductID]) VALUES (N'Diamond Bracelet', N'Women', N'Bracelet', N'Swarovski', 21000.0000, N'https://tse2.mm.bing.net/th/id/OIP.3e84qipXFOP6j2Mic8nemgHaHa?w=208&h=209&c=7&r=0&o=5&dpr=1.5&pid=1.7', 203)
GO
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
USE [master]
GO
ALTER DATABASE [MyntraDB] SET  READ_WRITE 
GO

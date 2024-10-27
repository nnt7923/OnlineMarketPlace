USE [master]
GO
/****** Object:  Database [mk5]    Script Date: 27/10/2024 12:27:13 CH ******/
CREATE DATABASE [mk5]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'mk5', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.NTRUONG\MSSQL\DATA\mk5.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'mk5_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.NTRUONG\MSSQL\DATA\mk5_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [mk5] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [mk5].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [mk5] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [mk5] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [mk5] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [mk5] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [mk5] SET ARITHABORT OFF 
GO
ALTER DATABASE [mk5] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [mk5] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [mk5] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [mk5] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [mk5] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [mk5] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [mk5] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [mk5] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [mk5] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [mk5] SET  ENABLE_BROKER 
GO
ALTER DATABASE [mk5] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [mk5] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [mk5] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [mk5] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [mk5] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [mk5] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [mk5] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [mk5] SET RECOVERY FULL 
GO
ALTER DATABASE [mk5] SET  MULTI_USER 
GO
ALTER DATABASE [mk5] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [mk5] SET DB_CHAINING OFF 
GO
ALTER DATABASE [mk5] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [mk5] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [mk5] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [mk5] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'mk5', N'ON'
GO
ALTER DATABASE [mk5] SET QUERY_STORE = OFF
GO
USE [mk5]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 27/10/2024 12:27:13 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[account_id] [int] IDENTITY(1,1) NOT NULL,
	[username] [nvarchar](100) NOT NULL,
	[password] [nvarchar](255) NOT NULL,
	[email] [nvarchar](255) NOT NULL,
	[phone] [nvarchar](20) NULL,
	[address] [nvarchar](255) NULL,
	[role_id] [int] NULL,
	[status] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[account_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Brand]    Script Date: 27/10/2024 12:27:13 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Brand](
	[brand_id] [int] IDENTITY(1,1) NOT NULL,
	[brandName] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[brand_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cart]    Script Date: 27/10/2024 12:27:13 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cart](
	[cart_id] [int] NOT NULL,
	[account_id] [int] NOT NULL,
 CONSTRAINT [PK_Cart] PRIMARY KEY CLUSTERED 
(
	[cart_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CartDetails]    Script Date: 27/10/2024 12:27:13 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CartDetails](
	[cart_id] [int] NOT NULL,
	[pd_id] [int] NOT NULL,
	[quantity] [int] NOT NULL,
 CONSTRAINT [PK_Cart_ProductDetail] PRIMARY KEY CLUSTERED 
(
	[cart_id] ASC,
	[pd_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 27/10/2024 12:27:13 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[cid] [int] IDENTITY(1,1) NOT NULL,
	[cname] [nvarchar](100) NOT NULL,
	[cimg] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[cid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 27/10/2024 12:27:13 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[customer_id] [int] IDENTITY(1,1) NOT NULL,
	[customer_name] [nvarchar](255) NOT NULL,
	[customer_type] [nvarchar](50) NULL,
	[account_id] [int] NULL,
	[customer_dob] [date] NULL,
	[customer_gender] [varchar](50) NULL,
	[customer_images] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[customer_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Feedback]    Script Date: 27/10/2024 12:27:13 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Feedback](
	[feedback_id] [int] IDENTITY(1,1) NOT NULL,
	[account_id] [int] NULL,
	[product_id] [int] NULL,
	[rating] [int] NULL,
	[create_date] [date] NOT NULL,
	[customer_id] [int] NULL,
	[feedback_content] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[feedback_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 27/10/2024 12:27:13 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[order_id] [int] NOT NULL,
	[pd_id] [int] NOT NULL,
	[productName] [nvarchar](50) NULL,
	[productPrice] [money] NULL,
	[quantity] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[order_id] ASC,
	[pd_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 27/10/2024 12:27:13 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[order_id] [int] IDENTITY(1,1) NOT NULL,
	[totalPrice] [float] NULL,
	[note] [nvarchar](255) NULL,
	[create_date] [date] NOT NULL,
	[shipping_id] [int] NULL,
	[customer_id] [int] NULL,
	[status_id] [int] NOT NULL,
	[payment] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK__Orders__46596229CD1E1762] PRIMARY KEY CLUSTERED 
(
	[order_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 27/10/2024 12:27:13 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[product_id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NOT NULL,
	[img] [nvarchar](255) NULL,
	[price] [float] NOT NULL,
	[title] [nvarchar](255) NULL,
	[cid] [int] NULL,
	[brand_id] [int] NULL,
	[seller_id] [int] NULL,
 CONSTRAINT [PK__Product__47027DF545A8A49C] PRIMARY KEY CLUSTERED 
(
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductDetails]    Script Date: 27/10/2024 12:27:13 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductDetails](
	[pd_id] [int] IDENTITY(1,1) NOT NULL,
	[product_id] [int] NOT NULL,
	[pdname] [nvarchar](100) NOT NULL,
	[pdprice_discount] [float] NOT NULL,
	[pdcolor] [nvarchar](100) NOT NULL,
	[pdimg] [nvarchar](255) NOT NULL,
	[pdcriteria] [nvarchar](100) NOT NULL,
	[pdquantity] [int] NOT NULL,
	[pddescribe] [nvarchar](max) NULL,
	[pdspecification] [nvarchar](max) NULL,
 CONSTRAINT [PK_ProductDetails] PRIMARY KEY CLUSTERED 
(
	[pd_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 27/10/2024 12:27:13 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[role_id] [int] NOT NULL,
	[role_name] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[role_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Seller]    Script Date: 27/10/2024 12:27:13 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Seller](
	[seller_id] [int] IDENTITY(1,1) NOT NULL,
	[account_id] [int] NULL,
	[store_name] [nvarchar](100) NULL,
	[rating] [decimal](3, 2) NULL,
	[join_date] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[seller_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Shipping]    Script Date: 27/10/2024 12:27:13 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Shipping](
	[shipping_id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NOT NULL,
	[phone] [nvarchar](20) NULL,
	[address] [nvarchar](255) NULL,
	[status] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[shipping_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Status]    Script Date: 27/10/2024 12:27:13 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Status](
	[status_id] [int] NOT NULL,
	[status_name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Status] PRIMARY KEY CLUSTERED 
(
	[status_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Account] ON 

INSERT [dbo].[Account] ([account_id], [username], [password], [email], [phone], [address], [role_id], [status]) VALUES (10, N'admin', N'123', N'admin@gmail.com', N'1234567890', N'123 Admin Street', 1, N'active')
INSERT [dbo].[Account] ([account_id], [username], [password], [email], [phone], [address], [role_id], [status]) VALUES (11, N'seller', N'123', N'seller@gmail.com', N'1234567891', N'123 Seller Street', 2, N'inactive')
INSERT [dbo].[Account] ([account_id], [username], [password], [email], [phone], [address], [role_id], [status]) VALUES (12, N'customer', N'123', N'customer@gmail.com', N'1234567892', N'123 Customer Street', 3, N'active')
INSERT [dbo].[Account] ([account_id], [username], [password], [email], [phone], [address], [role_id], [status]) VALUES (13, N'shipper', N'123', N'shipper@gmail.com', N'1234567893', N'123 Shipper Street', 4, N'active')
INSERT [dbo].[Account] ([account_id], [username], [password], [email], [phone], [address], [role_id], [status]) VALUES (14, N'wjbunhi', N'12345', N'wjbunhi@gmail.com', N'123456789', N'ha noi', 3, N'active')
INSERT [dbo].[Account] ([account_id], [username], [password], [email], [phone], [address], [role_id], [status]) VALUES (16, N'customer', N'12345', N'nntruong79230@gmail.com', N'0123456789', N'Ha Noi', 3, N'active')
INSERT [dbo].[Account] ([account_id], [username], [password], [email], [phone], [address], [role_id], [status]) VALUES (17, N'nguyenpqhe171272', N'96gZ2qEIwJ', N'nguyenpqhe171272@fpt.edu.vn', NULL, NULL, 3, N'active')
INSERT [dbo].[Account] ([account_id], [username], [password], [email], [phone], [address], [role_id], [status]) VALUES (18, N'nguyenpq65', N'p1ADmUZQlh', N'nguyenpq65@gmail.com', NULL, NULL, 3, N'active')
INSERT [dbo].[Account] ([account_id], [username], [password], [email], [phone], [address], [role_id], [status]) VALUES (19, N'anhnhhe172209', N'CfmwMsu2N3', N'anhnhhe172209@fpt.edu.vn', NULL, NULL, 3, N'active')
SET IDENTITY_INSERT [dbo].[Account] OFF
GO
SET IDENTITY_INSERT [dbo].[Brand] ON 

INSERT [dbo].[Brand] ([brand_id], [brandName]) VALUES (1, N'Apple')
INSERT [dbo].[Brand] ([brand_id], [brandName]) VALUES (2, N'SamSung')
INSERT [dbo].[Brand] ([brand_id], [brandName]) VALUES (3, N'Xiaomi')
INSERT [dbo].[Brand] ([brand_id], [brandName]) VALUES (4, N'Oppo')
INSERT [dbo].[Brand] ([brand_id], [brandName]) VALUES (5, N'Realme')
SET IDENTITY_INSERT [dbo].[Brand] OFF
GO
INSERT [dbo].[Cart] ([cart_id], [account_id]) VALUES (1, 12)
INSERT [dbo].[Cart] ([cart_id], [account_id]) VALUES (2, 17)
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([cid], [cname], [cimg]) VALUES (1, N'Telephone', N'https://down-vn.img.susercontent.com/file/31234a27876fb89cd522d7e3db1ba5ca@resize_w320_nl.webp')
INSERT [dbo].[Category] ([cid], [cname], [cimg]) VALUES (2, N'Laptop', N'https://uxwing.com/wp-content/themes/uxwing/download/computers-mobile-hardware/laptop-open-black-icon.png')
INSERT [dbo].[Category] ([cid], [cname], [cimg]) VALUES (3, N'Headphone', N'https://cdn-icons-png.flaticon.com/512/5754/5754910.png')
INSERT [dbo].[Category] ([cid], [cname], [cimg]) VALUES (4, N'PC', N'https://cdn-icons-png.flaticon.com/512/9711/9711115.png')
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[Customer] ON 

INSERT [dbo].[Customer] ([customer_id], [customer_name], [customer_type], [account_id], [customer_dob], [customer_gender], [customer_images]) VALUES (4, N'', NULL, 12, NULL, N'', N'')
INSERT [dbo].[Customer] ([customer_id], [customer_name], [customer_type], [account_id], [customer_dob], [customer_gender], [customer_images]) VALUES (5, N'', NULL, 12, NULL, N'', N'')
INSERT [dbo].[Customer] ([customer_id], [customer_name], [customer_type], [account_id], [customer_dob], [customer_gender], [customer_images]) VALUES (7, N'Default Customer Name', N'normal', 19, NULL, N'unknown', NULL)
SET IDENTITY_INSERT [dbo].[Customer] OFF
GO
INSERT [dbo].[OrderDetail] ([order_id], [pd_id], [productName], [productPrice], [quantity]) VALUES (5, 2, N'Iphone 13 128GB | Chính hãng VN/A', 13590000.0000, 2)
INSERT [dbo].[OrderDetail] ([order_id], [pd_id], [productName], [productPrice], [quantity]) VALUES (5, 4, N'Iphone 13 128GB | Chính hãng VN/A', 13590000.0000, 1)
INSERT [dbo].[OrderDetail] ([order_id], [pd_id], [productName], [productPrice], [quantity]) VALUES (5, 8, N'Iphone 13 128GB | Chính hãng VN/A', 13590000.0000, 1)
INSERT [dbo].[OrderDetail] ([order_id], [pd_id], [productName], [productPrice], [quantity]) VALUES (11, 9, N'Iphone 15 Pro Max 256GB | Chính hãng VN/A', 29290000.0000, 1)
INSERT [dbo].[OrderDetail] ([order_id], [pd_id], [productName], [productPrice], [quantity]) VALUES (21, 9, N'Iphone 15 Pro Max 256GB | Chính hãng VN/A', 29290000.0000, 2)
INSERT [dbo].[OrderDetail] ([order_id], [pd_id], [productName], [productPrice], [quantity]) VALUES (22, 2, N'Iphone 13 128GB | Chính hãng VN/A', 13590000.0000, 2)
INSERT [dbo].[OrderDetail] ([order_id], [pd_id], [productName], [productPrice], [quantity]) VALUES (23, 2, N'Iphone 13 128GB | Chính hãng VN/A', 13590000.0000, 2)
INSERT [dbo].[OrderDetail] ([order_id], [pd_id], [productName], [productPrice], [quantity]) VALUES (24, 9, N'Iphone 15 Pro Max 256GB | Chính hãng VN/A', 29290000.0000, 1)
INSERT [dbo].[OrderDetail] ([order_id], [pd_id], [productName], [productPrice], [quantity]) VALUES (27, 7, N'Iphone 13 128GB | Chính hãng VN/A', 13590000.0000, 1)
INSERT [dbo].[OrderDetail] ([order_id], [pd_id], [productName], [productPrice], [quantity]) VALUES (28, 4, N'Iphone 13 128GB | Chính hãng VN/A', 13590000.0000, 1)
INSERT [dbo].[OrderDetail] ([order_id], [pd_id], [productName], [productPrice], [quantity]) VALUES (28, 9, N'Iphone 15 Pro Max 256GB | Chính hãng VN/A', 29290000.0000, 1)
INSERT [dbo].[OrderDetail] ([order_id], [pd_id], [productName], [productPrice], [quantity]) VALUES (28, 10, N'Iphone 15 Pro Max 256GB | Chính hãng VN/A', 29290000.0000, 2)
INSERT [dbo].[OrderDetail] ([order_id], [pd_id], [productName], [productPrice], [quantity]) VALUES (29, 2, N'Iphone 13 128GB | Chính hãng VN/A', 13590000.0000, 1)
INSERT [dbo].[OrderDetail] ([order_id], [pd_id], [productName], [productPrice], [quantity]) VALUES (29, 4, N'Iphone 13 128GB | Chính hãng VN/A', 13590000.0000, 1)
INSERT [dbo].[OrderDetail] ([order_id], [pd_id], [productName], [productPrice], [quantity]) VALUES (30, 9, N'Iphone 15 Pro Max 256GB | Chính hãng VN/A', 29290000.0000, 1)
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([order_id], [totalPrice], [note], [create_date], [shipping_id], [customer_id], [status_id], [payment]) VALUES (5, 54360000, NULL, CAST(N'2024-10-19' AS Date), 9, 4, 6, N'COD')
INSERT [dbo].[Orders] ([order_id], [totalPrice], [note], [create_date], [shipping_id], [customer_id], [status_id], [payment]) VALUES (11, 29290000, NULL, CAST(N'2024-10-19' AS Date), 21, 4, 6, N'COD')
INSERT [dbo].[Orders] ([order_id], [totalPrice], [note], [create_date], [shipping_id], [customer_id], [status_id], [payment]) VALUES (21, 58580000, N'a', CAST(N'2024-10-19' AS Date), 40, 4, 6, N'COD')
INSERT [dbo].[Orders] ([order_id], [totalPrice], [note], [create_date], [shipping_id], [customer_id], [status_id], [payment]) VALUES (22, 27180000, N'oke', CAST(N'2024-10-21' AS Date), 41, 4, 1, N'COD')
INSERT [dbo].[Orders] ([order_id], [totalPrice], [note], [create_date], [shipping_id], [customer_id], [status_id], [payment]) VALUES (23, 27180000, N'', CAST(N'2024-10-21' AS Date), 42, 4, 1, N'COD')
INSERT [dbo].[Orders] ([order_id], [totalPrice], [note], [create_date], [shipping_id], [customer_id], [status_id], [payment]) VALUES (24, 29290000, N'abc', CAST(N'2024-10-21' AS Date), 43, 4, 1, N'VNPAY')
INSERT [dbo].[Orders] ([order_id], [totalPrice], [note], [create_date], [shipping_id], [customer_id], [status_id], [payment]) VALUES (25, 29290000, N'abc', CAST(N'2024-10-21' AS Date), 44, 4, 1, N'COD')
INSERT [dbo].[Orders] ([order_id], [totalPrice], [note], [create_date], [shipping_id], [customer_id], [status_id], [payment]) VALUES (26, 29290000, N'abc', CAST(N'2024-10-21' AS Date), 45, 4, 1, N'VNPAY')
INSERT [dbo].[Orders] ([order_id], [totalPrice], [note], [create_date], [shipping_id], [customer_id], [status_id], [payment]) VALUES (27, 13590000, N'fptu', CAST(N'2024-10-22' AS Date), 46, 4, 1, N'COD')
INSERT [dbo].[Orders] ([order_id], [totalPrice], [note], [create_date], [shipping_id], [customer_id], [status_id], [payment]) VALUES (28, 101460000, N'fptu', CAST(N'2024-10-23' AS Date), 47, 4, 6, N'VNPAY')
INSERT [dbo].[Orders] ([order_id], [totalPrice], [note], [create_date], [shipping_id], [customer_id], [status_id], [payment]) VALUES (29, 27180000, N'fptu', CAST(N'2024-10-23' AS Date), 48, 4, 1, N'COD')
INSERT [dbo].[Orders] ([order_id], [totalPrice], [note], [create_date], [shipping_id], [customer_id], [status_id], [payment]) VALUES (30, 29290000, N'fptu', CAST(N'2024-10-23' AS Date), 49, 4, 1, N'VNPAY')
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([product_id], [name], [img], [price], [title], [cid], [brand_id], [seller_id]) VALUES (1, N'Iphone 13 | Chính hãng VN/A', N'iphone-13_2_.png', 18990000, NULL, 1, 1, 2)
INSERT [dbo].[Product] ([product_id], [name], [img], [price], [title], [cid], [brand_id], [seller_id]) VALUES (4, N'Iphone 15 Pro Max | Chính hãng VN/A', N'iphone-15-pro-max_3.png', 34990000, NULL, 1, 1, 2)
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductDetails] ON 

INSERT [dbo].[ProductDetails] ([pd_id], [product_id], [pdname], [pdprice_discount], [pdcolor], [pdimg], [pdcriteria], [pdquantity], [pddescribe], [pdspecification]) VALUES (2, 1, N'Iphone 13 128GB | Chính hãng VN/A', 13590000, N'Hồng', N'iphone-13_2_.png,0000648_pink_550.png,0000649_pink_550.png,0000650_pink_550.png,0000651_pink_550.png', N'128GB', 5, NULL, NULL)
INSERT [dbo].[ProductDetails] ([pd_id], [product_id], [pdname], [pdprice_discount], [pdcolor], [pdimg], [pdcriteria], [pdquantity], [pddescribe], [pdspecification]) VALUES (4, 1, N'Iphone 13 128GB | Chính hãng VN/A', 13590000, N'Đen', N'_en_2_5.png,0000608_midnight_550.png,0000609_midnight_550.png,0000610_midnight_550.png,0000611_midnight_550.png', N'128GB', 4, NULL, NULL)
INSERT [dbo].[ProductDetails] ([pd_id], [product_id], [pdname], [pdprice_discount], [pdcolor], [pdimg], [pdcriteria], [pdquantity], [pddescribe], [pdspecification]) VALUES (5, 1, N'Iphone 13 128GB | Chính hãng VN/A', 13590000, N'Xanh lá', N'xnnah_kas_3.png,0019777_green_550.png,0019778_green_550.png,0019780_green_550.png,0019781_green_550.png', N'128GB', 7, NULL, NULL)
INSERT [dbo].[ProductDetails] ([pd_id], [product_id], [pdname], [pdprice_discount], [pdcolor], [pdimg], [pdcriteria], [pdquantity], [pddescribe], [pdspecification]) VALUES (7, 1, N'Iphone 13 128GB | Chính hãng VN/A', 13590000, N'Trắng', N'15_2_7_2_5.png,0000618_starlight_550.png,0000619_starlight_550.png,0000620_starlight_550.png,0000621_starlight_550.png', N'128GB', 6, NULL, NULL)
INSERT [dbo].[ProductDetails] ([pd_id], [product_id], [pdname], [pdprice_discount], [pdcolor], [pdimg], [pdcriteria], [pdquantity], [pddescribe], [pdspecification]) VALUES (8, 1, N'Iphone 13 128GB | Chính hãng VN/A', 13590000, N'Đỏ', N'0000639_product-red_550.png,0000640_product-red_550.png,0000641_product-red_550.png,0000642_product-red_550.png,0000643_product-red_550.png', N'128GB', 8, NULL, NULL)
INSERT [dbo].[ProductDetails] ([pd_id], [product_id], [pdname], [pdprice_discount], [pdcolor], [pdimg], [pdcriteria], [pdquantity], [pddescribe], [pdspecification]) VALUES (9, 4, N'Iphone 15 Pro Max 256GB | Chính hãng VN/A', 29290000, N'Titan Tự Nhiên', N'iphone15-pro-max-titan-nau.png', N'256GB', 5, NULL, NULL)
INSERT [dbo].[ProductDetails] ([pd_id], [product_id], [pdname], [pdprice_discount], [pdcolor], [pdimg], [pdcriteria], [pdquantity], [pddescribe], [pdspecification]) VALUES (10, 4, N'Iphone 15 Pro Max 256GB | Chính hãng VN/A', 29290000, N'Titan Trắng', N'iphone15-pro-max-titan-trang.png', N'256GB', 4, NULL, NULL)
INSERT [dbo].[ProductDetails] ([pd_id], [product_id], [pdname], [pdprice_discount], [pdcolor], [pdimg], [pdcriteria], [pdquantity], [pddescribe], [pdspecification]) VALUES (11, 4, N'Iphone 15 Pro Max 256GB | Chính hãng VN/A', 29290000, N'Titan Đen', N'0020074_iphone-15-pro-max-128gb_550.png', N'256GB', 8, NULL, NULL)
SET IDENTITY_INSERT [dbo].[ProductDetails] OFF
GO
INSERT [dbo].[Role] ([role_id], [role_name]) VALUES (1, N'Admin')
INSERT [dbo].[Role] ([role_id], [role_name]) VALUES (2, N'Seller')
INSERT [dbo].[Role] ([role_id], [role_name]) VALUES (3, N'Customer')
INSERT [dbo].[Role] ([role_id], [role_name]) VALUES (4, N'Shipper')
GO
SET IDENTITY_INSERT [dbo].[Seller] ON 

INSERT [dbo].[Seller] ([seller_id], [account_id], [store_name], [rating], [join_date]) VALUES (2, 11, N'Default Store Name', CAST(0.00 AS Decimal(3, 2)), CAST(N'2024-10-25' AS Date))
SET IDENTITY_INSERT [dbo].[Seller] OFF
GO
SET IDENTITY_INSERT [dbo].[Shipping] ON 

INSERT [dbo].[Shipping] ([shipping_id], [name], [phone], [address], [status]) VALUES (9, N'Phạm Quốc Nguyên', N'0988575467', N'hà nội,ba đình, thanh xuân, bug', NULL)
INSERT [dbo].[Shipping] ([shipping_id], [name], [phone], [address], [status]) VALUES (21, N'Ph?m Qu?c Nguyên', N'0988575467', N'big c thang long, abc, xyz', NULL)
INSERT [dbo].[Shipping] ([shipping_id], [name], [phone], [address], [status]) VALUES (40, N'Pham Quoc Nguyen', N'0123456789', N'abc, zyz,jsda,jndal', NULL)
INSERT [dbo].[Shipping] ([shipping_id], [name], [phone], [address], [status]) VALUES (41, N'Nguyễn Huy Anh', N'0866650703', N'nguyenhuyanh', N'Pending')
INSERT [dbo].[Shipping] ([shipping_id], [name], [phone], [address], [status]) VALUES (42, N'Nguyễn Huy Anh', N'0866650703', N'nguyenhuyanh', N'Pending')
INSERT [dbo].[Shipping] ([shipping_id], [name], [phone], [address], [status]) VALUES (43, N'long', N'0123456789', N'ha noi', N'Pending')
INSERT [dbo].[Shipping] ([shipping_id], [name], [phone], [address], [status]) VALUES (44, N'long', N'0123456789', N'ha noi', N'Pending')
INSERT [dbo].[Shipping] ([shipping_id], [name], [phone], [address], [status]) VALUES (45, N'long', N'0123456789', N'ha noi', N'Pending')
INSERT [dbo].[Shipping] ([shipping_id], [name], [phone], [address], [status]) VALUES (46, N'Nguyễn Huy Anh', N'0866650703', N'nguyenhuyanh,andb.ancut', N'Pending')
INSERT [dbo].[Shipping] ([shipping_id], [name], [phone], [address], [status]) VALUES (47, N'Nguyễn Huy Anh', N'0866650703', N'nguyenhuyanh,andb.ancut', N'Pending')
INSERT [dbo].[Shipping] ([shipping_id], [name], [phone], [address], [status]) VALUES (48, N'Nguyễn Huy Anh', N'0866650703', N'nguyenhuyanh,andb.ancut', N'Pending')
INSERT [dbo].[Shipping] ([shipping_id], [name], [phone], [address], [status]) VALUES (49, N'Nguyễn Huy Anh', N'0866650703', N'nguyenhuyanh,andb.ancut', N'Pending')
SET IDENTITY_INSERT [dbo].[Shipping] OFF
GO
INSERT [dbo].[Status] ([status_id], [status_name]) VALUES (1, N'Pending')
INSERT [dbo].[Status] ([status_id], [status_name]) VALUES (2, N'Pendding for confirmation')
INSERT [dbo].[Status] ([status_id], [status_name]) VALUES (3, N'Confirmed')
INSERT [dbo].[Status] ([status_id], [status_name]) VALUES (4, N'Waiting for pickup')
INSERT [dbo].[Status] ([status_id], [status_name]) VALUES (5, N'Delivered')
INSERT [dbo].[Status] ([status_id], [status_name]) VALUES (6, N'Cancelled')
INSERT [dbo].[Status] ([status_id], [status_name]) VALUES (7, N'On the way to pickup')
INSERT [dbo].[Status] ([status_id], [status_name]) VALUES (8, N'Customer not found')
GO
ALTER TABLE [dbo].[Account]  WITH CHECK ADD  CONSTRAINT [fk_role] FOREIGN KEY([role_id])
REFERENCES [dbo].[Role] ([role_id])
GO
ALTER TABLE [dbo].[Account] CHECK CONSTRAINT [fk_role]
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD  CONSTRAINT [FK_Cart_Account1] FOREIGN KEY([account_id])
REFERENCES [dbo].[Account] ([account_id])
GO
ALTER TABLE [dbo].[Cart] CHECK CONSTRAINT [FK_Cart_Account1]
GO
ALTER TABLE [dbo].[CartDetails]  WITH CHECK ADD  CONSTRAINT [FK_Cart_ProductDetail_ProductDetails] FOREIGN KEY([pd_id])
REFERENCES [dbo].[ProductDetails] ([pd_id])
GO
ALTER TABLE [dbo].[CartDetails] CHECK CONSTRAINT [FK_Cart_ProductDetail_ProductDetails]
GO
ALTER TABLE [dbo].[CartDetails]  WITH CHECK ADD  CONSTRAINT [FK_CartDetails_Cart1] FOREIGN KEY([cart_id])
REFERENCES [dbo].[Cart] ([cart_id])
GO
ALTER TABLE [dbo].[CartDetails] CHECK CONSTRAINT [FK_CartDetails_Cart1]
GO
ALTER TABLE [dbo].[Customer]  WITH CHECK ADD  CONSTRAINT [FK_Customer_Account] FOREIGN KEY([account_id])
REFERENCES [dbo].[Account] ([account_id])
GO
ALTER TABLE [dbo].[Customer] CHECK CONSTRAINT [FK_Customer_Account]
GO
ALTER TABLE [dbo].[Feedback]  WITH CHECK ADD  CONSTRAINT [FK_Feedback_Product] FOREIGN KEY([product_id])
REFERENCES [dbo].[Product] ([product_id])
GO
ALTER TABLE [dbo].[Feedback] CHECK CONSTRAINT [FK_Feedback_Product]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Order] FOREIGN KEY([order_id])
REFERENCES [dbo].[Orders] ([order_id])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Order]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_ProductDetails] FOREIGN KEY([pd_id])
REFERENCES [dbo].[ProductDetails] ([pd_id])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_ProductDetails]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Customer] FOREIGN KEY([customer_id])
REFERENCES [dbo].[Customer] ([customer_id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Customer]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Shipping1] FOREIGN KEY([shipping_id])
REFERENCES [dbo].[Shipping] ([shipping_id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Shipping1]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Status] FOREIGN KEY([status_id])
REFERENCES [dbo].[Status] ([status_id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Status]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Brand] FOREIGN KEY([brand_id])
REFERENCES [dbo].[Brand] ([brand_id])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Brand]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Category] FOREIGN KEY([cid])
REFERENCES [dbo].[Category] ([cid])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Category]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Seller] FOREIGN KEY([seller_id])
REFERENCES [dbo].[Seller] ([seller_id])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Seller]
GO
ALTER TABLE [dbo].[ProductDetails]  WITH CHECK ADD  CONSTRAINT [FK_ProductDetails_Product] FOREIGN KEY([product_id])
REFERENCES [dbo].[Product] ([product_id])
GO
ALTER TABLE [dbo].[ProductDetails] CHECK CONSTRAINT [FK_ProductDetails_Product]
GO
ALTER TABLE [dbo].[Seller]  WITH CHECK ADD  CONSTRAINT [FK_Seller_Account] FOREIGN KEY([account_id])
REFERENCES [dbo].[Account] ([account_id])
GO
ALTER TABLE [dbo].[Seller] CHECK CONSTRAINT [FK_Seller_Account]
GO
ALTER TABLE [dbo].[Feedback]  WITH CHECK ADD CHECK  (([rating]>=(1) AND [rating]<=(5)))
GO
ALTER TABLE [dbo].[Seller]  WITH CHECK ADD CHECK  (([rating]>=(0) AND [rating]<=(5)))
GO
USE [master]
GO
ALTER DATABASE [mk5] SET  READ_WRITE 
GO

CREATE TRIGGER trg_UpdateRoleOnAccount
ON [dbo].[Account]
AFTER UPDATE
AS
BEGIN
    -- Biến lưu account_id và role_id đã thay đổi
    DECLARE @account_id INT, @role_id INT;
    
    -- Lấy thông tin của account_id và role_id sau khi cập nhật
    SELECT @account_id = INSERTED.account_id, @role_id = INSERTED.role_id
    FROM INSERTED;

    -- Kiểm tra nếu role_id là 2 (seller)
    IF @role_id = 2
    BEGIN
        -- Thêm bản ghi vào bảng Seller nếu chưa có
        IF NOT EXISTS (SELECT 1 FROM [dbo].[Seller] WHERE [account_id] = @account_id)
        BEGIN
            INSERT INTO [dbo].[Seller] ([account_id], [store_name], [rating], [join_date])
            VALUES (@account_id, N'Default Store Name', 0.00, GETDATE());
        END

        -- Xóa bản ghi khỏi Customer nếu có
        DELETE FROM [dbo].[Customer] WHERE [account_id] = @account_id;
    END

    -- Kiểm tra nếu role_id là 3 (customer)
    IF @role_id = 3
    BEGIN
        -- Thêm bản ghi vào bảng Customer nếu chưa có
        IF NOT EXISTS (SELECT 1 FROM [dbo].[Customer] WHERE [account_id] = @account_id)
        BEGIN
            INSERT INTO [dbo].[Customer] ([account_id], [customer_name], [customer_type], [customer_dob], [customer_gender], [customer_images])
            VALUES (@account_id, N'Default Customer Name', N'normal', NULL, N'unknown', NULL);
        END

        -- Xóa bản ghi khỏi Seller nếu có
        DELETE FROM [dbo].[Seller] WHERE [account_id] = @account_id;
    END
END

-- run before
ALTER TABLE ProductDetails
DROP CONSTRAINT FK_ProductDetails_Product;
-- after 
ALTER TABLE ProductDetails
ADD CONSTRAINT FK_ProductDetails_Product FOREIGN KEY (product_id)
    REFERENCES Product(product_id) ON DELETE CASCADE;

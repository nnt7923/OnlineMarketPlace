USE [master]
GO
/****** Object:  Database [mk3]    Script Date: 26/09/2024 5:34:18 CH ******/
CREATE DATABASE [mk3]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'mk3', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.NTRUONG\MSSQL\DATA\mk3.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'mk3_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.NTRUONG\MSSQL\DATA\mk3_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [mk3] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [mk3].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [mk3] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [mk3] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [mk3] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [mk3] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [mk3] SET ARITHABORT OFF 
GO
ALTER DATABASE [mk3] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [mk3] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [mk3] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [mk3] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [mk3] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [mk3] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [mk3] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [mk3] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [mk3] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [mk3] SET  ENABLE_BROKER 
GO
ALTER DATABASE [mk3] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [mk3] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [mk3] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [mk3] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [mk3] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [mk3] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [mk3] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [mk3] SET RECOVERY FULL 
GO
ALTER DATABASE [mk3] SET  MULTI_USER 
GO
ALTER DATABASE [mk3] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [mk3] SET DB_CHAINING OFF 
GO
ALTER DATABASE [mk3] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [mk3] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [mk3] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [mk3] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'mk3', N'ON'
GO
ALTER DATABASE [mk3] SET QUERY_STORE = OFF
GO
USE [mk3]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 26/09/2024 5:34:18 CH ******/
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
/****** Object:  Table [dbo].[Brand]    Script Date: 26/09/2024 5:34:18 CH ******/
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
/****** Object:  Table [dbo].[Cart]    Script Date: 26/09/2024 5:34:18 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cart](
	[customer_id] [int] NULL,
	[product_id] [int] NULL,
	[amount] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 26/09/2024 5:34:18 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[cid] [int] IDENTITY(1,1) NOT NULL,
	[cname] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[cid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 26/09/2024 5:34:18 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[customer_id] [int] IDENTITY(1,1) NOT NULL,
	[customer_name] [nvarchar](255) NOT NULL,
	[email] [nvarchar](255) NULL,
	[phone] [nvarchar](20) NULL,
	[address] [nvarchar](500) NULL,
	[customer_type] [nvarchar](50) NULL,
	[account_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[customer_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Feedback]    Script Date: 26/09/2024 5:34:18 CH ******/
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
PRIMARY KEY CLUSTERED 
(
	[feedback_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 26/09/2024 5:34:18 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[order_id] [int] NOT NULL,
	[productid] [int] NOT NULL,
	[productName] [nvarchar](50) NULL,
	[productImage] [nvarchar](255) NULL,
	[productPrice] [money] NULL,
	[quantity] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[order_id] ASC,
	[productid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 26/09/2024 5:34:18 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[order_id] [int] IDENTITY(1,1) NOT NULL,
	[accountID] [int] NULL,
	[totalPrice] [decimal](10, 2) NULL,
	[note] [nvarchar](255) NULL,
	[create_date] [date] NOT NULL,
	[shipping_ID] [int] NULL,
	[customer_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[order_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Payments]    Script Date: 26/09/2024 5:34:18 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payments](
	[payment_id] [int] IDENTITY(1,1) NOT NULL,
	[order_id] [int] NULL,
	[payment_date] [date] NOT NULL,
	[amount] [decimal](10, 2) NOT NULL,
	[payment_method] [nvarchar](50) NULL,
	[status] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[payment_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 26/09/2024 5:34:18 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[product_id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NOT NULL,
	[img] [nvarchar](255) NULL,
	[price] [decimal](10, 2) NOT NULL,
	[title] [nvarchar](255) NULL,
	[description] [nvarchar](max) NULL,
	[cateID] [int] NULL,
	[sellID] [int] NULL,
	[brand_id] [int] NULL,
	[seller_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 26/09/2024 5:34:18 CH ******/
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
/****** Object:  Table [dbo].[Seller]    Script Date: 26/09/2024 5:34:18 CH ******/
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
/****** Object:  Table [dbo].[Shipping]    Script Date: 26/09/2024 5:34:18 CH ******/
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
SET IDENTITY_INSERT [dbo].[Account] ON 

INSERT [dbo].[Account] ([account_id], [username], [password], [email], [phone], [address], [role_id], [status]) VALUES (10, N'admin', N'truong1234', N'admin@gmail.com', N'1234567890', N'123 Admin Street', 1, N'active')
INSERT [dbo].[Account] ([account_id], [username], [password], [email], [phone], [address], [role_id], [status]) VALUES (11, N'seller', N'123', N'seller@gmail.com', N'1234567891', N'123 Seller Street', 2, N'active')
INSERT [dbo].[Account] ([account_id], [username], [password], [email], [phone], [address], [role_id], [status]) VALUES (12, N'customer', N'123', N'customer@gmail.com', N'1234567892', N'123 Customer Street', 3, N'active')
INSERT [dbo].[Account] ([account_id], [username], [password], [email], [phone], [address], [role_id], [status]) VALUES (13, N'shipper', N'123', N'shipper@gmail.com', N'1234567893', N'123 Shipper Street', 4, N'active')
INSERT [dbo].[Account] ([account_id], [username], [password], [email], [phone], [address], [role_id], [status]) VALUES (16, N'customer', N'123', N'nntruong79230@gmail.com', N'0123456789', N'Ha Noi', 3, N'active')
INSERT [dbo].[Account] ([account_id], [username], [password], [email], [phone], [address], [role_id], [status]) VALUES (18, N'admin', N'123', N'quocphongoccho4@gmail.com', N'0123456788', N'Ha Noi', 3, N'active')
INSERT [dbo].[Account] ([account_id], [username], [password], [email], [phone], [address], [role_id], [status]) VALUES (19, N'Duy', N'Truong2', N'phamdokhanhduy5803@gmail.com', N'0921948814', N'Ha Noi', 3, N'active')
SET IDENTITY_INSERT [dbo].[Account] OFF
GO
INSERT [dbo].[Role] ([role_id], [role_name]) VALUES (1, N'Admin')
INSERT [dbo].[Role] ([role_id], [role_name]) VALUES (2, N'Seller')
INSERT [dbo].[Role] ([role_id], [role_name]) VALUES (3, N'Customer')
INSERT [dbo].[Role] ([role_id], [role_name]) VALUES (4, N'Shipper')
GO
ALTER TABLE [dbo].[Account]  WITH CHECK ADD  CONSTRAINT [fk_role] FOREIGN KEY([role_id])
REFERENCES [dbo].[Role] ([role_id])
GO
ALTER TABLE [dbo].[Account] CHECK CONSTRAINT [fk_role]
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD  CONSTRAINT [FK_Cart_Customer] FOREIGN KEY([customer_id])
REFERENCES [dbo].[Customer] ([customer_id])
GO
ALTER TABLE [dbo].[Cart] CHECK CONSTRAINT [FK_Cart_Customer]
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD  CONSTRAINT [FK_Cart_Product] FOREIGN KEY([product_id])
REFERENCES [dbo].[Product] ([product_id])
GO
ALTER TABLE [dbo].[Cart] CHECK CONSTRAINT [FK_Cart_Product]
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
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Orders] FOREIGN KEY([order_id])
REFERENCES [dbo].[Orders] ([order_id])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Orders]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Product] FOREIGN KEY([productid])
REFERENCES [dbo].[Product] ([product_id])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Product]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Customer] FOREIGN KEY([customer_id])
REFERENCES [dbo].[Customer] ([customer_id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Customer]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Shipping] FOREIGN KEY([shipping_ID])
REFERENCES [dbo].[Shipping] ([shipping_id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Shipping]
GO
ALTER TABLE [dbo].[Payments]  WITH CHECK ADD  CONSTRAINT [FK_Payments_Orders] FOREIGN KEY([order_id])
REFERENCES [dbo].[Orders] ([order_id])
GO
ALTER TABLE [dbo].[Payments] CHECK CONSTRAINT [FK_Payments_Orders]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Brand] FOREIGN KEY([brand_id])
REFERENCES [dbo].[Brand] ([brand_id])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Brand]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Category] FOREIGN KEY([cateID])
REFERENCES [dbo].[Category] ([cid])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Category]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Seller] FOREIGN KEY([seller_id])
REFERENCES [dbo].[Seller] ([seller_id])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Seller]
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
ALTER DATABASE [mk3] SET  READ_WRITE 
GO

USE [mk9]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 11/2/2024 10:27:00 PM ******/
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
/****** Object:  Table [dbo].[Brand]    Script Date: 11/2/2024 10:27:01 PM ******/
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
/****** Object:  Table [dbo].[Cart]    Script Date: 11/2/2024 10:27:01 PM ******/
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
/****** Object:  Table [dbo].[CartDetails]    Script Date: 11/2/2024 10:27:01 PM ******/
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
/****** Object:  Table [dbo].[Category]    Script Date: 11/2/2024 10:27:01 PM ******/
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
/****** Object:  Table [dbo].[Customer]    Script Date: 11/2/2024 10:27:01 PM ******/
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
/****** Object:  Table [dbo].[Feedback]    Script Date: 11/2/2024 10:27:01 PM ******/
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
/****** Object:  Table [dbo].[News]    Script Date: 11/2/2024 10:27:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[News](
	[newid] [int] IDENTITY(1,1) NOT NULL,
	[ntid] [int] NOT NULL,
	[nimage] [nvarchar](255) NOT NULL,
	[title] [nvarchar](255) NOT NULL,
	[contents] [nvarchar](max) NOT NULL,
	[createdate] [date] NOT NULL,
	[status] [bit] NOT NULL,
 CONSTRAINT [PK_Blogs] PRIMARY KEY CLUSTERED 
(
	[newid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[News_Type]    Script Date: 11/2/2024 10:27:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[News_Type](
	[ntid] [int] IDENTITY(1,1) NOT NULL,
	[nttype] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Blogs Type] PRIMARY KEY CLUSTERED 
(
	[ntid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 11/2/2024 10:27:01 PM ******/
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
/****** Object:  Table [dbo].[Orders]    Script Date: 11/2/2024 10:27:01 PM ******/
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
	[seller_id] [int] NULL,
 CONSTRAINT [PK__Orders__46596229CD1E1762] PRIMARY KEY CLUSTERED 
(
	[order_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 11/2/2024 10:27:01 PM ******/
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
/****** Object:  Table [dbo].[ProductDetails]    Script Date: 11/2/2024 10:27:01 PM ******/
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
/****** Object:  Table [dbo].[Role]    Script Date: 11/2/2024 10:27:01 PM ******/
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
/****** Object:  Table [dbo].[Seller]    Script Date: 11/2/2024 10:27:01 PM ******/
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
	[last_online] [datetime] NULL,
	[seller_image] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[seller_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Shipping]    Script Date: 11/2/2024 10:27:01 PM ******/
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
/****** Object:  Table [dbo].[Status]    Script Date: 11/2/2024 10:27:01 PM ******/
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
INSERT [dbo].[Account] ([account_id], [username], [password], [email], [phone], [address], [role_id], [status]) VALUES (11, N'seller', N'123', N'seller@gmail.com', N'1234567891', N'123 Seller Street', 2, N'active')
INSERT [dbo].[Account] ([account_id], [username], [password], [email], [phone], [address], [role_id], [status]) VALUES (12, N'customer', N'123', N'customer@gmail.com', N'1234567892', N'123 Customer Street', 3, N'active')
INSERT [dbo].[Account] ([account_id], [username], [password], [email], [phone], [address], [role_id], [status]) VALUES (13, N'shipper', N'123', N'shipper@gmail.com', N'1234567893', N'123 Shipper Street', 4, N'active')
INSERT [dbo].[Account] ([account_id], [username], [password], [email], [phone], [address], [role_id], [status]) VALUES (14, N'wjbunhi', N'12345', N'wjbunhi@gmail.com', N'123456789', N'ha noi', 3, N'active')
INSERT [dbo].[Account] ([account_id], [username], [password], [email], [phone], [address], [role_id], [status]) VALUES (16, N'customer', N'12345', N'nntruong79230@gmail.com', N'0123456789', N'Ha Noi', 3, N'active')
INSERT [dbo].[Account] ([account_id], [username], [password], [email], [phone], [address], [role_id], [status]) VALUES (17, N'nguyenpqhe171272', N'96gZ2qEIwJ', N'nguyenpqhe171272@fpt.edu.vn', NULL, NULL, 3, N'active')
INSERT [dbo].[Account] ([account_id], [username], [password], [email], [phone], [address], [role_id], [status]) VALUES (18, N'nguyenpq65', N'p1ADmUZQlh', N'nguyenpq65@gmail.com', NULL, NULL, 3, N'active')
INSERT [dbo].[Account] ([account_id], [username], [password], [email], [phone], [address], [role_id], [status]) VALUES (19, N'anhnhhe172209', N'CfmwMsu2N3', N'anhnhhe172209@fpt.edu.vn', NULL, NULL, 3, N'active')
INSERT [dbo].[Account] ([account_id], [username], [password], [email], [phone], [address], [role_id], [status]) VALUES (21, N'khanhduy583', N'Vpccw21fx', N'phamdokhanhduy5803@gmail.com', N'0987654321', N'hanoi', 3, N'active')
INSERT [dbo].[Account] ([account_id], [username], [password], [email], [phone], [address], [role_id], [status]) VALUES (23, N'concac', N'Vpccw21fx', N'duypdkhe170542@fpt.edu.vn', N'0987654321', N'hanoi', 3, N'active')
INSERT [dbo].[Account] ([account_id], [username], [password], [email], [phone], [address], [role_id], [status]) VALUES (24, N'phamnguyen ', N'Pqnguyen2003', N'nguyenpq0605@gmail.com', N'0988575467', N'hà nội,ba đình, thanh xuân', 3, N'active')
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
INSERT [dbo].[CartDetails] ([cart_id], [pd_id], [quantity]) VALUES (1, 2, 1)
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
INSERT [dbo].[Customer] ([customer_id], [customer_name], [customer_type], [account_id], [customer_dob], [customer_gender], [customer_images]) VALUES (8, N'khanhduy583', NULL, 21, NULL, NULL, NULL)
INSERT [dbo].[Customer] ([customer_id], [customer_name], [customer_type], [account_id], [customer_dob], [customer_gender], [customer_images]) VALUES (9, N'Default Customer Name', N'normal', 24, NULL, N'unknown', NULL)
SET IDENTITY_INSERT [dbo].[Customer] OFF
GO
SET IDENTITY_INSERT [dbo].[Feedback] ON 

INSERT [dbo].[Feedback] ([feedback_id], [account_id], [product_id], [rating], [create_date], [customer_id], [feedback_content]) VALUES (6, 12, 1, 3, CAST(N'2024-10-29' AS Date), 4, N'abvcccc')
INSERT [dbo].[Feedback] ([feedback_id], [account_id], [product_id], [rating], [create_date], [customer_id], [feedback_content]) VALUES (7, 12, 8, 1, CAST(N'2024-10-29' AS Date), 4, N'đẹp')
INSERT [dbo].[Feedback] ([feedback_id], [account_id], [product_id], [rating], [create_date], [customer_id], [feedback_content]) VALUES (8, 12, 8, 1, CAST(N'2024-10-29' AS Date), 4, N'đẹp')
INSERT [dbo].[Feedback] ([feedback_id], [account_id], [product_id], [rating], [create_date], [customer_id], [feedback_content]) VALUES (9, 12, 8, 1, CAST(N'2024-10-29' AS Date), 4, N'đẹp')
INSERT [dbo].[Feedback] ([feedback_id], [account_id], [product_id], [rating], [create_date], [customer_id], [feedback_content]) VALUES (10, 12, 1, 3, CAST(N'2024-10-29' AS Date), 4, N'dep')
INSERT [dbo].[Feedback] ([feedback_id], [account_id], [product_id], [rating], [create_date], [customer_id], [feedback_content]) VALUES (11, 21, 4, 1, CAST(N'2024-10-29' AS Date), 8, N'dien thoai deu')
INSERT [dbo].[Feedback] ([feedback_id], [account_id], [product_id], [rating], [create_date], [customer_id], [feedback_content]) VALUES (12, 21, 4, 2, CAST(N'2024-10-29' AS Date), 8, N'abc')
INSERT [dbo].[Feedback] ([feedback_id], [account_id], [product_id], [rating], [create_date], [customer_id], [feedback_content]) VALUES (13, 21, 4, 5, CAST(N'2024-10-29' AS Date), 8, N'xau')
INSERT [dbo].[Feedback] ([feedback_id], [account_id], [product_id], [rating], [create_date], [customer_id], [feedback_content]) VALUES (14, 21, 1, 5, CAST(N'2024-10-29' AS Date), 8, N'ngonnn')
INSERT [dbo].[Feedback] ([feedback_id], [account_id], [product_id], [rating], [create_date], [customer_id], [feedback_content]) VALUES (15, 21, 1, 5, CAST(N'2024-10-29' AS Date), 8, N'ngonnn')
INSERT [dbo].[Feedback] ([feedback_id], [account_id], [product_id], [rating], [create_date], [customer_id], [feedback_content]) VALUES (16, 21, 1, 5, CAST(N'2024-10-29' AS Date), 8, N'test')
INSERT [dbo].[Feedback] ([feedback_id], [account_id], [product_id], [rating], [create_date], [customer_id], [feedback_content]) VALUES (17, 21, 1, 5, CAST(N'2024-10-29' AS Date), 8, N'test2')
INSERT [dbo].[Feedback] ([feedback_id], [account_id], [product_id], [rating], [create_date], [customer_id], [feedback_content]) VALUES (18, 21, 1, 5, CAST(N'2024-10-29' AS Date), 8, N'test2')
INSERT [dbo].[Feedback] ([feedback_id], [account_id], [product_id], [rating], [create_date], [customer_id], [feedback_content]) VALUES (19, 12, 1, 5, CAST(N'2024-10-29' AS Date), 4, N'test3')
INSERT [dbo].[Feedback] ([feedback_id], [account_id], [product_id], [rating], [create_date], [customer_id], [feedback_content]) VALUES (20, 12, 1, 5, CAST(N'2024-10-29' AS Date), 4, N'test4')
INSERT [dbo].[Feedback] ([feedback_id], [account_id], [product_id], [rating], [create_date], [customer_id], [feedback_content]) VALUES (21, 12, 4, 5, CAST(N'2024-10-29' AS Date), 4, N'test1')
INSERT [dbo].[Feedback] ([feedback_id], [account_id], [product_id], [rating], [create_date], [customer_id], [feedback_content]) VALUES (22, 12, 1, 5, CAST(N'2024-10-29' AS Date), 4, N'cc')
INSERT [dbo].[Feedback] ([feedback_id], [account_id], [product_id], [rating], [create_date], [customer_id], [feedback_content]) VALUES (23, 12, 1, 5, CAST(N'2024-10-29' AS Date), 4, N'cc')
INSERT [dbo].[Feedback] ([feedback_id], [account_id], [product_id], [rating], [create_date], [customer_id], [feedback_content]) VALUES (24, 12, 1, 5, CAST(N'2024-10-30' AS Date), 4, N'323')
INSERT [dbo].[Feedback] ([feedback_id], [account_id], [product_id], [rating], [create_date], [customer_id], [feedback_content]) VALUES (25, 12, 1, 5, CAST(N'2024-10-30' AS Date), 4, N'asa')
INSERT [dbo].[Feedback] ([feedback_id], [account_id], [product_id], [rating], [create_date], [customer_id], [feedback_content]) VALUES (26, 12, 1, 5, CAST(N'2024-10-30' AS Date), 4, N'dsdas')
INSERT [dbo].[Feedback] ([feedback_id], [account_id], [product_id], [rating], [create_date], [customer_id], [feedback_content]) VALUES (27, 12, 1, 5, CAST(N'2024-10-30' AS Date), 4, N'dsadav')
INSERT [dbo].[Feedback] ([feedback_id], [account_id], [product_id], [rating], [create_date], [customer_id], [feedback_content]) VALUES (28, 12, 1, 5, CAST(N'2024-10-30' AS Date), 4, N'dsds')
INSERT [dbo].[Feedback] ([feedback_id], [account_id], [product_id], [rating], [create_date], [customer_id], [feedback_content]) VALUES (29, 12, 1, 5, CAST(N'2024-10-30' AS Date), 4, N'sdsadvcv')
INSERT [dbo].[Feedback] ([feedback_id], [account_id], [product_id], [rating], [create_date], [customer_id], [feedback_content]) VALUES (30, 12, 1, 5, CAST(N'2024-10-30' AS Date), 4, N'sdsdsd')
INSERT [dbo].[Feedback] ([feedback_id], [account_id], [product_id], [rating], [create_date], [customer_id], [feedback_content]) VALUES (31, 12, 1, 5, CAST(N'2024-10-30' AS Date), 4, N'sdsd')
INSERT [dbo].[Feedback] ([feedback_id], [account_id], [product_id], [rating], [create_date], [customer_id], [feedback_content]) VALUES (32, 12, 1, 5, CAST(N'2024-10-30' AS Date), 4, N'log')
INSERT [dbo].[Feedback] ([feedback_id], [account_id], [product_id], [rating], [create_date], [customer_id], [feedback_content]) VALUES (33, 12, 1, 5, CAST(N'2024-10-30' AS Date), 4, N'cccccccccccccccccccccccccccccccccccccccccccccccccccc')
INSERT [dbo].[Feedback] ([feedback_id], [account_id], [product_id], [rating], [create_date], [customer_id], [feedback_content]) VALUES (34, 12, 1, 5, CAST(N'2024-10-30' AS Date), 4, N'bvcccccc')
INSERT [dbo].[Feedback] ([feedback_id], [account_id], [product_id], [rating], [create_date], [customer_id], [feedback_content]) VALUES (35, 12, 1, 5, CAST(N'2024-10-30' AS Date), 4, N'zxccccczxczxczxcz')
INSERT [dbo].[Feedback] ([feedback_id], [account_id], [product_id], [rating], [create_date], [customer_id], [feedback_content]) VALUES (36, 12, 1, 5, CAST(N'2024-10-30' AS Date), 4, N'dcmmm')
SET IDENTITY_INSERT [dbo].[Feedback] OFF
GO
SET IDENTITY_INSERT [dbo].[News] ON 

INSERT [dbo].[News] ([newid], [ntid], [nimage], [title], [contents], [createdate], [status]) VALUES (1, 1, N'0022649_apple-wwdc-2023-logo_1600.jpeg', N'Tiêu điểm cuối năm 2023: Tổng hợp sản phẩm MacBook và iMac mới nhất của Apple', N'<p>S&aacute;ng ng&agrave;y 31/10, tại sự kiện Scary Fast mới nhất, những mẫu sản phẩm mới Mac của Apple đ&atilde; ch&iacute;nh thức ra mắt, tạo một l&agrave;n s&oacute;ng g&acirc;y chấn động cộng đồng c&ocirc;ng nghệ to&agrave;n cầu. Sự kiện ra mắt sản phẩm n&agrave;y đ&atilde; thu h&uacute;t sự quan t&acirc;m của đ&ocirc;ng đảo người d&ugrave;ng v&agrave; giới chuy&ecirc;n m&ocirc;n. Cả thế giới đang đổ dồn con mắt v&agrave;o si&ecirc;u phẩm MacBook Pro M3 14&quot; v&agrave; 16&quot;c&ugrave;ng iMac M3.</p>

<h2><strong>1. MacBook Pro M3 14 inch v&agrave; MacBook Pro 16 inch</strong></h2>

<p>Sản phẩm MacBook Pro mới ra mắt bao gồm 2 phi&ecirc;n bản MacBook Pro M3 14 inch v&agrave; MacBook Pro M3 16 inch với một số t&iacute;nh năng v&agrave; cải tiến xuất sắc.</p>

<p>Cả hai mẫu MacBook Pro n&agrave;y đều được trang bị chip M3 mới nhất của Apple, mang đến hiệu năng mạnh mẽ v&agrave; khả năng tiết kiệm năng lượng vượt trội.</p>

<h4><strong>Thiết kế</strong></h4>

<p>Thiết kế mới sang trọng. với vỏ nh&ocirc;m nguy&ecirc;n khối, với c&aacute;c g&oacute;c cạnh được bo tr&ograve;n. M&aacute;y c&oacute; hai m&agrave;u sắc ch&iacute;nh l&agrave; bạc v&agrave; x&aacute;m than.</p>

<h3><strong>M&agrave;u sắc</strong></h3>

<p>M&aacute;y c&oacute; hai m&agrave;u sắc ch&iacute;nh l&agrave; bạc v&agrave; x&aacute;m than cực c&aacute;ng trọng</p>

<h3><strong>Th&ocirc;ng số kỹ thuật</strong></h3>

<h4><strong>M&agrave;n H&igrave;nh</strong></h4>

<p>MacBook Pro M3 c&oacute; hai k&iacute;ch thước m&agrave;n h&igrave;nh l&agrave; 14 inch v&agrave; 16 inch. Cả hai k&iacute;ch thước m&agrave;n h&igrave;nh đều sử dụng tấm nền Liquid Retina XDR, với độ ph&acirc;n giải 3024 x 1964 pixel v&agrave; tần số qu&eacute;t 120Hz. M&agrave;n h&igrave;nh Liquid Retina XDR tối ưu những v&ugrave;ng s&aacute;ng, kể cả h&igrave;nh ảnh v&ugrave;ng tối vẫn chi tiết, sắc n&eacute;t, độ tương phản cao v&agrave; m&agrave;u sắc ch&iacute;nh x&aacute;c.</p>

<p>Đặc biệt, với tần số qu&eacute;t 120Hz h&igrave;nh ảnh hiển thị mượt m&agrave; v&agrave; trơn tru hơn. Đặc biệt m&atilde;n nh&atilde;n khi chơi tr&ograve; chơi điện tử đồ họa đẹp mắt, hay v&agrave; xem video chất lượng.</p>

<h4><strong>Chip</strong></h4>

<p>Chip M3, M3 Pro v&agrave; M3 Max đều l&agrave; con chip mới nhất của Apple, được sản xuất tr&ecirc;n tiến tr&igrave;nh 3nm. Chip M3 l&agrave; d&ograve;ng chip ti&ecirc;n tiến nhất từng được thiết kế cho m&aacute;y t&iacute;nh c&aacute; nh&acirc;n, hơn hết, hiệu năng CPU v&agrave; GPU mạnh mẽ hơn so với chip M2.</p>

<h4><strong>Pin</strong></h4>

<p>Thời gian xem video l&ecirc;n đến 22 giờ v&agrave; thời gian duyệt web tr&ecirc;n mạng kh&ocirc;ng d&acirc;y l&ecirc;n đến 15 giờ.</p>

<h3><strong>Camera &amp; loa</strong></h3>

<p>Camera FaceTime HD 1080p, với cảm biến lớn v&agrave; khẩu độ lớn hơn, gi&uacute;p cải thiện chất lượng h&igrave;nh ảnh trong điều kiện &aacute;nh s&aacute;ng yếu. Tnh năng Center Stage, gi&uacute;p giữ cho người d&ugrave;ng lu&ocirc;n ở trung t&acirc;m khung h&igrave;nh khi họ di chuyển. Song song hệ thống loa 6 loa, với &acirc;m thanh nổi Dolby Atmos truyền tải &acirc;m thanh sống động v&agrave; mạnh mẽ,&nbsp;</p>

<h3><strong>B&agrave;n ph&iacute;m v&agrave; Touch Bar</strong></h3>

<p>B&agrave;n ph&iacute;m được thiết kế với c&aacute;c ph&iacute;m bấm c&oacute; độ nảy tốt v&agrave; độ ch&iacute;nh x&aacute;c cao. Touch Bar nhạy, gần như kh&ocirc;ng c&oacute; độ trễ, dễ d&agrave;ng thao t&aacute;c điều khiển m&aacute;y.</p>

<h3><strong>Cổng kết nối</strong></h3>

<p>MacBook Pro M3 c&oacute; ba cổng Thunderbolt 4, một cổng HDMI v&agrave; một cổng MagSafe 3.</p>

<h3><strong>Một số t&iacute;nh năng kh&aacute;c</strong></h3>

<h4><strong>C&ocirc;ng nghệ d&ograve; tia tốc độ cao bằng phần cứng</strong></h4>

<p>MacBook Pro giờ đ&acirc;y được trang bị c&ocirc;ng nghệ d&ograve; tia tốc độ cao bằng phần cứng, mang đến hiệu năng kết xuất nhanh hơn đến 2,5 giờ v&agrave; gi&uacute;p c&aacute;c ứng dụng chuy&ecirc;n nghiệp v&agrave; tr&ograve; chơi hiển thị ch&acirc;n thực hơn bao giờ hết.</p>

<h4><strong>Cảm biến Touch ID</strong></h4>

<p>Touch ID bảo vệ dữ liệu v&agrave; th&ocirc;ng tin c&aacute; nh&acirc;n của người d&ugrave;ng, cực kỳ an to&agrave;n v&agrave; tiện lợi, chỉ cần chạm ng&oacute;n tay m&agrave; kh&ocirc;ng phải nhớ mật khẩu.</p>

<p>&nbsp;</p>

<h2><strong>2. iMac M3</strong></h2>

<p>iMac M3 - chiếc m&aacute;y t&iacute;nh để b&agrave;n All-in-One mới của Apple mở ra một thế giới giải tr&iacute;, s&aacute;ng tạo kh&ocirc;ng giới hạn.</p>

<h3><strong>Thiết kế</strong></h3>

<p>Thiết kế đẹp v&agrave; hiện đại viền mỏng chỉ 11,5mm, được l&agrave;m bằng nh&ocirc;m nguy&ecirc;n khối c&agrave;ng sang trọng v&agrave; chắc chắn. Ch&acirc;n đế h&igrave;nh chữ V, cố định cho m&aacute;y đứng vững.&nbsp;</p>

<h3><strong>M&agrave;u sắc</strong></h3>

<p>7 m&agrave;u rực rỡ: Xanh l&aacute;, v&agrave;ng, cam, hồng, t&iacute;m, xanh dương, bạc</p>

<h3><strong>Th&ocirc;ng số kỹ thuật</strong></h3>

<h4><strong>M&agrave;n H&igrave;nh</strong></h4>

<p>M&agrave;n h&igrave;nh Liquid Retina diện t&iacute;ch lớn 24 inch với độ ph&acirc;n giải 4,5K (4480 x 2520 pixel), mang đến một khung h&igrave;nh rộng r&atilde;i v&agrave; chi tiết sắc n&eacute;t. Độ s&aacute;ng 500 nit gi&uacute;p m&agrave;n h&igrave;nh hiển thị r&otilde; r&agrave;ng ngay cả trong điều kiện &aacute;nh s&aacute;ng mạnh. Dải m&agrave;u rộng P3 biến mọi thứ trước mắt trở n&ecirc;n sống động v&agrave; ch&acirc;n thực hơn.</p>

<p><strong>Chip</strong></p>

<p>Bước nhảy vọt về hiệu năng nhờ chip M3 cực khủng.&nbsp; Chip M3 c&oacute; hiệu năng CPU gồm 10 l&otilde;i, c&oacute; thể xử l&yacute; c&aacute;c t&aacute;c vụ như chỉnh sửa video, dựng h&igrave;nh 3D v&agrave; chơi game một c&aacute;ch mượt m&agrave; hơn. Dễ d&agrave;ng chỉnh sửa video 4K ở tốc độ 30 khung h&igrave;nh/gi&acirc;y cũng như chơi game AAA ở c&agrave;i đặt đồ họa cao m&agrave; kh&ocirc;ng bị giật lag.</p>

<p>Chip M3 c&oacute; hiệu năng GPU nhanh hơn 30% so với chip M2. Điều n&agrave;y c&oacute; nghĩa l&agrave; iMac M3 c&oacute; thể xử l&yacute; c&aacute;c t&aacute;c vụ đồ họa như chỉnh sửa ảnh, thiết kế đồ họa v&agrave; chơi game một c&aacute;ch mượt m&agrave; hơn.</p>

<p>Đ&acirc;y l&agrave; con chip mang lại hiệu năng mạnh mẽ v&agrave; tiết kiệm điện cho iMac M3. T&aacute;c vụ n&agrave;o m&aacute;y cũng đ&aacute;p ứng tốt từ chỉnh sửa video, dựng h&igrave;nh 3D, chơi game đến chỉnh sửa ảnh, thiết kế đồ họa v&agrave; xử l&yacute; c&aacute;c t&aacute;c vụ tr&iacute; tuệ nh&acirc;n tạo.</p>

<p><strong>Pin</strong></p>

<p>Thời lượng pin d&ugrave;ng cả ng&agrave;y l&ecirc;n tới 26 giờ.Tuy nhi&ecirc;n, thời lượng pin sẽ kh&aacute;c nhau t&ugrave;y theo c&aacute;ch sử dụng v&agrave; cấu h&igrave;nh</p>

<h3><strong>Camera &amp; hệ thống loa</strong></h3>

<p>Camera v&agrave; hệ thống &acirc;m thanh tr&ecirc;n iMac M3 đều l&agrave; những điểm mạnh của m&aacute;y. Camera FaceTime HD 1080p quay video ở độ ph&acirc;n giải 1080p ở tốc độ 30 khung h&igrave;nh/gi&acirc;y, đem lại chất lượng h&igrave;nh ảnh tốt, ph&ugrave; hợp cho c&aacute;c cuộc gọi video, hội nghị trực tuyến v&agrave; c&aacute;c t&aacute;c vụ kh&aacute;c y&ecirc;u cầu video. Đồng thời khi hệ thống &acirc;m thanh 6 loa mang lại &acirc;m thanh chất lượng cao ngập tr&agrave;n kh&ocirc;ng gian.</p>

<h3><strong>Bộ nhớ</strong></h3>

<p>Bộ nhớ RAM l&ecirc;n đến 16GB v&agrave; ổ cứng SSD l&ecirc;n đến 2TB.</p>

<h3><strong>Kết nối</strong></h3>

<p>iMac M3 c&oacute; c&aacute;c cổng Thunderbolt 4, USB-C, HDMI v&agrave; giắc cắm tai nghe</p>

<p>&nbsp;</p>

<h2><strong>Gi&aacute; b&aacute;n c&aacute;c sản phẩm mới tại ShopDunk</strong></h2>

<p>Gi&aacute; cả lu&ocirc;n l&agrave; điều m&agrave; c&aacute;c kh&aacute;ch h&agrave;ng quan t&acirc;m mỗi khi sản phẩm mới ra mắt. Hiện nay, sản phẩm đ&atilde; c&oacute; gi&aacute; ch&iacute;nh thức v&agrave; đi k&egrave;m nhiều ưu đ&atilde;i cực đ&atilde;:&nbsp;</p>

<h3><strong>MacBook Pro M3</strong></h3>

<ul>
	<li><strong>MacBook Pro 14 inch M3</strong>&nbsp;2023 phi&ecirc;n bản 8GB RAM | 512GB SSD: 39.999.000đ</li>
	<li><strong>MacBook Pro 16 inch M3</strong>&nbsp;2023 phi&ecirc;n bản 8GB RAM | 512GB SSD: 64.999.000₫</li>
</ul>

<h2>B&ecirc;n cạnh đ&oacute;, bạn sẽ được hưởng ưu đ&atilde;i giảm gi&aacute; đến 200.000đ cho g&oacute;i Microsoft Office. G&oacute;i Microsoft Office bao gồm c&aacute;c phần mềm Word, Excel, PowerPoint, OneNote, Outlook hỗ trợ tối đa mọi t&aacute;c vụ học tập v&agrave; l&agrave;m việc</h2>

<h3><strong>Địa chỉ mua sản phẩm Apple mới ch&iacute;nh h&atilde;ng&nbsp;</strong></h3>

<p>Nếu bạn đang t&igrave;m kiếm một cơ sở uy t&iacute;n để mua sản phẩm Apple mới ch&iacute;nh h&atilde;ng, ShopDunk l&agrave; sự lựa chọn đ&aacute;ng tin cậy m&agrave; bạn kh&ocirc;ng thể bỏ lỡ. Với vị thế l&agrave; đại l&yacute; ủy quyền h&agrave;ng đầu của Apple tại Việt Nam, ShopDunk cam kết chất lượng sản phẩm v&agrave; cung cấp gi&aacute; cả cạnh tranh. Đặc biệt, ShopDunk lu&ocirc;n c&oacute; c&aacute;c chương tr&igrave;nh khuyến m&atilde;i hấp dẫn cho kh&aacute;ch h&agrave;ng h&agrave;ng th&aacute;ng.</p>

<p>Trở th&agrave;nh người nhận th&ocirc;ng tin mua sản phẩm&nbsp;<strong>MacBook v&agrave; iMac&nbsp;</strong>sớm nhất&nbsp;<strong>VỚI DEAL HẤP DẪN&nbsp;</strong>tại ShopDunk.&nbsp;</p>

<p>- Giảm tới 1.000.000đ qua cổng thanh to&aacute;n&nbsp;</p>

<p>- Trả g&oacute;p l&atilde;i suất 0%&nbsp;</p>

<p>- C&oacute; bảo h&agrave;nh Apple&nbsp;</p>

<p>- 50 Store tr&ecirc;n cả nước&nbsp;</p>
', CAST(N'2024-11-02' AS Date), 1)
INSERT [dbo].[News] ([newid], [ntid], [nimage], [title], [contents], [createdate], [status]) VALUES (2, 1, N'iphone1.png', N'iPhone 15 Pro Có Mấy Màu? Màu Nào Mới Và Đẹp Nhất?', N'<p>iPhone 15 Pro kh&ocirc;ng chỉ được n&acirc;ng cấp về t&iacute;nh năng, hiệu suất m&agrave; c&ograve;n sở hữu bảng m&agrave;u sắc ấn tượng v&agrave; sang trọng bậc nhất. Vậy&nbsp;<em><strong>iPhone 15 Pro c&oacute; mấy m&agrave;u</strong></em>? C&ugrave;ng ShopDunk kh&aacute;m ph&aacute; bảng m&agrave;u đặc biệt của iPhone 15 Pro trong b&agrave;i viết dưới đ&acirc;y.</p>

<p>&nbsp;</p>

<h2><strong>1. 4 m&agrave;u iPhone 15 Pro mới nhất</strong></h2>

<p>Ng&agrave;y 13/9, Apple ch&iacute;nh thức ra mắt iPhone 15 Series c&ugrave;ng bảng m&agrave;u ho&agrave;n to&agrave;n mới, hứa hẹn sẽ l&agrave; HOT TREND 2023. iPhone 15 Pro c&oacute; mấy m&agrave;u? iPhone 15 Pro c&oacute; 4 m&agrave;u: Blue Titanium (Titan Xanh), Black Titanium (Titan Đen), White Titanium (Titan Trắng) v&agrave; Natural Titanium (Titan tự nhi&ecirc;n).</p>

<p>iPhone 15 Pro c&oacute; bảng m&agrave;u sắc đa dạng v&agrave; độc đ&aacute;o, ph&ugrave; hợp với sở th&iacute;ch v&agrave; phong c&aacute;ch của nhiều người d&ugrave;ng, chi tiết trong bảng m&agrave;u iPhone 15 Pro dưới đ&acirc;y:</p>

<table border="1" cellpadding="0" cellspacing="0" dir="ltr">
	<tbody>
		<tr>
			<td><strong>M&agrave;u sắc</strong></td>
			<td><strong>Đặc điểm nổi bật</strong></td>
		</tr>
		<tr>
			<td>Titan Xanh (Blue Titanium)</td>
			<td>
			<ul>
				<li>M&agrave;u xanh dương đậm mang lại cảm gi&aacute;c sang trọng v&agrave; thời thượng.</li>
				<li>M&agrave;u sắc n&agrave;y ph&ugrave; hợp với những người y&ecirc;u th&iacute;ch sự nổi bật v&agrave; c&aacute; t&iacute;nh.</li>
				<li>M&agrave;u Titan Xanh l&agrave; một m&agrave;u sắc mới lạ v&agrave; độc đ&aacute;o, chưa từng xuất hiện tr&ecirc;n c&aacute;c phi&ecirc;n bản iPhone trước đ&acirc;y.</li>
			</ul>
			</td>
		</tr>
		<tr>
			<td>Titan Đen (Black Titanium)</td>
			<td>
			<ul>
				<li>M&agrave;u đen huyền b&iacute; mang lại cảm gi&aacute;c sang trọng v&agrave; mạnh mẽ.</li>
				<li>M&agrave;u sắc n&agrave;y ph&ugrave; hợp với những người y&ecirc;u th&iacute;ch sự đơn giản v&agrave; tinh tế.</li>
				<li>M&agrave;u Titan Đen l&agrave; một m&agrave;u sắc kinh điển v&agrave; phổ biến, được nhiều người ưa chuộng.</li>
			</ul>
			</td>
		</tr>
		<tr>
			<td>Titan Trắng (White Titanium)</td>
			<td>
			<ul>
				<li>M&agrave;u trắng tinh tế mang lại cảm gi&aacute;c thanh lịch v&agrave; cuốn h&uacute;t.</li>
				<li>M&agrave;u sắc n&agrave;y ph&ugrave; hợp với những người y&ecirc;u th&iacute;ch sự sang trọng v&agrave; hiện đại.</li>
				<li>M&agrave;u Titan Trắng l&agrave; một m&agrave;u sắc quen thuộc v&agrave; dễ kết hợp với c&aacute;c phụ kiện kh&aacute;c.</li>
			</ul>
			</td>
		</tr>
		<tr>
			<td>Titan tự nhi&ecirc;n (Natural Titanium)</td>
			<td>
			<ul>
				<li>M&agrave;u x&aacute;m tro mang lại cảm gi&aacute;c sang trọng v&agrave; đẳng cấp.</li>
				<li>M&agrave;u sắc n&agrave;y ph&ugrave; hợp với những người y&ecirc;u th&iacute;ch sự cổ điển v&agrave; lịch l&atilde;m.</li>
				<li>M&agrave;u Titan tự nhi&ecirc;n l&agrave; một m&agrave;u sắc trung t&iacute;nh v&agrave; thanh lịch, ph&ugrave; hợp với nhiều phong c&aacute;ch kh&aacute;c nhau.</li>
			</ul>
			</td>
		</tr>
	</tbody>
</table>

<p>Chi tiết về 4 m&agrave;u iPhone 15 Pro được ShopDunk th&ocirc;ng tin trong phần tiếp theo.&nbsp;</p>

<h2><strong>2. Bảng gi&aacute; iPhone 15 Pro chi tiết&nbsp;</strong></h2>

<p>Theo c&ocirc;ng bố mới nhất từ Apple, mức gi&aacute; ni&ecirc;m yết giữa c&aacute;c m&agrave;u&nbsp;<strong><a href="https://shopdunk.com/iPhone-15-series" rel="noopener" target="_blank">điện thoại iPhone 15</a></strong>&nbsp;kh&ocirc;ng c&oacute; sự ch&ecirc;nh lệch m&agrave; phụ thuộc nhiều hơn v&agrave;o t&ugrave;y chọn bộ nhớ, cụ thể như sau:</p>

<table border="1">
	<tbody>
		<tr>
			<td>
			<p><strong>Phi&ecirc;n bản</strong></p>
			</td>
			<td>
			<p><strong>Gi&aacute; mở b&aacute;n quốc tế</strong></p>
			</td>
			<td>
			<p><strong>Gi&aacute; tham khảo tại Việt Nam</strong></p>
			</td>
		</tr>
		<tr>
			<td>
			<p>iPhone 15 Pro 128GB&nbsp;</p>

			<p>(Titan Đen, Titan Trắng, Titan Xanh, Titan Tự Nhi&ecirc;n)</p>
			</td>
			<td>
			<p>999 USD</p>
			</td>
			<td>
			<p>28.999.000 VND</p>
			</td>
		</tr>
		<tr>
			<td>
			<p>iPhone 15 Pro 256GB</p>
			</td>
			<td>
			<p>1099 USD</p>
			</td>
			<td>
			<p>31.999.000 VND</p>
			</td>
		</tr>
		<tr>
			<td>
			<p>iPhone 15 Pro 512GB</p>
			</td>
			<td>
			<p>1299 USD</p>
			</td>
			<td>
			<p>37.999.000 VND</p>
			</td>
		</tr>
		<tr>
			<td>
			<p>iPhone 15 Pro 1TB</p>
			</td>
			<td>
			<p>1499 USD</p>
			</td>
			<td>
			<p>43.999.000 VND</p>
			</td>
		</tr>
		<tr>
			<td colspan="3">
			<p>*Nguồn th&ocirc;ng tin từ Apple Store Online tại Mỹ v&agrave; Việt Nam.</p>
			</td>
		</tr>
	</tbody>
</table>

<p>Do đ&oacute;, bạn c&oacute; thể thỏa th&iacute;ch &ldquo;rinh&rdquo; ngay một chiếc iPhone 15 Pro với gam m&agrave;u ưa th&iacute;ch ngay h&ocirc;m nay m&agrave; kh&ocirc;ng cần qu&aacute; lo lắng về sự ch&ecirc;nh lệch gi&aacute;.</p>

<p><em><img alt="iPhone 15 Pro không có sự chênh lệch giá giữa các màu" src="https://shopdunk.com/images/uploaded/Tin%20t%E1%BB%A9c%20iPhone%2015/iphone-15-pro-co-may-mau/iphone-15-pro-khong-co-su-chenh-lech-gia-giua-cac-mau.png" style="height:338px; width:600px" /></em></p>

<p><em>iPhone 15 Pro kh&ocirc;ng c&oacute; sự ch&ecirc;nh lệch gi&aacute; giữa c&aacute;c m&agrave;u</em></p>

<h2><strong>3. iPhone 15 Pro giữ nguy&ecirc;n những m&agrave;u sắc n&agrave;o?</strong></h2>

<p>Trong lịch sử, Apple v&ocirc; c&ugrave;ng ưa chuộng 2 m&agrave;u sắc nguy&ecirc;n bản l&agrave; Trắng v&agrave; Đen. Apple lu&ocirc;n biết c&aacute;ch thay đổi c&aacute;c sắc độ m&agrave;u để l&agrave;m mới những gam m&agrave;u cơ bản, trở n&ecirc;n ph&aacute; c&aacute;ch v&agrave; tạo dấu ấn ri&ecirc;ng biệt cho mỗi thế hệ, điển h&igrave;nh l&agrave; 2 gam m&agrave;u Titan Đen v&agrave; Titan Trắng tr&ecirc;n d&ograve;ng iPhone 15 Pro. iPhone 15 Pro c&oacute; c&aacute;c m&agrave;u Titan Đen, Titan Titan Trắng, Titan Xanh, Titan Tự Nhi&ecirc;n mang đến cho người d&ugrave;ng trải nghiệm độc đ&aacute;o v&agrave; mới lạ, sang trọng.&nbsp;<a href="https://shopdunk.com/iPhone-15-pro" rel="noopener" target="_blank"><em><strong>iPhone 15 Pro gi&aacute;</strong></em></a>&nbsp;dao động từ 999 USD - 1499 USD.</p>

<h3><strong>3.1. iPhone 15 Pro m&agrave;u Titan Đen&nbsp;</strong></h3>

<p>Đến với iPhone 15 Pro, Apple đ&atilde; tr&igrave;nh l&agrave;ng sản phẩm với thiết kế mang t&ocirc;ng m&agrave;u Titan Đen (Black Titanium) sang trọng v&agrave; huyền b&iacute;. M&agrave;u đen được ho&agrave;n thiện tr&ecirc;n lớp vỏ titan c&oacute; &aacute;nh kim x&aacute;m trắng dưới t&aacute;c động của nguồn s&aacute;ng, tr&ugrave;ng m&agrave;u với phần vỏ v&agrave; viền ngo&agrave;i của thiết bị, mang lại cảm gi&aacute;c tr&agrave;n viền v&agrave; tăng th&ecirc;m vẻ mảnh mai cho si&ecirc;u phẩm mới.</p>

<p><em><img alt="iPhone 15 Pro Titan Đen có vẻ đẹp sang chảnh và huyền bí" src="https://shopdunk.com/images/uploaded/Tin%20t%E1%BB%A9c%20iPhone%2015/iphone-15-pro-co-may-mau/iphone-15-pro-titan-den-co-ve-dep-sang-chanh-va-huyen-bi.png" style="height:338px; width:600px" /></em></p>

<p><em>iPhone 15 Pro Titan Đen c&oacute; vẻ đẹp sang chảnh v&agrave; huyền b&iacute;</em></p>

<p>Khi so s&aacute;nh với đời iPhone 14 Pro tiền nhiệm, sắc đen tr&ecirc;n iPhone 15 Pro m&agrave;u Titan Đen c&oacute; phần tươi s&aacute;ng hơn v&agrave; phản quang như kim loại. Do đ&oacute;, thiết kế iPhone 15 Pro m&agrave;u Titan Đen được đ&aacute;nh gi&aacute; l&agrave; gam m&agrave;u mạnh mẽ, dễ phối đồ v&agrave; ph&ugrave; hợp với nhiều phong c&aacute;ch từ sang trọng, lịch l&atilde;m đến những phong c&aacute;ch thoải m&aacute;i thường ng&agrave;y.&nbsp;</p>

<p>Theo ngũ h&agrave;nh, m&agrave;u đen tương hợp với những người mệnh Thủy, mang lại may mắn, sức khỏe v&agrave; sự gi&agrave;u sang. Đồng thời, mệnh Mộc tương sinh với h&agrave;nh Thủy cũng th&iacute;ch hợp với m&agrave;u sắc n&agrave;y.</p>

<p><em><img alt="iPhone 15 Pro màu Titan Đen mạnh mẽ, huyền bí nhưng vẫn đầy vẻ tinh tế, sang trọng" src="https://shopdunk.com/images/uploaded/Tin%20t%E1%BB%A9c%20iPhone%2015/iphone-15-pro-co-may-mau/iphone-15-pro-mau-titan-den-manh-me-huyen-bi-nhung-van-day-ve-tinh-te.png" style="height:338px; width:600px" /></em></p>

<p><em>iPhone 15 Pro m&agrave;u Titan Đen mạnh mẽ, huyền b&iacute; nhưng vẫn đầy vẻ tinh tế, sang trọng</em></p>

<p><em><img alt="Cạnh viền và mặt sau của iPhone 15 Pro Titan Đen" src="https://shopdunk.com/images/uploaded/Tin%20t%E1%BB%A9c%20iPhone%2015/iphone-15-pro-co-may-mau/canh-vien-va-mat-sau-cua-iphone-15-pro-titan-den.png" style="height:338px; width:600px" /></em></p>

<p><em>Cạnh viền v&agrave; mặt sau của iPhone 15 Pro Titan Đen</em></p>

<p><em><img alt="Hình ảnh thực tế của iPhone 15 Pro màu Titan Đen tại buổi triển lãm sản phẩm mới của Apple" src="https://shopdunk.com/images/uploaded/Tin%20t%E1%BB%A9c%20iPhone%2015/iphone-15-pro-co-may-mau/hinh-anh-thuc-te-cua-iphone-15-pro-mau-titan-den.png" style="height:400px; width:600px" /></em></p>

<p><em>H&igrave;nh ảnh thực tế của iPhone 15 Pro m&agrave;u Titan Đen tại buổi triển l&atilde;m sản phẩm mới của Apple</em></p>

<p>Tr&ecirc;n&nbsp;<strong>k&ecirc;nh Youtube c&oacute; t&ecirc;n SGS Tech Hindi</strong>&nbsp;đ&atilde; đăng tải video về iPhone 15 Pro Titan Đen được quay trực tiếp tại buổi triển l&atilde;m sau sự kiện ra mắt sản phẩm mới Wonderlust của Apple. Bạn đọc c&oacute; thể xem th&ecirc;m video dưới đ&acirc;y để c&oacute; c&aacute;i nh&igrave;n ch&acirc;n thực nhất về si&ecirc;u phẩm n&agrave;y.&nbsp;</p>

<p><iframe height="336" src="https://www.youtube.com/embed/z9As0UOGIQc" width="600"></iframe></p>

<h3><strong>3.2. iPhone 15 Pro m&agrave;u Titan Trắng</strong></h3>

<p>M&agrave;u trắng đ&atilde; được xem như m&agrave;u nhận diện thương hiệu của iPhone v&agrave; lu&ocirc;n xuất hiện trong tất cả thế hệ. Đến với iPhone 15 Pro năm nay, Apple ra mắt một phi&ecirc;n bản m&agrave;u trắng mới l&agrave; iPhone 15 Pro m&agrave;u Titan Trắng (White Titanium) với sắc trắng m&ocirc; phỏng &aacute;nh kim của kim loại Titan.</p>

<p><em><img alt="iPhone 15 Pro có những màu gì? Gam màu trắng là gam màu truyền thống thường xuyên xuất hiện trong bảng màu iPhone Pro" src="https://shopdunk.com/images/uploaded/Tin%20t%E1%BB%A9c%20iPhone%2015/iphone-15-pro-co-may-mau/gam-mau-trang-la-gam-mau-truyen-thong-thuong-xuyen-xuat-hien-trong-bang-mau-iphone-pro.png" style="height:338px; width:600px" /></em></p>

<p><em>iPhone 15 Pro c&oacute; những m&agrave;u g&igrave;? Gam m&agrave;u trắng l&agrave; gam m&agrave;u truyền thống thường xuy&ecirc;n xuất hiện trong bảng m&agrave;u iPhone Pro</em></p>

<p>Kh&aacute;c biệt với m&agrave;u bạc trắng tinh kh&ocirc;i của d&ograve;ng iPhone 14 Pro, m&agrave;u trắng ở iPhone 15 Pro mới c&oacute; sắc độ &ldquo;trầm&rdquo; hơn, c&oacute; &aacute;nh kim xuất hiện khi xoay mặt lưng điện thoại dưới &aacute;nh đ&egrave;n. Đặc biệt, khung viền của iPhone 15 Pro Titan Trắng kh&ocirc;ng được thiết kế c&ugrave;ng m&agrave;u với phần mặt lưng như c&aacute;c phi&ecirc;n bản kh&aacute;c, m&agrave; mang một m&agrave;u x&aacute;m bạc c&oacute; &aacute;nh kim loại r&otilde; n&eacute;t, tạo n&ecirc;n sức cuốn h&uacute;t ri&ecirc;ng v&agrave; l&agrave;m mới th&ecirc;m thiết kế gam m&agrave;u trắng cơ bản.</p>

<p><em><img alt="iPhone 15 Pro màu Titan Trắng với sắc trắng thanh lịch, trang nhã, phù hợp cho nhiều outfit thời thượng" src="https://shopdunk.com/images/uploaded/Tin%20t%E1%BB%A9c%20iPhone%2015/iphone-15-pro-co-may-mau/iphone-15-pro-mau-titan-den-manh-me.png" style="height:338px; width:600px" /></em></p>

<p><em>iPhone 15 Pro m&agrave;u Titan Trắng với sắc trắng thanh lịch, trang nh&atilde;, ph&ugrave; hợp cho nhiều outfit thời thượng</em></p>

<p>Với sự h&ograve;a trộn c&aacute;c sắc m&agrave;u theo một tỷ lệ c&acirc;n đối, iPhone 15 Pro m&agrave;u Titan Trắng chắc chắn l&agrave; một &ldquo;item&rdquo; kh&ocirc;ng thể bỏ qua khi phối đồ theo những phong c&aacute;ch trang nh&atilde;, thanh lịch như Minimalism, Normcore hoặc những phong c&aacute;ch ưa chuộng sự tối giản, trung t&iacute;nh.</p>

<p>Trong phong thủy, c&aacute;c gam m&agrave;u trắng, bạc, x&aacute;m đều l&agrave; m&agrave;u bản mệnh của người mệnh Kim, mang lại sự may mắn về t&agrave;i lộc v&agrave; c&ocirc;ng danh sự nghiệp cho người sở hữu. Ngo&agrave;i ra, người mệnh Thủy tương sinh với h&agrave;nh Kim cũng sẽ gặp may mắn khi sử dụng những gam m&agrave;u n&agrave;y.</p>

<p><em><img alt="Hình ảnh cận cảnh mặt sau màu của iPhone 15 Pro Titan Trắng" src="https://shopdunk.com/images/uploaded/Tin%20t%E1%BB%A9c%20iPhone%2015/iphone-15-pro-co-may-mau/hinh-anh-can-canh-mat-sau-cua-iphone-15-pro-mau-titan-trang.png" style="height:338px; width:600px" /></em></p>

<p><em>H&igrave;nh ảnh cận cảnh mặt sau m&agrave;u của iPhone 15 Pro Titan Trắng</em></p>

<p><em><img alt="iPhone 15 Pro màu Titan Trắng ngoài đời thực không có sự khác biệt so với trên ảnh được Apple cung cấp" src="https://shopdunk.com/images/uploaded/Tin%20t%E1%BB%A9c%20iPhone%2015/iphone-15-pro-co-may-mau/iphone-15-pro-mau-titan-trang-ngoai-doi-thuc-khong-co-su-khac-biet-so-voi-tren-anh.png" style="height:403px; width:600px" /></em></p>

<p><em>iPhone 15 Pro m&agrave;u Titan Trắng ngo&agrave;i đời thực kh&ocirc;ng c&oacute; sự kh&aacute;c biệt so với tr&ecirc;n ảnh được Apple cung cấp</em></p>
', CAST(N'2024-11-02' AS Date), 1)
INSERT [dbo].[News] ([newid], [ntid], [nimage], [title], [contents], [createdate], [status]) VALUES (3, 1, N'iphone02.jpeg', N'Giá iPhone 15 Pro Max ưu đãi chỉ 28 triệu 790 - Sẵn hàng [tháng 4/2024]', N'<p><em>H&agrave;ng loạt đơn vị cung cấp tại Việt Nam đ&atilde; tung ra&nbsp;</em><strong><em>gi&aacute;&nbsp;<a href="https://shopdunk.com/iphone-15-pro-max">iPhone 15 Pro Max</a></em></strong><em>&nbsp;ch&iacute;nh thức với nhiều ưu đ&atilde;i giảm gi&aacute; thanh to&aacute;n cực s&acirc;u trong đ&oacute; ShopDunk l&agrave; đơn vị ủy quyền tại Apple cũng đang c&oacute; chương tr&igrave;nh khuyến m&atilde;i l&ecirc;n đến&nbsp;</em><strong><em>2.000.000VND c&ugrave;ng với nhiều phần qu&agrave; hấp dẫn</em></strong><em>. Sở hữu h&agrave;ng loạt n&acirc;ng cấp vượt trội v&agrave; t&iacute;nh năng mới nhưng mức gi&aacute; &ldquo;si&ecirc;u hời&quot;. C&ugrave;ng t&igrave;m hiểu bảng gi&aacute; iPhone 15 Pro Max chi tiết tại b&agrave;i viết dưới đ&acirc;y.</em></p>

<p><strong>Bảng gi&aacute;&nbsp;<a href="https://shopdunk.com/iphone-15-pro-max">iPhone 15 Pro Max</a>&nbsp;mới nhất v&agrave;o ng&agrave;y 24/04/2024:&nbsp;</strong></p>

<table border="1">
	<tbody>
		<tr>
			<td>
			<p><strong>Gi&aacute; theo dung lượng</strong></p>
			</td>
			<td>
			<p><strong>Gi&aacute; b&aacute;n iPhone 15 Pro Max</strong></p>

			<p><strong>(T4/2024)</strong></p>
			</td>
			<td>
			<p><a href="https://www.apple.com/vn/shop/buy-iphone/iphone-15-pro" rel="noopener" target="_blank"><strong>Gi&aacute; b&aacute;n Apple c&ocirc;ng bố</strong></a></p>
			</td>
			<td>
			<p><strong>Ch&ecirc;nh lệch</strong></p>
			</td>
		</tr>
		<tr>
			<td>
			<p><a href="https://shopdunk.com/iphone-15-pro-max" rel="noopener" target="_blank">Gi&aacute; iPhone 15 Pro Max 256GB</a></p>
			</td>
			<td>
			<p>Từ: 29.290.000 VNĐ</p>
			</td>
			<td>
			<p>34.999.000 VNĐ</p>
			</td>
			<td>
			<p>5.700.000 VNĐ</p>
			</td>
		</tr>
		<tr>
			<td>
			<p><a href="https://shopdunk.com/iphone-15-pro-max-512gb" rel="noopener" target="_blank">Gi&aacute; iPhone 15 Pro Max 512GB</a></p>
			</td>
			<td>
			<p>Từ: 36.590.000 VNĐ</p>
			</td>
			<td>
			<p>40.999.000 VNĐ</p>
			</td>
			<td>
			<p>4.400.000 VNĐ</p>
			</td>
		</tr>
		<tr>
			<td>
			<p><a href="https://shopdunk.com/iphone-15-pro-max-1tb" rel="noopener" target="_blank">Gi&aacute; iPhone 15 Pro Max 1TB</a></p>
			</td>
			<td>
			<p>Từ: 42.990.000 VNĐ</p>
			</td>
			<td>
			<p>46.999.000 VNĐ</p>
			</td>
			<td>
			<p>4.000.000 VNĐ</p>
			</td>
		</tr>
	</tbody>
</table>

<p><em>*Bảng gi&aacute; iPhone 15 Pro Max được cập nhật với gi&aacute; thấp nhất cho người d&ugrave;ng muốn sở hữu si&ecirc;u phẩm của Apple*</em></p>

<p><strong><img alt="Giá iPhone 15 Pro Max tại Apple Store Singapore không có quá nhiều chênh lệch với giá bản tại Việt Nam" src="https://shopdunk.com/images/uploaded/gia-iphone-15-series/gia-iphone-15-pro-max/gia-iphone-15-pro-max-5.jpg" style="height:338px; width:600px" /></strong></p>

<p><em>Điện thoại iphone 15 pro max gi&aacute; bao nhi&ecirc;u? Gi&aacute; iPhone 15 Pro Max tại Apple Store Singapore kh&ocirc;ng c&oacute; qu&aacute; nhiều ch&ecirc;nh lệch với gi&aacute; bản tại Việt Nam</em></p>

<h2><strong>1. Gi&aacute; iPhone 15 Pro Max cập nhật mới nhất theo từng phi&ecirc;n bản m&agrave;u [TH&Aacute;NG 4/2024]</strong></h2>

<p>Gi&aacute; iPhone 15 Pro Max 256GB, 512GB, 1TB mở b&aacute;n tại Việt Nam dao động trong khoảng từ&nbsp;<strong>34.950.000đ - 46.950.000đ</strong>, thấp hơn&nbsp;<strong>2.000.000đ - 3.000.000đ</strong>&nbsp;so với gi&aacute; mở b&aacute;n của iPhone 14 Pro Max năm trước. Dưới đ&acirc;y l&agrave; bảng gi&aacute; iPhone 15 Pro Max mở b&aacute;n tại Việt Nam chi tiết từng mức dung lượng, m&agrave;u sắc k&egrave;m theo đ&oacute; l&agrave; gi&aacute; trả g&oacute;p h&agrave;ng th&aacute;ng của từng phi&ecirc;n bản:</p>

<h3><strong>1.1. Gi&aacute; iPhone 15 Pro Max 256GB</strong></h3>

<p>C&oacute; rất nhiều iFans băn khoăn ở thời điểm iPhone 15 Series ra mắt sau g&acirc;̀n 1 năm th&igrave; iPhone 15 Pro Max 256GB gi&aacute; bao nhi&ecirc;u?&nbsp;Gi&aacute; iPhone 15 Pro Max 256GB theo c&aacute;c phi&ecirc;n bản m&agrave;u sẽ&nbsp;<strong>ch&ecirc;nh nhau khoảng 500.000 VND</strong>&nbsp;,đ&acirc;y l&agrave; con số ch&ecirc;nh lệch kh&ocirc;ng đ&aacute;ng kể.&nbsp; Cụ thể, bản m&agrave;u Titan Xanh l&agrave; phi&ecirc;n bản m&agrave;u c&oacute; mức gi&aacute; thấp nhất l&agrave;&nbsp;<strong>28.790.000 VND.&nbsp;</strong></p>

<p>Chi tiết mời bạn đọc theo d&otilde;i bảng&nbsp;<strong>gi&aacute; gốc v&agrave; gi&aacute; trả g&oacute;p iPhone 15 Pro Max 256GB theo từng phi&ecirc;n bản m&agrave;u</strong>&nbsp;dưới đ&acirc;y:&nbsp;</p>

<table border="1">
	<tbody>
		<tr>
			<td>
			<p><strong>Phi&ecirc;n bản m&agrave;u iPhone 15 Pro Max 256GB</strong></p>
			</td>
			<td>
			<p><strong><a href="https://shopdunk.com/iphone-15-pro-max" rel="noopener" target="_blank">Gi&aacute; b&aacute;n iPhone 15 Pro Max 256GB (T04/2024)</a></strong></p>
			</td>
			<td>
			<p><strong><a href="https://shopdunk.com/tra-gop/iphone-15-pro-max" rel="noopener" target="_blank">Gi&aacute; trả g&oacute;p</a></strong></p>

			<p><strong>(kỳ hạn 12 th&aacute;ng)</strong></p>
			</td>
			<td>
			<p><strong>Ch&ecirc;nh lệch sau trả g&oacute;p</strong></p>
			</td>
		</tr>
		<tr>
			<td>
			<p><strong>Titan Đen</strong></p>
			</td>
			<td>
			<p>29.490.000đ</p>
			</td>
			<td>
			<p>2.721.465đ/1 th&aacute;ng</p>
			</td>
			<td>
			<p>3.000.000đ</p>
			</td>
		</tr>
		<tr>
			<td>
			<p><strong>Titan Xanh</strong></p>
			</td>
			<td>
			<p>29.490.000đ</p>
			</td>
			<td>
			<p>2.721.465đ/1 th&aacute;ng</p>
			</td>
			<td>
			<p>3.000.000đ</p>
			</td>
		</tr>
		<tr>
			<td>
			<p><strong>Titan Trắng</strong></p>
			</td>
			<td>
			<p>29.290.000đ</p>
			</td>
			<td>
			<p>2.721.465đ/1 th&aacute;ng</p>
			</td>
			<td>
			<p>3.000.000đ</p>
			</td>
		</tr>
		<tr>
			<td>
			<p><strong>Titan Tự Nhi&ecirc;n</strong></p>
			</td>
			<td>
			<p>29.490.000đ</p>
			</td>
			<td>
			<p>2.721.465đ/1 th&aacute;ng</p>
			</td>
			<td>
			<p>2.000.000đ</p>
			</td>
		</tr>
	</tbody>
</table>

<p><em>*Gi&aacute; iPhone 15 Pro Max 256GB k&egrave;m theo gi&aacute; trả g&oacute;p h&agrave;ng th&aacute;ng được cập nhật mới nhất v&agrave;o ng&agrave;y 24/04/2024 theo KV Mi&ecirc;̀n Bắc*</em></p>

<h3><strong>1.2. Gi&aacute; iPhone 15 Pro Max 512GB</strong></h3>

<p>Gi&aacute; iPhone 15 Pro Max 512GB theo c&aacute;c phi&ecirc;n bản m&agrave;u kh&ocirc;ng c&oacute; sự ch&ecirc;nh lệch gi&aacute; về m&agrave;u sắc. Cụ thể, cả 4 phi&ecirc;n bản m&agrave;u Titan Đen, Titan Trắng, Titan Xanh v&agrave; Titan tự nhi&ecirc;n đều c&oacute; mức gi&aacute; l&agrave;&nbsp;<strong>36.950.000 VNĐ</strong>.&nbsp;</p>

<p>Chi tiết mời bạn đọc theo d&otilde;i bảng&nbsp;<strong>gi&aacute; gốc v&agrave; gi&aacute; trả g&oacute;p iPhone 15 Pro Max 512GB theo từng phi&ecirc;n bản m&agrave;u</strong>&nbsp;tại ShopDunk dưới đ&acirc;y:&nbsp;</p>

<table border="1">
	<tbody>
		<tr>
			<td>
			<p><strong>Phi&ecirc;n bản m&agrave;u</strong></p>
			</td>
			<td>
			<p><strong><a href="https://shopdunk.com/iphone-15-pro-max-512gb" rel="noopener" target="_blank">Gi&aacute; điện thoại iPhone 15 Pro Max 512GB (T4/2024)</a></strong></p>
			</td>
			<td>
			<p><strong><a href="https://shopdunk.com/tra-gop/iphone-15-pro-max-512gb" rel="noopener" target="_blank">Gi&aacute; trả g&oacute;p</a></strong></p>

			<p><strong>(kỳ hạn 12 th&aacute;ng)</strong></p>
			</td>
			<td>
			<p><strong>Ch&ecirc;nh lệch sau trả g&oacute;p</strong></p>
			</td>
		</tr>
		<tr>
			<td>
			<p><strong>Titan Đen</strong></p>
			</td>
			<td>
			<p>36.950.000₫</p>
			</td>
			<td>
			<p>3.433.096đ/ 1 th&aacute;ng</p>
			</td>
			<td>
			<p>4.000.000đ</p>
			</td>
		</tr>
		<tr>
			<td>
			<p><strong>Titan Xanh</strong></p>
			</td>
			<td>
			<p>36.950.000₫</p>
			</td>
			<td>
			<p>3.433.096đ/ 1 th&aacute;ng</p>
			</td>
			<td>
			<p>4.000.000đ</p>
			</td>
		</tr>
		<tr>
			<td>
			<p><strong>Titan Trắng</strong></p>
			</td>
			<td>
			<p>36.950.000₫</p>
			</td>
			<td>
			<p>3.433.096đ/ 1 th&aacute;ng</p>
			</td>
			<td>
			<p>4.000.000đ</p>
			</td>
		</tr>
		<tr>
			<td>
			<p><strong>Titan Tự Nhi&ecirc;n</strong></p>
			</td>
			<td>
			<p>36.950.000₫</p>
			</td>
			<td>
			<p>3.433.096đ/ 1 th&aacute;ng</p>
			</td>
			<td>
			<p>3.000.000đ</p>
			</td>
		</tr>
	</tbody>
</table>

<p><em>*Gi&aacute; iPhone 15 Pro Max 512GB k&egrave;m theo gi&aacute; trả g&oacute;p h&agrave;ng th&aacute;ng được cập nhật mới nhất v&agrave;o ng&agrave;y 24/04/2024*</em></p>

<h3><strong>1.3. Gi&aacute; iPhone 15 Pro Max 1TB</strong></h3>

<p>iPhone 15 Pro Max 1TB sẽ kh&aacute;c c&aacute;c phi&ecirc;n bản trước l&agrave; kh&ocirc;ng ch&ecirc;nh lệch về khoảng gi&aacute;.&nbsp;</p>

<p>Mức gi&aacute; ch&ecirc;nh lệch với bản 256GB l&agrave; 13.700.000 VNĐ, ch&ecirc;nh lệch với bản 512GB l&agrave; 6.000.000 VNĐ</p>

<p>Chi tiết mời bạn đọc theo d&otilde;i bảng<strong>&nbsp;gi&aacute; gốc v&agrave; gi&aacute; trả g&oacute;p iPhone 15 Pro Max 1TB&nbsp;</strong>dưới đ&acirc;y:&nbsp;</p>

<table border="1">
	<tbody>
		<tr>
			<td>
			<p><strong>Phi&ecirc;n bản m&agrave;u</strong></p>
			</td>
			<td>
			<p><strong><a href="https://shopdunk.com/iphone-15-pro-max-1tb" rel="noopener" target="_blank">Gi&aacute; của iPhone 15 Pro Max 1TB (T04/2024)</a></strong></p>
			</td>
			<td>
			<p><strong><a href="https://shopdunk.com/tra-gop/iphone-15-pro-max-1tb" rel="noopener" target="_blank">Gi&aacute; trả g&oacute;p</a></strong></p>

			<p><strong>(kỳ hạn 12 th&aacute;ng)</strong></p>
			</td>
			<td>
			<p><strong>Ch&ecirc;nh lệch sau trả g&oacute;p</strong></p>
			</td>
		</tr>
		<tr>
			<td>
			<p><strong>Titan (Đen, Xanh, Trắng, Tự nhi&ecirc;n)</strong></p>
			</td>
			<td>
			<p>42.990.000₫</p>
			</td>
			<td>
			<p>3.990.510đ/ 1 th&aacute;ng</p>
			</td>
			<td>
			<p>3.000.000đ</p>
			</td>
		</tr>
	</tbody>
</table>

<p><em>*Gi&aacute; iPhone 15 Pro Max 1TB k&egrave;m theo gi&aacute; trả g&oacute;p h&agrave;ng th&aacute;ng được cập nhật mới nhất v&agrave;o ng&agrave;y 24/04/2024*</em></p>

<p><strong><em>&ldquo;Với mức gi&aacute; ở thời điểm hiện tại, si&ecirc;u phẩm iPhone 15 Pro Max 1TB m&agrave;u Titan tự nhi&ecirc;n đang l&agrave; sản phẩm được săn đ&oacute;n v&agrave; b&aacute;n chạy nhất tr&ecirc;n thị trường Việt Nam&rdquo;</em></strong></p>

<h3><strong>1.4. Gi&aacute; iPhone 15 Pro Max sau khi &aacute;p dụng khuyến m&atilde;i giảm gi&aacute; [Update 04/2024]</strong></h3>

<p><strong><em><img alt="Giá iPhone 15 sau khi áp dụng khuyến mãi giảm giá" src="https://shopdunk.com/images/uploaded/15.%20camera%20iPhone%2015/gia-iphone-15-pro-max-sau-khi-ap-dung-khuyen-mai.png" style="height:279px; width:600px" /></em></strong></p>

<p><strong><em>iPhone 15 Pro Max 2024 gi&aacute; bao nhi&ecirc;u? Gi&aacute; iPhone 15 Pro Max 256GB, 512Gb, 1TB sau khi &aacute;p dụng khuyến m&atilde;i với mức gi&aacute; cực sốc</em></strong></p>

<p>Bảng gi&aacute; iPhone 15 Pro Max sau khi &aacute;p dụng chương tr&igrave;nh khuyến m&atilde;i qua &ldquo;cổng thanh to&aacute;n&rdquo;:</p>

<table border="1">
	<tbody>
		<tr>
			<td>
			<p><strong>Gi&aacute; iPhone 15 Pro Max</strong></p>
			</td>
			<td>
			<p><strong>Gi&aacute; b&aacute;n của ShopDunk</strong></p>
			</td>
			<td>
			<p><strong>Gi&aacute; ưu đ&atilde;i sau khi &aacute;p dụng khuyến m&atilde;i giảm gi&aacute;</strong></p>
			</td>
		</tr>
		<tr>
			<td>
			<p><strong>Gi&aacute; iPhone 15 Pro Max 256GB</strong></p>
			</td>
			<td>
			<p>29.290.000₫</p>
			</td>
			<td>
			<p>28.790.000đ</p>
			</td>
		</tr>
		<tr>
			<td>
			<p><strong>Gi&aacute; iPhone 15 Pro Max 512GB</strong></p>
			</td>
			<td>
			<p>36.590.000₫</p>
			</td>
			<td>
			<p>36.090.000đ</p>
			</td>
		</tr>
		<tr>
			<td>
			<p><strong>Gi&aacute; iPhone 15 Pro Max 1TB</strong></p>
			</td>
			<td>
			<p>42.990.000₫</p>
			</td>
			<td>
			<p>42.490.000đ</p>
			</td>
		</tr>
	</tbody>
</table>

<p><em><img alt="gia-iphone-15-pro-max" src="https://shopdunk.com/images/uploaded/iPhone%2015%20series/iphone-15-pro-max.jpeg" style="height:338px; width:600px" /></em></p>

<p><em>Đại l&yacute; uỷ quyền ShopDunk tung ra h&agrave;ng loạt chương tr&igrave;nh ưu đ&atilde;i hấp dẫn</em></p>

<p>B&ecirc;n cạnh đ&oacute;, nhiều đại l&yacute; ủy quyền ch&iacute;nh h&atilde;ng của Apple c&ograve;n tặng th&ecirc;m loạt ưu đ&atilde;i v&agrave; khuyến m&atilde;i hấp dẫn gi&uacute;p mức gi&aacute; thanh to&aacute;n thực tế c&oacute; thể thấp hơn gi&aacute; gốc đến<strong>&nbsp;2.500.000đ&nbsp;</strong><em><strong>(&aacute;p dụng t&ugrave;y đại l&yacute;, số lượng c&oacute; hạn)</strong>. Tham khảo th&ocirc;ng tin khuyến m&atilde;i tiếp theo.</em></p>

<p>Dưới đ&acirc;y l&agrave;<strong>&nbsp;5 ưu đ&atilde;i khuyến m&atilde;i cực khủng của ShopDunk</strong>&nbsp;- đại l&yacute; Ủy Quyền ch&iacute;nh h&atilde;ng của Apple tại Việt Nam, nhanh tay săn qu&agrave; ngay:&nbsp;</p>

<p><strong>1 - Ưu đ&atilde;i thanh to&aacute;n&nbsp;</strong></p>

<ul>
	<li>Giảm tới 500.000đ qua cổng thanh to&aacute;n</li>
</ul>

<p><strong>2 - Ưu đ&atilde;i trả g&oacute;p (01/04 - 30/04)</strong></p>

<ul>
	<li>Ưu đ&atilde;i tới 5% gi&aacute; trị sản phẩm khi thanh to&aacute;n trả g&oacute;p</li>
</ul>

<p><strong>3 - Thu cũ đổi mới l&ecirc;n đời iPhone 15 series</strong></p>

<ul>
	<li>Trợ gi&aacute; đến 2.000.000đ cho kh&aacute;ch l&ecirc;n đời iPhone 15 series</li>
</ul>

<p><strong>4 - Ưu đ&atilde;i mua k&egrave;m iPhone 15 series</strong></p>

<ul>
	<li>Giảm 10% khi mua Bảo h&agrave;nh VIP, Bảo h&agrave;nh ti&ecirc;u chuẩn mở rộng (6 th&aacute;ng, 12 th&aacute;ng)</li>
	<li>Giảm 20% khi mua Bảo h&agrave;nh kim cương (Rơi vỡ, v&agrave;o nước)</li>
	<li>Giảm 300.000đ khi mua ốp lưng ch&iacute;nh h&atilde;ng Apple cho iPhone 15 series</li>
	<li>Mua combo phụ kiện c&agrave;ng nhiều nhiều giảm s&acirc;u đến 200.000đ</li>
</ul>

<p><strong>5 - Ưu đ&atilde;i c&aacute;n bộ c&ocirc;ng nh&acirc;n vi&ecirc;n VietinBank, VietcomBank, VinFast</strong></p>

<ul>
	<li>Tặng voucher giảm gi&aacute; 500.000đ (đã k&ecirc;́t thúc chương trình ưu đãi này)</li>
</ul>
', CAST(N'2024-11-02' AS Date), 1)
INSERT [dbo].[News] ([newid], [ntid], [nimage], [title], [contents], [createdate], [status]) VALUES (4, 1, N'0021957_dung-luong-pin-iphone-15-pro-max_1600.jpeg', N'Dung Lượng Pin iPhone 15 Pro Max KHỦNG 4.422 mAh| Test thực tế ra sao?', N'<p><em>Theo th&ocirc;ng b&aacute;o ch&iacute;nh thức từ Apple,&nbsp;<strong>dung lượng pin iPhone 15 Pro Max</strong>&nbsp;sở hữu vi&ecirc;n pin lớn nhất 4.422 mAh, tăng khoảng 2,29% với iPhone 14 Pro Max, với thời gian xem video trực tuyến 25 giờ. Chi tiết th&ocirc;ng tin n&agrave;y ra sao, c&ugrave;ng ShopDunk t&igrave;m hiểu ngay sau đ&acirc;y.</em></p>

<h2><strong>1. Dung lượng pin iPhone 15 Pro Max bao nhi&ecirc;u?</strong></h2>

<p>4 phi&ecirc;n bản iPhone 15 Series c&oacute; dung lượng pin nhiều hơn 100 mAh so với iPhone 14 Series. Trong đ&oacute;,&nbsp;<em><strong>iPhone 15 Pro Max c&oacute; vi&ecirc;n pin 4.422 mAh</strong></em>, dung lượng pin lớn nhất v&agrave; thời gian sử dụng dẫn đầu khi xem video khoảng 29 giờ, ph&aacute;t video trực tuyến 25 giờ v&agrave; nghe nhạc l&ecirc;n đến 95 giờ. Ngo&agrave;i ra, iPhone 15 Pro Max được hỗ trợ sạc nhanh với d&acirc;y 20W, sạc đầy 50% chỉ trong 35 ph&uacute;t.</p>

<p>Thay đổi cổng sạc&nbsp;<strong><a href="https://shopdunk.com/iphone-15-dung-sac-gi">iPhone 15 USB C</a></strong>&nbsp;tr&ecirc;n iphone 15 series gi&uacute;p bạn tiết kiệm thời gian sạc nhanh hơn. C&oacute; thể thấy, thời lượng sử dụng của iPhone 15 Pro Max theo Apple c&ocirc;ng bố kh&ocirc;ng c&oacute; sự thay đổi so với tiền nhiệm iPhone 14 Pro Max.</p>

<p>Chi tiết th&ocirc;ng số pin iPhone 15 Pro Max được cập nhật chi tiết trong nội dung dưới đ&acirc;y:</p>

<table border="1">
	<tbody>
		<tr>
			<td colspan="2">
			<p><strong>Th&ocirc;ng số pin iPhone 15 Pro Max</strong></p>
			</td>
		</tr>
		<tr>
			<td>
			<p><strong>Đặc điểm</strong></p>
			</td>
			<td>
			<p><strong>Th&ocirc;ng số chi tiết</strong></p>
			</td>
		</tr>
		<tr>
			<td>
			<p><strong>Loại pin</strong></p>
			</td>
			<td>
			<p>Li-ion (Lithium-ion)</p>
			</td>
		</tr>
		<tr>
			<td>
			<p><strong>Dung lượng pin</strong></p>
			</td>
			<td>
			<p>4.422 mAh</p>
			</td>
		</tr>
		<tr>
			<td>
			<p><strong>Thời lượng sử dụng</strong></p>
			</td>
			<td>
			<p>Xem video: 29 giờ</p>

			<p>Xem video trực tuyến: 25 giờ</p>

			<p>Nghe nhạc: 95 giờ</p>
			</td>
		</tr>
		<tr>
			<td>
			<p><strong>Thời gian sạc 50%</strong></p>
			</td>
			<td>
			<p>30 ph&uacute;t</p>
			</td>
		</tr>
		<tr>
			<td>
			<p><strong>Thời gian sạc đầy 100%</strong></p>
			</td>
			<td>
			<p>Từ 80 - 90 ph&uacute;t</p>
			</td>
		</tr>
	</tbody>
</table>

<p>C&oacute; thể thấy, iPhone 15 Pro Max vẫn sử dụng pin Li-ion tương tự như c&aacute;c d&ograve;ng iPhone kh&aacute;c, đồng thời c&aacute;c th&ocirc;ng số kh&ocirc;ng nhiều kh&aacute;c biệt so với bản tiền nhiệm. Vậy dung lượng pin ip15 Pro Max so với những phi&ecirc;n bản kh&aacute;c trong c&ugrave;ng series c&oacute; g&igrave; nổi bật, h&atilde;y c&ugrave;ng theo d&otilde;i trong nội dung dưới đ&acirc;y.</p>

<p><img alt="Dung lượng pin iPhone 15 Pro Max" src="https://shopdunk.com/images/uploaded/Tin%20t%E1%BB%A9c%20iPhone%2015/dung-luong-in-iphone-15-pro-max/dung-luong-pin-iphone-15-pro-max.jpg" style="height:300px; width:600px" /></p>

<p><em>iPhone 15 Pro Max sở hữu dung lượng pin l&ecirc;n tới 4.422 mAh</em></p>

<p><em>&gt;&gt;&gt; Tham khảo th&ecirc;m về&nbsp;<a href="https://shopdunk.com/kich-thuoc-iphone-15-pro-max" rel="noopener" target="_blank">k&iacute;ch thước iPhone 15 Pro Max</a>&nbsp;để xem Apple thay đổi si&ecirc;u phẩm lần n&agrave;y như thế n&agrave;o m&agrave; iFans săn đ&oacute;n rầm rộ như vậy.</em></p>

<h2><strong>2. 2 b&agrave;i test thời lượng pin iPhone 15 Pro Max thực tế</strong></h2>

<p>Để h&igrave;nh dung r&otilde; hơn về thời gian sử dụng thực tế của iPhone 15 Pro Max, người d&ugrave;ng h&atilde;y c&ugrave;ng ch&uacute;ng t&ocirc;i t&igrave;m hiểu chi tiết hơn qua 2 b&agrave;i test về dung lượng pin của những chuy&ecirc;n gia c&ocirc;ng nghệ:</p>

<h3><strong>2.1 Tom&rsquo;s Guide th&iacute; nghiệm iPhone 15 Pro Max d&ugrave;ng tới 14 tiếng 02 ph&uacute;t</strong>&nbsp;</h3>

<p>Chuy&ecirc;n trang c&ocirc;ng nghệ&nbsp;<a href="https://www.tomsguide.com/news/iphone-15-battery-life-tested" rel="noopener" target="_blank"><strong><em>Tom&rsquo;s Guide</em></strong></a>&nbsp;trang tin tức c&oacute; độ ch&iacute;nh x&aacute;c cao gần đ&acirc;y đ&atilde; thực hiện th&iacute; nghiệm thời gian sử dụng thực tế của cả 4 phi&ecirc;n bản iPhone 15 series.&nbsp;</p>

<p>Trong điều kiện lướt web li&ecirc;n tục với mức s&aacute;ng 150 nits, iPhone 15 Pro Max đ&atilde; cho thấy khả năng vượt trội của m&igrave;nh với thời gian sử dụng li&ecirc;n tục 14 giờ 02 ph&uacute;t. Mặc d&ugrave; th&ocirc;ng số kh&ocirc;ng mạnh bằng iPhone 15 Pro Max, nhưng trong th&iacute; nghiệm n&agrave;y, iPhone 15 Plus lại l&agrave; phi&ecirc;n bản đứng đầu iPhone 15 series với thời gian sử dụng li&ecirc;n tục l&agrave; 14 giờ 14 ph&uacute;t (hơn iPhone 15 Pro Max 12 ph&uacute;t). Đứng ở hạng &aacute;p ch&oacute;t v&agrave; hạng ch&oacute;t lần lượt l&agrave; iPhone 15 v&agrave; iPhone 15 Pro.</p>

<p>D&ugrave; kh&ocirc;ng phải l&agrave; phi&ecirc;n bản c&oacute; thời gian sử dụng l&acirc;u nhất trong th&iacute; nghiệm lần n&agrave;y nhưng Tom&rsquo;s Guide ưu &aacute;i d&agrave;nh lời nhận x&eacute;t &ldquo;c&oacute; c&aacute;nh&rdquo; cho iPhone 15 Pro Max: Kh&ocirc;ng c&oacute; một chiếc điện thoại h&agrave;ng đầu n&agrave;o m&agrave; chuy&ecirc;n trang n&agrave;y từng thử nghiệm cho thời gian sử dụng ấn tượng như iPhone 15 Pro Max. Tuy mức dung lượng pin chỉ nhỉnh hơn một ch&uacute;t nhưng r&otilde; r&agrave;ng, iPhone 15 Pro Max cho kết quả kh&aacute;c biệt hơn tiền nhiệm (l&acirc;u hơn 23 ph&uacute;t so với iPhone 14 Pro Max).</p>

<p><img alt="Kết quả thử nghiệm thời lượng sử dụng pin trên iPhone 15 series" src="https://shopdunk.com/images/uploaded/Tin%20t%E1%BB%A9c%20iPhone%2015/dung-luong-in-iphone-15-pro-max/thoi-luong-su-dung-pin-cac-dong-iphone-series.jpg" style="height:671px; width:600px" /></p>

<p><em>Kết quả của cuộc thử nghiệm của Tom&rsquo;s Guide với 4 phi&ecirc;n bản iPhone 15 series</em></p>

<h3><strong>2.2 Youtube DKHD khẳng định iPhone 15 Pro Max d&ugrave;ng hơn 12 tiếng</strong></h3>

<p>Mới đ&acirc;y k&ecirc;nh YouTube&nbsp;<strong><em>DKHD</em></strong>&nbsp;đ&atilde; đăng tải video so s&aacute;nh về pin giữa iPhone 15 Pro Max v&agrave; iPhone 14 Pro Max thu h&uacute;t 37.000 lượt xem. Trong video n&agrave;y, người thực hiện đ&atilde; sử dụng điều kiện thử nghiệm l&agrave; xem video kết hợp c&ugrave;ng chơi game tr&ecirc;n cả 2 phi&ecirc;n bản. Kết quả cho thấy, thời gian sử dụng li&ecirc;n tục của iPhone 14 Pro Max l&agrave; 9 giờ 30 ph&uacute;t. Với iPhone 15 Pro Max, con số cho ra ấn tượng hơn - khoảng 10 tiếng 30 ph&uacute;t trong c&ugrave;ng điều kiện thử nghiệm. Ngo&agrave;i ra, trong điều kiện thử nghiệm nhẹ nh&agrave;ng hơn, iPhone 15 cho thời gian sử dụng đ&aacute;ng kinh ngạc - l&ecirc;n đến hơn 12 giờ.</p>

<p>YouTuber DKHD cho rằng, c&oacute; 2 l&yacute; do ch&iacute;nh gi&uacute;p pin iPhone 15 Pro Max vượt trội hơn tiền nhiệm l&agrave; dung lượng pin 4.422 mAh v&agrave; bộ vi xử l&yacute; Apple A17 Pro 3nm gi&uacute;p tiết kiệm năng lượng mới được Apple trang bị cho phi&ecirc;n bản n&agrave;y. Như đ&atilde; ph&acirc;n t&iacute;ch ở phần tr&ecirc;n, dung lượng pin v&agrave; chipset l&agrave; 2 yếu tố quan trọng nhất gi&uacute;p n&acirc;ng cao thời lượng sử dụng pin của iPhone n&oacute;i ri&ecirc;ng v&agrave; to&agrave;n bộ smartphone n&oacute;i chung.</p>

<p>Để hiểu r&otilde; hơn về qu&aacute; tr&igrave;nh th&iacute; nghiệm pin iPhone 15 Pro Max của YouTuber n&agrave;y, người d&ugrave;ng c&oacute; thể tham khảo th&ecirc;m video dưới đ&acirc;y:</p>

<p><iframe height="336" src="https://www.youtube.com/embed/LxULQdoHE6M" width="600"></iframe></p>

<blockquote>
<p>2 th&iacute; nghiệm về pin iPhone 15 Pro Max cho thấy,&nbsp;<strong>thời gian sử dụng li&ecirc;n tục của phi&ecirc;n bản n&agrave;y khoảng 12 - 14 tiếng</strong>&nbsp;cho c&aacute;c t&aacute;c vụ kh&aacute;c nhau,&nbsp;<strong>nhiều hơn 20 ph&uacute;t - 60 ph&uacute;t so với iPhone 14 Pro Max</strong>. Đ&acirc;y l&agrave; phi&ecirc;n bản Pro Max c&oacute; pin &ldquo;tr&acirc;u&rdquo; nhất trong d&ograve;ng Pro Max, gi&uacute;p người d&ugrave;ng sử dụng cả ng&agrave;y m&agrave; kh&ocirc;ng lo hết pin. Điều n&agrave;y nhờ v&agrave;o 2 yếu tố:</p>

<ul>
	<li>Chip xử l&yacute; A17 Bionic ho&agrave;n to&agrave;n đột ph&aacute;: CPU 6 l&otilde;i v&agrave; GPU 6 l&otilde;i gi&uacute;p hiệu năng iPhone 15 Pro Max vượt trội hơn khoảng 30%, đồng thời gi&uacute;p tiết kiệm năng lượng hơn 30 - 35% so với chip A16 Bionic tr&ecirc;n iPhone 15, iPhone 15 Plus, iPhone 14 Pro v&agrave; iPhone 14 Pro Max.</li>
	<li>K&iacute;ch cỡ m&aacute;y 6.7 inch si&ecirc;u lớn: K&iacute;ch thước lớn gi&uacute;p Apple tăng k&iacute;ch cỡ của vi&ecirc;n pin, từ đ&oacute; gi&uacute;p cải thiện mức dung lượng pin tr&ecirc;n iPhone 15 Pro Max l&ecirc;n đến 4.422 mAh (nhiều hơn tiền nhiệm iPhone 14 Pro Max 99 mAh).</li>
</ul>
</blockquote>

<h2><strong>3. 4+ l&yacute; do Pin iPhone 15 Pro Max g&acirc;y ấn tượng với người d&ugrave;ng</strong></h2>

<p>Pin iPhone 15 Pro Max g&acirc;y ấn tượng với người d&ugrave;ng bởi thời lượng sử dụng được cải thiện đ&aacute;ng kể so với c&aacute;c thế hệ iPhone trước, gi&uacute;p người d&ugrave;ng c&oacute; thể sử dụng điện thoại cả ng&agrave;y d&agrave;i m&agrave; kh&ocirc;ng cần lo lắng về vấn đề hết pin. C&ugrave;ng ShopDunk điểm danh qua 4 l&yacute; do khiến người d&ugrave;ng ấn tượng với vi&ecirc;n pin 4.422 mAh n&agrave;y nh&eacute;:</p>

<ul>
	<li><strong>Tăng dung lượng pin:</strong>&nbsp;iPhone 15 Pro Max c&oacute; dung lượng pin 4.422 mAh, cao hơn so với iPhone 14 Pro Max l&agrave; 4.323 mAh. Sự gia tăng dung lượng pin n&agrave;y gi&uacute;p iPhone 15 Pro Max c&oacute; thời lượng sử dụng l&acirc;u hơn đ&aacute;ng kể.</li>
	<li><strong>Sử dụng m&agrave;n h&igrave;nh OLED tiết kiệm pin:</strong>&nbsp;iPhone 15 Pro Max sử dụng m&agrave;n h&igrave;nh OLED, loại m&agrave;n h&igrave;nh tiết kiệm pin hơn so với m&agrave;n h&igrave;nh LCD.</li>
	<li><strong>Tối ưu h&oacute;a hiệu năng chip A17 Pro:</strong>&nbsp;Chip A17 Pro được Apple tối ưu h&oacute;a về hiệu năng v&agrave; khả năng tiết kiệm pin.</li>
	<li><strong>Thay đổi cổng sạc Lightning th&agrave;nh cổng USB-C:</strong>&nbsp;Cổng USB Type C c&oacute; khả năng sạc nhanh hơn v&agrave; hiệu quả hơn cổng Lightning, c&oacute; thể kết nối với laptop, tivi v&agrave; c&aacute;c thiết bị kh&aacute;c nhanh ch&oacute;ng.</li>
</ul>

<p>Ngo&agrave;i ra, Apple ưu &aacute;i cải tiến 2 điểm sau gi&uacute;p iPhone 15 Pro Max tiết kiệm pin như:</p>

<ul>
	<li><strong>Chế độ tiết kiệm pin được cải thiện:</strong>&nbsp;Chế độ tiết kiệm pin tr&ecirc;n iPhone 15 Pro Max được cải thiện gi&uacute;p điện thoại tiết kiệm pin nhiều hơn.</li>
	<li><strong>Chế độ Always-on Display được cải thiện:</strong>&nbsp;Chế độ Always-on Display tr&ecirc;n iPhone 15 Pro Max được cải thiện gi&uacute;p điện thoại ti&ecirc;u tốn &iacute;t pin hơn.</li>
</ul>

<p>Kh&ocirc;ng chỉ iPhone 15 Pro Max g&acirc;y ấn tượng với người d&ugrave;ng về dung lượng v&agrave; thời gian sử dụng, iPhone 15 l&agrave; một trong 4 phi&ecirc;n bản iPhone 15 Series được nhiều người d&ugrave;ng y&ecirc;u th&iacute;ch với mức t&agrave;i ch&iacute;nh ph&ugrave; hợp. Với bảng m&agrave;u đa dạng, c&ugrave;ng&nbsp;<strong><a href="https://shopdunk.com/iphone-15-dung-luong-pin-bao-nhieu">dung lượng pin iPhone 15</a></strong>&nbsp;cao hơn phi&ecirc;n bản cũ, nhiều n&acirc;ng cấp &#39;&#39;ăn tiền&#39;&#39; đến từ nh&agrave; T&aacute;o chắc chắn l&agrave;m iFans m&ecirc; mẩn.</p>

<h2><strong>4. So s&aacute;nh dung lượng pin iPhone 15 Pro Max với iPhone 15/Plus/Pro</strong></h2>

<p>Khi so s&aacute;nh với c&aacute;c phi&ecirc;n bản c&ugrave;ng thế hệ, iPhone 15 Pro Max vẫn chiếm &ldquo;thế độc t&ocirc;n&rdquo; khi sở hữu vi&ecirc;n pin c&oacute; dung lượng &ldquo;tr&acirc;u&rdquo; nhất. Bạn c&oacute; thể tham khảo bảng th&ocirc;ng số chi tiết về th&ocirc;ng số pin iPhone 15 series trong bảng dưới đ&acirc;y:</p>

<table border="1">
	<tbody>
		<tr>
			<td>
			<p><strong>Phi&ecirc;n bản iPhone 15</strong></p>
			</td>
			<td>
			<p><strong>Dung lượng pin</strong></p>
			</td>
			<td>
			<p><strong>Thời lượng pin</strong></p>
			</td>
			<td>
			<p><strong>Thời gian sạc đầy</strong></p>
			</td>
		</tr>
		<tr>
			<td>
			<p><strong>iPhone 15</strong></p>
			</td>
			<td>
			<p>3.349 mAh</p>
			</td>
			<td>
			<p>Xem video: 20 giờ&nbsp;</p>

			<p>Xem video trực tuyến: 16 giờ&nbsp;</p>

			<p>Nghe nhạc: 80 giờ</p>
			</td>
			<td>
			<p>60 - 80 ph&uacute;t&nbsp;</p>
			</td>
		</tr>
		<tr>
			<td>
			<p><strong>iPhone 15 Plus</strong></p>
			</td>
			<td>
			<p>4.383 mAh</p>
			</td>
			<td>
			<p>Xem video: 26 giờ&nbsp;</p>

			<p>Xem video trực tuyến: 20 giờ&nbsp;</p>

			<p>Nghe nhạc: 100 giờ</p>
			</td>
			<td>
			<p>80 - 90 ph&uacute;t&nbsp;</p>
			</td>
		</tr>
		<tr>
			<td>
			<p><strong>iPhone 15 Pro</strong></p>
			</td>
			<td>
			<p>3.274 mAh</p>
			</td>
			<td>
			<p>Xem video: 23 giờ&nbsp;</p>

			<p>Xem video trực tuyến: 20 giờ&nbsp;</p>

			<p>Nghe nhạc: 75 giờ</p>
			</td>
			<td>
			<p>60 - 70 ph&uacute;t&nbsp;</p>
			</td>
		</tr>
		<tr>
			<td>
			<p><strong>iPhone 15 Pro Max</strong></p>
			</td>
			<td>
			<p>4.422 mAh</p>
			</td>
			<td>
			<p>Xem video: 29 giờ&nbsp;</p>

			<p>Xem video trực tuyến: 25 giờ&nbsp;</p>

			<p>Nghe nhạc: 95 giờ</p>
			</td>
			<td>
			<p>80 - 90 ph&uacute;t&nbsp;</p>
			</td>
		</tr>
	</tbody>
</table>

<p>C&oacute; thể thấy,&nbsp;<strong><a href="https://shopdunk.com/iPhone-15-series" rel="noopener" target="_blank">điện thoại iPhone 15</a></strong>&nbsp;phi&ecirc;n bản c&oacute; dung lượng pin lớn nhất l&agrave; iPhone 15 Pro Max ở mức 4.422 mAh. Xếp hạng 2 l&agrave; iPhone 15 Plus với mức pin 4.383 mAh (&iacute;t hơn 39 mAh so với phi&ecirc;n bản dẫn đầu). iPhone 15 đứng thứ 3 sở hữu mức dung lượng 3.349 mAh. Đứng vị tr&iacute; cuối c&ugrave;ng trong 4 phi&ecirc;n bản iPhone 15 series về mức dung lượng pin, iPhone 15 Pro c&oacute; vi&ecirc;n pin b&eacute; nhất 3.274 mAh.</p>

<p>iPhone 15 Pro Max v&agrave; iPhone 15 Plus l&agrave; 2 phi&ecirc;n bản c&oacute; mức dung lượng pin tốt nhất bởi k&iacute;ch cỡ lớn n&ecirc;n c&oacute; đủ kh&ocirc;ng gian cho vi&ecirc;n pin lớn hơn so với iPhone 15 v&agrave; iPhone 15 Pro. Nhưng iPhone 15 Pro Max vẫn cho thời lượng sử dụng tốt hơn v&igrave; đ&atilde; được Apple n&acirc;ng cấp đ&aacute;ng kể về vi xử l&yacute;.&nbsp;<strong><a href="https://shopdunk.com/camera-iphone-15-plus">iPhone 15 Plus h&igrave;nh ảnh</a></strong>&nbsp;được chụp từ cụm camera ch&iacute;nh 48 MP được đ&aacute;nh gi&aacute; l&agrave; một trong những n&acirc;ng cấp &#39;&#39;đắt xắt ra miếng&#39;&#39; đến từ nh&agrave; T&aacute;o, mang đến cho người d&ugrave;ng những bức ảnh chất lượng cao.</p>

<p>Chip A17 Pro với 6 l&otilde;i CPU v&agrave; 6 l&otilde;i GPU gi&uacute;p hiệu năng iPhone 15 Pro Max vượt trội hơn khoảng 30%, đồng thời gi&uacute;p tiết kiệm năng lượng hơn 30 - 35% so với chip A16 Bionic tr&ecirc;n iPhone 15 Plus. Theo đ&oacute;, iPhone 15 Pro Max sẽ d&ugrave;ng được l&acirc;u hơn iPhone 15 Plus 3 - 5 giờ.</p>

<p><img alt="Cải thiện dung lượng pin iPhone 15 Pro Max qua chip A17" src="https://shopdunk.com/images/uploaded/Tin%20t%E1%BB%A9c%20iPhone%2015/dung-luong-in-iphone-15-pro-max/chip-a17-iphone-15-pro-max.jpg" style="height:312px; width:600px" /></p>

<p><em>Chip A17 Pro l&agrave; một trong những yếu tố gi&uacute;p thời gian sử dụng của iPhone 15 Pro Max tốt hơn so với bản thường</em></p>

<p>So với iPhone 15 v&agrave; iPhone 15 Pro, pin iPhone 15 Pro Max chắn chắn tốt hơn v&igrave; cỡ m&aacute;y lớn n&ecirc;n được Apple trang bị vi&ecirc;n pin c&oacute; k&iacute;ch thước lớn hơn. Tuy iPhone 15 Pro cũng sở hữu chip A17 Pro si&ecirc;u tiết kiệm điện năng nhưng v&igrave; hạn chế của vi&ecirc;n pin nhỏ n&ecirc;n sẽ kh&ocirc;ng thể cho thời gian sử dụng &ldquo;khủng&rdquo; như iPhone 15 Pro Max. 2 phi&ecirc;n bản iPhone 15 v&agrave; iPhone 15 Pro lần lượt k&eacute;m hơn tới 1.073 mAh v&agrave; 1.148 mAh so với &ldquo;anh cả&rdquo; iPhone 15 Pro Max.</p>

<p>C&oacute; thể kết luận, trong c&ugrave;ng series iPhone 15 mới nhất, iPhone 15 Pro Max c&oacute; pin khủng nhất c&ugrave;ng thời gian sử dụng &ldquo;tr&acirc;u&rdquo; nhất.</p>

<p><img alt="Thời gian xem video trên iPhone 15 Pro Max" src="https://shopdunk.com/images/uploaded/Tin%20t%E1%BB%A9c%20iPhone%2015/dung-luong-in-iphone-15-pro-max/thoi-luong-xem-video-tren-iphone-15-pro-max.jpg" style="height:269px; width:600px" /></p>

<p><em>Chip A17 Pro 3nm c&ugrave;ng k&iacute;ch thước lớn đủ sức chứa vi&ecirc;n pin khủng gi&uacute;p iPhone 15 Pro Max trở th&agrave;nh phi&ecirc;n bản c&oacute; lượng pin đứng đầu iPhone 15 series</em></p>

<h2><strong>4. So s&aacute;nh dung lượng pin iPhone 15 Pro Max với pin iPhone 14 Pro Max</strong></h2>

<p>Người d&ugrave;ng h&atilde;y theo d&otilde;i ngay bảng so s&aacute;nh giữa iPhone 15 Pro Max v&agrave; c&aacute;c bản tiền nhiệm sau để c&ugrave;ng ch&uacute;ng t&ocirc;i đ&aacute;nh gi&aacute; pin iPhone 15 Pro Max so với tất cả c&aacute;c phi&ecirc;n bản n&agrave;y:</p>

<table border="1">
	<tbody>
		<tr>
			<td>
			<p><strong>Phi&ecirc;n bản iPhone&nbsp;</strong></p>
			</td>
			<td>
			<p><strong>Dung lượng pin</strong></p>
			</td>
			<td>
			<p><strong>Thời lượng pin</strong></p>
			</td>
			<td>
			<p><strong>Thời gian sạc đầy</strong></p>
			</td>
		</tr>
		<tr>
			<td>
			<p><strong>iPhone 15 Pro Max</strong></p>
			</td>
			<td>
			<p>4.422 mAh</p>
			</td>
			<td>
			<p>Xem video: 29 giờ&nbsp;</p>

			<p>Xem video trực tuyến: 25 giờ&nbsp;</p>

			<p>Nghe nhạc: 95 giờ</p>
			</td>
			<td>
			<p>1 giờ 30 ph&uacute;t&nbsp;</p>
			</td>
		</tr>
		<tr>
			<td>
			<p><strong>iPhone 14 Pro Max</strong></p>
			</td>
			<td>
			<p>4.323 mAh</p>
			</td>
			<td>
			<p>Xem video: 29 giờ&nbsp;</p>

			<p>Xem video trực tuyến: 25 giờ&nbsp;</p>

			<p>Nghe nhạc: 95 giờ</p>
			</td>
			<td>
			<p>1 giờ 21 ph&uacute;t</p>
			</td>
		</tr>
		<tr>
			<td>
			<p><strong>iPhone 13 Pro Max</strong></p>
			</td>
			<td>
			<p>4.352 mAh</p>
			</td>
			<td>
			<p>Xem video: 28 giờ&nbsp;</p>

			<p>Xem video trực tuyến: 25 giờ&nbsp;</p>

			<p>Nghe nhạc: 95 giờ</p>
			</td>
			<td>
			<p>1 giờ 40 ph&uacute;t&nbsp;</p>
			</td>
		</tr>
		<tr>
			<td>
			<p><strong>iPhone 12 Pro Max</strong></p>
			</td>
			<td>
			<p>3.046 mAh</p>
			</td>
			<td>
			<p>Xem video: 20 giờ&nbsp;</p>

			<p>Xem video trực tuyến: 12 giờ&nbsp;</p>

			<p>Nghe nhạc: 80 giờ</p>
			</td>
			<td>
			<p>3 giờ 12 ph&uacute;t&nbsp;</p>
			</td>
		</tr>
		<tr>
			<td>
			<p><strong>iPhone 11 Pro Max</strong></p>
			</td>
			<td>
			<p>3.969 mAh</p>
			</td>
			<td>
			<p>Xem video: 20 giờ&nbsp;</p>

			<p>Xem video trực tuyến: 12 giờ&nbsp;</p>

			<p>Nghe nhạc: 80 giờ</p>
			</td>
			<td>
			<p>1 giờ 57 ph&uacute;t&nbsp;</p>
			</td>
		</tr>
	</tbody>
</table>

<p>&gt;&gt;&gt; Tham khảo chi tiết th&ocirc;ng tin về&nbsp;<a href="https://admin.shopdunk.com/so-sanh-iphone-14-pro-max-va-15-pro-max" rel="noopener" target="_blank">so s&aacute;nh iphone 14 Pro Max v&agrave; iphone 15 Pro Max.</a></p>

<p>Từ bảng tr&ecirc;n c&oacute; thể kết luận, dung lượng pin của c&aacute;c bản Pro Max c&oacute; xu hướng tăng nhẹ từ iPhone 11 Pro Max, cho thấy nỗ lực cải thiện vi&ecirc;n pin của Apple trong suốt 5 năm qua gi&uacute;p d&ograve;ng Pro Max cải thiện thời gian sử dụng, đủ sức để cạnh tranh với c&aacute;c flagship Android mới cả về hiệu suất lẫn thời lượng sử dụng pin.</p>

<p>So với tất cả c&aacute;c phi&ecirc;n bản tiền nhiệm, iPhone 15 Pro Max lần lượt c&oacute; dung lượng pin tăng khoảng 2,29% với iPhone 14 Pro Max. Với iPhone 13 Pro Max, dung lượng pin tăng khoảng 1,61%. Pin iPhone 15 Pro Max cũng tăng khoảng 45,17% so với iPhone 12 Pro Max v&agrave; với iPhone 11 Pro Max tăng khoảng 11,41%.</p>

<p>Tuy nhi&ecirc;n mặc d&ugrave; dung lượng pin iPhone 15 Pro Max c&oacute; tăng nhẹ nhưng thời gian sử dụng vẫn giữ nguy&ecirc;n so với iPhone 14 Pro Max khiến kh&ocirc;ng &iacute;t người d&ugrave;ng băn khoăn về 2% pin tăng th&ecirc;m c&oacute; t&aacute;c dụng như thế n&agrave;o. C&oacute; vẻ lần trở lại n&agrave;y Apple kh&ocirc;ng qu&aacute; đầu tư v&agrave;o vấn về pin v&agrave; thời gian sử dụng v&agrave; những n&acirc;ng cấp mới tr&ecirc;n iPhone 15 Pro Max dự kiến sẽ &ldquo;ngốn&quot; nhiều dung lượng pin khiến thời gian sử dụng kh&ocirc;ng tăng l&ecirc;n qu&aacute; nhiều.</p>

<p><img alt="Dung lượng pin iPhone 15 Pro Max" src="https://shopdunk.com/images/uploaded/Tin%20t%E1%BB%A9c%20iPhone%2015/dung-luong-in-iphone-15-pro-max/so-sanh-dung-luong-pin-iphone-15-pro-max.jpg" style="height:338px; width:600px" /></p>

<p><em>iPhone 15 Pro Max l&agrave; phi&ecirc;n bản iPhone c&oacute; mức dung lượng pin cao nhất trong lịch sử của Apple</em></p>

<blockquote>
<p><em><strong>So về pin giữa c&aacute;c d&ograve;ng iPhone Pro Max th&igrave; iPhone 15 Pro Max vẫn giữ phong độ, trở th&agrave;nh phi&ecirc;n bản Pro Max c&oacute; pin đỉnh nhất. Nhờ chip A17 Pro gi&uacute;p tối ưu năng lượng ho&agrave;n hảo, hiện tại iPhone 15 Pro Max đang l&agrave; bản iPhone &ldquo;bất khả chiến bại&rdquo; của Apple.&nbsp;</strong><strong>Tuy nhi&ecirc;n, dung lượng pin của iPhone 15 Pro Max vẫn chỉ l&agrave; th&ocirc;ng số được c&ocirc;ng bố. Thực hư iPhone 15 Pro Max c&oacute; phải bản iPhone khỏe nhất hay kh&ocirc;ng cần phải được chứng minh dựa tr&ecirc;n những th&iacute; nghiệm sử dụng thực thế.</strong></em></p>

<p><em><strong>Xem th&ecirc;m:&nbsp;<a href="https://shopdunk.com/iphone-15-pro-khac-gi-iphone-13-pro" rel="noopener" target="_blank">12 ti&ecirc;u ch&iacute; iPhone 15 Pro kh&aacute;c g&igrave; iPhone 13 Pro ĐỈNH nhất!</a></strong></em></p>
</blockquote>

<p>Với mức tăng 2,29% so với tiền nhiệm iPhone 14 Pro Max,&nbsp;<em><strong>dung lượng pin iPhone 15 Pro Max</strong></em><em>&nbsp;</em>sẽ &ldquo;tr&acirc;u nhất&rdquo; trong đội h&igrave;nh tất cả sản phẩm iPhone m&agrave; Apple đ&atilde; cho ra mắt. Tuy kh&ocirc;ng c&oacute; sự thay đổi về thời lượng sử dụng, nhưng với vi&ecirc;n pin lớn hơn sẽ cho thời gian sử dụng l&ecirc;n đến hơn 2 - 3 ng&agrave;y, gi&uacute;p người d&ugrave;ng an t&acirc;m sử dụng m&agrave; kh&ocirc;ng cần lo lắng về vấn đề cần t&igrave;m chỗ sạc pin khi iPhone hiện th&ocirc;ng b&aacute;o pin yếu.</p>

<p>Nếu bạn c&ograve;n băn khoăn v&agrave; cần tư vấn th&ecirc;m về c&aacute;c sản phẩm iPhone 15, h&atilde;y li&ecirc;n hệ trực tiếp tới ShopDunk để được hỗ trợ giải đ&aacute;p nhanh nhất.</p>
', CAST(N'2024-11-02' AS Date), 1)
INSERT [dbo].[News] ([newid], [ntid], [nimage], [title], [contents], [createdate], [status]) VALUES (5, 2, N'macbook1.jpeg', N'Đánh giá MacBook Air M1: MacBook Air M1 có ổn không? Dùng được mấy năm nữa?', N'<p>Đến hiện tại, MacBook Air M1 vẫn l&agrave; một trong những d&ograve;ng m&aacute;y t&iacute;ch hợp chip Apple M1 mạnh mẽ nhất v&agrave; ấn tượng nhất tr&ecirc;n thị trường. Với sự kết hợp của vi xử l&yacute; 8 nh&acirc;n v&agrave; đồ họa 8 nh&acirc;n tr&ecirc;n c&ugrave;ng một con chip, Macbook Air M1 mang lại hiệu suất vượt trội hơn hẳn so với c&aacute;c thế hệ tiền nhiệm. Khả năng xử l&yacute; đa nhiệm mượt m&agrave;, tốc độ phản hồi nhanh ch&oacute;ng v&agrave; khả năng tiết kiệm năng lượng xuất sắc đ&atilde; đặt nền m&oacute;ng cho một trải nghiệm l&agrave;m việc v&agrave; giải tr&iacute; tốt hơn.</p>

<p>Ch&iacute;nh v&igrave; hiệu năng v&agrave; những đặc điểm của MacBook Air M1, c&acirc;u hỏi đặt ra l&agrave; liệu MacBook Air M1 c&oacute; thực sự &ldquo;đỉnh&rdquo; như lời đồn? D&ugrave;ng được mấy năm nữa? C&ugrave;ng&nbsp;<strong>ShopDunk</strong>&nbsp;kh&aacute;m ph&aacute; xem MacBook Air M1 c&oacute; ổn kh&ocirc;ng v&agrave; c&oacute; thể d&ugrave;ng được trong bao l&acirc;u.</p>

<p><img alt="" src="https://shopdunk.com/images/uploaded/danh-gia-macbook-air-m1/_DSC4264.JPG" style="height:461px; width:692px" /></p>

<h2><strong>1. Đ&aacute;nh gi&aacute; tổng quan về MacBook Air M1</strong></h2>

<h3><strong>1.1. Chip M1 sở hữu hiệu năng đỉnh cao</strong></h3>

<p><strong>MacBook Air M1</strong>&nbsp;đ&atilde; đ&aacute;nh dấu một bước tiến quan trọng trong việc t&iacute;ch hợp sức mạnh xử l&yacute; v&agrave; hiệu năng đồ họa. Chip M1, được Apple ph&aacute;t triển dựa tr&ecirc;n kiến tr&uacute;c ARM, kh&ocirc;ng chỉ mang lại hiệu năng nhanh ch&oacute;ng m&agrave; c&ograve;n tiết kiệm năng lượng đ&aacute;ng kể. Bộ vi xử l&yacute; được thiết kế với mục ti&ecirc;u cải thiện hiệu suất năng lượng v&agrave; khả năng xử l&yacute;, điều n&agrave;y gi&uacute;p tiết kiệm pin đ&aacute;ng kể. Chip M1 c&oacute; thiết kế 8 l&otilde;i, bao gồm 4 l&otilde;i hiệu suất cao v&agrave; GPU t&iacute;ch hợp với 7 l&otilde;i. GPU mạnh mẽ&nbsp; kh&ocirc;ng chỉ đ&aacute;p ứng mượt m&agrave; c&aacute;c nhu cầu c&ocirc;ng việc h&agrave;ng ng&agrave;y m&agrave; c&ograve;n đem lại khả năng xử l&yacute; đồ họa với tốc độ cao. Apple thậm ch&iacute; khẳng định rằng GPU tr&ecirc;n MacBook M1 l&agrave; một trong những card đồ họa t&iacute;ch hợp nhanh nhất tr&ecirc;n thế giới hiện nay.</p>

<p><img alt="" src="https://shopdunk.com/images/uploaded/danh-gia-macbook-air-m1/apple_silicon_endframe__forvi6ykwn6m_large_2x.jpg" style="height:425px; width:705px" /></p>

<p><em>Chip M1 cung cấp hiệu suất đ&aacute;ng kể cải thiện so với c&aacute;c chip Intel (Nguồn ảnh: Apple)</em></p>

<h3><strong>1.2. Thiết kế tối giản<img alt="" src="https://shopdunk.com/images/uploaded/danh-gia-macbook-air-m1/_DSC4274.JPG" style="height:460px; width:690px" /></strong></h3>

<p><em>Thiết kế mang n&eacute;t đẹp v&agrave; sự tinh tế của d&ograve;ng sản phẩm MacBook Air</em></p>

<p>Tinh tế trong thiết kế c&ugrave;ng với vỏ nh&ocirc;m nguy&ecirc;n khối tạo ra vẻ ngoại h&igrave;nh sang trọng v&agrave; chất lượng.</p>

<p>Vỏ nh&ocirc;m nguy&ecirc;n khối kh&ocirc;ng chỉ mang lại sự bền bỉ m&agrave; c&ograve;n tạo cảm gi&aacute;c cao cấp khi cầm tr&ecirc;n tay. Khả năng chống va đập tốt c&ugrave;ng khung viền kim loại đảm bảo c&oacute; thể dễ d&agrave;ng mang đi khắp mọi nơi.</p>

<h3><strong>1.3. M&agrave;n h&igrave;nh&nbsp;</strong></h3>

<p>Với m&agrave;n h&igrave;nh Retina sắc n&eacute;t, MacBook Air M1 mang đến trải nghiệm h&igrave;nh ảnh v&ocirc; c&ugrave;ng ấn tượng.&nbsp;</p>

<p><em><img alt="" src="https://shopdunk.com/images/uploaded/danh-gia-macbook-air-m1/_DSC4294.JPG" style="height:459px; width:689px" /></em><em>M&agrave;n h&igrave;nh Retina k&iacute;ch thước 13.3 inch, hiển thị h&igrave;nh ảnh tinh tế với độ ph&acirc;n giải cao v&agrave; m&agrave;u sắc ch&acirc;n thực.&nbsp;</em></p>

<p>Viền m&agrave;n h&igrave;nh được thiết kế mỏng, tạo n&ecirc;n một trải nghiệm hấp dẫn v&agrave; kh&ocirc;ng gian hiển thị rộng lớn hơn. Độ ph&acirc;n giải cao kh&ocirc;ng chỉ đảm bảo mọi chi tiết được hiển thị r&otilde; r&agrave;ng m&agrave; c&ograve;n thỏa m&atilde;n được cả nhu cầu l&agrave;m việc đồ họa chất lượng.&nbsp;</p>

<h3><strong>1.4. Khả năng tương th&iacute;ch</strong></h3>

<p><img alt="" src="https://shopdunk.com/images/uploaded/danh-gia-macbook-air-m1/mba_charging__es0ane5j84eq_large_2x.jpg" style="height:453px; width:675px" /></p>

<p><em>Khả năng tương th&iacute;ch vượt trội với nhiều ứng dụng v&agrave; thiết bị kh&aacute;c nhau (Nguồn ảnh: Apple)</em></p>

<p>Một ưu điểm nổi bật của MacBook Air M1 ch&iacute;nh l&agrave; khả năng tương th&iacute;ch với hệ thống macOS v&agrave; c&aacute;c ứng dụng tr&ecirc;n Apple Store. Apple đ&atilde; v&agrave; đang tiếp tục hỗ trợ c&aacute;c phi&ecirc;n bản hệ điều h&agrave;nh mới, đảm bảo rằng người d&ugrave;ng c&oacute; thể tiếp tục trải nghiệm c&aacute;c t&iacute;nh năng mới nhất v&agrave; bảo mật tốt nhất. Ngo&agrave;i ra, MacBook Air M1 c&ograve;n tương th&iacute;ch với nhiều thiết bị ngoại vi như m&agrave;n h&igrave;nh, ổ cứng di động, b&agrave;n ph&iacute;m, chuột, v&agrave;&nbsp; c&aacute;c thiết bị kh&aacute;c.&nbsp;</p>

<h3><strong>1.5. Tuổi thọ</strong></h3>

<p>D&ugrave; c&oacute; thiết kế mỏng nhẹ, MacBook Air M1 kh&ocirc;ng hề &ldquo;bị lơ l&agrave;&rdquo; khả năng chống va đập v&agrave; hao m&ograve;n. Vỏ nh&ocirc;m nguy&ecirc;n khối c&ugrave;ng c&ocirc;ng nghệ chế tạo ti&ecirc;n tiến gi&uacute;p sử dụng m&aacute;y bền bỉ, đảm bảo tuổi thọ d&agrave;i hơn.</p>

<h2><strong>2. Một chiếc m&aacute;y c&oacute; hiệu suất cao như vậy c&oacute; &ldquo;k&eacute;n chọn&rdquo; người d&ugrave;ng kh&ocirc;ng?&nbsp;</strong></h2>

<p>C&acirc;u trả lời l&agrave; &ldquo;Kh&ocirc;ng&rdquo;, gần như tất cả mọi đối tượng đều c&oacute; thể sử dụng MacBook Air M1 một c&aacute;ch dễ d&agrave;ng v&agrave; hiệu quả.&nbsp;</p>

<p><img alt="" src="https://shopdunk.com/images/uploaded/danh-gia-macbook-air-m1/_DSC4225.JPG" style="height:376px; width:668px" /></p>

<p><em>MacBook Air M1 ph&ugrave; hợp với gần như tất cả mọi đối tượng</em></p>

<h3><strong>2.1 Sinh vi&ecirc;n v&agrave; Học sinh</strong></h3>

<p>MacBook Air M1 l&agrave; sự lựa chọn tốt cho sinh vi&ecirc;n v&agrave; học sinh, đ&aacute;p ứng nhu cầu học tập, nghi&ecirc;n cứu v&agrave; l&agrave;m việc nh&oacute;m. Sức mạnh của chip M1 v&agrave; khả năng xử l&yacute; đồ họa gi&uacute;p xử l&yacute; tốt c&aacute;c t&agrave;i liệu, b&agrave;i thuyết tr&igrave;nh v&agrave; dự &aacute;n học tập.</p>

<h3><strong>2.2. Designer, content creator</strong></h3>

<p>Với m&agrave;n h&igrave;nh Retina chất lượng cao v&agrave; hiệu suất xử l&yacute; đ&aacute;ng kinh ngạc, MacBook Air M1 th&iacute;ch hợp cho c&aacute;c nh&agrave; thiết kế đồ họa, chỉnh sửa ảnh v&agrave; video. C&aacute;c ứng dụng đồ họa nặng cũng c&oacute; thể chạy mượt m&agrave; tr&ecirc;n m&aacute;y n&agrave;y.</p>

<h2><strong><img alt="" src="https://shopdunk.com/images/uploaded/danh-gia-macbook-air-m1/DSC02305-Copy-1.JPG" style="height:448px; width:672px" /></strong></h2>

<p><em>MacBook Air M1 đặc biệt ph&ugrave; hợp với d&acirc;n s&aacute;ng tạo do c&oacute; hiệu suất cao v&agrave; m&agrave;n h&igrave;nh lớn hơn</em></p>

<h3><strong>2.3. Nh&acirc;n vi&ecirc;n IT</strong></h3>

<p>MacBook Air M1 hỗ trợ tốt cho việc ph&aacute;t triển phần mềm v&agrave; lập tr&igrave;nh. Hiệu năng cao v&agrave; khả năng chạy c&aacute;c m&aacute;y ảo gi&uacute;p c&aacute;c nh&agrave; ph&aacute;t triển l&agrave;m việc hiệu quả.</p>

<h3><strong>2.4. Nh&acirc;n vi&ecirc;n văn ph&ograve;ng</strong></h3>

<p>D&agrave;nh cho c&ocirc;ng việc h&agrave;ng ng&agrave;y như xử l&yacute; văn bản, tr&igrave;nh chiếu, quản l&yacute; email v&agrave; duyệt web, MacBook Air M1 nhẹ nh&agrave;ng v&agrave; di động đ&aacute;p ứng đủ nhu cầu cần thiết.</p>

<h3><strong>2.5. Người &ldquo;nghiền&rdquo; giải tr&iacute;</strong></h3>

<p>MacBook Air M1 cũng l&agrave; một lựa chọn tốt cho người y&ecirc;u th&iacute;ch giải tr&iacute;. M&agrave;n h&igrave;nh Retina v&agrave; khả năng xử l&yacute; video tốt gi&uacute;p bạn xem phim, stream video v&agrave; thậm ch&iacute; l&agrave; chỉnh sửa video một c&aacute;ch thoải m&aacute;i.</p>

<p>Nh&igrave;n chung, MacBook Air M1 l&agrave; một sản phẩm đa dụng, ph&ugrave; hợp cho nhiều đối tượng người d&ugrave;ng từ học sinh, sinh vi&ecirc;n, người l&agrave;m việc c&ocirc;ng nghệ đến người d&ugrave;ng th&ocirc;ng thường.</p>

<h2><strong>3. N&ecirc;n mua MacBook Air M1 chính hãng, giá t&ocirc;́t ở đ&acirc;u?</strong></h2>

<p>ShopDunk l&agrave; điểm đến của rất nhiều người d&ugrave;ng muốn sở hữu MacBook chất lượng hiện nay. Tự h&agrave;o l&agrave; đại l&yacute; ủy quyền ch&iacute;nh thức của Apple tại Việt Nam, ShopDunk cung cấp rất nhiều c&aacute;c sản phẩm của nh&agrave; T&aacute;o như: iPad, iPhone, Macbook, Apple Watch,... Mua sắm tại ShopDunk, bạn sẽ kh&ocirc;ng cần lo lắng v&igrave; 100% sản phẩm đều l&agrave; h&agrave;ng ch&iacute;nh h&atilde;ng c&oacute; chứng nhận từ Apple.&nbsp;</p>

<p><img alt="" src="https://shopdunk.com/images/uploaded/danh-gia-macbook-air-m1/IMG_000028.jpg" style="height:399px; width:709px" /><em>ShopDunk l&agrave; đơn vị ủy quyền ch&iacute;nh thức của Apple tại Việt Nam, l&agrave; địa chỉ mua sắm đ&aacute;ng tin cậy d&agrave;nh cho fan nh&agrave; T&aacute;o</em></p>

<p>Hiện tại,&nbsp;<a href="https://shopdunk.com/macbook-air-m1-2020" rel="noopener" target="_blank"><strong>MacBook Air M1</strong></a>&nbsp;đang c&oacute; mức gi&aacute; dao động từ 18 triệu đến 19 triệu. Kh&ocirc;ng những thế, ShopDunk c&ograve;n thường xuy&ecirc;n tổ chức những chương tr&igrave;nh tri &acirc;n kh&aacute;ch h&agrave;ng với ưu đ&atilde;i hấp dẫn độc quyền khi mua MacBook như:&nbsp;</p>

<ul>
	<li>Giảm 5% tối đa 500.000đ khi thanh to&aacute;n qua Kredivo.</li>
	<li>Giảm 200.000đ g&oacute;i AppleCare+.&nbsp;</li>
	<li>Hỗ trợ trả g&oacute;p 0%</li>
	<li>Bảo h&agrave;nh 12 tháng theo ti&ecirc;u chu&acirc;̉n Apple.</li>
</ul>

<p>B&ecirc;n cạnh đ&oacute;, khi mua MacBook Air M1 tại&nbsp;<strong>ShopDunk</strong>, bạn sẽ được hưởng ưu đ&atilde;i giảm gi&aacute; đến 200.000đ cho g&oacute;i Microsoft Office. G&oacute;i Microsoft Office bao gồm c&aacute;c phần mềm Word, Excel, PowerPoint, OneNote, Outlook hỗ trợ tối đa moịh t&aacute;c vụ học tập v&agrave; l&agrave;m việc</p>
', CAST(N'2024-11-02' AS Date), 1)
INSERT [dbo].[News] ([newid], [ntid], [nimage], [title], [contents], [createdate], [status]) VALUES (6, 2, N'iphone03.jpeg', N'iPad đang dần thay thế Macbook như thế nào?', N'<p>Kể từ khi c&ocirc;ng bố lần đầu ti&ecirc;n v&agrave;o năm 2010, cho tới nay, Apple đ&atilde; li&ecirc;n tục cho ra mắt 10 thế hệ iPad với 27 loại m&aacute;y cải tiến theo từng năm. Tiếp sau kh&aacute;t vọng &ldquo;xo&aacute; sổ&rdquo; m&aacute;y t&iacute;nh đề b&agrave;n, với ch&acirc;m ng&ocirc;n &ldquo;holding the internet in your hands&rdquo;, h&atilde;ng đ&atilde; v&agrave; đang thiện thực ho&aacute; tham vọng đưa iPad thay thế cho MacBook cũng như c&aacute;c d&ograve;ng m&aacute;y laptop.</p>

<p><img alt="" src="https://shopdunk.com/images/uploaded/Linh%20Dang/GettyImages96210943.png" style="height:483px; width:699px" /><em>Steve Jobs - cựu tổng gi&aacute;m đốc điều h&agrave;nh của Apple, cầm tr&ecirc;n tay chiếc iPad thế hệ đầu ti&ecirc;n ra mắt năm 2010 (Ảnh: Getty Images)</em></p>

<p>D&ugrave; từng bước biến đổi từ con chip đời đầu A4 cho tới chip M3 mạnh mẽ như hiện nay, nhiều người d&ugrave;ng vẫn lu&ocirc;n nghi vấn về khả năng thay thế ho&agrave;n to&agrave;n của iPad với MacBook. Hiệu năng được cải tiến mạnh mẽ rồi nhưng hiệu suất của c&aacute;c ứng dụng hiện nay chưa được đ&aacute;nh gi&aacute; cao, c&ograve;n nhiều hạn chế v&agrave; chưa đuổi kịp tốc độ ph&aacute;t triển của c&aacute;c thế hệ chip. Tuy nhi&ecirc;n, nh&igrave;n v&agrave;o g&oacute;c t&iacute;ch cực th&igrave; dưới đ&acirc;y l&agrave; những đ&aacute;nh gi&aacute; m&agrave; ch&uacute;ng ta c&oacute; thể tin tưởng v&agrave;o viễn cảnh &ldquo;chỉ cần iPad th&ocirc;i, mọi vấn đề đều c&oacute; thể xử l&yacute;.&rdquo;&nbsp;</p>

<p><img alt="" src="https://shopdunk.com/images/uploaded/Linh%20Dang/iPadCellularFamilyLineupScreenUSEN.png" style="height:529px; width:692px" /></p>

<h3>Thiết kế</h3>

<p>Đ&acirc;y l&agrave; điểm cộng lớn nhất khi chuyển từ MacBook sang iPad. Apple hiện c&oacute; 4 d&ograve;ng sản phẩm: iPad (ph&aacute;t triển từ thế hệ iPad đầu ti&ecirc;n), iPad Mini, iPad Air v&agrave; iPad Pro. Mỗi d&ograve;ng sẽ được &aacute;p dụng c&aacute;c k&iacute;ch thước kh&aacute;c nhau, đ&aacute;p ứng với nhu cầu sử dụng của nhiều đối tượng kh&aacute;ch h&agrave;ng: 8.7 inch - 12.9 inch.</p>

<p><img alt="" src="https://shopdunk.com/images/uploaded/Linh%20Dang/iPadAir4ShopDunkWaterMark4.jpg" style="height:435px; width:692px" /></p>

<p>Nh&igrave;n chung, Apple hướng đến việc tinh giản trọng lượng đối đa cho iPad, mang đến trải nghiệm mỏng hơn, nhẹ hơn, tiện hơn cho người ti&ecirc;u d&ugrave;ng. Hiện nay, mẫu iPad Pro 12.9 inch nặng nhất cũng chỉ khoảng 650 gram.&nbsp;</p>

<p><img alt="" src="https://shopdunk.com/images/uploaded/Linh%20Dang/59bcfce0b23b2e4aae553a51a96fe30b1.png" style="height:859px; width:702px" /></p>

<p><em>iPad sở hữu thiết kế sang trọng, tối giản c&ugrave;ng bảng m&agrave;u kh&ocirc;ng bao giờ lỗi thời (Ảnh: Internet)</em></p>

<p>B&ecirc;n cạnh đ&oacute;, c&aacute;c d&ograve;ng iPad đều c&oacute; m&agrave;u sắc tối giản, ph&ugrave; hợp với từng đối tượng v&agrave; mang t&iacute;nh thẩm mỹ thời thượng. C&oacute; thể hiểu l&agrave; d&ugrave; bạn c&oacute; d&ugrave;ng 1 chiếc iPad từ 10 năm trước th&igrave; đến hiện nay, m&agrave;u sắc của ch&uacute;ng cũng kh&ocirc;ng lỗi thời.&nbsp;</p>

<p>&nbsp;</p>

<h3>Chip xử l&yacute; ngang ngửa với một chiếc MacBook</h3>

<p>Kể từ thế hệ chip M1 &amp; M2, sắp tới l&agrave; M3, Apple đ&atilde; ứng dụng lu&ocirc;n con chip n&agrave;y cho cả MacBook v&agrave; iPad. C&oacute; lẽ về hiệu năng th&igrave; kh&ocirc;ng c&oacute; g&igrave; phải b&agrave;n c&atilde;i khi ch&uacute;ng nhận về đ&aacute;nh gi&aacute; t&iacute;ch cực của người ti&ecirc;u d&ugrave;ng sau một thời gian trải nghiệm. Thậm ch&iacute;, nhiều reviewer cũng nhận định rằng thế hệ iPad chip M2 c&oacute; thể sử dụng bền bỉ tới 4-5 năm nữa, thậm ch&iacute; hơn.</p>

<p><img alt="" src="https://shopdunk.com/images/uploaded/Linh%20Dang/VNiPadProCellular11in4thGenSilverPDPImagePosition.jpg" style="height:687px; width:687px" /><em>iPad c&ugrave;ng sở hữu chip xử l&yacute; mạnh mẽ như MacBook (Ảnh: Apple)</em></p>

<p>Cuộc đua c&ocirc;ng nghệ n&agrave;y c&ograve;n c&oacute; sự g&oacute;p sức của c&aacute;c đồng minh ứng dụng. Điển h&igrave;nh như Adobe, &quot;&ocirc;ng lớn&quot; n&agrave;y đ&atilde; ph&aacute;t triển vũ trụ phần mềm đồ hoạ &ldquo;all-in-one&rdquo; tương th&iacute;ch với iPad để d&agrave;nh cho d&acirc;n thiết kế. Từ Lightroom, Illustration, Photoshop, Premier, XD&hellip; đều c&oacute; thể d&ugrave;ng tr&ecirc;n iPad m&agrave; kh&ocirc;ng lo giật, lag nhờ con chip c&oacute; khả năng c&acirc;n được kha kh&aacute; task nặng.</p>

<p>B&ecirc;n cạnh đ&oacute;, sử dụng Microsoft Office tận dụng tối đa sức mạnh của iPad cho học tập v&agrave; l&agrave;m việc, c&aacute;c ứng dụng Word, Excel, PowerPoint quen thuộc giờ đ&acirc;y c&oacute; sẵn tr&ecirc;n iPad, được tối ưu h&oacute;a ho&agrave;n hảo cho m&agrave;n h&igrave;nh cảm ứng. Bạn kh&ocirc;ng chỉ xem v&agrave; chỉnh sửa t&agrave;i liệu dễ d&agrave;ng m&agrave; c&ograve;n c&oacute; thể: Soạn thảo văn bản, lập bảng t&iacute;nh, thuyết tr&igrave;nh, l&agrave;m việc nh&oacute;m, học tập, lưu trữ v&agrave; truy cập t&agrave;i liệu....</p>

<p>&nbsp;Đặc biệt, khi mua c&aacute;c sản phảm iPad, MacBook tại ShopDunk, bạn sẽ được hưởng ưu đ&atilde;i giảm gi&aacute; đến 200.000đ cho g&oacute;i Microsoft Office. G&oacute;i Microsoft Office bao gồm c&aacute;c phần mềm Word, Excel, PowerPoint, OneNote, Outlook, gi&uacute;p bạn ho&agrave;n th&agrave;nh tốt mọi y&ecirc;u cầu học tập.</p>

<p><img alt="" src="https://shopdunk.com/images/uploaded/Linh%20Dang/AdobeMaxiPadProPSCC.jpg" style="height:577px; width:687px" /><em>Adobe ph&aacute;t triển bộ sản phẩm đồ hoạ th&iacute;ch ứng với iPad (Ảnh: Apple)</em></p>

<h3>&nbsp;</h3>

<h3>M&agrave;n h&igrave;nh &ldquo;khủng&rdquo;</h3>

<p>Một điểm cộng lớn nữa của iPad hiện nay l&agrave; được cải tiến l&ecirc;n tới m&agrave;n h&igrave;nh Liquid Retina XDR c&ugrave;ng khả năng qu&eacute;t l&ecirc;n tới 120Hz, tương đương với một chiếc MacBook Pro. Chưa hết, độ s&aacute;ng XDR c&oacute; thể tăng l&ecirc;n tối đa 1600 nits khi xem nội dung HDR, hỗ trợ l&ecirc;n đến 1 tỷ m&agrave;u, mang đến trải nghiệm cực đ&atilde; mắt.&nbsp;</p>

<p>Đối với người d&ugrave;ng đ&ograve;i hỏi một thiết bị c&oacute; m&agrave;n h&igrave;nh y&ecirc;u cầu độ chuẩn m&agrave;u cao để chỉnh sửa h&igrave;nh ảnh, edit video mượt m&agrave; th&igrave; iPad ho&agrave;n to&agrave;n c&oacute; thể đ&aacute;p ứng được. Thậm ch&iacute;, ch&uacute;ng c&ograve;n c&oacute; phần nhanh hơn, tiện lợi hơn MacBook khi sử dụng c&aacute;c ứng dụng hậu kỳ như Capcut.</p>

<p>B&ecirc;n cạnh đ&oacute;, m&agrave;n h&igrave;nh iPad cũng được ứng dụng c&ocirc;ng nghệ True Tone, tự động theo d&otilde;i, điều chỉnh m&agrave;u sắc v&agrave; cường độ của m&agrave;n h&igrave;nh ph&ugrave; hợp với &aacute;nh s&aacute;ng xung quanh. Nhờ c&oacute; c&ocirc;ng nghệ n&agrave;y, thiết bị sẽ l&agrave;m cho h&igrave;nh ảnh tr&ecirc;n m&agrave;n h&igrave;nh hiển thị tự nhi&ecirc;n hơn, hỗ trợ người d&ugrave;ng giảm mỏi mắt trong qu&aacute; tr&igrave;nh sử dụng.</p>

<p><img alt="" src="https://shopdunk.com/images/uploaded/Linh%20Dang/Frame5.png" style="height:825px; width:825px" /></p>

<p><em>Trải nghiệm chơi game mượt m&agrave; tr&ecirc;n iPad (Ảnh: Hưng Kh&uacute;c)</em></p>

<p><img alt="" src="https://shopdunk.com/images/uploaded/Linh%20Dang/iPadCellular.jpg" style="height:656px; width:656px" /></p>

<p><em>iPad sở hữu&nbsp;m&agrave;n h&igrave;nh Liquid Retina XDR mang đến trải nghiệm ch&acirc;n thật (Ảnh: Apple)</em></p>

<p>&nbsp;</p>

<h3><strong>MacBook c&oacute; b&agrave;n ph&iacute;m. Chẳng sao, iPad cũng t&iacute;ch hợp được, thậm ch&iacute; nhiều hơn</strong></h3>

<p>Bước cải tiến đầu ti&ecirc;n gi&uacute;p iPad tiến gần hơn việc thay thế cho MacBook l&agrave; khả năng t&iacute;ch hợp 3 thiết bị hỗ trợ: Pencil, Magic Mouse, Magic Keyboard. Tuy c&oacute; kha kh&aacute; &ldquo;tệp đ&iacute;nh k&egrave;m&rdquo; nhưng sản phẩm n&agrave;o Apple cũng khiến ch&uacute;ng ra tấm ra m&oacute;n.&nbsp;</p>

<p><img alt="" src="https://shopdunk.com/images/uploaded/Linh%20Dang/59bcfce0b23b2e4aae553a51a96fe30b%201.png" style="height:834px; width:695px" /></p>

<p><em>Để hoạt động tốt hơn, iPad cần kh&aacute; nhiều phụ kiện đi k&egrave;m (Ảnh: Pinterest)</em></p>

<p>Trong trường hợp người d&ugrave;ng l&agrave; d&acirc;n văn ph&ograve;ng, học sinh/ sinh vi&ecirc;n, với nhu cầu nhẹ g&aacute;nh như: ghi ch&eacute;p, soạn thảo văn bản, research th&ocirc;ng tin, xem phim, chơi game&hellip; th&igrave; chỉ một chiếc iPad th&ocirc;i (ai c&oacute; điều kiện th&igrave; &quot;đ&oacute;ng bộ&quot; th&ecirc;m Magic Keyboard) l&agrave; đủ để &ldquo;xử đẹp&rdquo; những c&aacute;c t&aacute;c vụ n&agrave;y rồi. Hơn nữa, với OS17 hiện nay, người d&ugrave;ng c&oacute; thể import file PDF l&ecirc;n m&aacute;y ghi ch&eacute;p v&agrave; chỉnh sửa trực tiếp tr&ecirc;n m&aacute;y m&agrave; kh&ocirc;ng cần... capture m&agrave;n h&igrave;nh lại như trước đ&acirc;y nữa.</p>
', CAST(N'2024-11-02' AS Date), 1)
INSERT [dbo].[News] ([newid], [ntid], [nimage], [title], [contents], [createdate], [status]) VALUES (7, 2, N'55.jpg', N'So sánh iPad Gen 10 và iPad Air 5: Nên chọn iPad nào?', N'<p><em><strong>iPad Gen 10 v&agrave; iPad Air 5</strong>&nbsp;l&agrave; hai sản phẩm c&ugrave;ng được ra mắt năm 2022 của nh&agrave; T&aacute;o, trong đ&oacute; iPad Air 5 c&oacute; gi&aacute; cao hơn so với iPad gen 10. Vậy 2 phi&ecirc;n bản n&agrave;y c&oacute; g&igrave; kh&aacute;c biệt? C&ugrave;ng ShopDunk so s&aacute;nh iPad gen 10 v&agrave; iPad Air 5 để hiểu r&otilde; nh&eacute;!</em></p>

<h2><strong>1. So s&aacute;nh iPad Gen 10 v&agrave; iPad Air 5</strong></h2>

<p>Về ngoại h&igrave;nh của iPad gen 10 v&agrave; iPad Air 5 - hai chiếc m&aacute;y t&iacute;nh bảng thực sự như l&agrave; &ldquo;cặp song sinh&rdquo; của nh&agrave; T&aacute;o. C&ugrave;ng c&oacute; thiết kế m&agrave;n h&igrave;nh 10.9 inch, viền mỏng được chế t&aacute;c với chất liệu khung nh&ocirc;m, bo tr&ograve;n 4 g&oacute;c, cả 2 phi&ecirc;n bản đều khiến người d&ugrave;ng phải trầm trồ khen ngợi v&igrave; thiết kế hợp thời thượng.&nbsp;</p>

<p>Tuy nhi&ecirc;n, hai chiếc m&aacute;y t&iacute;nh bảng n&agrave;y lại c&oacute; sự kh&aacute;c biệt r&otilde; rệt về phần cấu h&igrave;nh. iPad Air 5 sở hữu con chip M1 v&agrave; iPad Gen 10 sở hữu con chip A14. X&eacute;t về hiệu suất chip M1 nhỉnh hơn hẳn với chip A14 kể cả trong c&aacute;c t&aacute;c vụ b&igrave;nh thường đến t&aacute;c vụ nặng. C&aacute;c thực nghiệm về hiệu suất cũng cho biết chip Apple M1 vượt trội với số điểm hơn hẳn chip A15.&nbsp;</p>

<p><img alt="So sánh iPad Gen 10 và iPad Air 5" src="https://shopdunk.com/images/uploaded/so-sanh-ipad-gen-10-va-ipad-air-5/so-sanh-ipad-gen-10-va-ipad-air-5.jpg" style="height:388px; width:600px" /></p>

<p><em>iPad gen 10 c&oacute; nhiều điểm kh&aacute;c biệt so với iPad Air 5</em></p>

<p>Dưới đ&acirc;y l&agrave; bảng so s&aacute;nh iPad gen 10 v&agrave; iPad Air 5, những phần b&ocirc;i đỏ l&agrave; điểm kh&aacute;c biệt của 2 phi&ecirc;n bản, c&ugrave;ng theo d&otilde;i nh&eacute;!</p>

<table border="1">
	<tbody>
		<tr>
			<td>&nbsp;</td>
			<td>
			<p><strong>iPad Air 5</strong></p>
			</td>
			<td>
			<p><strong>iPad gen 10</strong></p>
			</td>
		</tr>
		<tr>
			<td>
			<p>K&iacute;ch cỡ</p>
			</td>
			<td>
			<p>247.6 x 178.5 x 6.1mm</p>
			</td>
			<td>
			<p>248.6 x 179.5 x 0.28mm</p>
			</td>
		</tr>
		<tr>
			<td>
			<p>C&acirc;n nặng</p>
			</td>
			<td>
			<p>Bản Wi-Fi:&nbsp;461&nbsp;gam</p>

			<p>Wi-Fi + Cellular:&nbsp;462&nbsp;gam</p>
			</td>
			<td>
			<p>Bản Wi-Fi: 477 gam</p>

			<p>Wi-Fi + Cellular: 481 gam</p>
			</td>
		</tr>
		<tr>
			<td>
			<p>M&agrave;n h&igrave;nh</p>
			</td>
			<td>
			<p>10.9-inch</p>

			<p>Laminated&nbsp;Liquid Retina, True Tone v&agrave;&nbsp;lớp phủ chống lo&aacute;</p>
			</td>
			<td>
			<p>10.9-inch</p>

			<p>Liquid Retina, True Tone</p>
			</td>
		</tr>
		<tr>
			<td>
			<p>Độ ph&acirc;n giải m&agrave;n h&igrave;nh</p>
			</td>
			<td>
			<p>2360 x 1640 pixels, 264 ppi</p>
			</td>
			<td>
			<p>2360 x 1640&nbsp; pixels, 264 ppi</p>
			</td>
		</tr>
		<tr>
			<td>
			<p>Cấu h&igrave;nh</p>
			</td>
			<td>
			<p>Apple M1</p>
			</td>
			<td>
			<p>Apple A14 Bionic</p>
			</td>
		</tr>
		<tr>
			<td>
			<p>Camera</p>
			</td>
			<td>
			<p>Camera sau: 12MP wide</p>

			<p>Camera trước: 12MP ultrawide</p>
			</td>
			<td>
			<p>Camera sau: 12-megapixel wide</p>

			<p>Camera trước: 12MP landscape ultrawide</p>
			</td>
		</tr>
		<tr>
			<td>
			<p>Thời lượng pin</p>
			</td>
			<td>
			<p>L&ecirc;n tới 10 giờ sử dụng với Wi-Fi</p>
			</td>
			<td>
			<p>L&ecirc;n tới 10 giờ sử dụng với Wi-Fi</p>
			</td>
		</tr>
		<tr>
			<td>
			<p>Khả năng tương th&iacute;ch với c&aacute;c phụ kiện</p>
			</td>
			<td>
			<p>Apple Pencil (2nd-gen)</p>

			<p>Magic Keyboard, Smart Keyboard Folio</p>
			</td>
			<td>
			<p>Apple Pencil (1st-gen)</p>

			<p>Magic Keyboard Folio</p>
			</td>
		</tr>
		<tr>
			<td>
			<p>M&agrave;u sắc</p>
			</td>
			<td>
			<p>X&aacute;m kh&ocirc;ng gian,&nbsp;Xanh dương, Hồng,&nbsp;T&iacute;m,&nbsp;Trắng &aacute;nh sao</p>
			</td>
			<td>
			<p>Xanh dương, hồng, bạc,&nbsp;v&agrave;ng</p>
			</td>
		</tr>
		<tr>
			<td>
			<p>Đ&aacute;nh gi&aacute; chi tiết về m&aacute;y</p>
			</td>
			<td>
			<p><a href="https://tin.shopdunk.com/tong-quan-ve-ipad-air-5.html" rel="noopener" target="_blank">https://tin.shopdunk.com/tong-quan-ve-ipad-air-5.html</a>&nbsp;</p>
			</td>
			<td>
			<p><a href="https://shopdunk.com/danh-gia-ipad-gen-10" rel="noopener" target="_blank">https://shopdunk.com/danh-gia-ipad-gen-10</a>&nbsp;</p>
			</td>
		</tr>
	</tbody>
</table>

<h2><strong>2. Chi tiết 08 điểm kh&aacute;c biệt giữa iPad gen 10 v&agrave; iPad Air 5</strong></h2>

<p>8 điểm kh&aacute;c biệt được đề cập ở phần dưới đ&acirc;y cũng ch&iacute;nh l&agrave; 8 ưu điểm của iPad Air 5 so với iPad gen 10. Theo d&otilde;i để biết m&igrave;nh n&ecirc;n chọn iPad gen 10 hay iPad Air 5 nh&eacute;!</p>

<h3><strong>2.1. Hiệu suất</strong></h3>

<p>Apple quả thực đ&atilde; khiến nhiều người d&ugrave;ng phải bất ngờ khi trang bị con chip M1 si&ecirc;u mạnh mẽ cho d&ograve;ng iPad Air 5 (2022), gi&uacute;p n&acirc;ng tầm trải nghiệm cho iPad Air 5. Trong khi đ&oacute;, iPad Gen 10 sở hữu trong m&igrave;nh con chip Apple A14 Bionic &ndash; d&ograve;ng chip đ&atilde; c&oacute; mặt tr&ecirc;n d&ograve;ng iPhone 12 Series. Do đ&oacute;, nếu bạn c&oacute; nhu cầu l&agrave;m việc cơ bản v&agrave; giải tr&iacute; sau giờ những giờ l&agrave;m việc căng thẳng, iPad gen 10 sẽ l&agrave; sự lựa chọn tối ưu đ&aacute;ng xem x&eacute;t.&nbsp;</p>

<p><img alt="Hiệu suất của chip Apple M1 trên iPad Air 5" src="https://shopdunk.com/images/uploaded/so-sanh-ipad-gen-10-va-ipad-air-5/chip-apple-M1.jpg" style="height:338px; width:600px" /></p>

<p><em>Con Chip M1 gi&uacute;p iPad Air 5 khoẻ hơn, bền pin hơn so với iPad Gen 10</em></p>

<p>Khi so s&aacute;nh con chip M1 v&agrave; con chip A14, bạn sẽ thấy chip M1 vượt xa A14 về khả năng xử l&yacute;:</p>

<table border="1">
	<tbody>
		<tr>
			<td>&nbsp;</td>
			<td>
			<p><strong>Apple M1</strong></p>
			</td>
			<td>
			<p><strong>Apple A14 Bionic</strong></p>
			</td>
		</tr>
		<tr>
			<td>
			<p><strong>Tiến tr&igrave;nh</strong></p>
			</td>
			<td>
			<p>5 nm</p>
			</td>
			<td>
			<p>5 nm</p>
			</td>
		</tr>
		<tr>
			<td>
			<p><strong>Số lượng b&oacute;ng b&aacute;n dẫn</strong></p>
			</td>
			<td>
			<p>16 tỷ</p>
			</td>
			<td>
			<p>11,8 tỷ</p>
			</td>
		</tr>
		<tr>
			<td>
			<p><strong>K&iacute;ch thước</strong></p>
			</td>
			<td>
			<p>120,5 mm2</p>
			</td>
			<td>
			<p>88 mm2</p>
			</td>
		</tr>
		<tr>
			<td>
			<p><strong>Số lượng nh&acirc;n xử l&yacute;</strong></p>
			</td>
			<td>
			<p>4 x 3.2 GHz Firestorm + 4 x 2 GHz IceStorm</p>
			</td>
			<td>
			<p>2 x 3.1 GHz FireStorm + 4 x 1.8 GHz IceStorm</p>
			</td>
		</tr>
		<tr>
			<td>
			<p><strong>L2 Cache</strong></p>
			</td>
			<td>
			<p>12 MB</p>
			</td>
			<td>
			<p>8 MB</p>
			</td>
		</tr>
		<tr>
			<td>
			<p><strong>GPU</strong></p>
			</td>
			<td>
			<p>8 nh&acirc;n</p>
			</td>
			<td>
			<p>4 nh&acirc;n</p>
			</td>
		</tr>
		<tr>
			<td>
			<p><strong>NPU</strong></p>
			</td>
			<td>
			<p>16 nh&acirc;n</p>
			</td>
			<td>
			<p>16 nh&acirc;n</p>
			</td>
		</tr>
		<tr>
			<td>
			<p><strong>Giao diện bộ nhớ</strong></p>
			</td>
			<td>
			<p>128-bit LPDDR4X (8 k&ecirc;nh)</p>
			</td>
			<td>
			<p>64-bit LPDDR4X (4 k&ecirc;nh)</p>
			</td>
		</tr>
		<tr>
			<td>
			<p><strong>TDP</strong></p>
			</td>
			<td>
			<p>15 W</p>
			</td>
			<td>
			<p>6 W</p>
			</td>
		</tr>
	</tbody>
</table>

<p>Ri&ecirc;ng về RAM, iPad Gen 10 cũng kh&ocirc;ng phải đối thủ của iPad Air 5 khi chỉ sở hữu RAM 3GB, trong khi iPad Air 5 c&oacute; RAM 8GB. Như vậy đủ thấy iPad Air 5 xử l&yacute; tr&igrave;nh đa nhiệm tốt hơn, mang đến những trải nghiệm mượt m&agrave; hơn. Nếu mong muốn tận hưởng c&aacute;c t&iacute;nh năng mạnh mẽ hơn, cụ thể l&agrave; khi bạn y&ecirc;u cầu cao hơn v&agrave;o khả năng xử l&yacute; đồ họa th&igrave; iPad Air 5 l&uacute;c n&agrave;y l&agrave; sự lựa chọn ph&ugrave; hợp.</p>

<h3><strong>2.2. Chất lượng m&agrave;n h&igrave;nh</strong></h3>

<p>Về độ hiển thị, hai chiếc m&aacute;y t&iacute;nh bảng n&agrave;y đem lại trải nghiệm kh&ocirc;ng mấy kh&aacute;c biệt cho người d&ugrave;ng.&nbsp;<strong>10.9 inch v&agrave; m&agrave;n h&igrave;nh Liquid Retina IPS LCD</strong>&nbsp;l&agrave; k&iacute;ch thước v&agrave; c&ocirc;ng nghệ hiển thị ti&ecirc;u chuẩn cho iPad gen 10 v&agrave; iPad Air 5, ngo&agrave;i ra với độ ph&acirc;n giải&nbsp;<strong>1640 x 2360 pixels</strong>, mật độ điểm ảnh<strong>&nbsp;264 ppi&nbsp;</strong>c&ugrave;ng với độ s&aacute;ng l&ecirc;n đến&nbsp;<strong>500 nits</strong>, đồng nghĩa với việc xem phim, lướt web, chơi game đều kh&ocirc;ng l&agrave; vấn đề tr&ecirc;n hai chiếc tablet n&agrave;y.</p>

<p>Điểm kh&aacute;c biệt về m&agrave;n h&igrave;nh ở tr&ecirc;n 2 phi&ecirc;n bản n&agrave;y l&agrave; về m&agrave;u sắc hiển thị. iPad gen 10 chỉ hỗ trợ bảng m&agrave;u sRGB, trong khi iPad Air hỗ trợ c&aacute;c gam m&agrave;u P3 sặc sỡ hơn.</p>

<p><img alt="Màn hình iPad Air 5" src="https://shopdunk.com/images/uploaded/so-sanh-ipad-gen-10-va-ipad-air-5/man-hinh-ipad-air-5.jpg" style="height:384px; width:600px" /></p>

<p><em>M&agrave;n h&igrave;nh iPad Air 5 sặc sỡ hơn so với iPad gen 10 nhờ dải m&agrave;u P3</em></p>

<p>Một điểm cộng của Apple tr&ecirc;n c&aacute;c d&ograve;ng sản phẩm iPad đều được tr&aacute;ng phủ một lớp oleophilic - m&agrave;n h&igrave;nh sẽ gi&uacute;p hạn chế b&aacute;m bẩn, mồ h&ocirc;i hay dấu v&acirc;n tay.</p>

<h3><strong>2.3. Tương th&iacute;ch với c&aacute;c phụ kiện</strong></h3>

<p><strong>Với việc kết nối Apple pencil:&nbsp;</strong>Nếu như iPad (thế hệ thứ 10) chỉ tương th&iacute;ch với Apple pencil 1 th&igrave; iPad Air 5 lại tương th&iacute;ch với Apple pencil 2. Nhờ đ&oacute;, trải nghiệm b&uacute;t cảm ứng tr&ecirc;n iPad Air 5 được đ&aacute;nh gi&aacute; rất cao từ người d&ugrave;ng, vượt xa iPad gen 10. Người d&ugrave;ng sẽ kh&ocirc;ng phải d&ugrave;ng bộ kết nối phức tạp nữa m&agrave; c&oacute; thể kết nối Apple pencil 2 với iPAd Air 5 si&ecirc;u đơn giản, thuận tiện.&nbsp;</p>

<p>B&ecirc;n cạnh đ&oacute;, Apple pencil 2 cũng hỗ trợ cảm ứng ch&iacute;nh x&aacute;c hơn, tốc độ ổn định hơn v&agrave; l&agrave;m được nhiều điều th&uacute; vị hơn so với Apple pencil 1.&nbsp;</p>

<p>Đặc biệt, việc sạc Apple pencil 2 tr&ecirc;n iPad Air 5 cũng đơn giản hơn v&igrave; iPad Air hỗ trợ sạc kh&ocirc;ng d&acirc;y khi người d&ugrave;ng gắn v&agrave;o cạnh. Trong khi đ&oacute;, nếu d&ugrave;ng iPad (thế hệ thứ 10), bạn sẽ cần đầu tư v&agrave;o Type C for Lightning dongle, bởi v&igrave; b&uacute;t cảm ứng thế hệ 1 của Apple sẽ phải được gắn với cổng Lightning để sạc.&nbsp;</p>

<p><img alt="Apple Pencil 2 tương thích với iPad Air 5" src="https://shopdunk.com/images/uploaded/so-sanh-ipad-gen-10-va-ipad-air-5/apple-pencil-2.jpg" style="height:338px; width:600px" /></p>

<p><em>Apple pencil 2 tr&ecirc;n iPad Air 5 mang đến trải nghiệm th&uacute; vị hơn</em></p>

<p><strong>Với việc kết nối b&agrave;n ph&iacute;m:&nbsp;</strong>iPad gen 10 c&oacute; hỗ trợ Magic Keyboard của Apple, trong khi iPad Air 5 hỗ trợ Magic Keyboard v&agrave; Smart Keyboard Folio. Cả hai chiếc m&aacute;y t&iacute;nh bảng n&agrave;y đều hỗ trợ b&agrave;n ph&iacute;m Bluetooth.</p>

<h3><strong>2.4. Thời lượng pin</strong></h3>

<p>Khi n&oacute;i đến thời lượng pin th&igrave; cả hai d&ograve;ng m&aacute;y đều cung cấp khoảng 10 giờ lướt web. N&oacute;i một c&aacute;ch đơn giản th&igrave; c&oacute; rất &iacute;t sự kh&aacute;c biệt để so s&aacute;nh thời lượng pin tr&ecirc;n iPad gen 10 v&agrave; iPad Air 5.</p>

<p>Cho n&ecirc;n, với sản phẩm iPad gi&aacute; tầm trung được sản xuất phục vụ cho c&aacute;c c&ocirc;ng việc thao t&aacute;c đơn giản h&agrave;ng ng&agrave;y th&igrave; iPad thế hệ thứ 10 hay iPad Air đời thứ 5 kh&ocirc;ng phải l&agrave; sự lựa chọn qu&aacute; tồi cho c&aacute;c d&acirc;n văn ph&ograve;ng v&agrave; học sinh, sinh vi&ecirc;n.</p>

<h3><strong>2.5. Thiết kế m&agrave;u sắc</strong></h3>

<p>Cuối c&ugrave;ng, iPad (2022) v&agrave; iPad Air (2022) c&oacute; sẵn c&aacute;c loại m&agrave;u sắc ho&agrave;n to&agrave;n kh&aacute;c nhau.&nbsp;</p>

<ul>
	<li>iPad Air 5: C&oacute; 5 m&agrave;u trung t&iacute;nh l&agrave;: m&agrave;u hồng s&aacute;ng, xanh dương (blue), t&iacute;m, x&aacute;m (Space Gray), trắng &aacute;nh v&agrave;ng (Starlight)</li>
	<li>iPad Gen 10: C&oacute; 4 m&agrave;u sặc sỡ hơn l&agrave;: Bạc (Silver), m&agrave;u xanh nước biển (Blue), hồng (Pink) v&agrave; v&agrave;ng s&aacute;ng (Yellow).</li>
</ul>

<p><img alt="Màu các mẫu iPad Air 5" src="https://shopdunk.com/images/uploaded/so-sanh-ipad-gen-10-va-ipad-air-5/mau-ipad-air-5.jpg" style="height:385px; width:600px" /></p>

<p><em>iPad Air 5 c&oacute; 5 m&agrave;u, trong khi đ&oacute; iPad gen 10 chỉ c&oacute; 4 m&agrave;u</em></p>

<p><img alt="Mẫu thiết kế iPad gen 10" src="https://shopdunk.com/images/uploaded/so-sanh-ipad-gen-10-va-ipad-air-5/ipad-gen-10.jpg" style="height:338px; width:600px" /></p>

<p><em>iPad gen 10 được thiết kế với nhiều m&agrave;u sắc nổi bật</em></p>

<h3><strong>2.6. Trọng lượng</strong></h3>

<p>Trước hết, h&atilde;y chỉ nh&igrave;n đến kh&iacute;a cạnh &quot;c&acirc;n nặng&quot; - một chi tiết nhỏ nhưng c&oacute; li&ecirc;n quan đến sự thoải m&aacute;i cầm nắm. iPad Gen 10 sở hữu trọng lượng nhẹ hơn với mức 477 gam (Wi-Fi) v&agrave; 481 gam (Wi-Fi + Cellular). Trong khi đ&oacute;, iPad Air 5 nhẹ hơn với trọng lượng 461 gam (Wi-Fi) v&agrave; 462 gam (Wi-Fi + Cellular).&nbsp;</p>

<p>Một sự ch&ecirc;nh lệch nhỏ, nhưng trong thực tế, iPad Air 5 được đ&aacute;nh gi&aacute; kh&aacute; cao v&igrave; thoải m&aacute;i cầm nắm ở mọi tư thế.&nbsp;</p>

<h3><strong>2.7. Thiết kế vị tr&iacute; đặt camera</strong></h3>

<p>iPad gen 10 (2022) v&agrave; iPad Air 5 (2022) đều cung cấp c&ugrave;ng một camera sau 12 megapixel (MP) với khẩu độ f/1.8, zoom kỹ thuật số 5x v&agrave; hỗ trợ Smart HDR 3. N&oacute; cũng c&oacute; thể quay video 4K với tốc độ l&ecirc;n đến 60 khung h&igrave;nh / gi&acirc;y (fps), với dải động mở rộng v&agrave; thậm ch&iacute; hỗ trợ quay video slo-mo.</p>

<p>Camera trước tr&ecirc;n iPad gen 10 (2022) cũng c&oacute; th&ocirc;ng số kỹ thuật giống hệt với camera tr&ecirc;n iPad Air 5 (2022), với độ ph&acirc;n giải 12MP, khẩu độ f / 2.4 v&agrave; hỗ trợ Center Stage v&agrave; ổn định video điện ảnh.&nbsp;</p>

<p>Tuy nhi&ecirc;n, iPad gen 10 c&oacute; phần camera trước đặt ở cạnh d&agrave;i, ph&ugrave; hợp để sử dụng khi cầm iPad sang một b&ecirc;n theo hướng ngang. Điều n&agrave;y cung cấp trải nghiệm người d&ugrave;ng giống m&aacute;y t&iacute;nh x&aacute;ch tay hơn, gi&uacute;p c&aacute;c cuộc gọi FaceTime v&agrave; Zoom tốt hơn.</p>
', CAST(N'2024-11-02' AS Date), 1)
INSERT [dbo].[News] ([newid], [ntid], [nimage], [title], [contents], [createdate], [status]) VALUES (9, 4, N'iphone03.jpeg', N'Hướng dẫn sử dụng Launchpad MacBook chỉ trong 5 phút', N'<p><strong>Launchpad MacBook</strong>&nbsp;l&agrave; một phần quan trọng gi&uacute;p việc truy cập ứng dụng của người d&ugrave;ng được diễn ra nhanh ch&oacute;ng v&agrave; thuận tiện hơn. H&atilde;y c&ugrave;ng ShopDunk t&igrave;m hiểu nhanh những thao t&aacute;c cơ bản m&agrave; bạn c&oacute; thể dễ d&agrave;ng thực hiện ngay tr&ecirc;n phần Launchpad n&agrave;y.</p>

<h2><strong>1. Launchpad MacBook l&agrave; g&igrave;?</strong></h2>

<p>Launchpad l&agrave; kho chứa đầy đủ c&aacute;c ứng dụng hiện đang được c&agrave;i đặt tr&ecirc;n MacBook. Giao diện của Launchpad c&oacute; phần tương đồng với giao diện hiển thị m&agrave;n h&igrave;nh ch&iacute;nh tr&ecirc;n những chiếc iPad.</p>

<p>Ở phi&ecirc;n bản macOS Catalina trở về trước, Launchpad c&oacute; k&yacute; hiệu l&agrave; biểu tượng t&ecirc;n lửa. Đến bản macOS Big Sur, Launchpad được k&yacute; hiệu l&agrave; biểu tượng h&igrave;nh vu&ocirc;ng c&oacute; 9 &ocirc; m&agrave;u kh&aacute;c nhau.</p>

<p><img alt="Biểu tượng mới nhất của Launchpad là hình ô vuông có 9 màu" src="https://shopdunk.com/images/uploaded/MacBook/bieu-tuong-moi-nhat-cua-launchpad-la-hinh-o-vuong-co-9-mau.jpg" style="height:292px; width:560px" /></p>

<p>Biểu tượng mới nhất của Launchpad l&agrave; h&igrave;nh &ocirc; vu&ocirc;ng c&oacute; 9 m&agrave;u</p>

<h2><strong>2. C&aacute;ch sử dụng Launchpad MacBook</strong></h2>

<p>Dưới đ&acirc;y l&agrave; 6 thao t&aacute;c với Launchpad tr&ecirc;n MacBook m&agrave; bạn n&ecirc;n biết:</p>

<h3><strong>2.1. C&aacute;ch mở v&agrave; đ&oacute;ng Launchpad MacBook</strong></h3>

<p>C&oacute; đến 3 c&aacute;ch đ&oacute;ng v&agrave; mở Launchpad tr&ecirc;n MacBook, bạn c&oacute; thể tham khảo 1 trong 3 c&aacute;ch dưới đ&acirc;y:</p>

<p><strong>C&aacute;ch 1:</strong>&nbsp;Chọn biểu tượng Launchpad tại thanh menu Dock tr&ecirc;n m&agrave;n h&igrave;nh giao diện.</p>

<p><img alt="Mở Launchpad trên bản macOS Big Sur" src="https://shopdunk.com/images/uploaded/MacBook/mo-launchpad-tren-ban-macos-big-sur.jpg" style="height:312px; width:600px" /></p>

<p>Mở Launchpad tr&ecirc;n bản macOS Big Sur</p>

<p><strong>C&aacute;ch 2:</strong>&nbsp;Chụm v&agrave; mở rộng c&ugrave;ng l&uacute;c 4 ng&oacute;n tay tr&ecirc;n phần TouchPad.</p>

<p><img alt="Thao tác mở và đóng Launchpad thông qua phần touchpad" src="https://shopdunk.com/images/uploaded/MacBook/thao-tac-mo-va-dong-launchpad-thong-qua-phan-touchpad.jpg" style="height:338px; width:600px" /></p>

<p>Thao t&aacute;c mở v&agrave; đ&oacute;ng Launchpad th&ocirc;ng qua phần touchpad</p>

<p><strong>C&aacute;ch 3:</strong>&nbsp;</p>

<ul>
	<li>Nhấn ph&iacute;m F4 để mở Launchpad&nbsp;</li>
	<li>Nh&iacute;n nhấm F4 một lần nữa để đ&oacute;ng Launchpad</li>
</ul>

<p><img alt="Thao tác mở và đóng Launchpad bằng phím bấm vật lý" src="https://shopdunk.com/images/uploaded/MacBook/thao-tac-mo-va-dong-launchpad-bang-phim-bam-vat-ly.jpg" style="height:338px; width:600px" /></p>

<p>Thao t&aacute;c mở v&agrave; đ&oacute;ng Launchpad bằng ph&iacute;m bấm vật l&yacute;</p>

<h3><strong>2.2. C&aacute;ch t&igrave;m v&agrave; mở ứng dụng trong Launchpad tr&ecirc;n MacBook</strong></h3>

<p>Bước 1: Sau khi mở Launchpad, tr&ecirc;n &ocirc; t&igrave;m kiếm bạn g&otilde; t&ecirc;n ứng dụng muốn mở.</p>

<p>Bước 2: Click chuột v&agrave;o biểu tượng ứng dụng hiện ra.</p>

<p><img alt="Thao tác mở ứng dụng trong Launchpad" src="https://shopdunk.com/images/uploaded/MacBook/thao-tac-mo-ung-dung-trong-launchpad.jpg" style="height:338px; width:600px" /></p>

<p>Thao t&aacute;c mở ứng dụng trong Launchpad</p>

<h3><strong>2.3. C&aacute;ch di chuyển v&agrave; sắp xếp ứng dụng trong Launchpad MacBook</strong></h3>

<p><strong>Di chuyển ứng dụng</strong></p>

<p>Bước 1: Bấm v&agrave; giữ chuột v&agrave;o ứng dụng cần di chuyển.</p>

<p>Bước 2: K&eacute;o chuột sang m&eacute;p m&agrave;n h&igrave;nh tr&aacute;i hoặc phải để nhảy trang.&nbsp;</p>

<p><strong>Lưu &yacute;:&nbsp;</strong>Bạn cũng c&oacute; thể k&eacute;o thả ứng dụng từ Launchpad v&agrave;o th&agrave;nh menu Dock.</p>

<p><img alt="Chọn, nhấn giữ và kéo ứng dụng sang mép màn hình để di chuyển " src="https://shopdunk.com/images/uploaded/MacBook/chon-nhan-giu-va-keo-ung-dung-sang-mep-man-hinh-de-di-chuyen-.jpg" style="height:375px; width:600px" /></p>

<p>Chọn, nhấn giữ v&agrave; k&eacute;o ứng dụng sang m&eacute;p m&agrave;n h&igrave;nh để di chuyển&nbsp;</p>

<p><strong>Tạo thư mục</strong></p>

<p>Bước 1: K&eacute;o ứng dụng mong muốn đ&egrave; l&ecirc;n một ứng dụng kh&aacute;c.</p>

<p><img alt="Kéo thả ứng dụng đè lên ứng dụng khác để tạo thư mục mới" src="https://shopdunk.com/images/uploaded/MacBook/keo-tha-ung-dung-de-len-ung-dung-khac-de-tao-thu-muc-moi.jpg" style="height:338px; width:600px" /></p>

<p>K&eacute;o thả ứng dụng đ&egrave; l&ecirc;n ứng dụng kh&aacute;c để tạo thư mục mới</p>

<p>Bước 2: Nhấn v&agrave;o ti&ecirc;u để để đổi t&ecirc;n thư mục mới tạo.</p>

<p><img alt="Nhấn vào phần tiêu đề để đổi tên thư mục" src="https://shopdunk.com/images/uploaded/MacBook/nhan-vao-phan-tieu-de-de-doi-ten-thu-muc.jpg" style="height:338px; width:600px" /></p>

<p>Nhấn v&agrave;o phần ti&ecirc;u đề để đổi t&ecirc;n thư mục</p>
', CAST(N'2024-11-02' AS Date), 1)
INSERT [dbo].[News] ([newid], [ntid], [nimage], [title], [contents], [createdate], [status]) VALUES (10, 4, N'iphone04.jpeg', N'Hướng dẫn 5 cách tạo thư mục trên MacBook đơn giản, nhanh chóng', N'<p>Tạo thư mục (folder) để lưu trữ v&agrave; ph&acirc;n loại t&agrave;i liệu l&agrave; một trong những thao t&aacute;c quen thuộc của người d&ugrave;ng m&aacute;y t&iacute;nh. Nếu bạn l&agrave; người d&ugrave;ng đ&atilde; quen thuộc với hệ điều h&agrave;nh Windows th&igrave; chắc hẳn sẽ gặp kh&ocirc;ng &iacute;t bối rối khi tạo thư mục (folder) tr&ecirc;n macOS. Trong b&agrave;i viết n&agrave;y, ShopDunk sẽ hướng dẫn bạn&nbsp;<strong>c&aacute;ch tạo thư mục tr&ecirc;n MacBook</strong>&nbsp;với 5 bước đơn giản v&agrave; nhanh ch&oacute;ng!</p>

<h2><strong>1. C&aacute;ch 1: Tạo thư mục tr&ecirc;n menu của cửa sổ macOS</strong></h2>

<p>Một trong những c&aacute;ch đơn giản v&agrave; dễ d&agrave;ng nhất để tạo thư mục tr&ecirc;n m&aacute;y t&iacute;nh MacBook l&agrave; bạn thực hiện tạo thư mục ngay tr&ecirc;n menu cửa sổ macOS.&nbsp;</p>

<ul>
	<li><strong>Bước 1:</strong>&nbsp;Tr&ecirc;n thanh menu ph&iacute;a tr&ecirc;n m&agrave;n h&igrave;nh bạn chọn &ldquo;Tệp (File)&rdquo;.</li>
	<li><strong>Bước 2:&nbsp;</strong>Nhấn chọn mục &ldquo;Tạo thư mục mới (New Folder)&rdquo;.</li>
</ul>

<p><em><img alt="Nhấn “New Folder” để bắt đầu tạo một thư mục mới trên MacBook" src="https://shopdunk.com/images/uploaded/MacBook/nhan-new-folder-de-bat-dau-tao-mot-thu-muc-moi-tren-macbook.jpg" style="height:275px; width:600px" /></em></p>

<p>Nhấn &ldquo;New Folder&rdquo; để bắt đầu tạo một thư mục mới tr&ecirc;n MacBook</p>

<h2><strong>2.&nbsp; C&aacute;ch 2: Tạo trực tiếp ở giao diện m&agrave;n h&igrave;nh macOS</strong></h2>

<p>Tạo thư mục trong MacBook theo c&aacute;ch n&agrave;y cũng kh&aacute; giống c&aacute;ch l&agrave;m tr&ecirc;n hệ điều h&agrave;nh Windows. Bạn sẽ cần thực hiện:&nbsp;</p>

<ul>
	<li><strong>Bước 1:</strong>&nbsp;Từ giao diện m&agrave;n h&igrave;nh của m&aacute;y bạn nhấn chuột phải.</li>
	<li><strong>Bước 2:&nbsp;</strong>T&igrave;m v&agrave; nhấn &ldquo;Tạo thư mục mới (New Folder)&rdquo;.</li>
</ul>

<p><img alt="Bạn tìm và chọn “New Folder” từ cửa sổ xuất hiện" src="https://shopdunk.com/images/uploaded/MacBook/tim-va-chon-new-folder-tu-cua-so-xuat-hien.jpg" style="height:504px; width:600px" /></p>

<p>Bạn t&igrave;m v&agrave; chọn &ldquo;New Folder&rdquo; từ cửa sổ xuất hiện</p>

<h2><strong>3. C&aacute;ch 3: Nhấn đồng thời tổ hợp ph&iacute;m tắt</strong></h2>

<p>C&oacute; một c&aacute;ch tạo thư mục tr&ecirc;n MacBook nhanh ch&oacute;ng hơn đ&oacute; l&agrave; th&ocirc;ng qua tổ hợp ph&iacute;m tắt&nbsp;<strong>&ldquo;Shift + Command + N&rdquo;</strong>.</p>

<p><strong>Lưu &yacute;:&nbsp;</strong>Khi tạo thư mục bằng tổ hợp ph&iacute;m tắt ở tr&ecirc;n, người d&ugrave;ng cần phải đổi t&ecirc;n folder theo thứ tự: Nhấp chuột phải &gt; chọn &ldquo;Đổi t&ecirc;n (Rename)&rdquo;. C&aacute;ch kh&aacute;c bạn c&oacute; thể nhấn đ&uacute;p 2 lần v&agrave;o t&ecirc;n thư mục để điền t&ecirc;n.</p>

<p><img alt="Nhấn đồng thời tổ hợp 3 phím “Shift + Command + N”" src="https://shopdunk.com/images/uploaded/MacBook/nhan-dong-thoi-to-hop-3-phim-shift-command-n.jpg" style="height:450px; width:600px" /></p>

<p>Nhấn đồng thời tổ hợp 3 ph&iacute;m &ldquo;Shift + Command + N&rdquo;</p>

<h2><strong>4. C&aacute;ch 4: Tận dụng Smart Folders</strong></h2>

<p>Smart Folder hay thư mục th&ocirc;ng minh l&agrave; t&iacute;nh năng hỗ trợ người d&ugrave;ng t&igrave;m kiếm tệp tin một c&aacute;ch dễ d&agrave;ng v&agrave; nhanh ch&oacute;ng hơn, đồng thời gi&uacute;p bạn quản l&yacute; thư mục tr&ecirc;n MacBook hiệu quả hơn.&nbsp;</p>

<ul>
	<li><strong>Bước 1:&nbsp;</strong>Tr&ecirc;n thanh Menu của Finder, bạn tiến h&agrave;nh chọn &ldquo;Tệp (File)&rdquo; v&agrave; nhấn &ldquo;Tạo thư mục th&ocirc;ng minh (New Smart Folder)&rdquo;. Hoặc bạn c&oacute; thể thao t&aacute;c tổ hợp ph&iacute;m tắt &ldquo;Option + Command + Space&rdquo;.</li>
</ul>

<p><img alt="Chọn New Smart Folder từ cửa sổ File của máy" src="https://shopdunk.com/images/uploaded/MacBook/chon-new-smart-folder-tu-cua-so-file-cua-may.jpg" style="height:244px; width:600px" /></p>

<p>Chọn New Smart Folder từ cửa sổ File của m&aacute;y</p>

<ul>
	<li><strong>Bước 2:</strong>&nbsp;Tại &ocirc; &ldquo;T&igrave;m kiếm (Search)&rdquo;, bạn c&oacute; thể t&igrave;m tất cả c&aacute;c file để cho v&agrave;o thư mục n&agrave;y.</li>
</ul>

<p><img alt="Tìm các file dữ liệu trên mục Search" src="https://shopdunk.com/images/uploaded/MacBook/tim-cac-file-du-lieu-tren-muc-search.jpg" style="height:311px; width:600px" /></p>

<p>T&igrave;m c&aacute;c file dữ liệu tr&ecirc;n mục Search</p>

<ul>
	<li><strong>Bước 3:</strong>&nbsp;Nhấn v&agrave;o &ldquo;Lưu (Save)&rdquo;, tại cửa số n&agrave;y sẽ c&oacute; 3 phần:

	<ul>
		<li><strong>Save As:&nbsp;</strong>Lưu t&ecirc;n Smart Folder vừa được tạo.</li>
		<li><strong>Where:&nbsp;</strong>Vị tr&iacute; m&agrave; người d&ugrave;ng muốn lưu Smart Folder.</li>
		<li><strong>Add to Sidebar:</strong>&nbsp;Thanh Sidebar của Finder sẽ hỗ trợ người d&ugrave;ng cập nhanh v&agrave;o Thư mục th&ocirc;ng minh vừa tạo.</li>
	</ul>
	</li>
</ul>

<h2><strong>5. C&aacute;ch 5: Tạo thư mục từ d&ograve;ng lệnh</strong></h2>

<p>Dưới đ&acirc;y l&agrave; c&aacute;ch tạo thư mục MacBook từ d&ograve;ng lệnh:&nbsp;</p>

<ul>
	<li><strong>Bước 1:&nbsp;</strong>Bạn tiến h&agrave;nh mở Terminal bằng c&aacute;ch nhấn tổ hợp ph&iacute;m &ldquo;Command + Space&quot;.</li>
	<li><strong>Bước 2:&nbsp;</strong>G&otilde; t&ecirc;n v&agrave; mở ứng dụng &ldquo;Terminal&rdquo;.</li>
	<li><strong>Bước 3:</strong>&nbsp;Nhập d&ograve;ng lệnh &ldquo;mkdir + Địa chỉ chứa thư mục + T&ecirc;n thư mục&rdquo;.&nbsp;</li>
</ul>

<p><strong>V&iacute; dụ:</strong>&nbsp;Với lệnh, &ldquo;mkdir ./Desktop/ShopDunk&rdquo;, bạn sẽ c&oacute; 1 thư mục t&ecirc;n ShopDunk nằm trong tại m&agrave;n h&igrave;nh Desktop.<em>&nbsp;</em></p>

<p><img alt="Thư mục ShopDunk được tạo mới nằm ở màn hình Desktop" src="https://shopdunk.com/images/uploaded/MacBook/thu-muc-shopdunk-duoc-tao-moi-nam-o-man-hinh-desktop.jpg" style="height:354px; width:600px" /></p>

<p>Thư mục ShopDunk được tạo mới nằm ở m&agrave;n h&igrave;nh Desktop</p>

<p><em><strong>Lưu &yacute;:&nbsp;</strong>5 bước tr&ecirc;n sẽ &aacute;p dụng cho tất cả c&aacute;c sản phẩm MacBook, từ thế hệ cũ cho tới phi&ecirc;n bản mới như&nbsp;<a href="https://shopdunk.com/macbook-pro-m3-2023" rel="noopener" target="_blank">Macbook M3 Pro</a>.</em></p>

<h2><strong>C&aacute;ch x&oacute;a thư mục tr&ecirc;n MacBook</strong></h2>

<p>Tr&ecirc;n đ&acirc;y l&agrave; những c&aacute;ch tạo thư mục tr&ecirc;n MacBook, tuy nhi&ecirc;n để x&oacute;a Folder bạn c&oacute; thể thực hiện th&ocirc;ng qua c&aacute;c thao t&aacute;c: Nhấp chuột phải v&agrave;o thư mục v&agrave; nhấn &ldquo;Di chuyển v&agrave;o th&ugrave;ng r&aacute;c (Move to Trash)&rdquo;.</p>

<p><img alt="Nhấn “Move to Trash” để xóa thư mục đã tạo trên MacBook" src="https://shopdunk.com/images/uploaded/MacBook/nhan-move-to-trash-de-xoa-thu-muc-da-tao-tren-macbook.jpg" style="height:450px; width:600px" /></p>

<p>Nhấn &ldquo;Move to Trash&rdquo; để x&oacute;a thư mục đ&atilde; tạo tr&ecirc;n MacBook</p>

<p>Tr&ecirc;n đ&acirc;y l&agrave;&nbsp;<strong>5 c&aacute;ch tạo thư mục tr&ecirc;n MacBook&nbsp;</strong>v&ocirc; c&ugrave;ng dễ d&agrave;ng m&agrave; bạn c&oacute; thể tham khảo. Mong rằng với những chia sẻ tr&ecirc;n sẽ sớm gi&uacute;p bạn c&oacute; thể nhanh ch&oacute;ng tạo được những thư mục cần thiết tr&ecirc;n m&aacute;y MacBook. Nếu gặp kh&oacute; khăn do lỗi đến từ MacBook, bạn h&atilde;y li&ecirc;n hệ đến&nbsp;<strong>ShopDunk Care - Trung t&acirc;m dịch vụ ủy quyền ch&iacute;nh thức của Apple, chuy&ecirc;n bảo h&agrave;nh v&agrave; sửa chữa c&aacute;c sản phẩm từ Apple</strong>! Hotline ShopDunk Care: 1900.8036.</p>

<p>&nbsp;</p>

<p><span style="display:none">&nbsp;</span>&nbsp;</p>
', CAST(N'2024-11-02' AS Date), 1)
INSERT [dbo].[News] ([newid], [ntid], [nimage], [title], [contents], [createdate], [status]) VALUES (11, 4, N'macbook1.jpeg', N'3 bước xóa trắng MacBook M2 và cài đặt lại macOS cực dễ dàng', N'<p><strong>X&oacute;a trắng MacBook M2</strong>&nbsp;thường được ứng dụng trong trường hợp người d&ugrave;ng muốn c&agrave;i đặt lại macOS, hoặc muốn sang nhượng lại m&aacute;y cho người kh&aacute;c. Dưới đ&acirc;y sẽ l&agrave; 5 bước x&oacute;a m&aacute;y mac M2 v&ocirc; c&ugrave;ng đơn giản m&agrave; bạn c&oacute; thể tham khảo:</p>

<h2>1. Hướng dẫn x&oacute;a trắng MacBook M2</h2>

<p>MacBook M2 c&oacute; thể sử dụng hệ điều h&agrave;nh macOS Monterey hoặc một số m&aacute;y cập nhật phi&ecirc;n bản macOS Ventura mới nhất. B&agrave;i viết sau sẽ hướng dẫn bạn x&oacute;a trắng MacBook M2 ở cả 2 phi&ecirc;n bản.</p>

<p><strong><em>Lưu &yacute;:</em></strong><em>&nbsp;</em>Qu&aacute; tr&igrave;nh n&agrave;y sẽ x&oacute;a to&agrave;n bộ dữ liệu c&oacute; trong m&aacute;y ở cả 2 hệ điều h&agrave;nh. V&igrave; vậy, người d&ugrave;ng h&atilde;y sao lưu c&aacute;c tệp v&agrave; t&agrave;i liệu cần thiết ra ổ cứng ngo&agrave;i hoặc c&aacute;c dịch vụ lưu trữ đ&aacute;m m&acirc;y kh&aacute;c trước khi thực hiện c&aacute;c bước dưới đ&acirc;y.</p>

<p><img alt="sao lưu toàn bộ dữ liệu" src="https://shopdunk.com/images/uploaded/MacBook/sao-luu-toan-bo-du-lieu.jpg" style="height:450px; width:600px" /></p>

<p><em>Trước khi x&oacute;a m&aacute;y Mac bạn n&ecirc;n sao lưu to&agrave;n bộ dữ liệu</em></p>

<p>Khi đ&atilde; sao lưu c&aacute;c dữ liệu cần thiết, bạn tiến h&agrave;nh x&oacute;a trắng MAcBook M2 theo hướng dẫn c&aacute;c bước sau.</p>

<h3><strong>1.1. Đối với Mac chạy macOS Ventura</strong></h3>

<p><strong>Bước 1</strong>. Mở System Settings (C&agrave;i đặt hệ thống) tr&ecirc;n MacBook M2&nbsp;</p>

<p><em><img alt="Chọn ứng dụng System Settings" src="https://shopdunk.com/images/uploaded/MacBook/chon-ung-dung-system-settings.jpg" style="height:400px; width:600px" /></em></p>

<p><em>Chọn ứng dụng System Settings (C&agrave;i đặt hệ thống) tr&ecirc;n giao diện m&agrave;n h&igrave;nh</em></p>

<p><strong>Bước 2.</strong>&nbsp;Nhấn chọn &ldquo;General&rdquo; (C&agrave;i đặt chung) ở thanh b&ecirc;n tr&aacute;i, sau đ&oacute; nhấp v&agrave;o Transfer or Reset (Chuyển đổi hoặc c&agrave;i đặt lại)</p>

<p><em><img alt="Chọn “General” sau đó nhấp vào Transfer or Reset" src="https://shopdunk.com/images/uploaded/MacBook/chon-general-sau-do-nhap-vao-transfer-or-reset.jpg" style="height:490px; width:600px" /></em></p>

<p><em>Chọn &ldquo;General&rdquo; sau đ&oacute; nhấp v&agrave;o Transfer or Reset&nbsp;</em></p>

<p><strong>Bước 3.</strong>&nbsp;Cửa sổ Transfer or Reset (Chuyển đổi hoặc c&agrave;i đặt lại) xuất hiện, bạn nhấn chọn &ldquo;Erase All Contents and Settings&rdquo; (X&oacute;a to&agrave;n bộ nội dung v&agrave; c&agrave;i đặt).</p>

<p><em><img alt="Chọn “Erase All Contents and Settings”" src="https://shopdunk.com/images/uploaded/MacBook/chon-erase-all-contents-and-settings.jpg" style="height:424px; width:600px" /></em></p>

<p><em>Chọn &ldquo;</em><em>Erase All Contents and Settings&rdquo; (X&oacute;a to&agrave;n bộ nội dung v&agrave; c&agrave;i đặt)</em></p>

<p>Nhập mật khẩu nếu m&aacute;y y&ecirc;u cầu, sau đ&oacute; chỉ cần chờ m&aacute;y x&oacute;a dữ liệu v&agrave; tiến h&agrave;nh c&agrave;i đặt macOS mới.</p>

<h3><strong>1.2. Đối với Mac chạy macOS Monterey</strong></h3>

<p>Đối với MacBook M2 chạy macOS Monterey, bạn l&agrave;m theo hướng dẫn sau.</p>

<p>Mở System Preferences (T&ugrave;y chọn hệ thống) v&agrave; nhấn chọn &ldquo;Erase All Contents and Settings&rdquo; (X&oacute;a to&agrave;n bộ nội dung v&agrave; c&agrave;i đặt).</p>

<p><em><img alt="Nhấn chọn “Erase All Contents and Settings" src="https://shopdunk.com/images/uploaded/MacBook/nhan-chon-erase-all-contents-and-settings-voi-mac-chay-macos-monterey.jpg" style="height:379px; width:600px" /></em></p>

<p><em>Nhấn chọn &ldquo;</em><em>Erase All Contents and Settings&rdquo; (X&oacute;a to&agrave;n bộ nội dung v&agrave; c&agrave;i đặt)</em></p>

<p>Giống như macOS Ventura, m&aacute;y sẽ tự động xử l&yacute; mọi thứ để x&oacute;a sạch MacBook M2 của bạn.&nbsp;</p>

<h2>2. C&aacute;ch c&agrave;i đặt lại mac OS sau khi x&oacute;a m&aacute;y Mac</h2>

<p>Sau khi x&oacute;a trắng MacBook M2, người d&ugrave;ng c&oacute; thể c&agrave;i đặt lại macOS theo c&aacute;c bước như sau:&nbsp;</p>

<p><strong>Bước 1.&nbsp;</strong>Khởi động m&aacute;y t&iacute;nh của bạn trong &ldquo;Reinstall MacOS&rdquo;</p>

<p>Tắt m&aacute;y sau đ&oacute; giữ n&uacute;t nguồn cho đến khi xuất hiện &ldquo;Loading boot options&rdquo;.</p>

<p><em><img alt="Tắt máy và giữ nút nguồn đến khi xuất hiện “Loading boot options”" src="https://shopdunk.com/images/uploaded/MacBook/tat-may-va-giu-nut-nguon.jpg" style="height:365px; width:600px" /></em></p>

<p><em>Tắt m&aacute;y v&agrave; giữ n&uacute;t nguồn đến khi xuất hiện &ldquo;Loading boot options&rdquo;</em></p>

<p>Sau đ&oacute;, chọn &ldquo;Options&rdquo; v&agrave; bấm v&agrave;o &ldquo;Continue&rdquo;</p>

<p><em><img alt="Chọn “Options” và bấm vào “Continue”" src="https://shopdunk.com/images/uploaded/MacBook/chon-options-va-bam-vao-continue-Copy-1.jpg" style="height:398px; width:600px" /></em></p>

<p><em>Chọn &ldquo;Options&rdquo; v&agrave; bấm v&agrave;o &ldquo;Continue&rdquo;</em></p>

<p><strong>Bước 2.</strong>&nbsp;Cửa sổ mới hiện ra, chọn &ldquo;Reinstall macOS Ventura&rdquo; (hoặc Reinstall macOS Monterey t&ugrave;y theo macOS hiện tại của bạn) v&agrave; bấm &ldquo;Continue&rdquo;</p>

<p><em><img alt="Chọn “ Reinstall macOS Ventura” hiện tại máy đang sử dụng để tiến hành cài đặt lại macOS" src="https://shopdunk.com/images/uploaded/MacBook/chon-o-dia-ma-macbook-m2-cua-ban-dang-su-dung-de-cai-dat-macos.jpg" style="height:424px; width:600px" /></em></p>

<p><em>Chọn &ldquo; Reinstall macOS Ventura&rdquo; hiện tại m&aacute;y đang sử dụng để tiến h&agrave;nh c&agrave;i đặt lại macOS</em></p>

<p><strong>Bước 3.&nbsp;</strong>L&agrave;m theo c&aacute;c hướng dẫn tr&ecirc;n m&agrave;n h&igrave;nh</p>

<p>Sau khi bấm &ldquo;Continue&rdquo; ở mục &ldquo; Reinstall macOS&rdquo;, c&aacute;c cửa sổ kh&aacute;c sẽ xuất hiện, bạn chỉ cần l&agrave;m theo hướng dẫn tr&ecirc;n m&agrave;n h&igrave;nh l&agrave; c&oacute; thể đến bước tiếp theo.</p>

<p><em><img alt="Thực hiện theo hướng dẫn xuất hiện trên màn hình" src="https://shopdunk.com/images/uploaded/MacBook/thuc-hien-theo-huong-dan-xuat-hien-tren-man-hinh.jpg" style="height:416px; width:600px" /></em></p>

<p><em>Thực hiện theo hướng dẫn xuất hiện tr&ecirc;n m&agrave;n h&igrave;nh</em></p>

<p><strong>Bước 4.&nbsp;</strong>Chọn ổ đĩa macOS hiện tại m&aacute;y đang sử dụng</p>

<p>Ho&agrave;n tất c&aacute;c thao t&aacute;c theo hướng dẫn xuất hiện tr&ecirc;n m&agrave;n h&igrave;nh, cửa sổ mới hiện ra, nhấn chọn ổ đĩa macOS hiện tại MacBook M2 của bạn đang sử dụng để tiến h&agrave;nh c&agrave;i đặt macOS.</p>
', CAST(N'2024-11-03' AS Date), 1)
INSERT [dbo].[News] ([newid], [ntid], [nimage], [title], [contents], [createdate], [status]) VALUES (12, 4, N'iphone01.png', N'Cách khắc phục MacBook M2 lỗi wifi nhanh chóng và dễ dàng nhất', N'<p>Thông thường, <strong>MacBook M2 lỗi wifi</strong> sẽ đến từ 2 nguyên nhân chính là do máy hoặc mạng wifi đang truy cập. Dưới đây là 16 cách đơn giản khắc phục lỗi wifi mà bạn có thể thực hiện tại nhà từ ShopDunk. Tìm hiểu ngay nhé!</p>

<h2><strong>1. Trường hợp 1: Chỉ MacBook M2 của bạn không bắt được wifi</strong></h2>

<p>Trường hợp tất cả các thiết bị khác bao gồm cả MacBook đều có thể kết nối được wifi nhưng chiếc MacBook M2 của bạn thì không thì có thể, thiết bị của bạn đang gặp phải lỗi phần mềm hoặc lỗi phần cứng. </p>

<table border="1">
	<tbody>
		<tr>
			<td colspan="2">
			<p><strong>Lỗi phần mềm:</strong></p>

			<ul>
				<li>Cấu hình DNS trên MacBook M2 không đúng khiến máy không thể kết nối wifi.</li>
				<li>Máy chủ DNS bị quá tải.</li>
				<li>Địa chỉ IP hoặc TCP đang chưa chính xác.</li>
				<li>Máy bị virus không kết nối được wifi.</li>
			</ul>

			<p><strong>Lỗi phần cứng:</strong></p>

			<ul>
				<li>Máy bị hư hỏng phần cứng</li>
			</ul>
			</td>
		</tr>
	</tbody>
</table>

<p> </p>

<p>Trong trường hợp này, bạn có thể tham khảo 10 cách xử lý dưới đây: </p>

<h3><strong>1.1. Khởi động lại máy</strong></h3>

<p>Bước 1: Chọn biểu tượng logo quả Táo Ở góc trên bên trái màn hình. </p>

<p>Bước 2: Chọn “Khởi động lại/Restart” để tiến hành khởi động lại máy.</p>

<p><strong><img alt="Chọn mục Khởi động lại để tiến hành Restart MacBook M2" src="https://shopdunk.com/images/uploaded/MacBook/chon-muc-khoi-dong-lai-de-tien-hanh-restart-macbook-m2.jpg" style="height:365px; width:600px" /></strong></p>

<p>Chọn mục Khởi động lại để tiến hành Restart MacBook M2</p>

<h3><strong>1.2. Rút hết các thiết bị ngoại vi</strong></h3>

<p>Trong một số trường hợp những thiết bị kết nối cùng MacBook M2 có thể gây nhiễu sóng, ảnh hưởng đến quá trình kết nối wifi như điện thoại, loa, USB,... </p>

<p>Do đó, bạn có thể thử rút các thiết bị này và kết nối loại mạng wifi.</p>

<h3><strong>1.3. Di chuyển gần cục phát wifi hơn</strong></h3>

<p>Nếu không có vật cản, tầm phát sóng tối đa của cục phát wifi sẽ dao động khoảng 30 - 50m. Nếu vượt ra ngoài phạm vi này, thiết bị của bạn có thể sẽ không thể kết được wifi. Do đó, cách tốt hơn hết là bạn nên di chuyển chiếc MacBook M2 đến gần cục phát wifi. </p>

<p>Bên cạnh đó để đảm bảo bộ định tuyến không bị nhiễu, bạn không nên đặt cục phát gần cáp điện, máy quay, lò vi sóng hay bất cứ thiết bị có khả năng truyền tín hiệu. </p>

<h3><strong>1.4. Làm mới địa chỉ DHCP</strong></h3>

<p>Để có thể dụng mạng wifi trên <a href="https://shopdunk.com/macbook-air-m2-2022" rel="noopener" target="_blank">MacBook Air M2</a> hoặc Pro M2 được hiệu quả và ổn định hơn bạn có thể thay đổi địa chỉ DHCP bằng cách:</p>

<p>Bước 1: Tại phần logo quả Táo ở góc trên bên trái màn hình bạn chọn “Cài đặt hệ thống/System Setting”.</p>

<p><img alt="Chọn mục Cài đặt hệ thống để bắt đầu tùy chỉnh địa chỉ DHCP" src="https://shopdunk.com/images/uploaded/MacBook/chon-muc-cai-dat-he-thong-de-bat-dau-tuy-chinh-dia-chi-dhcp.jpg" style="height:403px; width:600px" /></p>

<p>Chọn mục Cài đặt hệ thống để bắt đầu tùy chỉnh địa chỉ DHCP</p>

<p>Bước 2: Bạn gõ TCP trong ô tìm kiếm và nhấn chọn mục “TCP/IP"</p>

<p><img alt="Tìm và chọn TCP/IP trên thanh tìm kiếm " src="https://shopdunk.com/images/uploaded/MacBook/tim-va-chon-tcp-ip-tren-thanh-tim-kiem.jpg" style="height:282px; width:600px" /></p>

<p>Tìm và chọn TCP/IP trên thanh tìm kiếm </p>

<p>Bước 3: Chọn “Gia hạn Hợp đồng thuê DHCP/Renew DHCP Lease”. Sau đó nhấn “OK”.</p>

<p><img alt="Tại cửa sổ TCP bạn chọn Gia hạn hợp đồng thuê DHCP" src="https://shopdunk.com/images/uploaded/MacBook/tai-cua-so-tcp-ban-chon-gia-han-hop-dong-thue-dhcp.jpg" style="height:333px; width:600px" /></p>

<p>Tại cửa sổ TCP bạn chọn Gia hạn hợp đồng thuê DHCP</p>
', CAST(N'2024-11-02' AS Date), 1)
INSERT [dbo].[News] ([newid], [ntid], [nimage], [title], [contents], [createdate], [status]) VALUES (13, 4, N'pc02.jpg', N'iPad bám vân tay và cách khắc phục', N'<p>Hầu hết&nbsp;<strong>m&agrave;n h&igrave;nh iPad</strong>&nbsp;hiện nay đều được trang bị lớp phủ oleophobic được cho l&agrave; c&oacute; c&ocirc;ng dụng chống bụi bẩn. Tuy nhi&ecirc;n, d&ugrave; ho&agrave;n hảo cỡ n&agrave;o cũng kh&ocirc;ng thể tr&aacute;nh khỏi t&igrave;nh trạng h&agrave;ng loạt v&acirc;n tay b&aacute;m tr&ecirc;n bề mặt m&aacute;y. Vậy nguy&ecirc;n nh&acirc;n do đ&acirc;u? C&aacute;ch khắc phục thế n&agrave;o? C&ugrave;ng&nbsp;ShopDunk&nbsp;t&igrave;m hiểu nh&eacute;!</p>

<h2>1. M&agrave;n h&igrave;nh iPad c&oacute; lớp phủ oleophobic</h2>

<p>Lớp phủ oleophobic tr&ecirc;n&nbsp;<strong>m&agrave;n h&igrave;nh iPad</strong>&nbsp;l&agrave; dạng chất liệu mỏng m&agrave; hầu hết c&aacute;c nh&agrave; sản xuất sử dụng để tr&aacute;ng men cho m&agrave;n h&igrave;nh smartphone v&agrave; c&aacute;c loại m&aacute;y t&iacute;nh bảng cao cấp của m&igrave;nh, với mục đ&iacute;ch giảm dấu v&acirc;n tay v&agrave; vết ố nếu sử dụng l&acirc;u ng&agrave;y.</p>

<p><img alt="" src="https://shopdunk.com/images/uploaded/LOANNN/man-hinh-ipad-bi-bam-van-tay-3-1024x576.webp" style="height:338px; width:600px" />M&agrave;n h&igrave;nh iPad c&oacute; lớp phủ oleophobic</p>

<p>V&igrave; một số l&yacute; do m&agrave; những người d&ugrave;ng sản phẩm Apple thường kh&ocirc;ng để &yacute; đến tuy&ecirc;n bố của Apple rằng iPad Pro c&oacute; &ldquo;lớp phủ oleophobic chống b&aacute;m v&acirc;n tay&rdquo;, tuy nhi&ecirc;n rất dễ nhận ra m&agrave;n h&igrave;nh của iPad c&oacute; vẻ b&aacute;m nhiều dấu v&acirc;n tay v&agrave; vết mồ h&ocirc;i hơn iPhone.</p>

<h2>2. Nguy&ecirc;n nh&acirc;n b&aacute;m v&acirc;n tay c&oacute; thể đến từ việc hỗ trợ Apple Pencil</h2>

<p>Một trong những nguy&ecirc;n nh&acirc;n khiến&nbsp;<strong>m&agrave;n h&igrave;nh&nbsp;<a href="https://shopdunk.com/ipad/" rel="noopener" target="_blank">iPad</a>&nbsp;bị b&aacute;m v&acirc;n tay&nbsp;</strong>c&oacute; lẽ l&agrave; do Apple đ&atilde; sử dụng lớp phủ oleophobic yếu hơn tr&ecirc;n iPad để hỗ trợ Apple Pencil.</p>

<p><img alt="" src="https://shopdunk.com/images/uploaded/LOANNN/man-hinh-ipad-bi-bam-van-tay-1.jpg" style="height:338px; width:600px" />Hỗ trợ Apple Pencil khiến lớp phủ oleophobic yếu hơn</p>

<p>Rất nhiều khẳng định cho rằng ch&iacute;nh lớp phủ oleophobic truyền thống d&agrave;y dặn n&agrave;y sẽ can thiệp v&agrave;o độ ch&iacute;nh x&aacute;c của Apple Pencil, cho n&ecirc;n Apple đ&atilde; sử dụng một lớp phủ mỏng hơn iPhone dẫn đến b&aacute;m v&acirc;n tay hơn.</p>

<p><strong>&gt;&gt; Xem th&ecirc;m:</strong>&nbsp;<a href="https://shopdunk.com/ipad-gen-10-10-9-inch-wi-fi-64gb" rel="noopener" target="_blank">iPad gen 10 2023</a>&nbsp;mới nhất từ nh&agrave; T&aacute;o với m&agrave;n h&igrave;nh 10.9 inch v&agrave; c&ocirc;ng nghệ m&agrave;n h&igrave;nh sRGB.</p>

<h2>3. Vệ sinh m&agrave;n h&igrave;nh iPad khi bị b&aacute;m v&acirc;n tay</h2>

<p>Apple khuy&ecirc;n bạn&nbsp;&ldquo;chỉ cần lau&nbsp;<strong>m&agrave;n h&igrave;nh iPad</strong>&nbsp;bằng một miếng vải mềm, kh&ocirc;ng xơ để loại bỏ dầu do tay bạn để lại&rdquo;. Tuy nhi&ecirc;n nếu t&igrave;nh trạng nặng th&igrave; bạn c&oacute; thể c&acirc;n nhắc c&aacute;c loại dung dịch vệ sinh m&agrave;n h&igrave;nh chuy&ecirc;n dụng.</p>

<p><img alt="" src="https://shopdunk.com/images/uploaded/LOANNN/man-hinh-ipad-bi-bam-van-tay.jpg" style="height:380px; width:600px" />Vệ sinh m&agrave;n h&igrave;nh iPad khi bị b&aacute;m v&acirc;n tay</p>

<p>Ngo&agrave;i ra, bạn c&oacute; thể sử dụng k&iacute;nh cường lực hay miếng d&aacute;n m&agrave;n h&igrave;nh c&oacute; thể khắc phục, nhưng kh&ocirc;ng ai đảm bảo ch&uacute;ng sẽ kh&ocirc;ng ảnh hưởng tới độ ch&iacute;nh x&aacute;c của Apple Pencil.</p>

<p>Ngo&agrave;i ra, một gợi &yacute; cho bạn đ&oacute; l&agrave; d&aacute;n k&iacute;nh cường lực cho iPad. Thị trường hiện nay c&oacute; rất nhiều loại k&iacute;nh cải thiện việc b&aacute;m v&acirc;n tay, đảm bảo ri&ecirc;ng tư,.... Bạn c&oacute; thể d&aacute;n tự d&aacute;n&nbsp;<a href="https://shopdunk.com/dan-man-ipad-cuc-de-chi-voi-3-buoc">m&agrave;n h&igrave;nh cường lực iPad</a>&nbsp;hoặc đến cửa h&agrave;ng ShopDunk gần nhất để nhận hỗ trợ.</p>

<h2>4. Apple cần cải thiện lớp phủ chống b&aacute;m v&acirc;n tay</h2>

<p>Mặc d&ugrave; vấn đề&nbsp;<strong>m&agrave;n h&igrave;nh iPad</strong>&nbsp;bị b&aacute;m v&acirc;n tay thường được người d&ugrave;ng bỏ qua bởi v&igrave; c&aacute;i iFan thường quan t&acirc;m chỉ chỉ l&agrave; cấu h&igrave;nh, thiết kế. Tuy nhi&ecirc;n, điều n&agrave;y khiến m&aacute;y t&iacute;nh bảng nh&agrave; T&aacute;o kh&oacute; trở n&ecirc;n ho&agrave;n hảo hơn.</p>

<p><img alt="" src="https://shopdunk.com/images/uploaded/LOANNN/man-hinh-ipad-bi-bam-van-tay-2.jpg" style="height:340px; width:600px" />Apple cần cải thiện lớp phủ chống b&aacute;m v&acirc;n tay</p>

<p>Do đ&oacute;, đ&atilde; đến l&uacute;c Apple cần lắng nghe người d&ugrave;ng để giải quyết vấn đề n&agrave;y hiệu quả bằng c&aacute;ch cải thiện lợp phủ chống b&aacute;m v&acirc;n tay. Nếu nguy&ecirc;n nh&acirc;n do hỗ trợ Apple Pencil th&igrave; Apple cũng n&ecirc;n c&oacute; giải ph&aacute;p tốt hơn trong tương lai.</p>
', CAST(N'2024-11-03' AS Date), 1)
INSERT [dbo].[News] ([newid], [ntid], [nimage], [title], [contents], [createdate], [status]) VALUES (14, 3, N'pc04.png', N'Thông số MacBook Air M2 15 inch 2023 có gì mới? Có đáng để “xuống tiền?', N'<p>Tại sự kiện WWDC diễn ra v&agrave;o 06/2023, Apple đ&atilde; tr&igrave;nh l&agrave;ng mẫu sản phẩm mới mang t&ecirc;n&nbsp;<strong>MacBook Air 15 inch 2023</strong>. Về cơ bản, đ&acirc;y l&agrave; sản phẩm MacBook Air M2 bản 15 inch - mẫu được coi l&agrave; &ldquo;ph&oacute;ng to&rdquo; của người đ&agrave;n anh Air M2 13 inch. Dưới đ&acirc;y h&atilde;y c&ugrave;ng t&igrave;m hiểu r&otilde; hơn về&nbsp;<strong>c&aacute;c th&ocirc;ng số MacBook Air 15 inch 2023</strong>&nbsp;nh&eacute;!</p>

<h2><strong>1.&nbsp; Bảng th&ocirc;ng số MacBook Air M2 15 inch 2023</strong></h2>

<p>MacBook Air 15 inch 2023 được biết đến với những ưu điểm nổi bật như thiết kế si&ecirc;u mỏng nhẹ trong thế giới laptop 15 inch, m&agrave;n h&igrave;nh lớn, chip M2 mạnh mẽ, thời lượng pin khủng,... Cụ thể, những th&ocirc;ng số đ&aacute;ng ch&uacute; &yacute; tr&ecirc;n &ldquo;si&ecirc;u phẩm&rdquo; MacBook Air 15 inch 2023:</p>

<table border="1">
	<tbody>
		<tr>
			<td>
			<p><strong>Ti&ecirc;u ch&iacute;</strong></p>
			</td>
			<td>
			<p><strong>Th&ocirc;ng số kỹ thuật</strong></p>
			</td>
			<td>
			<p><strong>Th&ocirc;ng số chi tiết</strong></p>
			</td>
		</tr>
		<tr>
			<td rowspan="2">
			<p>Thiết kế</p>
			</td>
			<td>
			<p>Trọng lượng</p>
			</td>
			<td>
			<p>1.51kg</p>
			</td>
		</tr>
		<tr>
			<td>
			<p>K&iacute;ch thước m&aacute;y</p>
			</td>
			<td>
			<p>34.04 x 23.76 x 1.15cm</p>
			</td>
		</tr>
		<tr>
			<td rowspan="5">
			<p>M&agrave;n h&igrave;nh</p>
			</td>
			<td>
			<p>K&iacute;ch thước&nbsp;</p>
			</td>
			<td>
			<p>15.3 inch</p>
			</td>
		</tr>
		<tr>
			<td>
			<p>Độ ph&acirc;n giải&nbsp;</p>
			</td>
			<td>
			<p>2.880 x 1.864 px</p>
			</td>
		</tr>
		<tr>
			<td>
			<p>C&ocirc;ng nghệ&nbsp;</p>
			</td>
			<td>
			<p>Liquid Retina Display</p>
			</td>
		</tr>
		<tr>
			<td>
			<p>Độ s&aacute;ng</p>
			</td>
			<td>
			<p>500 nits</p>
			</td>
		</tr>
		<tr>
			<td>
			<p>Camera</p>
			</td>
			<td>
			<p>1080p</p>
			</td>
		</tr>
		<tr>
			<td rowspan="4">
			<p>Cấu h&igrave;nh</p>
			</td>
			<td>
			<p>CPU&nbsp;</p>
			</td>
			<td>
			<p>Chip Apple M2 với 8 nh&acirc;n</p>
			</td>
		</tr>
		<tr>
			<td>
			<p>GPU</p>
			</td>
			<td>
			<p>GPU 10 nh&acirc;n</p>
			</td>
		</tr>
		<tr>
			<td>
			<p>RAM</p>
			</td>
			<td>
			<p>8GB, 16GB hoặc 24GB</p>
			</td>
		</tr>
		<tr>
			<td>
			<p>SSD</p>
			</td>
			<td>
			<p>256GB, 512GB, 1TB hoặc 2TB</p>
			</td>
		</tr>
		<tr>
			<td>
			<p>B&agrave;n ph&iacute;m</p>
			</td>
			<td>
			<p>B&agrave;n ph&iacute;m</p>
			</td>
			<td>
			<p>T&iacute;ch hợp Touch ID</p>
			</td>
		</tr>
		<tr>
			<td>
			<p>Loa</p>
			</td>
			<td>
			<p>Loa</p>
			</td>
			<td>
			<p>6 loa</p>
			</td>
		</tr>
		<tr>
			<td rowspan="2">
			<p>Pin</p>
			</td>
			<td>
			<p>Dung lượng pin</p>
			</td>
			<td>
			<p>66.5Whr</p>
			</td>
		</tr>
		<tr>
			<td>
			<p>Sạc</p>
			</td>
			<td>
			<p>35W</p>
			</td>
		</tr>
		<tr>
			<td rowspan="2">
			<p>Chế độ kết nối</p>
			</td>
			<td>
			<p>Kết nối vật l&yacute;</p>
			</td>
			<td>
			<ul>
				<li>2 cổng Thunderbolt/USB 4</li>
				<li>Sạc MagSafe 3</li>
				<li>Jack cắm 3.5mm</li>
			</ul>
			</td>
		</tr>
		<tr>
			<td>
			<p>Kết nối kh&ocirc;ng d&acirc;y</p>
			</td>
			<td>
			<p>Wi-Fi 6 v&agrave; Bluetooth 5.3</p>
			</td>
		</tr>
		<tr>
			<td>
			<p>Tản nhiệt</p>
			</td>
			<td>
			<p>Hệ thống tản nhiệt</p>
			</td>
			<td>
			<p>Kh&ocirc;ng trang bị quạt tản nhiệt</p>
			</td>
		</tr>
	</tbody>
</table>

<h2><strong>2. Đ&aacute;nh gi&aacute; c&aacute;c đặc điểm nổi bật của MacBook Air 15 inch 2023</strong></h2>

<p>MacBook Air 15 inch 2023 l&agrave; mẫu sản phẩm hướng đến đối tượng người d&ugrave;ng chủ đạo l&agrave; doanh nh&acirc;n, d&acirc;n văn ph&ograve;ng, người l&agrave;m nghề s&aacute;ng tạo cơ bản. Hiện m&aacute;y đang được nhiều người d&ugrave;ng v&agrave; giới chuy&ecirc;n m&ocirc;n đ&aacute;nh gi&aacute; cao th&ocirc;ng qua c&aacute;c yếu tố như:</p>
', CAST(N'2024-11-03' AS Date), 1)
INSERT [dbo].[News] ([newid], [ntid], [nimage], [title], [contents], [createdate], [status]) VALUES (15, 3, N'pc100.jpg', N'Mẹo tải ứng dụng SEED dù không phải là nhân viên Apple', N'<p><em><strong>Ứng dụng SEED</strong>&nbsp;l&agrave; một ứng dụng kh&aacute; th&uacute; vị về đ&agrave;o tạo, th&uacute;c đẩy v&agrave; ph&aacute;t triển b&aacute;n h&agrave;ng&nbsp; m&agrave; chỉ c&oacute; nh&acirc;n vi&ecirc;n, đại l&yacute; b&aacute;n lẻ được Apple ủy quyền mới c&oacute; thể tải. H&ocirc;m nay&nbsp;<strong>ShopDunk</strong>&nbsp;sẽ hướng dẫn bạn mẹo tải ứng dụng SEED Apple m&agrave; kh&ocirc;ng cần l&agrave; nh&acirc;n vi&ecirc;n Apple nh&eacute;!</em></p>

<p><em><img alt="ứng dụng seed apple" src="https://shopdunk.com/images/uploaded/MacBook/ung-dung-seed-apple.jpg" style="height:342px; width:600px" /></em></p>

<h2>Ứng dụng SEED l&agrave; g&igrave;?</h2>

<p>Ứng dụng SEED viết tắt của Sales Enablement, Education and Development v&agrave; cung cấp c&aacute;c nguồn lực b&aacute;n h&agrave;ng v&agrave; kỹ thuật cho c&aacute;c đối t&aacute;c b&aacute;n h&agrave;ng của Apple tr&ecirc;n khắp thế giới. Đăng k&yacute; c&aacute;c lớp đ&agrave;o tạo, x&acirc;y dựng kiến thức v&agrave; li&ecirc;n tục cập nhật c&aacute;c sản phẩm, dịch vụ của Apple trong khi vẫn gi&agrave;nh được huy hiệu v&agrave; điểm kinh nghiệm - ngay tr&ecirc;n thiết bị di động hoặc để b&agrave;n của bạn.F</p>

<p>Bạn c&oacute; thể tải ứng dụng SEED cho sản phẩm iPhone 15 mới được Apple ra mắt ng&agrave;y 12/09/2023 đơn giản v&agrave; nhanh ch&oacute;ng. Với những n&acirc;ng cấp m&agrave;n h&igrave;nh v&agrave; t&iacute;nh năng, iPhone 15 chắc chắn l&agrave; lựa chọn tốt nhất cho những ai muốn trải nghiệm c&ocirc;ng nghệ từ nh&agrave; T&aacute;o. Nếu bạn đang ph&acirc;n v&acirc;n m&agrave;n h&igrave;nh iPhone 15 c&oacute; cải tiến g&igrave; mới, tham khảo ngay b&agrave;i viết&nbsp;<strong><a href="https://shopdunk.com/iphone-15-bao-nhieu-inch">iPhone 15 bao nhi&ecirc;u inch</a></strong>&nbsp;của ShopDunk để c&oacute; th&ecirc;m nhiều th&ocirc;ng tin mới nhất về si&ecirc;u phẩm n&agrave;y nh&eacute;!</p>

<p><img alt="Mẹo tải ứng dụng SEED dù không phải là nhân viên Apple hình 1" src="https://tin.shopdunk.com/wp-content/uploads/2021/12/ung-dung-seed-1-1.jpg" style="height:382px; width:660px" title="Mẹo tải ứng dụng SEED dù không phải là nhân viên Apple 2" /></p>

<p>Kh&ocirc;ng cần thiết phải l&agrave; nh&acirc;n vi&ecirc;n Apple, bạn vẫn c&oacute; thể tải về ứng dụng SEED.</p>

<p>Bộ học liệu tr&ecirc;n ứng dụng SEED cung cấp những điều cần thiết về sản phẩm Apple cung cấp hiểu biết cơ bản về hệ sinh th&aacute;i của Apple m&agrave; mỗi người b&aacute;n h&agrave;ng cần c&oacute;.</p>
', CAST(N'2024-11-03' AS Date), 1)
INSERT [dbo].[News] ([newid], [ntid], [nimage], [title], [contents], [createdate], [status]) VALUES (16, 3, N'pc07.png', N'Đánh giá sức mạnh của chip A17 Pro: Vượt xa A16 Bionic', N'<p>Mới đ&acirc;y,&nbsp;<a href="https://shopdunk.com/iphone-15-series">iPhone 15 series</a>&nbsp;- thế hệ iPhone mới nhất của Apple đ&atilde; tr&igrave;nh l&agrave;ng v&agrave; g&acirc;y b&atilde;o cộng đồng mạng. Đặc biệt d&ograve;ng&nbsp;<a href="https://shopdunk.com/iphone-15-pro">iPhone 15 Pro</a>&nbsp;v&agrave;&nbsp;<a href="https://shopdunk.com/iphone-15-pro-max">iPhone 15 Pro Max</a>&nbsp;ch&iacute;nh thức so&aacute;n ng&ocirc;i vương trong l&agrave;ng smartphone bởi thiết kế tinh tế, hiệu năng đỉnh cao v&agrave; camera cải tiến. Một trong những l&yacute; do khiến bộ đ&ocirc;i Pro n&agrave;y chiếm thế &ldquo;&aacute;p đảo&rdquo; tr&ecirc;n thị trường l&agrave; được trang bị&nbsp;<strong>chip A17 Pro</strong>&nbsp;mới nhất v&agrave; ti&ecirc;n tiến nhất, thay thế ho&agrave;n to&agrave;n chip A16 Bionic quen thuộc tr&ecirc;n&nbsp;<a href="https://shopdunk.com/iphone-14-pro">iPhone 14 Pro</a>&nbsp;v&agrave;&nbsp;<a href="https://shopdunk.com/iphone-14-pro-max">iPhone 14 Pro Max</a>.</p>

<p>Dưới đ&acirc;y l&agrave; những đ&aacute;nh gi&aacute; kh&aacute;ch quan nhất về hiệu năng của&nbsp;<strong>chip A17 Pro</strong>&nbsp;cũng như đi s&acirc;u v&agrave;o những điểm tương đồng, kh&aacute;c biệt giữa chip A17 Pro v&agrave; chip A16, gi&uacute;p c&aacute;c bạn hiểu r&otilde; hơn về chip Apple mới nhất.</p>

<h2><strong>1. Chip A17 Pro l&agrave; g&igrave;?</strong></h2>

<p><strong>Chip Apple A17 Bionic</strong>&nbsp;l&agrave; một chip xử l&yacute; được ph&aacute;t triển bởi Apple Inc. Đ&acirc;y cũng l&agrave; con chip di động nhanh nhất thế giới được sản xuất theo quy tr&igrave;nh 3 nanomet ti&ecirc;n tiến, v&agrave; bao gồm một CPU 6 nh&acirc;n, một GPU 4 nh&acirc;n, v&agrave; một Neural Engine 16 nh&acirc;n.&nbsp;</p>

<p><img alt="" src="https://shopdunk.com/images/uploaded/iPhone%2015%20Pro%20-%20Chip%20A17%20Pro/1694599132_image7_11zon.jpg" style="height:397px; width:706px" /></p>

<p>Chip A17 được thiết kế để mang lại hiệu năng v&agrave; hiệu suất tốt hơn so với chip A16 Bionic. CPU của chip A17 được cải tiến để mang lại hiệu năng tốt hơn 20%, trong khi GPU được cải tiến để mang lại hiệu năng đồ họa tốt hơn 30%. Neural Engine của chip A17 cũng được cải tiến để mang lại hiệu năng AI tốt hơn 40%.</p>

<p>&nbsp;</p>

<h2><strong>2. Ưu điểm nổi bật của chip A17 Pro</strong></h2>

<h3><strong>2.1. Hiệu năng CPU 6 nh&acirc;n</strong></h3>

<p>Chip A17 c&oacute; hiệu suất vượt trội hơn hẳn thế hệ &ldquo;đ&agrave;n em&rdquo; của m&igrave;nh. C&aacute;c l&otilde;i hiệu suất trong A17 Pro của Apple được khen ngợi l&agrave; &quot;l&otilde;i CPU di động tiết kiệm năng lượng nhất&quot;, với khả năng tỷ lệ hiệu suất tr&ecirc;n mỗi watt hiệu quả hơn ba lần so với c&aacute;c bộ xử l&yacute; cạnh tranh.</p>

<p>Ngo&agrave;i ra, khả năng học m&aacute;y của chip cũng đ&aacute;ng ch&uacute; &yacute;. Mặc d&ugrave; c&ocirc;ng cụ thần kinh Apple vẫn giữ nguy&ecirc;n cấu tr&uacute;c 16 l&otilde;i, tương tự như trong A16 Bionic, nhưng đ&atilde; được n&acirc;ng cấp để tăng hiệu suất gấp đ&ocirc;i. Cải tiến n&agrave;y tương đương với khả năng xử l&yacute; 35 ngh&igrave;n tỷ thao t&aacute;c mỗi gi&acirc;y, gần như kh&ocirc;ng thể tưởng tượng, n&acirc;ng cao c&aacute;c t&iacute;nh năng như nhận dạng giọng n&oacute;i v&agrave; xử l&yacute; h&igrave;nh ảnh cao cấp l&ecirc;n một tầm cao mới.</p>

<p><img alt="" src="https://shopdunk.com/images/uploaded/iPhone%2015%20Pro%20-%20Chip%20A17%20Pro/a17-pro-vs-a16-efficiency_11zon.jpg" style="height:447px; width:726px" /></p>

<h3><strong>2.2. 6 nh&acirc;n GPU mạnh&nbsp;</strong><strong>mẽ</strong></h3>

<p>Apple đ&atilde; mang đến GPU &ldquo;tầm cỡ&rdquo; đầy t&iacute;nh c&aacute;ch mạng. Đ&acirc;y l&agrave; thiết kế s&aacute;u l&otilde;i ti&ecirc;n tiến, được tối ưu h&oacute;a đặc biệt để đạt hiệu suất cao v&agrave; tiết kiệm năng lượng. GPU n&agrave;y kết hợp c&aacute;c kỹ thuật kết xuất mới v&agrave; tự h&agrave;o về khả năng tăng tốc 20% so với phi&ecirc;n bản trước.</p>
', CAST(N'2024-11-03' AS Date), 1)
INSERT [dbo].[News] ([newid], [ntid], [nimage], [title], [contents], [createdate], [status]) VALUES (17, 1, N'0030427_so-sanh-iphone-16-va-iphone-15_1600.jpeg', N'So sánh iPhone 16 và iPhone 15: cải tiến hay thụt lùi?', N'<h1>So s&aacute;nh iPhone 16 v&agrave; iPhone 15: cải tiến hay thụt l&ugrave;i?</h1>

<p>25/09/2024</p>

<p><strong><em>So s&aacute;nh iPhone 16 v&agrave; iPhone 15</em></strong>&nbsp;chi tiết, đầy đủ.&nbsp;</p>

<p>Apple vừa ra mắt iPhone 16 d&ograve;ng ti&ecirc;u chuẩn mới với một số thay đổi quan trọng, bao gồm thiết kế camera mới, m&agrave;n h&igrave;nh viền mỏng, một số n&uacute;t bấm mới cũng như thời lượng pin tốt hơn.</p>

<p>iPhone 16 ti&ecirc;u chuẩn được xem l&agrave; mẫu cơ bản c&oacute; mức gi&aacute; thấp nhất trong to&agrave;n bộ iPhone 16 series. Tuy nhi&ecirc;n, với những yếu tố được Apple thay đổi về n&acirc;ng cấp tr&ecirc;n d&ograve;ng cơ bản. Chắc hẳn, sẽ c&oacute; nhiều người d&ugrave;ng muốn l&ecirc;n đời d&ograve;ng m&aacute;y n&agrave;y thay cho iPhone 15.</p>

<p>Nếu bạn t&ograve; m&ograve; về so s&aacute;nh iPhone 16 v&agrave; iPhone 15, chắc chắn b&agrave;i viết n&agrave;y sẽ d&agrave;nh cho bạn.&nbsp;</p>

<p>Bạn cũng c&oacute; thể tham khảo b&agrave;i so s&aacute;nh iPhone 16 Pro Max v&agrave; iPhone 15 Pro Max để bạn c&acirc;n nhắc những sự lựa chọn kh&aacute;c.&nbsp;</p>

<h2>1. So s&aacute;nh iPhone 16 v&agrave; iPhone 15: tổng quan</h2>

<table border="1">
	<tbody>
		<tr>
			<td colspan="2">
			<p><strong>So s&aacute;nh iPhone 16 v&agrave; iPhone 15</strong></p>
			</td>
		</tr>
		<tr>
			<td>
			<p><strong>iPhone 16&nbsp;</strong></p>
			</td>
			<td>
			<p><strong>iPhone 15</strong></p>
			</td>
		</tr>
		<tr>
			<td>
			<p>K&iacute;ch thước 6,1 inch</p>
			</td>
			<td>
			<p>K&iacute;ch thước 6,1 inch</p>
			</td>
		</tr>
		<tr>
			<td>
			<p>N&uacute;t H&agrave;nh động (Action Button)<br />
			N&uacute;t Điều khiển camera (Camera Control)&nbsp;</p>
			</td>
			<td>
			<p>N&uacute;t H&agrave;nh động (Action Button)</p>
			</td>
		</tr>
		<tr>
			<td>
			<p>Chip set A18&nbsp;</p>
			</td>
			<td>
			<p>Chip set A16 Bionic&nbsp;</p>
			</td>
		</tr>
		<tr>
			<td>
			<p>RAM 8GB</p>
			</td>
			<td>
			<p>RAM 6GB</p>
			</td>
		</tr>
		<tr>
			<td>
			<p>Hỗ trợ AI</p>
			</td>
			<td>
			<p>Kh&ocirc;ng hỗ trợ AI</p>
			</td>
		</tr>
		<tr>
			<td>
			<p>Dung lượng lưu trữ: 128GB / 256GB / 512GB</p>
			</td>
			<td>
			<p>Dung lượng lưu trữ: 128GB / 256GB / 512GB</p>
			</td>
		</tr>
		<tr>
			<td>
			<p>Camera dọc hỗ trợ Spatial Video (Video 3D)</p>
			</td>
			<td>
			<p>Camera ch&eacute;o chưa hỗ trợ Spatial Video</p>
			</td>
		</tr>
		<tr>
			<td>
			<p>Camera Fusion 48MP</p>
			</td>
			<td>
			<p>Camera ch&iacute;nh 48MP</p>
			</td>
		</tr>
		<tr>
			<td>
			<p>Camera g&oacute;c si&ecirc;u rộng 12MP hỗ trợ chụp ảnh macro</p>
			</td>
			<td>
			<p>Camera g&oacute;c si&ecirc;u rộng 12MP&nbsp;</p>
			</td>
		</tr>
		<tr>
			<td>
			<p>Pin 22 giờ xem video</p>
			</td>
			<td>
			<p>Pin 20 giờ xem video&nbsp;</p>
			</td>
		</tr>
		<tr>
			<td>
			<p>Sạc c&oacute; d&acirc;y 20W</p>
			</td>
			<td>
			<p>Sạc c&oacute; d&acirc;y 20W</p>
			</td>
		</tr>
		<tr>
			<td>
			<p>Sạc nhanh kh&ocirc;ng d&acirc;y MagSafe 25W</p>
			</td>
			<td>
			<p>Sạc kh&ocirc;ng d&acirc;y MagSafe 15W</p>
			</td>
		</tr>
		<tr>
			<td>
			<p><strong>M&agrave;u sắc gồm:</strong><br />
			Đen<br />
			Trắng<br />
			Hồng<br />
			Xanh M&ograve;ng K&eacute;t&nbsp;<br />
			Xanh Lưu Ly</p>
			</td>
			<td>
			<p><strong>M&agrave;u sắc gồm:&nbsp;</strong><br />
			Xanh lam<br />
			Hồng<br />
			Xanh lục<br />
			V&agrave;ng<br />
			Đen</p>
			</td>
		</tr>
	</tbody>
</table>

<h2>2. So s&aacute;nh iPhone 16 v&agrave; iPhone 15: thiết kế v&agrave; hiển thị&nbsp;</h2>

<p>iPhone 16 vẫn giữ nguy&ecirc;n thiết kế như tr&ecirc;n iPhone 15. M&agrave;n h&igrave;nh giữ nguy&ecirc;n 6,1 inch với khung nh&ocirc;m, c&aacute;c cạnh được v&aacute;t thon v&agrave; mặt sau bằng k&iacute;nh pha m&agrave;u.</p>

<p>iPhone 16 cũng được ứng dụng c&ocirc;ng nghệ giảm viền BRS gi&uacute;p viền m&agrave;n h&igrave;nh mỏng hơn. Nhờ đ&oacute;, m&agrave;n h&igrave;nh của iPhone mới khi nh&igrave;n trực diện sẽ rộng r&atilde;i v&agrave; tho&aacute;ng đ&atilde;ng hơn một ch&uacute;t so với người anh tiền nhiệm.&nbsp;</p>

<p>Nếu viền mỏng hơn kh&ocirc;ng đủ l&agrave;m n&ecirc;n sự kh&aacute;c biệt của iPhone 16, th&igrave; chắc chắn cụm camera dọc sẽ l&agrave; điểm độc đ&aacute;o nhất về thiết kế tr&ecirc;n chiếc di động n&agrave;y. Thay v&igrave; camera ch&eacute;o tr&ecirc;n iPhone 15, cụm camera được bố tr&iacute; lại theo chiều dọc tr&ecirc;n iPhone mới. Nhờ đ&oacute;, d&ograve;ng iPhone 16 ti&ecirc;u chuẩn gi&aacute; thấp cũng c&oacute; thể quay được video kh&ocirc;ng gian (video 3D).&nbsp;&nbsp;</p>

<p><img alt="" src="https://shopdunk.com/images/uploaded/iPhone%2016/man-hinh-iphone-16.jpg" style="width:80%" /><em>(M&agrave;n h&igrave;nh iPhone 16 mỏng hơn iPhone 15 một ch&uacute;t, giữ nguy&ecirc;n k&iacute;ch thước v&agrave; tần số qu&eacute;t 60Hz)</em></p>

<p>Ngo&agrave;i ra, iPhone 16 ti&ecirc;u chuẩn cũng c&oacute; n&uacute;t H&agrave;nh động Action v&agrave; n&uacute;t Điều khiển camera (Camera Control) - điều m&agrave; iPhone 15 kh&ocirc;ng c&oacute;.&nbsp;</p>

<p>N&uacute;t Action nằm ở b&ecirc;n tr&aacute;i, ph&iacute;a tr&ecirc;n c&aacute;c ph&iacute;m &acirc;m lượng của iPhone 16. C&ograve;n n&uacute;t Camera Control nằm ở b&ecirc;n phải, b&ecirc;n dưới n&uacute;t Nguồn. Đ&acirc;y l&agrave; nơi Apple từng đặt ăng-ten mmWave, nhưng giờ Apple đ&atilde; di chuyển ăng-ten xuống ph&iacute;a dưới ph&iacute;m &acirc;m lượng.</p>

<p>Ngo&agrave;i những điểm kh&aacute;c biệt tr&ecirc;n, về cơ bản iPhone 16 c&oacute; thiết kế tương đồng với iPhone 15 về cả k&iacute;ch thước, trọng lượng, cổng USB-C v&agrave; độ bền chuẩn IP68.&nbsp;</p>

<p>iPhone 16 ti&ecirc;u chuẩn vẫn chỉ hỗ trợ tốc độ truyền dữ liệu qua USB 2 (c&aacute;c mẫu Pro hỗ trợ USB 3 kể từ mẫu iPhone 15 Pro).</p>

<p>Về m&agrave;n h&igrave;nh, hầu hết c&aacute;c th&ocirc;ng số kỹ thuật tr&ecirc;n iPhone 16 vẫn giữ nguy&ecirc;n. Trong đ&oacute; gồm m&agrave;n h&igrave;nh OLED quen thuộc với m&agrave;u đen được thể hiện tiệm cận sự ho&agrave;n hảo, độ s&aacute;ng tối đa 2000nits (ngo&agrave;i trời) v&agrave; độ s&aacute;ng tối thiểu 1nit. Với độ s&aacute;ng tối thiểu 1nit cũng được xem như điểm cải tiến khi sử dụng điện thoại v&agrave;o ban đ&ecirc;m.&nbsp;</p>

<p>Kh&ocirc;ng thể bỏ qua tấm k&iacute;nh m&agrave;n Ceramic Shield thế hệ mới bền hơn. Apple thậm ch&iacute; c&ograve;n tự h&agrave;o khi tuy&ecirc;n bố đ&acirc;y l&agrave; loại k&iacute;nh m&agrave;n h&igrave;nh di động bền nhất hiện nay khi được tung ra thị trường.&nbsp;</p>

<p>Tuy nhi&ecirc;n&hellip;</p>

<p>Điểm đ&aacute;ng tiếc l&agrave; iPhone 16 vẫn chỉ giữ tần số qu&eacute;t 60Hz thay v&igrave; 120Hz. Như vậy, trải nghiệm ProMotion mượt m&agrave; sẽ chưa c&oacute; tr&ecirc;n d&ograve;ng ti&ecirc;u chuẩn của iPhone 16.</p>

<h2>3. So s&aacute;nh iPhone 16 v&agrave; iPhone 15: hiệu suất v&agrave; phần mềm</h2>

<p>iPhone 16 sử dụng chip Apple A18 mới, c&ocirc;ng nghệ 3nm thế hệ thứ hai. iPhone 15 sử dụng chip A16 Bionic. V&igrave; thế, iPhone 16 sẽ l&agrave; mẫu di động ti&ecirc;u chuẩn đầu ti&ecirc;n sử dụng bộ xử l&yacute; 3nm, đ&acirc;y l&agrave; bước nhảy vọt về c&ocirc;ng nghệ tr&ecirc;n d&ograve;ng iPhone ti&ecirc;u chuẩn.&nbsp;</p>

<p>Chipset mới n&agrave;y cũng l&agrave; chipset đầu ti&ecirc;n được tối ưu h&oacute;a cho AI.</p>

<p>iPhone 16 c&oacute; 8GB RAM, tăng từ 6GB RAM tr&ecirc;n iPhone 15. L&yacute; do v&igrave; c&aacute;c t&aacute;c vụ AI dường như đều y&ecirc;u cầu th&ecirc;m RA, n&ecirc;n việc RAM được n&acirc;ng cấp l&agrave; điều hợp l&yacute;. Đồng nghĩa, iPhone 15 cũng c&oacute; thể sử dụng được &iacute;t t&iacute;nh năng AI hơn iPhone 16.&nbsp;</p>

<p><img alt="so sánh hiệu suất iPhone 16 và iPhone 15" src="https://shopdunk.com/images/uploaded/iPhone%2016/so%20s%C3%A1nh%20iphone%2016%20v%C3%A0%20iphone%2015/so-sanh-iphone-16-va-iphone-15-hieu-nang.jpg" style="width:80%" /><em>(Chip mới v&agrave; c&ocirc;ng nghệ AI gi&uacute;p cải thiện hiệu suất của iPhone 16 tốt hơn đ&aacute;ng kể so với iPhone 15)</em></p>

<p>Với việc t&iacute;ch hợp th&ecirc;m chip, c&ocirc;ng nghệ AI mới, Chat GPT cho iPhone 16. Đ&acirc;y c&oacute; thể l&agrave; bước đệm để ra mắt một Siri mới th&ocirc;ng minh hơn, hữu dụng hơn v&agrave;o đầu năm 2025. V&agrave; iPhone 16 sẽ l&agrave; chiếc điện thoại ti&ecirc;u chuẩn đầu ti&ecirc;n c&oacute; thể tận dụng to&agrave;n bộ c&aacute;c t&iacute;nh năng AI v&agrave; Siri mới.&nbsp;</p>

<p>Mức dung lượng lưu trữ tr&ecirc;n iPhone 16 được giữ nguy&ecirc;n giống iPhone 15 gồm: 128GB, 256GB v&agrave; 512GB.&nbsp;&nbsp;</p>

<p>iPhone 16 cũng c&oacute; thể sử dụng Snapdragon X70. Tuy kh&ocirc;ng &ldquo;xịn&quot; như Snapdragon X75 mới tr&ecirc;n iPhone 16 Pro v&agrave; Pro Max. Nhưng vẫn đủ d&ugrave;ng v&agrave; thoả m&atilde;n cho mọi t&aacute;c vụ h&agrave;ng ng&agrave;y.&nbsp;</p>

<h2>4. So s&aacute;nh iPhone 16 v&agrave; iPhone 15: camera&nbsp;</h2>

<p>Với hệ thống camera h&igrave;nh vi&ecirc;n thuốc mới, iPhone 16&nbsp; tr&ocirc;ng kh&aacute;c biệt so với trước đ&acirc;y, nhưng ngo&agrave;i kiểu d&aacute;ng mới th&igrave; đ&acirc;y l&agrave; bản n&acirc;ng cấp camera k&eacute;m th&uacute; vị hơn so với iPhone 15 của năm ngo&aacute;i .</p>

<p>Tất cả c&aacute;c phi&ecirc;n bản iPhone 16 cũng sẽ c&oacute; n&uacute;t Camera Control vật l&yacute; mới, được đặt b&ecirc;n dưới ph&iacute;m nguồn. N&uacute;t mới n&agrave;y l&agrave; n&uacute;t cảm ứng điện dung. Nghĩa l&agrave; n&uacute;t chỉ ghi nhận một lần nhấn khi bạn nhấn bằng ng&oacute;n tay.&nbsp;</p>

<p><img alt="camera iPhone 16 được thay đổi so với thiết kế cũ trên iPhone 15" src="https://shopdunk.com/images/uploaded/iPhone%2016/so%20s%C3%A1nh%20iphone%2016%20v%C3%A0%20iphone%2015/so-sanh-camera-tren-iphone-16-va-iphone-15.jpg" style="width:80%" /><em>(Bộ cục camera dọc tr&ecirc;n iPhone 16 tr&aacute;i được thay đổi so với bố cục camera ch&eacute;o cũ tr&ecirc;n iPhone 15 phải)</em></p>

<p>Do đ&oacute; n&oacute; sẽ kh&ocirc;ng c&oacute; t&igrave;nh trạng camera bị v&ocirc; t&igrave;nh k&iacute;ch hoạt khi để trong t&uacute;i x&aacute;ch, t&uacute;i quần khi di chuyển. Người d&ugrave;ng c&oacute; thể tự t&ugrave;y chỉnh chiếc n&uacute;t n&agrave;y để hoạt động với nhiều ứng dụng kh&aacute;c nhau, bao gồm cả ứng dụng từ b&ecirc;n thứ ba.&nbsp;</p>

<p><img alt="nút chụp ảnh trên iPhone 16" src="https://shopdunk.com/images/uploaded/iPhone%2016/iphone-16-series-nut-chup-anh-cam-ung.jpg" style="width:80%" /><em>(iPhone 16 sở hữu n&uacute;t chụp ảnh cảm ứng diện dung mới r&uacute;t ngắn thời gian thao t&aacute;c với camera)</em></p>

<p>Chiếc n&uacute;t Camera Control mới n&agrave;y gi&uacute;p người d&ugrave;ng kh&ocirc;ng bị bỏ lỡ bất kỳ khoảnh khắc n&agrave;o cần lưu lại nhanh. Thay v&igrave; phải mở m&aacute;y v&agrave; truy cập camera theo c&aacute;ch cũ cần đến 02 bước. Giờ đ&acirc;y chỉ cần 01 bước duy nhất để thu giữ mọi khoảnh khắc ngay lập tức.&nbsp;</p>

<p><img alt="iPhone 16 sở hữu nút Action từ iPhone 15 Pro Max" src="https://shopdunk.com/images/uploaded/iPhone%2016/iphone-16-mau-hong-thong-so-nut-chup-anh.jpg" style="width:80%" /><em>(iPhone 16 sở hữu n&uacute;t H&agrave;nh động thừa hưởng từ iPhone 15 Pro Max)</em></p>

<p>Chiếc n&uacute;t n&agrave;y cũng c&oacute; thể sử dụng như một trackpad mini. Với việc chỉ cần trượt ng&oacute;n tay tr&ecirc;n mặt phẳng n&uacute;t, người d&ugrave;ng c&oacute; thể chuyển đổi c&aacute;c t&ugrave;y chọn kh&aacute;c nhau như đổi bộ lọc hoặc thu ph&oacute;ng m&aacute;y ảnh.&nbsp;</p>

<h3>4.1. Về phần cứng</h3>

<p>Về phần cứng camera, nếu iPhone 15 l&agrave; mẫu iPhone cơ bản đầu ti&ecirc;n c&oacute; camera ch&iacute;nh 48MP, một n&acirc;ng cấp lớn về cả độ chi tiết v&agrave; h&igrave;nh ảnh chụp trong điều kiện thiếu s&aacute;ng so với camera 12MP được sử dụng tr&ecirc;n c&aacute;c mẫu iPhone trước đ&acirc;y.</p>

<p>Th&igrave; năm nay, với iPhone 16 , kh&ocirc;ng c&oacute; thay đổi lớn n&agrave;o về phần cứng v&igrave; Apple vẫn trung th&agrave;nh với thiết kế 02 camera. Vẫn sẽ kh&ocirc;ng c&oacute; ống k&iacute;nh tele chuy&ecirc;n dụng cho d&ograve;ng iPhone cơ bản. iPhone mới vẫn sẽ c&oacute; camera ch&iacute;nh 48MP c&oacute; c&ugrave;ng khẩu độ f/1.6 v&agrave; khả năng zoom 2X.&nbsp;</p>

<p><img alt="" src="https://shopdunk.com/images/uploaded/iPhone%2016/camera%20iphone%2016/anh-macro-tren-iphone-16-tieu-chuan.jpg" style="width:80%" /><em>(Chất lượng ảnh chụp macro tr&ecirc;n iPhone 16 với độ chi tiết cao v&agrave; m&agrave;u sắc rực rỡ)</em></p>

<p>Đối với camera g&oacute;c si&ecirc;u rộng, m&aacute;y vẫn giữ nguy&ecirc;n cảm biến 12MP, nhưng sử dụng khẩu độ nhanh hơn một ch&uacute;t (f/2.2 hiện tại so với f/2.4 trước đ&acirc;y) cho ph&eacute;p nhận nhiều &aacute;nh s&aacute;ng hơn. iPhone mới c&ograve;n được Apple ưu &aacute;i bổ sung khả năng chụp ảnh macro. Cho đến nay, chỉ c&oacute; d&ograve;ng Pro v&agrave; Pro Max mới c&oacute; hỗ trợ chụp ảnh macro. V&igrave; thế, người d&ugrave;ng c&oacute; thể thấy iPhone 16 đ&atilde; được &ldquo;cưng chiều&quot; như thế n&agrave;o khi ra mắt v&agrave;o năm nay.&nbsp;</p>

<h3>4.2. Về phần mềm</h3>

<p>Về mặt phần mềm, iPhone 16 được trang bị nhiều Phong c&aacute;ch nhiếp ảnh thế hệ mới mạnh mẽ hơn nhiều so với trước đ&acirc;y.</p>

<p>Với AI t&iacute;ch hợp tr&ecirc;n iPhone 16, người d&ugrave;ng c&oacute; thể mong đợi về c&aacute;c t&iacute;nh năng chỉnh sửa ảnh th&ocirc;ng minh như: thay đổi k&iacute;ch thước, di chuyển vật thể, x&oacute;a vật thể&hellip;</p>

<p>Về chất lượng video, iPhone 16 được n&acirc;ng cấp th&ecirc;m Spatial Video v&agrave; Spatial Photos. Đ&acirc;y l&agrave; c&aacute;c dạng video v&agrave; ảnh 3D sử dụng với Vision Pro hoặc c&aacute;c thiết bị AR/VR kh&aacute;c. Tuy thời điểm hiện tại, VR/AR vẫn chưa được phổ biến rộng r&atilde;i.&nbsp;</p>

<p><img alt="" src="https://shopdunk.com/images/uploaded/iPhone%2016/camera%20iphone%2016/chup-anh-va-quay-video-khong-gian-tren-iphone-16-va-iphone-16-plus.jpg" style="width:80%" /><em>(iPhone 16 c&oacute; khả năng quay chụp 3D v&agrave; t&iacute;ch hợp với Vision Pro - yếu tố m&agrave; iPhone 15 chưa c&oacute;)</em></p>

<p>Tuy nhi&ecirc;n, trong lương gần, c&ocirc;ng nghệ 3D c&oacute; thể đột ph&aacute; trải nghiệm cho người d&ugrave;ng. V&agrave; Apple đ&atilde; sớm chuẩn bị c&aacute;c bước đầu ti&ecirc;n cho sự đột ph&aacute; n&agrave;y bằng c&aacute;ch trang bị to&agrave;n bộ c&aacute;c t&iacute;nh năng 3D mới tr&ecirc;n tất cả c&aacute;c thiết bị di động của m&igrave;nh.&nbsp;</p>

<h2>5. So s&aacute;nh iPhone 16 v&agrave; iPhone 15: &acirc;m thanh&nbsp;</h2>

<p>Apple đang cố gắng cải thiện th&ecirc;m về chất lượng &acirc;m thanh từ loa iPhone. Tuy nhi&ecirc;n, với phi&ecirc;n bản iPhone 16 c&oacute; thể chưa c&oacute; g&igrave; qu&aacute; r&otilde; rệt về chất lượng &acirc;m thanh. D&ugrave; sao, chất lượng &acirc;m thanh tr&ecirc;n iPhone hiện nay vẫn được đa số người d&ugrave;ng chấp nhận. Chưa c&oacute; nhiều phản hồi để Apple dồn tiền n&acirc;ng cấp mạnh mẽ về yếu tố n&agrave;y.&nbsp;</p>

<p><img alt="" src="https://shopdunk.com/images/uploaded/iPhone%2016/camera%20iphone%2016/audio-mix-tren-camera-iphone-16-khu-tieng-on-va-tieng-gio.jpg" style="width:80%" /></p>

<h2>6. So s&aacute;nh iPhone 16 v&agrave; iPhone 15: pin sạc&nbsp;</h2>

<p>Vi&ecirc;n pin của iPhone 16 sẽ c&oacute; k&iacute;ch thước tương đương với iPhone 15. Điều n&agrave;y hợp l&yacute;, v&igrave; k&iacute;ch thước iPhone mới gần như kh&ocirc;ng thay đổi so với bản tiền nhiệm.&nbsp;</p>

<p>Tuy nhi&ecirc;n, k&iacute;ch thước giữ nguy&ecirc;n kh&ocirc;ng c&oacute; nghĩa dung lượng pin giữ nguy&ecirc;n. Dung lượng pin của iPhone 16 được tăng nhẹ (khoảng 6%) v&agrave; c&oacute; thể sử dụng đến 22 giờ (nhiều hơn 2 giờ so với iPhone 15).&nbsp;</p>

<p>Về sạc nhanh kh&ocirc;ng d&acirc;y, iPhone 16 sử dụng sạc d&acirc;y c&oacute; tốc độ tương tự như iPhone 15. Tuy nhi&ecirc;n, sạc nhanh MagSafe đ&atilde; được tăng tốc l&ecirc;n 25W cho ph&eacute;p sạc đầy 50% pin trong nửa tiếng. iPhone 16 cũng được hỗ trợ chuẩn Qi v&agrave; Qi2, trong khi iPhone 15 chỉ hỗ trợ chuẩn Qi.&nbsp;</p>

<p>Đ&acirc;y l&agrave; trường hợp đầu ti&ecirc;n sạc kh&ocirc;ng d&acirc;y c&oacute; tốc độ nhanh hơn sạc c&oacute; d&acirc;y tr&ecirc;n iPhone v&agrave; di động n&oacute;i chung.&nbsp;</p>

<h2>7. So s&aacute;nh iPhone 16 v&agrave; iPhone 15: th&ocirc;ng số kỹ thuật&nbsp;</h2>

<table border="1">
	<tbody>
		<tr>
			<td colspan="3">
			<p><strong>So s&aacute;nh th&ocirc;ng số kỹ thuật iPhone 16 v&agrave; iPhone 15</strong></p>
			</td>
		</tr>
		<tr>
			<td>
			<p><strong>Th&ocirc;ng số kỹ thuật</strong></p>
			</td>
			<td>
			<p><strong>iPhone 16</strong></p>
			</td>
			<td>
			<p><strong>iPhone 15</strong></p>
			</td>
		</tr>
		<tr>
			<td>
			<p>K&iacute;ch thước chung&nbsp;</p>
			</td>
			<td>
			<p>147,6 x 71,6 x 7,8mm</p>
			</td>
			<td>
			<p>147,6 x 71,6 x 7,8mm</p>
			</td>
		</tr>
		<tr>
			<td>
			<p>Trọng lượng&nbsp;</p>
			</td>
			<td>
			<p>170 gram</p>
			</td>
			<td>
			<p>171 gram&nbsp;</p>
			</td>
		</tr>
		<tr>
			<td>
			<p>Chip set&nbsp;</p>
			</td>
			<td>
			<p>A18<br />
			3nm (thế hệ II)&nbsp;</p>
			</td>
			<td>
			<p>A16 Bionic<br />
			3nm (thế hệ I)</p>
			</td>
		</tr>
		<tr>
			<td>
			<p>M&agrave;n h&igrave;nh&nbsp;</p>
			</td>
			<td>
			<p>OLED 6,1 inch<br />
			Tần số qu&eacute;t 120Hz</p>
			</td>
			<td>
			<p>OLED 6,1 inch<br />
			Tần số qu&eacute;t 60Hz</p>
			</td>
		</tr>
		<tr>
			<td>
			<p>RAM / Bộ nhớ lưu trữ</p>
			</td>
			<td>
			<p>8GB/128GB<br />
			8GB/256GB<br />
			8GB/512GB</p>
			</td>
			<td>
			<p>8GB/128GB<br />
			8GB/256GB<br />
			8GB/512GB</p>
			</td>
		</tr>
		<tr>
			<td>
			<p>Camera sau</p>
			</td>
			<td>
			<p>48MP, f/1.6, 26mm<br />
			12MP, f/2.2, 13mm</p>
			</td>
			<td>
			<p>48MP, f/1.6, 26mm<br />
			12MP, f/2.2, 13mm</p>
			</td>
		</tr>
		<tr>
			<td>
			<p>Camera trước</p>
			</td>
			<td>
			<p>12MP</p>
			</td>
			<td>
			<p>12MP</p>
			</td>
		</tr>
		<tr>
			<td>
			<p>Video 4K Dolby Vision</p>
			</td>
			<td>
			<p>C&oacute;&nbsp;</p>
			</td>
			<td>
			<p>Kh&ocirc;ng&nbsp;</p>
			</td>
		</tr>
		<tr>
			<td>
			<p>Pin</p>
			</td>
			<td>
			<p>3.561 mAh</p>
			</td>
			<td>
			<p>3.349 mAh</p>
			</td>
		</tr>
		<tr>
			<td>
			<p>Sạc</p>
			</td>
			<td>
			<p>Sạc c&oacute; d&acirc;y 20W<br />
			Sạc MagSafe 25W<br />
			Chuẩn Qi/Qi2</p>
			</td>
			<td>
			<p>Sạc c&oacute; d&acirc;y 20W<br />
			Sạc MagSafe 15W<br />
			Chuẩn Qi</p>
			</td>
		</tr>
		<tr>
			<td>
			<p>Gi&aacute;</p>
			</td>
			<td>
			<p>Từ 799 USD - 1.099 USD<br />
			(Từ 22,9 triệu đến 32 triệu)&nbsp;</p>
			</td>
			<td>
			<p>Từ 799 USD - 1.099 USD<br />
			(Từ 22 triệu đến 31 triệu)&nbsp;</p>
			</td>
		</tr>
	</tbody>
</table>

<h2>Vậy c&oacute; n&ecirc;n l&ecirc;n đời iPhone 16 hay đợi iPhone 17?&nbsp;</h2>

<p>So với iPhone 15, th&igrave; iPhone 16 chưa phải một phi&ecirc;n bản được n&acirc;ng cấp qu&aacute; đột ph&aacute;.&nbsp;</p>

<p>C&aacute;c n&acirc;ng cấp chủ yếu đến từ thiết kế camera, khả năng chụp cận cảnh, hai n&uacute;t bấm mới, pin được n&acirc;ng nhẹ v&agrave; bảng m&agrave;u mới rực rỡ. Chủ yếu sự cải tiến đột ph&aacute; đ&aacute;ng kể nhất đến từ Apple Intelligence.&nbsp;</p>

<p>Nếu bạn y&ecirc;u th&iacute;ch c&aacute;c điểm cải tiến tr&ecirc;n, th&igrave; l&ecirc;n đời iPhone 16 sẽ l&agrave; ghế, v&igrave; việc n&agrave;y kh&ocirc;ng phải b&agrave;n.&nbsp;</p>

<p>Tuy nhi&ecirc;n, nếu đang sở hữu iPhone 15 v&agrave; chưa muốn l&ecirc;n đời hoặc chờ đợi những thay đổi mới th&uacute; vị hơn tr&ecirc;n iPhone 17. Th&igrave; iPhone 15 vẫn sẽ đ&aacute;p ứng tốt mọi nhu cầu sử dụng h&agrave;ng ng&agrave;y. Việc cập nhật l&ecirc;n iOS 18 cũng sẽ gi&uacute;p m&aacute;y &ldquo;hưởng s&aacute;i&quot; được một số t&iacute;nh năng AI của Apple.&nbsp;</p>

<p>Mong rằng, b&agrave;i viết n&agrave;y đ&atilde; mang đến cho bạn đầy đủ những th&ocirc;ng tin về iPhone 16 khi so s&aacute;nh với phi&ecirc;n bản iPhone cũ. Từ đ&oacute;, bạn c&oacute; cơ sở uy t&iacute;n để lựa chọn c&oacute; l&ecirc;n đời di động hay kh&ocirc;ng một c&aacute;ch ch&iacute;nh x&aacute;c.&nbsp;</p>

<p><em>Đừng qu&ecirc;n theo d&otilde;i th&ecirc;m nhiều th&ocirc;ng tin về&nbsp;</em><strong><em>iPhone 16 ng&agrave;y mở b&aacute;n ch&iacute;nh thức</em></strong><em>&nbsp;tại ShopDunk nh&eacute;!</em></p>
', CAST(N'2024-11-02' AS Date), 1)
INSERT [dbo].[News] ([newid], [ntid], [nimage], [title], [contents], [createdate], [status]) VALUES (19, 1, N'0030236_iphone-16-pro-max-mau--vang-titan-sa-mac-7_1600.jpeg', N'iPhone 16 Pro Max Titan Vàng Sa Mạc: Hợp mệnh Thổ/Kim?', N'<h1>iPhone 16 Pro Max Titan V&agrave;ng Sa Mạc: Hợp mệnh Thổ/Kim?</h1>

<p>13/09/2024</p>

<p>Nếu bạn đang t&igrave;m kiếm một chiếc&nbsp;<a href="https://shopdunk.com/dien-thoai-iphone-16" rel="noopener" target="_blank">iPhone 16</a>&nbsp;với thiết kế thanh lịch v&agrave; sang trọng,&nbsp;<strong>iPhone 16 Pro Max m&agrave;u v&agrave;ng Titan Sa Mạc</strong>&nbsp;l&agrave; một lựa chọn đ&aacute;ng xem x&eacute;t. Phi&ecirc;n bản n&agrave;y kh&ocirc;ng chỉ nổi bật với m&agrave;u sắc ấm &aacute;p v&agrave; trang nh&atilde; m&agrave; c&ograve;n c&oacute; sự hấp dẫn về mặt phong thủy.&nbsp;</p>

<p>Vậy, iPhone 16 Pro Max m&agrave;u v&agrave;ng Titan Sa Mạc&nbsp;<strong>c&oacute; g&igrave; mới</strong>&nbsp;v&agrave;&nbsp;<strong>hợp với mệnh</strong>&nbsp;n&agrave;o?</p>

<p><img alt="iPhone 16 Pro Max màu vàng Titan Sa Mạc" src="https://shopdunk.com/images/uploaded/iPhone%2016%20Pro%20Max%20M%C3%A0u%20v%C3%A0ng%20Titan%20Sa%20M%E1%BA%A1c/iphone-16-pro-max-mau--vang-titan-sa-mac-%202).jpg" style="width:100%" /></p>

<h2>1. T&oacute;m tắt điểm mới về iPhone 16 Pro Max M&agrave;u v&agrave;ng Titan Sa Mạc</h2>

<p>iPhone 16 Pro Max m&agrave;u v&agrave;ng Titan Sa Mạc kh&ocirc;ng chỉ g&acirc;y ấn tượng với &yacute; nghĩa phong thủy m&agrave; c&ograve;n nổi bật như một m&oacute;n đồ thời trang sang trọng. Vậy, b&ecirc;n trong n&oacute; c&oacute; g&igrave; mới?</p>

<h3>1.1. M&agrave;n H&igrave;nh Đột Ph&aacute; với C&ocirc;ng Nghệ ProMotion</h3>

<p><strong>M&agrave;n h&igrave;nh 6.9 inch</strong>&nbsp;của&nbsp;<a href="https://shopdunk.com/iphone-16-pro-max" rel="noopener" target="_blank">iPhone 16 Pro Max</a>&nbsp;với c&ocirc;ng nghệ ProMotion v&agrave;&nbsp;<strong>tần số qu&eacute;t 120Hz</strong>&nbsp;mang đến trải nghiệm h&igrave;nh ảnh mượt m&agrave; v&agrave; sống động. C&ocirc;ng nghệ n&agrave;y cải thiện sự nhạy b&eacute;n của m&agrave;n h&igrave;nh v&agrave;&nbsp;<strong>giảm thiểu hiện tượng giật lag</strong>&nbsp;khi sử dụng.</p>

<h3>1.2. Hiệu Năng Mạnh Mẽ với Vi Xử L&yacute; Apple A18 Pro</h3>

<p>Vi xử l&yacute; Apple A18 Pro cung cấp hiệu suất mạnh mẽ với Neural Engine cải tiến, hỗ trợ&nbsp;<strong>xử l&yacute; tr&iacute; tuệ nh&acirc;n tạo nhanh hơn v&agrave; hiệu quả hơn</strong>. Nh&acirc;n đồ họa của chip gi&uacute;p chơi game đồ họa cao v&agrave; xử l&yacute; ứng dụng đa phương tiện mượt m&agrave;, l&yacute; tưởng cho giải tr&iacute; v&agrave; c&ocirc;ng việc đ&ograve;i hỏi hiệu suất cao.</p>

<p><img alt="iPhone 16 Pro Max màu vàng Titan Sa Mạc" src="https://shopdunk.com/images/uploaded/iPhone%2016%20Pro%20Max%20M%C3%A0u%20v%C3%A0ng%20Titan%20Sa%20M%E1%BA%A1c/iphone-16-pro-max-mau--vang-titan-sa-mac-7.jpg" style="width:100%" /></p>

<p>&nbsp;</p>

<h2>2. iPhone 16 Pro Max m&agrave;u v&agrave;ng Titan Sa Mạc hợp mệnh g&igrave;?</h2>

<p>M&agrave;u sắc của iPhone 16 Pro Max m&agrave;u v&agrave;ng Titan Sa Mạc l&agrave; sự h&ograve;a quyện giữa &aacute;nh v&agrave;ng nhạt v&agrave; &aacute;nh kim.&nbsp;</p>

<p>Theo phong thủy, t&ocirc;ng m&agrave;u n&agrave;y rất hợp với những người thuộc&nbsp;<strong>mệnh Thổ</strong>&nbsp;v&agrave;&nbsp;<strong>mệnh Kim</strong>. M&agrave;u v&agrave;ng của Titan Sa Mạc tượng trưng cho&nbsp;<strong>sự ổn định v&agrave; bền vững</strong>, điều n&agrave;y đặc biệt ph&ugrave; hợp với mệnh Thổ.&nbsp;</p>

<p>Đồng thời, &aacute;nh kim nhẹ của m&agrave;u sắc n&agrave;y cũng rất h&agrave;i h&ograve;a với&nbsp;<strong>mệnh Kim</strong>, đại diện cho&nbsp;<strong>sự cứng cỏi v&agrave; quyền lực.</strong></p>

<p><strong><img alt="iPhone 16 Pro Max màu vàng Titan Sa Mạc" src="https://shopdunk.com/images/uploaded/iPhone%2016%20Pro%20Max%20M%C3%A0u%20v%C3%A0ng%20Titan%20Sa%20M%E1%BA%A1c/iphone-16-pro-max-mau--vang-titan-sa-mac-%20(1).jpg" style="width:100%" /></strong></p>

<h2>3. &Yacute; nghĩa phong thủy đằng sau m&agrave;u v&agrave;ng Titan Sa Mạc?</h2>

<p><strong>M&agrave;u v&agrave;ng Titan Sa Mạ</strong>c kh&ocirc;ng chỉ c&oacute; vẻ đẹp nổi bật m&agrave; c&ograve;n mang &yacute; nghĩa phong thủy s&acirc;u sắc.</p>

<h3>3.1. Mệnh Thổ</h3>

<p><strong>M&agrave;u v&agrave;ng của Titan Sa Mạc</strong>&nbsp;mang đến cảm gi&aacute;c vững ch&atilde;i v&agrave; ổn định, điều n&agrave;y đặc biệt c&oacute; lợi cho những người thuộc mệnh Thổ. Trong phong thủy, mệnh Thổ li&ecirc;n quan đến&nbsp;<strong>yếu tố đất đai, sự ki&ecirc;n cố v&agrave; nền tảng bền vững.</strong>&nbsp;</p>

<p>M&agrave;u v&agrave;ng thường gắn liền với sự ổn định v&agrave; sự ph&aacute;t triển ổn định. Khi sử dụng m&agrave;u n&agrave;y, người mệnh Thổ c&oacute; thể cảm nhận được&nbsp;<strong>một nền m&oacute;ng vững chắc trong cuộc sống v&agrave; c&ocirc;ng việc</strong>&nbsp;của m&igrave;nh.</p>

<p><strong>M&agrave;u v&agrave;ng nhẹ của Titan Sa Mạc</strong>&nbsp;tạo ra cảm gi&aacute;c an to&agrave;n v&agrave; sự h&ograve;a hợp, gi&uacute;p người mệnh Thổ cảm thấy c&acirc;n bằng v&agrave; vững v&agrave;ng hơn trong mọi kh&iacute;a cạnh của cuộc sống. Điều n&agrave;y c&oacute; thể g&oacute;p phần l&agrave;m&nbsp;<strong>giảm căng thẳng v&agrave; lo &acirc;u, đồng thời tăng cường sự tự tin v&agrave; khả năng đưa ra quyết định ch&iacute;nh x&aacute;c</strong>&nbsp;trong c&ocirc;ng việc.</p>

<p><img alt="iPhone 16 Pro Max màu vàng Titan Sa Mạc" src="https://shopdunk.com/images/uploaded/iPhone%2016%20Pro%20Max%20M%C3%A0u%20v%C3%A0ng%20Titan%20Sa%20M%E1%BA%A1c/iphone-16-pro-max-mau--vang-titan-sa-mac(4).jpg" style="width:100%" /></p>

<h3>3.2. Mệnh Kim</h3>

<p>&Aacute;nh kim nhẹ của m&agrave;u Titan Sa Mạc rất ph&ugrave; hợp với người&nbsp;<strong>mệnh Kim</strong>, nhờ v&agrave;o khả năng thể hiện sự cứng cỏi v&agrave; mạnh mẽ. Trong phong thủy, mệnh Kim li&ecirc;n quan đến c&aacute;c yếu tố như&nbsp;<strong>sự mạnh mẽ, quyền lực v&agrave; sự th&agrave;nh c&ocirc;ng trong sự nghiệp.&nbsp;</strong></p>

<p>M&agrave;u sắc n&agrave;y kh&ocirc;ng chỉ thể hiện sự sang trọng v&agrave; quyền uy m&agrave; c&ograve;n gi&uacute;p&nbsp;<strong>n&acirc;ng cao khả năng thu h&uacute;t t&agrave;i lộc v&agrave; sự ph&aacute;t triển c&aacute; nh&acirc;n.</strong></p>

<p>Người mệnh Kim sử dụng m&agrave;u Titan Sa Mạc c&oacute; thể cảm thấy được&nbsp;<strong>sự khẳng định v&agrave; sự tự tin</strong>, tạo điều kiện thuận lợi cho sự thăng tiến trong c&ocirc;ng việc v&agrave; c&aacute;c mối quan hệ x&atilde; hội.&nbsp;</p>

<p>&Aacute;nh kim trong m&agrave;u sắc n&agrave;y&nbsp;<strong>mang lại năng lượng t&iacute;ch cực</strong>, gi&uacute;p cải thiện sự tự tin v&agrave; khả năng l&atilde;nh đạo, đồng thời&nbsp;<strong>th&uacute;c đẩy sự s&aacute;ng tạo v&agrave; th&agrave;nh c&ocirc;ng</strong>&nbsp;trong c&aacute;c dự &aacute;n c&aacute; nh&acirc;n.</p>

<h2>4. Bạn hứng th&uacute; với m&agrave;u sắc n&agrave;o của iPhone 16?</h2>

<ul>
	<li>iPhone 16 Pro Max Titan tự nhi&ecirc;n</li>
	<li><a href="https://shopdunk.com/iphone-16-mau-den" rel="noopener" target="_blank">iPhone 16 m&agrave;u đen</a></li>
	<li>iPhone 16 m&agrave;u hồng</li>
	<li>iPhone 16 m&agrave;u xanh lưu ly</li>
	<li>iPhone 16 m&agrave;u xanh m&ograve;ng k&eacute;t</li>
	<li>iPhone 16 m&agrave;u trắng</li>
</ul>

<p>iPhone 16 Pro Max m&agrave;u v&agrave;ng Titan Sa Mạc rất ph&ugrave; hợp với người mệnh Thổ v&agrave; mệnh Kim. Hy vọng th&ocirc;ng tin n&agrave;y gi&uacute;p bạn chọn lựa được chiếc điện thoại ph&ugrave; hợp với mệnh của m&igrave;nh. Cảm ơn bạn đ&atilde; đọc b&agrave;i viết của ShopDunk, v&agrave; ch&uacute;c bạn t&igrave;m được iPhone 16 m&agrave; bạn ưng &yacute;!</p>
', CAST(N'2024-11-02' AS Date), 1)
INSERT [dbo].[News] ([newid], [ntid], [nimage], [title], [contents], [createdate], [status]) VALUES (20, 5, N'0030999_banner hotsale_App copy_1600.png', N'SALE TƯNG BỪNG - MỪNG PHÁI ĐẸP 10/10 - 31/10', N'<h1>SALE TƯNG BỪNG - MỪNG PH&Aacute;I ĐẸP 10/10 - 31/10</h1>

<p>17/10/2024</p>

<p><strong>Chương tr&igrave;nh ưu đ&atilde;i deal độc quyền d&agrave;nh ri&ecirc;ng cho ph&aacute;i đẹp</strong></p>

<p>Chương tr&igrave;nh ưu đ&atilde;i đặc biệt giảm tới 1.000.000đ, &aacute;p dụng cho mọi h&igrave;nh thức thanh to&aacute;n online, thẻ t&iacute;n dụng qua website v&agrave; thanh to&aacute;n offline tại cửa h&agrave;ng ShopDunk tr&ecirc;n to&agrave;n quốc:</p>

<table border="1">
	<tbody>
		<tr>
			<td>
			<p><strong>Sản phẩm</strong></p>
			</td>
			<td>
			<p><strong>Khuyến mại 20/10</strong></p>
			</td>
		</tr>
		<tr>
			<td>
			<p>iPhone 16 Plus m&agrave;u Hồng</p>
			</td>
			<td>
			<p>Giảm 1 triệu tr&ecirc;n gi&aacute; bản l&eacute;</p>
			</td>
		</tr>
		<tr>
			<td>
			<p>iPhone 16 m&agrave;u Hồng</p>
			</td>
			<td>
			<p>Giảm 1 triệu tr&ecirc;n gi&aacute; b&aacute;n lẻ</p>
			</td>
		</tr>
		<tr>
			<td>
			<p>iPhone 15 Pro Max m&agrave;u Xanh Titanium</p>
			</td>
			<td>
			<p>Giảm 200.000đ tr&ecirc;n gi&aacute; b&aacute;n lẻ</p>
			</td>
		</tr>
		<tr>
			<td>
			<p>iPhone 13 m&agrave;u Midnight/Starlight</p>
			</td>
			<td>
			<p>Giảm 300.000đ tr&ecirc;n gi&aacute; b&aacute;n lẻ</p>
			</td>
		</tr>
		<tr>
			<td>
			<p>Apple Watch Series 3</p>

			<p>Apple Watch Series 8</p>

			<p>Apple Watch SE 2020</p>
			</td>
			<td>
			<p>Giảm 500.000đ tr&ecirc;n gi&aacute; b&aacute;n lẻ</p>
			</td>
		</tr>
		<tr>
			<td>
			<p>Apple Watch SE 2022</p>

			<p>Apple Watch Series 9</p>

			<p>Apple Watch cũ</p>
			</td>
			<td>
			<p>Giảm 200.000đ tr&ecirc;n gi&aacute; b&aacute;n lẻ</p>
			</td>
		</tr>
		<tr>
			<td>
			<p>Tai nghe Belkin</p>
			</td>
			<td>
			<p>Mua k&egrave;m iPhone gi&aacute; c&ograve;n 590.000đ (Giảm 600.000đ tr&ecirc;n gi&aacute; b&aacute;n)</p>
			</td>
		</tr>
	</tbody>
</table>

<p>&nbsp;</p>

<p><strong>2. Gợi &yacute; sản phẩm qu&agrave; tặng d&agrave;nh cho vợ/ bạn g&aacute;i nh&acirc;n dịp ng&agrave;y Phụ nữ Việt Nam 20/10</strong></p>

<p><strong>2.1 iPhone 16 Plus</strong></p>

<p><strong>❗</strong>25.990.000đ&nbsp;giảm c&ograve;n 24.990.000đ</p>

<p>✨&nbsp; M&agrave;u mới trendy</p>

<p>✨ M&agrave;n h&igrave;nh 6.1 inch Super Retina XDR sắc n&eacute;t, sống động, nằm gọn trong tay&nbsp;</p>

<p>✨ Camera 48MP ch&acirc;n thực với nước ảnh si&ecirc;u đẹp</p>

<p>✨ N&uacute;t điều khiển camera mới, khẽ nh&iacute;ch ng&oacute;n tay, c&oacute; ngay ảnh đỉnh</p>

<p>✨ Chip A18 mạnh mẽ, lướt web, chơi game thoải m&aacute;i</p>

<p>✨ Pin l&ecirc;n đến 22 giờ</p>

<p>&nbsp;</p>

<p><strong>2.2 iPhone 15 Pro Max</strong></p>

<p><strong>❗</strong>29.290.000đ&nbsp;giảm c&ograve;n 29.090.000đ</p>

<p>✨ M&agrave;n h&igrave;nh 6.7 inch Super Retina XDR sắc n&eacute;t, sống động</p>

<p>✨ Camera 48MP ch&acirc;n thực, xo&aacute; ph&ocirc;ng đẹp diệu kỳ cho n&agrave;ng tha hồ sống ảo</p>

<p>✨ Chip A15 Bionic lướt web, chơi game tẹt ga, thoải m&aacute;i l&agrave;m việc trong nhiều giờ liền</p>

<p>✨ Pin l&ecirc;n đến 26 giờ, đ&aacute;p ứng tốt nhu cầu sử dụng trong cả ng&agrave;y d&agrave;i</p>

<p>&nbsp;</p>

<p><strong>2.4 AirPods Max USB-C 2024</strong></p>

<p><strong>❗</strong>13.990.000đ&nbsp;giảm c&ograve;n 13.190.000đ</p>

<p>✨ Thiết kế tai chụp thời thượng</p>

<p>✨ Gọng đeo c&oacute; lưới đan tho&aacute;ng kh&iacute; v&agrave; đệm tai bằng foam hoạt t&iacute;nh vừa vặn với tai&nbsp;</p>

<p>✨ &Acirc;m thanh cực kỳ chi tiết v&agrave; c&oacute; độ trung thực cao</p>

<p>✨ Chế Độ Xuy&ecirc;n &Acirc;m gi&uacute;p bạn nghe v&agrave; tương t&aacute;c với thế giới xung quanh</p>

<p>✨ Đắm ch&igrave;m trong thế giới &acirc;m nhạc ri&ecirc;ng với t&iacute;nh năng chủ động khử tiếng ồn</p>

<p>✨ Dễ d&agrave;ng thiết lập v&agrave; chuyển đổi mượt m&agrave; giữa c&aacute;c thiết bị</p>

<p>&nbsp;</p>

<p><strong>3. Gợi &yacute; sản phẩm qu&agrave; tặng d&agrave;nh cho mẹ nh&acirc;n ng&agrave;y Phụ nữ Việt Nam 20/10</strong></p>

<p><strong>3.1 iPhone 13</strong></p>

<p><strong>❗</strong>13.890.000&nbsp;giảm c&ograve;n 13.590.000đ</p>

<p>✨ Thiết kế nhỏ gọn với viền m&aacute;y bo tr&ograve;n, vừa l&ograve;ng b&agrave;n tay</p>

<p>✨&nbsp;M&agrave;n h&igrave;nh Super Retina XDR 6.1 inch sắc n&eacute;t, sống động dễ d&agrave;ng đọc b&aacute;o, xem tin tức h&agrave;ng ng&agrave;y</p>

<p>✨ Camera 12MP v&agrave; HDR th&ocirc;ng minh, xo&aacute; ph&ocirc;ng ch&acirc;n thực, gi&uacute;p mẹ dễ d&agrave;ng ghi lại mọi khoảnh khắc đ&aacute;ng nhớ</p>

<p>✨&nbsp;Chip A15 Bionic mạnh mẽ, thoải m&aacute;i xử l&yacute; c&aacute;c t&aacute;c vụ h&agrave;ng ng&agrave;y như đọc b&aacute;o, lướt web, xem&nbsp;phim</p>

<p>✨ Thời lượng pin 18 giờ, đ&aacute;p ứng cả ng&agrave;y d&agrave;i kh&ocirc;ng lo gi&aacute;n đoạn li&ecirc;n lạc</p>

<p>&nbsp;</p>

<p><strong>3.2 Apple Watch Series 3</strong></p>

<p><strong>❗</strong>5.390.000&nbsp;giảm c&ograve;n 4.990.000</p>

<p>✨ Thiết kế nhỏ, gọn, sang trọng, vừa vặn tr&ecirc;n cổ tay</p>

<p>✨ M&agrave;n h&igrave;nh Retina độ s&aacute;ng 1000 nits, gi&uacute;p mẹ thoải m&aacute;i xem th&ocirc;ng b&aacute;o trong mọi ho&agrave;n cảnh, ngay cả dưới trời nắng gắt</p>

<p>✨ Theo d&otilde;i sức khoẻ v&agrave; hỗ trợ tập luyện, dễ d&agrave;ng đo nhịp tim v&agrave; nồng độ oxy trong m&aacute;u</p>

<p>✨ Ph&aacute;t hiện va chạm, hỗ trợ gọi khẩn cấp</p>

<p>&nbsp;</p>

<p><strong>3.3 Apple Watch Series 9&nbsp;</strong></p>

<p><strong>❗</strong>9.390.000&nbsp;giảm c&ograve;n 9.190.000</p>

<p>✨ M&agrave;n h&igrave;nh Retina 2000 nits lu&ocirc;n bật</p>

<p>✨ Chip S9 SiP mạnh mẽ, cập nhật dữ liệu nhanh ch&oacute;ng gần như kh&ocirc;ng c&oacute; độ trễ</p>

<p>✨ Thao t&aacute;c 2 chạm kh&ocirc;ng cần chạm m&agrave;n h&igrave;nh, tiện lợi trong mọi ho&agrave;n cảnh</p>

<p>✨ Theo d&otilde;i sức khỏe to&agrave;n diện: đo nhịp tim, nồng độ oxy trong m&aacute;u, chu kỳ kinh nguyệt, cảnh b&aacute;o đột quỵ</p>

<p>✨ Trải nghiệm c&aacute; nh&acirc;n ho&aacute; đến từng chi tiết</p>

<p>✨ Hỗ trợ t&igrave;m ch&iacute;nh x&aacute;c vị tr&iacute; iPhone</p>

<p>✨ Chống bụi, chống va đập, chống nước tốt</p>

<p>✨ Thời lượng pin d&agrave;i: 18 - 36 giờ</p>

<p>Tr&ecirc;n đ&acirc;y l&agrave; chương tr&igrave;nh khuyến m&atilde;i chi tiết d&agrave;nh cho ph&aacute;i đẹp ng&agrave;y Phụ nữ Việt Nam v&agrave; một số gợi &yacute; qu&agrave; tặng từ ShopDunk. Đến ngay cửa h&agrave;ng ShopDunk gần nhất để sắm iPhone, iPad, Macbook với gi&aacute; tốt nhất v&agrave; nhận ưu đ&atilde;i cực xịn nh&eacute;.&nbsp;</p>
', CAST(N'2024-11-02' AS Date), 1)
SET IDENTITY_INSERT [dbo].[News] OFF
GO
SET IDENTITY_INSERT [dbo].[News_Type] ON 

INSERT [dbo].[News_Type] ([ntid], [nttype]) VALUES (1, N'Tin tức Apple')
INSERT [dbo].[News_Type] ([ntid], [nttype]) VALUES (2, N'Bài viết review')
INSERT [dbo].[News_Type] ([ntid], [nttype]) VALUES (3, N'Khám phá')
INSERT [dbo].[News_Type] ([ntid], [nttype]) VALUES (4, N'Thủ thuật')
INSERT [dbo].[News_Type] ([ntid], [nttype]) VALUES (5, N'Khuyến mại')
INSERT [dbo].[News_Type] ([ntid], [nttype]) VALUES (6, N'Tin khác')
SET IDENTITY_INSERT [dbo].[News_Type] OFF
GO
INSERT [dbo].[OrderDetail] ([order_id], [pd_id], [productName], [productPrice], [quantity]) VALUES (34, 2, N'Iphone 13 128GB | Chính hãng VN/A', 13590000.0000, 1)
INSERT [dbo].[OrderDetail] ([order_id], [pd_id], [productName], [productPrice], [quantity]) VALUES (34, 8, N'Iphone 13 128GB | Chính hãng VN/A', 13590000.0000, 1)
INSERT [dbo].[OrderDetail] ([order_id], [pd_id], [productName], [productPrice], [quantity]) VALUES (35, 8, N'Iphone 13 128GB | Chính hãng VN/A', 13590000.0000, 5)
INSERT [dbo].[OrderDetail] ([order_id], [pd_id], [productName], [productPrice], [quantity]) VALUES (36, 10, N'Iphone 15 Pro Max 256GB | Chính hãng VN/A', 29290000.0000, 1)
INSERT [dbo].[OrderDetail] ([order_id], [pd_id], [productName], [productPrice], [quantity]) VALUES (37, 8, N'Iphone 13 128GB | Chính hãng VN/A', 13590000.0000, 1)
INSERT [dbo].[OrderDetail] ([order_id], [pd_id], [productName], [productPrice], [quantity]) VALUES (38, 5, N'Iphone 13 128GB | Chính hãng VN/A', 13590000.0000, 1)
INSERT [dbo].[OrderDetail] ([order_id], [pd_id], [productName], [productPrice], [quantity]) VALUES (38, 8, N'Iphone 13 128GB | Chính hãng VN/A', 13590000.0000, 1)
INSERT [dbo].[OrderDetail] ([order_id], [pd_id], [productName], [productPrice], [quantity]) VALUES (39, 4, N'Iphone 13 128GB | Chính hãng VN/A', 13590000.0000, 1)
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([order_id], [totalPrice], [note], [create_date], [shipping_id], [customer_id], [status_id], [payment], [seller_id]) VALUES (34, 27180000, N'add', CAST(N'2024-11-01' AS Date), 55, 4, 2, N'COD', 2)
INSERT [dbo].[Orders] ([order_id], [totalPrice], [note], [create_date], [shipping_id], [customer_id], [status_id], [payment], [seller_id]) VALUES (35, 67950000, N'gói cẩn thận giúp em', CAST(N'2024-11-01' AS Date), 56, 4, 2, N'COD', 2)
INSERT [dbo].[Orders] ([order_id], [totalPrice], [note], [create_date], [shipping_id], [customer_id], [status_id], [payment], [seller_id]) VALUES (36, 29290000, N'em mua cho bồ', CAST(N'2024-11-01' AS Date), 57, 4, 1, N'COD', 2)
INSERT [dbo].[Orders] ([order_id], [totalPrice], [note], [create_date], [shipping_id], [customer_id], [status_id], [payment], [seller_id]) VALUES (37, 13590000, N'mình mua cho mẹ', CAST(N'2024-11-01' AS Date), 58, 4, 1, N'COD', 2)
INSERT [dbo].[Orders] ([order_id], [totalPrice], [note], [create_date], [shipping_id], [customer_id], [status_id], [payment], [seller_id]) VALUES (38, 27180000, N'mua cho vợ không vợ giận', CAST(N'2024-11-01' AS Date), 59, 4, 2, N'COD', 2)
INSERT [dbo].[Orders] ([order_id], [totalPrice], [note], [create_date], [shipping_id], [customer_id], [status_id], [payment], [seller_id]) VALUES (39, 13590000, N'okkkkk', CAST(N'2024-11-01' AS Date), 60, 4, 1, N'COD', 2)
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([product_id], [name], [img], [price], [title], [cid], [brand_id], [seller_id]) VALUES (1, N'Iphone 13 | Chính hãng VN/A', N'iphone-13_2_.png', 18990000, NULL, 1, 1, 2)
INSERT [dbo].[Product] ([product_id], [name], [img], [price], [title], [cid], [brand_id], [seller_id]) VALUES (4, N'Iphone 15 Pro Max | Chính hãng VN/A', N'iphone-15-pro-max_3.png', 34990000, NULL, 1, 1, 2)
INSERT [dbo].[Product] ([product_id], [name], [img], [price], [title], [cid], [brand_id], [seller_id]) VALUES (8, N'Iphone 16 | Chính hãng VN/A', N'iphone-13_2_.png', 18990000, NULL, 1, 1, 2)
INSERT [dbo].[Product] ([product_id], [name], [img], [price], [title], [cid], [brand_id], [seller_id]) VALUES (10, N'Iphone 15 Pro Max | Chính hãng VN/A', N'iphone-15-pro-max_3.png', 34990000, NULL, 1, 1, 2)
INSERT [dbo].[Product] ([product_id], [name], [img], [price], [title], [cid], [brand_id], [seller_id]) VALUES (11, N'Iphone 13 | Chính hãng VN/A', N'iphone-13_2_.png', 18990000, NULL, 1, 1, 2)
INSERT [dbo].[Product] ([product_id], [name], [img], [price], [title], [cid], [brand_id], [seller_id]) VALUES (12, N'Iphone 13 | Chính hãng VN/A', N'iphone-13_2_.png', 18990000, NULL, 1, 1, 2)
INSERT [dbo].[Product] ([product_id], [name], [img], [price], [title], [cid], [brand_id], [seller_id]) VALUES (14, N'Iphone 13 | Chính hãng VN/A', N'iphone-13_2_.png', 18990000, NULL, 1, 1, 2)
INSERT [dbo].[Product] ([product_id], [name], [img], [price], [title], [cid], [brand_id], [seller_id]) VALUES (15, N'Iphone 13 | Chính hãng VN/A', N'iphone-13_2_.png', 18990000, NULL, 1, 1, 2)
INSERT [dbo].[Product] ([product_id], [name], [img], [price], [title], [cid], [brand_id], [seller_id]) VALUES (16, N'Iphone 15 Pro Max | Chính hãng VN/A', N'iphone-15-pro-max_3.png', 34990000, NULL, 1, 1, 2)
INSERT [dbo].[Product] ([product_id], [name], [img], [price], [title], [cid], [brand_id], [seller_id]) VALUES (17, N'Iphone 13 | Chính hãng VN/A', N'iphone-13_2_.png', 18990000, NULL, 1, 1, 2)
INSERT [dbo].[Product] ([product_id], [name], [img], [price], [title], [cid], [brand_id], [seller_id]) VALUES (18, N'Iphone 13 | Chính hãng VN/A', N'iphone-13_2_.png', 18990000, NULL, 1, 1, 2)
INSERT [dbo].[Product] ([product_id], [name], [img], [price], [title], [cid], [brand_id], [seller_id]) VALUES (19, N'Iphone 13 | Chính hãng VN/A', N'iphone-13_2_.png', 18990000, NULL, 1, 1, 2)
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
INSERT [dbo].[ProductDetails] ([pd_id], [product_id], [pdname], [pdprice_discount], [pdcolor], [pdimg], [pdcriteria], [pdquantity], [pddescribe], [pdspecification]) VALUES (12, 8, N'Iphone 16 | Chính hãng VN/A', 13590000, N'Đỏ', N'1730214133370_0000639_product-red_550.png', N'128GB', 10, N'testtestststst', N'abcccc')
SET IDENTITY_INSERT [dbo].[ProductDetails] OFF
GO
INSERT [dbo].[Role] ([role_id], [role_name]) VALUES (1, N'Admin')
INSERT [dbo].[Role] ([role_id], [role_name]) VALUES (2, N'Seller')
INSERT [dbo].[Role] ([role_id], [role_name]) VALUES (3, N'Customer')
INSERT [dbo].[Role] ([role_id], [role_name]) VALUES (4, N'Shipper')
GO
SET IDENTITY_INSERT [dbo].[Seller] ON 

INSERT [dbo].[Seller] ([seller_id], [account_id], [store_name], [rating], [join_date], [last_online], [seller_image]) VALUES (2, 11, N'ButterFly Store', CAST(0.00 AS Decimal(3, 2)), CAST(N'2024-10-25' AS Date), CAST(N'2024-10-31T23:47:31.670' AS DateTime), N'logo.jpg')
SET IDENTITY_INSERT [dbo].[Seller] OFF
GO
SET IDENTITY_INSERT [dbo].[Shipping] ON 

INSERT [dbo].[Shipping] ([shipping_id], [name], [phone], [address], [status]) VALUES (9, N'Phạm Quốc Nguyên', N'0988575467', N'hà nội,ba đình, thanh xuân, bug', NULL)
INSERT [dbo].[Shipping] ([shipping_id], [name], [phone], [address], [status]) VALUES (21, N'Ph?m Qu?c Nguyên', N'0988575467', N'big c thang long, abc, xyz', NULL)
INSERT [dbo].[Shipping] ([shipping_id], [name], [phone], [address], [status]) VALUES (40, N'Pham Quoc Nguyen', N'0123456789', N'abc, zyz,jsda,jndal', NULL)
INSERT [dbo].[Shipping] ([shipping_id], [name], [phone], [address], [status]) VALUES (41, N'Nguyễn Huy Anh', N'0866650703', N'nguyenhuyanh', N'Awaiting Confirmation')
INSERT [dbo].[Shipping] ([shipping_id], [name], [phone], [address], [status]) VALUES (42, N'Nguyễn Huy Anh', N'0866650703', N'nguyenhuyanh', N'Awaiting Confirmation')
INSERT [dbo].[Shipping] ([shipping_id], [name], [phone], [address], [status]) VALUES (43, N'long', N'0123456789', N'ha noi', N'Awaiting Confirmation')
INSERT [dbo].[Shipping] ([shipping_id], [name], [phone], [address], [status]) VALUES (44, N'long', N'0123456789', N'ha noi', N'Awaiting Confirmation')
INSERT [dbo].[Shipping] ([shipping_id], [name], [phone], [address], [status]) VALUES (45, N'long', N'0123456789', N'ha noi', N'Awaiting Confirmation')
INSERT [dbo].[Shipping] ([shipping_id], [name], [phone], [address], [status]) VALUES (46, N'Nguyễn Huy Anh', N'0866650703', N'nguyenhuyanh,andb.ancut', N'Awaiting Confirmation')
INSERT [dbo].[Shipping] ([shipping_id], [name], [phone], [address], [status]) VALUES (47, N'Nguyễn Huy Anh', N'0866650703', N'nguyenhuyanh,andb.ancut', N'Awaiting Confirmation')
INSERT [dbo].[Shipping] ([shipping_id], [name], [phone], [address], [status]) VALUES (48, N'Nguyễn Huy Anh', N'0866650703', N'nguyenhuyanh,andb.ancut', N'Awaiting Confirmation')
INSERT [dbo].[Shipping] ([shipping_id], [name], [phone], [address], [status]) VALUES (49, N'Nguyễn Huy Anh', N'0866650703', N'nguyenhuyanh,andb.ancut', N'Awaiting Confirmation')
INSERT [dbo].[Shipping] ([shipping_id], [name], [phone], [address], [status]) VALUES (50, N'Pham Do Khanh Duy', N'0987654321', N'HANOI', N'Awaiting Confirmation')
INSERT [dbo].[Shipping] ([shipping_id], [name], [phone], [address], [status]) VALUES (51, N'Pham Do Khanh Duy', N'0987654321', N'HANOI', N'Awaiting Confirmation')
INSERT [dbo].[Shipping] ([shipping_id], [name], [phone], [address], [status]) VALUES (52, N'Vũ Đình Phú', N'0123456789', N'abc,jklaskdj,lakld', N'Awaiting Confirmation')
INSERT [dbo].[Shipping] ([shipping_id], [name], [phone], [address], [status]) VALUES (53, N'Vũ Đình Phú', N'0123456789', N'abc,jklaskdj,lakld', N'Awaiting Confirmation')
INSERT [dbo].[Shipping] ([shipping_id], [name], [phone], [address], [status]) VALUES (54, N'Vũ Đình Phú', N'0988575467', N'hà nội,ba đình, thanh xuân', N'Awaiting Confirmation')
INSERT [dbo].[Shipping] ([shipping_id], [name], [phone], [address], [status]) VALUES (55, N'Vũ Đình Phú', N'0988575467', N'hà nội,ba đình, thanh xuân', N'Awaiting Confirmation')
INSERT [dbo].[Shipping] ([shipping_id], [name], [phone], [address], [status]) VALUES (56, N'Nguyễn Huy Anh', N'0988575477', N'hà nội,ba đình, thanh xuân', N'Awaiting Confirmation')
INSERT [dbo].[Shipping] ([shipping_id], [name], [phone], [address], [status]) VALUES (57, N'Nguyễn Huy Anh', N'0988575477', N'thanh trì, cầu giấy, hà nội', N'Awaiting Confirmation')
INSERT [dbo].[Shipping] ([shipping_id], [name], [phone], [address], [status]) VALUES (58, N'Nguyễn Huy Anh', N'0988575477', N'xuân sơn, ba đình, hà nội', N'Awaiting Confirmation')
INSERT [dbo].[Shipping] ([shipping_id], [name], [phone], [address], [status]) VALUES (59, N'Vũ Đình Phú', N'0988575467', N'hà nội,ba đình, thanh xuân', N'Awaiting Confirmation')
INSERT [dbo].[Shipping] ([shipping_id], [name], [phone], [address], [status]) VALUES (60, N'Vũ Đình Phú', N'0988575467', N'hà nội,ba đình, thanh xuân', N'Awaiting Confirmation')
SET IDENTITY_INSERT [dbo].[Shipping] OFF
GO
INSERT [dbo].[Status] ([status_id], [status_name]) VALUES (1, N'Awaiting Confirmation')
INSERT [dbo].[Status] ([status_id], [status_name]) VALUES (2, N'Preparing Goods')
INSERT [dbo].[Status] ([status_id], [status_name]) VALUES (3, N'In Transit')
INSERT [dbo].[Status] ([status_id], [status_name]) VALUES (4, N'Preparing For Delivery')
INSERT [dbo].[Status] ([status_id], [status_name]) VALUES (5, N'Delivered')
INSERT [dbo].[Status] ([status_id], [status_name]) VALUES (6, N'Cancelled')
INSERT [dbo].[Status] ([status_id], [status_name]) VALUES (7, N'On the way to pickup')
INSERT [dbo].[Status] ([status_id], [status_name]) VALUES (8, N'Customer not found')
GO
ALTER TABLE [dbo].[Feedback] ADD  CONSTRAINT [DF_Feedback_create_date]  DEFAULT (getdate()) FOR [create_date]
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
ON DELETE CASCADE
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
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Feedback] CHECK CONSTRAINT [FK_Feedback_Product]
GO
ALTER TABLE [dbo].[News]  WITH CHECK ADD  CONSTRAINT [FK_Blogs_Blogs Type] FOREIGN KEY([ntid])
REFERENCES [dbo].[News_Type] ([ntid])
GO
ALTER TABLE [dbo].[News] CHECK CONSTRAINT [FK_Blogs_Blogs Type]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Order] FOREIGN KEY([order_id])
REFERENCES [dbo].[Orders] ([order_id])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Order]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_ProductDetails] FOREIGN KEY([pd_id])
REFERENCES [dbo].[ProductDetails] ([pd_id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_ProductDetails]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Customer] FOREIGN KEY([customer_id])
REFERENCES [dbo].[Customer] ([customer_id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Customer]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Seller] FOREIGN KEY([seller_id])
REFERENCES [dbo].[Seller] ([seller_id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Seller]
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
ON DELETE CASCADE
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

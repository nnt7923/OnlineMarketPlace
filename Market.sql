
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
/****** Object:  Table [dbo].[Brand]    Script Date: 10/30/2024 3:24:46 AM ******/
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
/****** Object:  Table [dbo].[Cart]    Script Date: 10/30/2024 3:24:46 AM ******/
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
/****** Object:  Table [dbo].[CartDetails]    Script Date: 10/30/2024 3:24:46 AM ******/
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
/****** Object:  Table [dbo].[Category]    Script Date: 10/30/2024 3:24:46 AM ******/
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
/****** Object:  Table [dbo].[Customer]    Script Date: 10/30/2024 3:24:46 AM ******/
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
/****** Object:  Table [dbo].[Feedback]    Script Date: 10/30/2024 3:24:46 AM ******/
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
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 10/30/2024 3:24:46 AM ******/
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
/****** Object:  Table [dbo].[Orders]    Script Date: 10/30/2024 3:24:46 AM ******/
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
/****** Object:  Table [dbo].[Product]    Script Date: 10/30/2024 3:24:46 AM ******/
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
/****** Object:  Table [dbo].[ProductDetails]    Script Date: 10/30/2024 3:24:46 AM ******/
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
/****** Object:  Table [dbo].[Role]    Script Date: 10/30/2024 3:24:46 AM ******/
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
/****** Object:  Table [dbo].[Seller]    Script Date: 10/30/2024 3:24:46 AM ******/
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
/****** Object:  Table [dbo].[Shipping]    Script Date: 10/30/2024 3:24:46 AM ******/
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
/****** Object:  Table [dbo].[Status]    Script Date: 10/30/2024 3:24:46 AM ******/
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
INSERT [dbo].[OrderDetail] ([order_id], [pd_id], [productName], [productPrice], [quantity]) VALUES (31, 2, N'Iphone 13 128GB | Chính hãng VN/A', 13590000.0000, 1)
INSERT [dbo].[OrderDetail] ([order_id], [pd_id], [productName], [productPrice], [quantity]) VALUES (32, 2, N'Iphone 13 128GB | Chính hãng VN/A', 13590000.0000, 1)
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
INSERT [dbo].[Orders] ([order_id], [totalPrice], [note], [create_date], [shipping_id], [customer_id], [status_id], [payment]) VALUES (31, 13590000, N'', CAST(N'2024-10-29' AS Date), 50, 4, 1, N'COD')
INSERT [dbo].[Orders] ([order_id], [totalPrice], [note], [create_date], [shipping_id], [customer_id], [status_id], [payment]) VALUES (32, 13590000, N'', CAST(N'2024-10-29' AS Date), 51, 4, 1, N'COD')
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

INSERT [dbo].[Seller] ([seller_id], [account_id], [store_name], [rating], [join_date]) VALUES (2, 11, N'Default Store Name', CAST(0.00 AS Decimal(3, 2)), CAST(N'2024-10-25' AS Date))
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

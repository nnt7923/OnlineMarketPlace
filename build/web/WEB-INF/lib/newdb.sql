USE [mk3]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 10/16/2024 1:56:20 AM ******/
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
	[roleID] [int] NULL,
	[status] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[account_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Brand]    Script Date: 10/16/2024 1:56:20 AM ******/
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
/****** Object:  Table [dbo].[Cart]    Script Date: 10/16/2024 1:56:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cart](
	[customer_id] [int] NULL,
	[pd_id] [int] NULL,
	[amount] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 10/16/2024 1:56:20 AM ******/
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
/****** Object:  Table [dbo].[Customer]    Script Date: 10/16/2024 1:56:20 AM ******/
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
/****** Object:  Table [dbo].[Feedback]    Script Date: 10/16/2024 1:56:20 AM ******/
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
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 10/16/2024 1:56:20 AM ******/
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
/****** Object:  Table [dbo].[Orders]    Script Date: 10/16/2024 1:56:20 AM ******/
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
/****** Object:  Table [dbo].[Payments]    Script Date: 10/16/2024 1:56:20 AM ******/
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
/****** Object:  Table [dbo].[Product]    Script Date: 10/16/2024 1:56:20 AM ******/
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
	[description] [nvarchar](max) NULL,
	[cateID] [int] NULL,
	[sellID] [int] NULL,
	[brand_id] [int] NULL,
	[seller_id] [int] NULL,
 CONSTRAINT [PK__Product__47027DF545A8A49C] PRIMARY KEY CLUSTERED 
(
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductDetails]    Script Date: 10/16/2024 1:56:20 AM ******/
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
 CONSTRAINT [PK_ProductDetails] PRIMARY KEY CLUSTERED 
(
	[pd_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 10/16/2024 1:56:20 AM ******/
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
/****** Object:  Table [dbo].[Seller]    Script Date: 10/16/2024 1:56:20 AM ******/
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
/****** Object:  Table [dbo].[Shipping]    Script Date: 10/16/2024 1:56:20 AM ******/
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

INSERT [dbo].[Account] ([account_id], [username], [password], [email], [phone], [address], [roleID], [status]) VALUES (10, N'admin', N'123', N'admin@gmail.com', N'1234567890', N'123 Admin Street', 1, N'active')
INSERT [dbo].[Account] ([account_id], [username], [password], [email], [phone], [address], [roleID], [status]) VALUES (11, N'seller', N'123', N'seller@gmail.com', N'1234567891', N'123 Seller Street', 2, N'active')
INSERT [dbo].[Account] ([account_id], [username], [password], [email], [phone], [address], [roleID], [status]) VALUES (12, N'customer', N'123', N'customer@gmail.com', N'1234567892', N'123 Customer Street', 3, N'active')
INSERT [dbo].[Account] ([account_id], [username], [password], [email], [phone], [address], [roleID], [status]) VALUES (13, N'shipper', N'123', N'shipper@gmail.com', N'1234567893', N'123 Shipper Street', 4, N'active')
INSERT [dbo].[Account] ([account_id], [username], [password], [email], [phone], [address], [roleID], [status]) VALUES (14, N'wjbunhi', N'12345', N'wjbunhi@gmail.com', N'123456789', N'ha noi', 3, N'active')
INSERT [dbo].[Account] ([account_id], [username], [password], [email], [phone], [address], [roleID], [status]) VALUES (16, N'customer', N'12345', N'nntruong79230@gmail.com', N'0123456789', N'Ha Noi', 3, N'active')
INSERT [dbo].[Account] ([account_id], [username], [password], [email], [phone], [address], [roleID], [status]) VALUES (17, N'nguyenpqhe171272', N'96gZ2qEIwJ', N'nguyenpqhe171272@fpt.edu.vn', NULL, NULL, 3, N'active')
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
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([cid], [cname]) VALUES (1, N'Telephone')
INSERT [dbo].[Category] ([cid], [cname]) VALUES (2, N'Laptop')
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[Customer] ON 

INSERT [dbo].[Customer] ([customer_id], [customer_name], [customer_type], [account_id], [customer_dob], [customer_gender], [customer_images]) VALUES (4, N'', NULL, 12, NULL, N'', N'')
INSERT [dbo].[Customer] ([customer_id], [customer_name], [customer_type], [account_id], [customer_dob], [customer_gender], [customer_images]) VALUES (5, N'', NULL, 12, NULL, N'', N'')
SET IDENTITY_INSERT [dbo].[Customer] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([product_id], [name], [img], [price], [title], [description], [cateID], [sellID], [brand_id], [seller_id]) VALUES (1, N'Iphone 13 | Chính hãng VN/A', N'iphone-13_2_.png', 18990000, NULL, NULL, 1, NULL, 1, NULL)
INSERT [dbo].[Product] ([product_id], [name], [img], [price], [title], [description], [cateID], [sellID], [brand_id], [seller_id]) VALUES (4, N'Iphone 15 Pro Max | Chính hãng VN/A', N'iphone-15-pro-max_3.png', 34990000, NULL, NULL, 1, NULL, 1, NULL)
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductDetails] ON 

INSERT [dbo].[ProductDetails] ([pd_id], [product_id], [pdname], [pdprice_discount], [pdcolor], [pdimg], [pdcriteria], [pdquantity]) VALUES (2, 1, N'Iphone 13 128GB | Chính hãng VN/A', 13590000, N'Hồng', N'iphone-13_2_.png,0000648_pink_550.png,0000649_pink_550.png,0000650_pink_550.png,0000651_pink_550.png', N'128GB', 5)
INSERT [dbo].[ProductDetails] ([pd_id], [product_id], [pdname], [pdprice_discount], [pdcolor], [pdimg], [pdcriteria], [pdquantity]) VALUES (4, 1, N'Iphone 13 128GB | Chính hãng VN/A', 13590000, N'Đen', N'_en_2_5.png,0000608_midnight_550.png,0000609_midnight_550.png,0000610_midnight_550.png,0000611_midnight_550.png', N'128GB', 4)
INSERT [dbo].[ProductDetails] ([pd_id], [product_id], [pdname], [pdprice_discount], [pdcolor], [pdimg], [pdcriteria], [pdquantity]) VALUES (5, 1, N'Iphone 13 128GB | Chính hãng VN/A', 13590000, N'Xanh lá', N'xnnah_kas_3.png,0019777_green_550.png,0019778_green_550.png,0019780_green_550.png,0019781_green_550.png', N'128GB', 7)
INSERT [dbo].[ProductDetails] ([pd_id], [product_id], [pdname], [pdprice_discount], [pdcolor], [pdimg], [pdcriteria], [pdquantity]) VALUES (7, 1, N'Iphone 13 128GB | Chính hãng VN/A', 13590000, N'Trắng', N'15_2_7_2_5.png,0000618_starlight_550.png,0000619_starlight_550.png,0000620_starlight_550.png,0000621_starlight_550.png', N'128GB', 6)
INSERT [dbo].[ProductDetails] ([pd_id], [product_id], [pdname], [pdprice_discount], [pdcolor], [pdimg], [pdcriteria], [pdquantity]) VALUES (8, 1, N'Iphone 13 128GB | Chính hãng VN/A', 13590000, N'Đỏ', N'0000639_product-red_550.png,0000640_product-red_550.png,0000641_product-red_550.png,0000642_product-red_550.png,0000643_product-red_550.png', N'128GB', 8)
INSERT [dbo].[ProductDetails] ([pd_id], [product_id], [pdname], [pdprice_discount], [pdcolor], [pdimg], [pdcriteria], [pdquantity]) VALUES (9, 4, N'Iphone 15 Pro Max 256GB | Chính hãng VN/A', 29290000, N'Titan Tự Nhiên', N'iphone15-pro-max-titan-nau.png', N'256GB', 5)
INSERT [dbo].[ProductDetails] ([pd_id], [product_id], [pdname], [pdprice_discount], [pdcolor], [pdimg], [pdcriteria], [pdquantity]) VALUES (10, 4, N'Iphone 15 Pro Max 256GB | Chính hãng VN/A', 29290000, N'Titan Trắng', N'iphone15-pro-max-titan-trang.png', N'256GB', 4)
INSERT [dbo].[ProductDetails] ([pd_id], [product_id], [pdname], [pdprice_discount], [pdcolor], [pdimg], [pdcriteria], [pdquantity]) VALUES (11, 4, N'Iphone 15 Pro Max 256GB | Chính hãng VN/A', 29290000, N'Titan Đen', N'0020074_iphone-15-pro-max-128gb_550.png', N'256GB', 8)
SET IDENTITY_INSERT [dbo].[ProductDetails] OFF
GO
INSERT [dbo].[Role] ([role_id], [role_name]) VALUES (1, N'Admin')
INSERT [dbo].[Role] ([role_id], [role_name]) VALUES (2, N'Seller')
INSERT [dbo].[Role] ([role_id], [role_name]) VALUES (3, N'Customer')
INSERT [dbo].[Role] ([role_id], [role_name]) VALUES (4, N'Shipper')
GO
ALTER TABLE [dbo].[Account]  WITH CHECK ADD  CONSTRAINT [fk_role] FOREIGN KEY([roleID])
REFERENCES [dbo].[Role] ([role_id])
GO
ALTER TABLE [dbo].[Account] CHECK CONSTRAINT [fk_role]
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD  CONSTRAINT [FK_Cart_Customer] FOREIGN KEY([customer_id])
REFERENCES [dbo].[Customer] ([customer_id])
GO
ALTER TABLE [dbo].[Cart] CHECK CONSTRAINT [FK_Cart_Customer]
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD  CONSTRAINT [FK_Cart_ProductDetails] FOREIGN KEY([pd_id])
REFERENCES [dbo].[ProductDetails] ([pd_id])
GO
ALTER TABLE [dbo].[Cart] CHECK CONSTRAINT [FK_Cart_ProductDetails]
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

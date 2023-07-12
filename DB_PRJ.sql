CREATE DATABASE AssignmentPRJ
DROP DATABASE AssignmentPRJ
USE AssignmentPRJ

create table [dbo].[Account] (
	[username] [varchar](30) NOT NULL PRIMARY KEY,
	[password] [varchar](30) NOT NULL,
	[fullname] [nvarchar](50) NOT NULL,
	[isAdmin] [bit] NOT NULL,
)

INSERT [dbo].[Account] ([username], [password], [fullname], [isAdmin]) VALUES (N'admin', N'admin', N'admin', 1)
INSERT [dbo].[Account] ([username], [password], [fullname], [isAdmin]) VALUES (N'user', N'user', N'user', 0)
INSERT [dbo].[Account] ([username], [password], [fullname], [isAdmin]) VALUES (N'thanhdoan', N'thanh', N'Đoàn Viết Thanh', 1)
INSERT [dbo].[Account] ([username], [password], [fullname], [isAdmin]) VALUES (N'quanghuy', N'huy', N'Nguyễn Vũ Quang Huy', 0)
INSERT [dbo].[Account] ([username], [password], [fullname], [isAdmin]) VALUES (N'thetam', N'tam', N'Bùi Thế Tâm', 0)
INSERT [dbo].[Account] ([username], [password], [fullname], [isAdmin]) VALUES (N'minhtam', N'tam', N'Nguyễn Minh Tâm', 0)
INSERT [dbo].[Account] ([username], [password], [fullname], [isAdmin]) VALUES (N'anhtoan', N'toan', N'Trần Thẩm Anh Toàn', 0)
INSERT [dbo].[Account] ([username], [password], [fullname], [isAdmin]) VALUES (N'trungluu', N'luu', N'Nillllll Lưu', 0)

create table [dbo].[Category] (
	[idCategory] int NOT NULL PRIMARY KEY,
	[nameCategory] [nvarchar](30) NOT NULL
)
INSERT [dbo].[Category] ([idCategory],[nameCategory]) values (1, N'Trousers')
INSERT [dbo].[Category] ([idCategory],[nameCategory]) values (2, N'Shirt')
INSERT [dbo].[Category] ([idCategory],[nameCategory]) values (3, N'Others')

-- COMMENT
create table [dbo].[Comment] (
	[username] nvarchar(30) NOT NULL,
	[date] nvarchar(30) NOT NULL,
	[textComment] nvarchar(1000) NOT NULL,
	[skuProduct] nvarchar(30) NOT NULL
)
DROP table [dbo].[Comment]
select * from comment

INSERT [dbo].[Comment]([username],[date],[textComment],[skuProduct]) 
values ('admin', N'Sunday, 12/12/2023', 'Perfect', 'Q10')


-- PRODUCT
create table [dbo].[Product] (
	[sku] [nvarchar](30) NOT NULL PRIMARY KEY,
	[name] [nvarchar](50) NOT NULL,
	[quantity] int NOT NULL,
	[status] bit NOT NULL,
	[stars] int NOT NULL,
	[categoryID] int NOT NULL,
	[price] float NOT NULL,
	[description] [nvarchar](50) NOT NULL,
	[image] [nvarchar](1000) NOT NULL,
)

select * from Product
order by price ASC
-- Quần
INSERT [dbo].[Product] ([sku],[name],[quantity],[status],[stars],[categoryID],[price],[description],[image]) 
VALUES ('Q10', N'Quần Short', 999, 1, 5, 1, 99, N'Good', N'https://owen.cdn.vccloud.vn/media/catalog/product/cache/01755127bd64f5dde3182fd2f139143a/s/w/sw231537._39.jpg')

INSERT [dbo].[Product] ([sku],[name],[quantity],[status],[stars],[categoryID],[price],[description],[image]) 
VALUES ('Q20', N'Quần Tây', 999, 1, 5, 1, 180, N'Very Good', N'https://owen.cdn.vccloud.vn/media/catalog/product/cache/01755127bd64f5dde3182fd2f139143a/q/r/qrt23885r2-n._31_1.jpg')

INSERT [dbo].[Product] ([sku],[name],[quantity],[status],[stars],[categoryID],[price],[description],[image]) 
VALUES ('Q30', N'Quần Khaki', 999, 1, 5, 1, 270, N'Perpect', N'https://owen.cdn.vccloud.vn/media/catalog/product/cache/01755127bd64f5dde3182fd2f139143a/q/k/qksl231305_3m_._84.jpg')

INSERT [dbo].[Product] ([sku],[name],[quantity],[status],[stars],[categoryID],[price],[description],[image]) 
VALUES ('Q40', N'Quần Jeans', 999, 1, 5, 1, 346, N'Good', N'https://owen.cdn.vccloud.vn/media/catalog/product/cache/01755127bd64f5dde3182fd2f139143a/q/j/qjs230151._61.jpg')

INSERT [dbo].[Product] ([sku],[name],[quantity],[status],[stars],[categoryID],[price],[description],[image]) 
VALUES ('Q50', N'Quần Jogger', 999, 1, 5, 1, 824, N'Nice', N'https://owen.cdn.vccloud.vn/media/catalog/product/cache/01755127bd64f5dde3182fd2f139143a/d/s/dsc07436.jpg')

-- Áo
INSERT [dbo].[Product] ([sku],[name],[quantity],[status],[stars],[categoryID],[price],[description],[image]) 
VALUES ('A10', N'Áo Polo', 999, 1, 4, 2, 842, N'Good', N'https://owen.cdn.vccloud.vn/media/catalog/product/cache/01755127bd64f5dde3182fd2f139143a/a/p/apt231548._89.jpg')

INSERT [dbo].[Product] ([sku],[name],[quantity],[status],[stars],[categoryID],[price],[description],[image]) 
VALUES ('A20', N'Áo Sơ Mi', 999, 1, 5, 2, 34, N'Good', N'https://owen.cdn.vccloud.vn/media/catalog/product/cache/01755127bd64f5dde3182fd2f139143a/a/r/ar230326dt._93.jpg')

INSERT [dbo].[Product] ([sku],[name],[quantity],[status],[stars],[categoryID],[price],[description],[image]) 
VALUES ('A30', N'Áo T-Shirt', 999, 1, 5, 2, 62, N'Good', N'https://owen.cdn.vccloud.vn/media/catalog/product/cache/01755127bd64f5dde3182fd2f139143a/t/s/tsn231431_12.jpg')

INSERT [dbo].[Product] ([sku],[name],[quantity],[status],[stars],[categoryID],[price],[description],[image]) 
VALUES ('A40', N'Áo Blazer', 999, 1, 5, 2, 40, N'Good', N'https://owen.cdn.vccloud.vn/media/catalog/product/cache/01755127bd64f5dde3182fd2f139143a/d/s/dsc02520.jpg')

INSERT [dbo].[Product] ([sku],[name],[quantity],[status],[stars],[categoryID],[price],[description],[image]) 
VALUES ('A50', N'Áo Veston', 999, 1, 5, 2, 94, N'Good', N'https://owen.cdn.vccloud.vn/media/catalog/product/cache/01755127bd64f5dde3182fd2f139143a/d/s/dsc09183.jpg')

-- Phụ kiện
INSERT [dbo].[Product] ([sku],[name],[quantity],[status],[stars],[categoryID],[price],[description],[image]) 
VALUES ('PK10', N'Tất', 999, 1, 4, 3, 350, N'Good', N'https://owen.cdn.vccloud.vn/media/catalog/product/cache/01755127bd64f5dde3182fd2f139143a/d/s/dsc07436.jpg')

INSERT [dbo].[Product] ([sku],[name],[quantity],[status],[stars],[categoryID],[price],[description],[image]) 
VALUES ('PK20', N'Dây lưng', 999, 1, 4, 3, 254, N'Good', N'https://owen.cdn.vccloud.vn/media/catalog/product/cache/01755127bd64f5dde3182fd2f139143a/d/s/dsc07436.jpg')

INSERT [dbo].[Product] ([sku],[name],[quantity],[status],[stars],[categoryID],[price],[description],[image]) 
VALUES ('PK30', N'Ví da', 999, 1, 4, 3, 932, N'Good', N'https://owen.cdn.vccloud.vn/media/catalog/product/…55127bd64f5dde3182fd2f139143a/v/i/vid220610_1.jpg')

INSERT [dbo].[Product] ([sku],[name],[quantity],[status],[stars],[categoryID],[price],[description],[image]) 
VALUES ('PK40', N'Cà vạt', 999, 1, 4, 3, 562, N'Good', N'https://owen.cdn.vccloud.vn/media/catalog/product/…55127bd64f5dde3182fd2f139143a/v/i/vid220610_1.jpg')


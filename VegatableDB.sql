USE master;
GO

DROP DATABASE VegatableDB
GO

CREATE DATABASE VegatableDB
GO

USE VegatableDB
GO

CREATE TABLE tblUser (
[userID] [NVARCHAR](50) NOT NULL,
[fullname] [NVARCHAR](50) NULL,
[password] [NVARCHAR](50) NULL,
[roleID] [NVARCHAR](50)NOT NULL FOREIGN KEY REFERENCES tblRole, 
[address] [NVARCHAR](50) NULL,
[birthday] [DATE] NULL,
[phone] [NVARCHAR](50) NULL,
[status] [bit] NULL,
[email] [NVARCHAR](70) NULL
PRIMARY KEY ([userID])
);
GO

CREATE TABLE tblRole (
[roleID] [NVARCHAR](50) NOT NULL,
[roleName] [NVARCHAR](50) NULL,
PRIMARY KEY ([roleID])
);
GO

CREATE TABLE tblCategory (
[categoryID] [NVARCHAR](50) NOT NULL ,
[categoryName] [NVARCHAR](50) NULL
PRIMARY KEY ([categoryID])
);
GO

CREATE TABLE tblOrder (
[orderID] [NVARCHAR](50) NOT NULL ,
[orderDate] [DATE] NULL,
[total] [MONEY] NULL,
[userID] [NVARCHAR](50) NOT NULL FOREIGN KEY REFERENCES tblUser
PRIMARY KEY ([orderID])
);
GO

CREATE TABLE tblProduct (
[productID] [NVARCHAR](50) NOT NULL ,
[productName] [NVARCHAR](50) NULL,
[image] [VARCHAR](120) NULL,
[price] [MONEY] NULL,
[quantity] [INT] NULL,
[categoryID] [NVARCHAR](50) NOT NULL FOREIGN KEY REFERENCES tblCategory,
[importDate] [DATE] NULL,
[usingDate] [DATE] NULL
PRIMARY KEY ([productID])
);
GO

CREATE TABLE tblOrderDetail (
[detailID] [NVARCHAR](50) NOT NULL,
[price] [MONEY] NULL,
[quantity] [INT] NULL,
[orderID] [NVARCHAR](50)NOT NULL FOREIGN KEY REFERENCES tblOrder,
[productID] [NVARCHAR](50)NOT NULL FOREIGN KEY REFERENCES tblProduct,
PRIMARY KEY ([detailID])
);
GO

INSERT INTO tblRole([roleID],[roleName]) 
VALUES (N'AD',N'Admin')
GO
INSERT INTO tblRole([roleID],[roleName]) 
VALUES (N'US',N'User')
GO

INSERT INTO tblCategory([categoryID],[categoryName]) 
VALUES (N'01',N'Fruit')
GO
INSERT INTO tblCategory([categoryID],[categoryName]) 
VALUES (N'02',N'Vegatable')
GO

INSERT INTO tblUser ([userID],[fullName],[password],[roleID], [address], [birthday], [phone],[status],[email]) 
VALUES (N'SE150545', N'Nguyen Doan Tu',N'1',N'AD',N'TP.HCM',N'20011026',N'012345', 1,N'tundse150545@fpt.edu.vn' );
GO
INSERT INTO tblUser ([userID],[fullName],[password],[roleID], [address], [birthday], [phone],[status],[email]) 
VALUES (N'user2', N'Nguyen Van An',N'1',N'US',N'TP.HANOI',N'20021122',N'012335', 1,N'annvSS150322@fpt.edu.vn' );
GO
INSERT INTO tblUser ([userID],[fullName],[password],[roleID], [address], [birthday], [phone],[status],[email]) 
VALUES (N'user1', N'Nguyen Van Toan',N'1',N'US',N'TP.HANOI',N'20031122',N'011335', 1,N'toannvSS150322@fpt.edu.vn' );
GO

INSERT INTO tblProduct([productID],[productName],[image],[price], [quantity], [categoryID], [importDate],[usingDate]) 
VALUES (N'01', N'Watermelon',N'assets/img/products/duahau.jpg',N'85',N'500',N'01',N'20220410',N'20220425' );
GO
INSERT INTO tblProduct([productID],[productName],[image],[price], [quantity], [categoryID], [importDate],[usingDate]) 
VALUES (N'02', N'Melon',N'assets/img/products/dualuoi.jpg',N'70',N'500',N'01',N'20220401',N'20220425' );
GO
INSERT INTO tblProduct([productID],[productName],[image],[price], [quantity], [categoryID], [importDate],[usingDate]) 
VALUES (N'03', N'Apple',N'assets/img/products/taodo.jpg',N'35',N'500',N'01',N'20220410',N'20220401' );
GO
INSERT INTO tblProduct([productID],[productName],[image],[price], [quantity], [categoryID], [importDate],[usingDate]) 
VALUES (N'04', N'Dragon fruit',N'assets/img/products/thanhlong.jpg',N'50',N'500',N'01',N'20220401',N'20220414' );
GO
INSERT INTO tblProduct([productID],[productName],[image],[price], [quantity], [categoryID], [importDate],[usingDate]) 
VALUES (N'05', N'Grape',N'assets/img/products/nho.jpg',N'45',N'500',N'01',N'20220410',N'20220425' );
GO
INSERT INTO tblProduct([productID],[productName],[image],[price], [quantity], [categoryID], [importDate],[usingDate]) 
VALUES (N'06', N'Carrot',N'assets/img/products/carot.jpg',N'40',N'500',N'02',N'20220410',N'20220425' );
GO
INSERT INTO tblProduct([productID],[productName],[image],[price], [quantity], [categoryID], [importDate],[usingDate]) 
VALUES (N'07', N'Grourd',N'assets/img/products/bausao.jpg',N'30',N'500',N'02',N'20220410',N'20220425' );
GO
INSERT INTO tblProduct([productID],[productName],[image],[price], [quantity], [categoryID], [importDate],[usingDate]) 
VALUES (N'08', N'Onion',N'assets/img/products/hanhtay.jpg',N'30',N'500',N'02',N'20220410',N'20220425' );
GO

Select * from tblUser;
GO
Select * from tblCategory;
GO
Select * from tblProduct;
GO

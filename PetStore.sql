USE [master]
GO
/****** Object:  Database [PetStore]    Script Date: 06-Nov-21 10:21:31 PM ******/
CREATE DATABASE [PetStore]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PetStore', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\PetStore.mdf' , SIZE = 3264KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'PetStore_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\PetStore_log.ldf' , SIZE = 832KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [PetStore] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PetStore].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PetStore] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PetStore] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PetStore] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PetStore] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PetStore] SET ARITHABORT OFF 
GO
ALTER DATABASE [PetStore] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [PetStore] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PetStore] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PetStore] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PetStore] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PetStore] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PetStore] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PetStore] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PetStore] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PetStore] SET  DISABLE_BROKER 
GO
ALTER DATABASE [PetStore] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PetStore] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PetStore] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PetStore] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PetStore] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PetStore] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PetStore] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PetStore] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [PetStore] SET  MULTI_USER 
GO
ALTER DATABASE [PetStore] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PetStore] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PetStore] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PetStore] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [PetStore] SET DELAYED_DURABILITY = DISABLED 
GO
USE [PetStore]
GO
/****** Object:  Table [dbo].[tblBillDetails]    Script Date: 06-Nov-21 10:21:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblBillDetails](
	[BillDetailID] [int] IDENTITY(1,1) NOT NULL,
	[BillID] [int] NOT NULL,
	[PetID] [int] NOT NULL,
	[QuantityBuy] [int] NOT NULL,
	[Discount] [float] NOT NULL,
	[SubTotal] [money] NOT NULL,
 CONSTRAINT [PK_tblBillDetails] PRIMARY KEY CLUSTERED 
(
	[BillDetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblBills]    Script Date: 06-Nov-21 10:21:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblBills](
	[BillID] [int] NOT NULL,
	[CustomerID] [int] NOT NULL,
	[Freight] [money] NULL,
	[Total] [money] NOT NULL,
	[Date] [datetime] NOT NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_tblBills] PRIMARY KEY CLUSTERED 
(
	[BillID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblCategories]    Script Date: 06-Nov-21 10:21:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCategories](
	[CategoryID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_tblCategories] PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblCustomers]    Script Date: 06-Nov-21 10:21:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblCustomers](
	[CustomerID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerName] [nvarchar](50) NOT NULL,
	[Gender] [bit] NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[Phone] [varchar](15) NOT NULL,
	[Address] [nvarchar](120) NOT NULL,
	[AccumulatedPoint] [int] NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK__tblCusto__A4AE64B8CE37F110] PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblPets]    Script Date: 06-Nov-21 10:21:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblPets](
	[PetID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryID] [int] NOT NULL,
	[PetName] [nvarchar](50) NOT NULL,
	[Age] [int] NOT NULL,
	[Gender] [bit] NOT NULL,
	[Color] [nvarchar](50) NOT NULL,
	[QuantityInStock] [int] NOT NULL,
	[ImportPrice] [money] NOT NULL,
	[ExportPrice] [money] NOT NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_tblPets] PRIMARY KEY CLUSTERED 
(
	[PetID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[tblBillDetails] ON 

INSERT [dbo].[tblBillDetails] ([BillDetailID], [BillID], [PetID], [QuantityBuy], [Discount], [SubTotal]) VALUES (14, 5, 3, 3, 0.32, 6120000.0000)
INSERT [dbo].[tblBillDetails] ([BillDetailID], [BillID], [PetID], [QuantityBuy], [Discount], [SubTotal]) VALUES (15, 5, 1, 2, 0.32, 680000.0000)
INSERT [dbo].[tblBillDetails] ([BillDetailID], [BillID], [PetID], [QuantityBuy], [Discount], [SubTotal]) VALUES (17, 6, 2, 2, 0.12, 26400000.0000)
INSERT [dbo].[tblBillDetails] ([BillDetailID], [BillID], [PetID], [QuantityBuy], [Discount], [SubTotal]) VALUES (18, 6, 1, 2, 0.12, 880000.0000)
INSERT [dbo].[tblBillDetails] ([BillDetailID], [BillID], [PetID], [QuantityBuy], [Discount], [SubTotal]) VALUES (19, 7, 2, 1, 0.12, 13200000.0000)
INSERT [dbo].[tblBillDetails] ([BillDetailID], [BillID], [PetID], [QuantityBuy], [Discount], [SubTotal]) VALUES (20, 7, 1, 1, 0.12, 440000.0000)
INSERT [dbo].[tblBillDetails] ([BillDetailID], [BillID], [PetID], [QuantityBuy], [Discount], [SubTotal]) VALUES (21, 8, 2, 1, 0.32, 10200000.0000)
INSERT [dbo].[tblBillDetails] ([BillDetailID], [BillID], [PetID], [QuantityBuy], [Discount], [SubTotal]) VALUES (22, 9, 2, 1, 0.21, 11850000.0000)
INSERT [dbo].[tblBillDetails] ([BillDetailID], [BillID], [PetID], [QuantityBuy], [Discount], [SubTotal]) VALUES (23, 10, 2, 1, 0.11, 13350000.0000)
INSERT [dbo].[tblBillDetails] ([BillDetailID], [BillID], [PetID], [QuantityBuy], [Discount], [SubTotal]) VALUES (24, 11, 2, 1, 0.31, 10350000.0000)
INSERT [dbo].[tblBillDetails] ([BillDetailID], [BillID], [PetID], [QuantityBuy], [Discount], [SubTotal]) VALUES (33, 13, 12, 6, 0.1, 81000000.0000)
INSERT [dbo].[tblBillDetails] ([BillDetailID], [BillID], [PetID], [QuantityBuy], [Discount], [SubTotal]) VALUES (34, 14, 1, 10, 0.12, 4400000.0000)
INSERT [dbo].[tblBillDetails] ([BillDetailID], [BillID], [PetID], [QuantityBuy], [Discount], [SubTotal]) VALUES (35, 15, 2, 1, 0.12, 13200000.0000)
INSERT [dbo].[tblBillDetails] ([BillDetailID], [BillID], [PetID], [QuantityBuy], [Discount], [SubTotal]) VALUES (36, 16, 2, 2, 0.321, 20370000.0000)
INSERT [dbo].[tblBillDetails] ([BillDetailID], [BillID], [PetID], [QuantityBuy], [Discount], [SubTotal]) VALUES (37, 17, 15, 5, 0.123, 43850000.0000)
INSERT [dbo].[tblBillDetails] ([BillDetailID], [BillID], [PetID], [QuantityBuy], [Discount], [SubTotal]) VALUES (38, 18, 16, 5, 0.312, 1720000.0000)
INSERT [dbo].[tblBillDetails] ([BillDetailID], [BillID], [PetID], [QuantityBuy], [Discount], [SubTotal]) VALUES (39, 19, 15, 5, 0.312, 34400000.0000)
INSERT [dbo].[tblBillDetails] ([BillDetailID], [BillID], [PetID], [QuantityBuy], [Discount], [SubTotal]) VALUES (40, 20, 1, 1, 0.312, 344000.0000)
INSERT [dbo].[tblBillDetails] ([BillDetailID], [BillID], [PetID], [QuantityBuy], [Discount], [SubTotal]) VALUES (41, 21, 2, 2, 0.321, 20370000.0000)
INSERT [dbo].[tblBillDetails] ([BillDetailID], [BillID], [PetID], [QuantityBuy], [Discount], [SubTotal]) VALUES (42, 22, 12, 2, 0.3121, 20637000.0000)
SET IDENTITY_INSERT [dbo].[tblBillDetails] OFF
INSERT [dbo].[tblBills] ([BillID], [CustomerID], [Freight], [Total], [Date], [Status]) VALUES (5, 4, 120000.0000, 6920000.0000, CAST(N'2021-11-05 20:18:59.383' AS DateTime), 1)
INSERT [dbo].[tblBills] ([BillID], [CustomerID], [Freight], [Total], [Date], [Status]) VALUES (6, 2, 66000.0000, 27346000.0000, CAST(N'2021-11-05 21:43:37.703' AS DateTime), 1)
INSERT [dbo].[tblBills] ([BillID], [CustomerID], [Freight], [Total], [Date], [Status]) VALUES (7, 4, 10000.0000, 13650000.0000, CAST(N'2021-11-05 21:45:06.057' AS DateTime), 1)
INSERT [dbo].[tblBills] ([BillID], [CustomerID], [Freight], [Total], [Date], [Status]) VALUES (8, 3, 10000.0000, 10210000.0000, CAST(N'2021-11-05 21:48:20.543' AS DateTime), 1)
INSERT [dbo].[tblBills] ([BillID], [CustomerID], [Freight], [Total], [Date], [Status]) VALUES (9, 3, 12000.0000, 11874000.0000, CAST(N'2021-11-05 21:51:56.573' AS DateTime), 1)
INSERT [dbo].[tblBills] ([BillID], [CustomerID], [Freight], [Total], [Date], [Status]) VALUES (10, 4, 12000.0000, 13362000.0000, CAST(N'2021-11-05 21:53:15.327' AS DateTime), 1)
INSERT [dbo].[tblBills] ([BillID], [CustomerID], [Freight], [Total], [Date], [Status]) VALUES (11, 3, 12000.0000, 10361999.9600, CAST(N'2021-11-05 21:55:41.147' AS DateTime), 1)
INSERT [dbo].[tblBills] ([BillID], [CustomerID], [Freight], [Total], [Date], [Status]) VALUES (12, 4, 32000.0000, 131732003.1500, CAST(N'2021-11-06 11:13:45.067' AS DateTime), 1)
INSERT [dbo].[tblBills] ([BillID], [CustomerID], [Freight], [Total], [Date], [Status]) VALUES (13, 4, 23000.0000, 81022997.8500, CAST(N'2021-11-06 11:17:31.857' AS DateTime), 1)
INSERT [dbo].[tblBills] ([BillID], [CustomerID], [Freight], [Total], [Date], [Status]) VALUES (14, 1, 120000.0000, 4519999.9800, CAST(N'2021-11-06 11:29:20.870' AS DateTime), 1)
INSERT [dbo].[tblBills] ([BillID], [CustomerID], [Freight], [Total], [Date], [Status]) VALUES (15, 1, 25000.0000, 13224999.9300, CAST(N'2021-11-06 11:31:46.930' AS DateTime), 1)
INSERT [dbo].[tblBills] ([BillID], [CustomerID], [Freight], [Total], [Date], [Status]) VALUES (16, 2, 120000.0000, 20490000.6000, CAST(N'2021-11-06 19:54:08.870' AS DateTime), 1)
INSERT [dbo].[tblBills] ([BillID], [CustomerID], [Freight], [Total], [Date], [Status]) VALUES (17, 2, 120000.0000, 43969998.7100, CAST(N'2021-11-06 20:01:04.320' AS DateTime), 1)
INSERT [dbo].[tblBills] ([BillID], [CustomerID], [Freight], [Total], [Date], [Status]) VALUES (18, 4, 120000.0000, 1839999.9100, CAST(N'2021-11-06 20:07:45.817' AS DateTime), 1)
INSERT [dbo].[tblBills] ([BillID], [CustomerID], [Freight], [Total], [Date], [Status]) VALUES (19, 3, 120000.0000, 34519998.1900, CAST(N'2021-11-06 20:11:52.070' AS DateTime), 1)
INSERT [dbo].[tblBills] ([BillID], [CustomerID], [Freight], [Total], [Date], [Status]) VALUES (20, 6, 120000.0000, 463999.9800, CAST(N'2021-11-06 20:12:30.760' AS DateTime), 1)
INSERT [dbo].[tblBills] ([BillID], [CustomerID], [Freight], [Total], [Date], [Status]) VALUES (21, 2, 210000.0000, 20580000.6000, CAST(N'2021-11-06 21:31:00.560' AS DateTime), 1)
INSERT [dbo].[tblBills] ([BillID], [CustomerID], [Freight], [Total], [Date], [Status]) VALUES (22, 2, 320000.0000, 20957000.2000, CAST(N'2021-11-06 21:38:55.253' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[tblCategories] ON 

INSERT [dbo].[tblCategories] ([CategoryID], [CategoryName]) VALUES (1, N'Dog')
INSERT [dbo].[tblCategories] ([CategoryID], [CategoryName]) VALUES (2, N'Cat')
INSERT [dbo].[tblCategories] ([CategoryID], [CategoryName]) VALUES (3, N'Rabbit')
INSERT [dbo].[tblCategories] ([CategoryID], [CategoryName]) VALUES (4, N'Hamster')
INSERT [dbo].[tblCategories] ([CategoryID], [CategoryName]) VALUES (5, N'Hedgehog')
SET IDENTITY_INSERT [dbo].[tblCategories] OFF
SET IDENTITY_INSERT [dbo].[tblCustomers] ON 

INSERT [dbo].[tblCustomers] ([CustomerID], [CustomerName], [Gender], [Email], [Phone], [Address], [AccumulatedPoint], [Status]) VALUES (1, N'Võ Văn Phương', 0, N'petervo0606@gmail.com', N'09717751691', N'94/21 Bùi Quang Là, phường 12, quận Gò Vấp TPHCM', 4, 1)
INSERT [dbo].[tblCustomers] ([CustomerID], [CustomerName], [Gender], [Email], [Phone], [Address], [AccumulatedPoint], [Status]) VALUES (2, N'Lê Thiên Ân ', 1, N'thienan@gmail.com', N'0321211692', N'Cà Mau miền Tây', 6, 1)
INSERT [dbo].[tblCustomers] ([CustomerID], [CustomerName], [Gender], [Email], [Phone], [Address], [AccumulatedPoint], [Status]) VALUES (3, N'Nguyễn Thị Hoàng Dung', 0, N'dungnguyen@gmail.com', N'0931283821', N'Hải Phòng Việt Nam', 2, 1)
INSERT [dbo].[tblCustomers] ([CustomerID], [CustomerName], [Gender], [Email], [Phone], [Address], [AccumulatedPoint], [Status]) VALUES (4, N'Đoàn Phạm Bích Hợp', 0, N'mimi123@gmail.com', N'01309123112', N'Sài Phố HCM', 4, 1)
INSERT [dbo].[tblCustomers] ([CustomerID], [CustomerName], [Gender], [Email], [Phone], [Address], [AccumulatedPoint], [Status]) VALUES (5, N'Bảo Châu', 0, N'trieumee24@gmail.com', N'0239129312', N'Gò Vấp TPHCM', 2, 1)
INSERT [dbo].[tblCustomers] ([CustomerID], [CustomerName], [Gender], [Email], [Phone], [Address], [AccumulatedPoint], [Status]) VALUES (6, N'Peter Võ', 1, N'vanphuong@gmail.com', N'3091283712', N'Gò Vấp TPHCM', 2, 1)
INSERT [dbo].[tblCustomers] ([CustomerID], [CustomerName], [Gender], [Email], [Phone], [Address], [AccumulatedPoint], [Status]) VALUES (7, N'Bích Ngọc', 0, N'bichngoc@gmail.com', N'0565466478', N'1358 Quang Trung', 1, 1)
INSERT [dbo].[tblCustomers] ([CustomerID], [CustomerName], [Gender], [Email], [Phone], [Address], [AccumulatedPoint], [Status]) VALUES (8, N'Thu Hà', 0, N'hathu@gmail.com', N'07891234567', N'Gò Vấp,Hồ Chí Minh,', 1, 1)
INSERT [dbo].[tblCustomers] ([CustomerID], [CustomerName], [Gender], [Email], [Phone], [Address], [AccumulatedPoint], [Status]) VALUES (9, N'Thái An ', 0, N'thaian@gmail.com', N'0565466489', N'Quang Trung, HCM', 2, 1)
INSERT [dbo].[tblCustomers] ([CustomerID], [CustomerName], [Gender], [Email], [Phone], [Address], [AccumulatedPoint], [Status]) VALUES (10, N'Quỳnh Anh ', 0, N'anhquynh@gmail.com', N'0565466476', N'Phạm Văn Chiêu, HCM', 2, 1)
INSERT [dbo].[tblCustomers] ([CustomerID], [CustomerName], [Gender], [Email], [Phone], [Address], [AccumulatedPoint], [Status]) VALUES (11, N'Minh Anh ', 0, N'anhminh@gmail.com', N'0346782390', N'Phan Huy Ích, HCM', 2, 1)
INSERT [dbo].[tblCustomers] ([CustomerID], [CustomerName], [Gender], [Email], [Phone], [Address], [AccumulatedPoint], [Status]) VALUES (12, N'Thành Đạt ', 1, N'datthanh@gmail.com', N'036475826', N'An Hoi, Hcm', 1, 1)
INSERT [dbo].[tblCustomers] ([CustomerID], [CustomerName], [Gender], [Email], [Phone], [Address], [AccumulatedPoint], [Status]) VALUES (13, N'Phúc Điền', 1, N'phucdien@gmail.com', N'0123456789', N'Nguyen Oanh', 2, 1)
INSERT [dbo].[tblCustomers] ([CustomerID], [CustomerName], [Gender], [Email], [Phone], [Address], [AccumulatedPoint], [Status]) VALUES (14, N'Kiều Duyên', 0, N'kieuduyen@gmail.com', N'0123456788', N'Nguyễn Oanh, HCm', 2, 1)
INSERT [dbo].[tblCustomers] ([CustomerID], [CustomerName], [Gender], [Email], [Phone], [Address], [AccumulatedPoint], [Status]) VALUES (15, N'Ngọc Hà', 1, N'ngocha@gmail.com', N'0312456789', N'Nguyễn Trãi', 1, 1)
INSERT [dbo].[tblCustomers] ([CustomerID], [CustomerName], [Gender], [Email], [Phone], [Address], [AccumulatedPoint], [Status]) VALUES (16, N'Minh Hiếu ', 0, N'minhhiu@gmai.com', N'0324156789', N'Cống Quỳnh', 2, 1)
INSERT [dbo].[tblCustomers] ([CustomerID], [CustomerName], [Gender], [Email], [Phone], [Address], [AccumulatedPoint], [Status]) VALUES (17, N'Vũ Hoàng', 0, N'hoangvu@gmail.com', N'0777777888', N'Quang Trung,Hcm', 1, 1)
INSERT [dbo].[tblCustomers] ([CustomerID], [CustomerName], [Gender], [Email], [Phone], [Address], [AccumulatedPoint], [Status]) VALUES (18, N'Quang Hưng', 0, N'quanghung@gmail.com', N'0555555777', N'Quang Trung, hcm ', 2, 1)
INSERT [dbo].[tblCustomers] ([CustomerID], [CustomerName], [Gender], [Email], [Phone], [Address], [AccumulatedPoint], [Status]) VALUES (19, N'Anh Huy', 0, N'huyanh@gmail.com', N'034567829', N'Quang Trung,Hcm', 3, 1)
INSERT [dbo].[tblCustomers] ([CustomerID], [CustomerName], [Gender], [Email], [Phone], [Address], [AccumulatedPoint], [Status]) VALUES (20, N'Gia Huy', 0, N'huygia@gmail.com', N'065789365', N'Phan Huy ích, Hcm', 1, 1)
INSERT [dbo].[tblCustomers] ([CustomerID], [CustomerName], [Gender], [Email], [Phone], [Address], [AccumulatedPoint], [Status]) VALUES (21, N'Minh Khanh', 0, N'minhkhanh@gmail.com', N'07462894625', N'Le Lai,HCm', 2, 1)
INSERT [dbo].[tblCustomers] ([CustomerID], [CustomerName], [Gender], [Email], [Phone], [Address], [AccumulatedPoint], [Status]) VALUES (22, N'Minh Khanh', 0, N'minhkhanh@gmail.com', N'07648265748', N'Le Loi, Hcm', 1, 1)
INSERT [dbo].[tblCustomers] ([CustomerID], [CustomerName], [Gender], [Email], [Phone], [Address], [AccumulatedPoint], [Status]) VALUES (23, N'Vân Khang', 0, N'vankhang@gamil.com', N'0345726895', N'Le Lai, Hcm', 2, 1)
INSERT [dbo].[tblCustomers] ([CustomerID], [CustomerName], [Gender], [Email], [Phone], [Address], [AccumulatedPoint], [Status]) VALUES (24, N'Phi Long', 0, N'philong@gmail.com', N'04657389174', N'Cống Quỳnh,Hcm', 2, 1)
INSERT [dbo].[tblCustomers] ([CustomerID], [CustomerName], [Gender], [Email], [Phone], [Address], [AccumulatedPoint], [Status]) VALUES (25, N'Duy Long', 0, N'duylong@gmail.com', N'07464826511', N'Cây Trâm, HCm', 2, 1)
INSERT [dbo].[tblCustomers] ([CustomerID], [CustomerName], [Gender], [Email], [Phone], [Address], [AccumulatedPoint], [Status]) VALUES (26, N'Trà My', 1, N'tramy@gmail.com', N'0567738264', N'Đồng Khởi, Hcm', 1, 1)
INSERT [dbo].[tblCustomers] ([CustomerID], [CustomerName], [Gender], [Email], [Phone], [Address], [AccumulatedPoint], [Status]) VALUES (27, N'Quang Nam', 0, N'quangnam@gmail.com', N'06473251783', N'Cô Giang, Hcm', 1, 1)
INSERT [dbo].[tblCustomers] ([CustomerID], [CustomerName], [Gender], [Email], [Phone], [Address], [AccumulatedPoint], [Status]) VALUES (28, N'Mỹ Ngân', 1, N'myngan@gmail.com', N'06473738264', N'Hàm Nghi', 2, 1)
INSERT [dbo].[tblCustomers] ([CustomerID], [CustomerName], [Gender], [Email], [Phone], [Address], [AccumulatedPoint], [Status]) VALUES (29, N'Khánh Ngân ', 1, N'khanhngan@gmail.com', N'037463525474', N'Quang Trung, Hcm', 1, 1)
INSERT [dbo].[tblCustomers] ([CustomerID], [CustomerName], [Gender], [Email], [Phone], [Address], [AccumulatedPoint], [Status]) VALUES (30, N'Bảo Ngọc', 1, N'baongoc', N'0708985877', N'An Hội, Hcm', 2, 1)
INSERT [dbo].[tblCustomers] ([CustomerID], [CustomerName], [Gender], [Email], [Phone], [Address], [AccumulatedPoint], [Status]) VALUES (31, N'Kim Ngọc', 1, N'ngockim@gmail.com', N'056565657', N'Lê Duẩn ', 1, 1)
INSERT [dbo].[tblCustomers] ([CustomerID], [CustomerName], [Gender], [Email], [Phone], [Address], [AccumulatedPoint], [Status]) VALUES (32, N'Như Ngọc', 1, N'nhungoc', N'0657538271', N'Lê Lai,Hcm', 2, 1)
INSERT [dbo].[tblCustomers] ([CustomerID], [CustomerName], [Gender], [Email], [Phone], [Address], [AccumulatedPoint], [Status]) VALUES (33, N'Thiện Nhân', 0, N'nhanthie@gmail.com', N'0846476264', N'Lê Duẩn,Hcm', 3, 1)
INSERT [dbo].[tblCustomers] ([CustomerID], [CustomerName], [Gender], [Email], [Phone], [Address], [AccumulatedPoint], [Status]) VALUES (34, N'Yến Nhi', 1, N'nhiyen@gamil.com', N'08765678282', N'Lê Lai, Hcm', 1, 1)
INSERT [dbo].[tblCustomers] ([CustomerID], [CustomerName], [Gender], [Email], [Phone], [Address], [AccumulatedPoint], [Status]) VALUES (35, N'Hùng Phúc ', 0, N'phuchung@gmail.com', N'0576282683', N'Quang Trung,Hcm', 2, 1)
INSERT [dbo].[tblCustomers] ([CustomerID], [CustomerName], [Gender], [Email], [Phone], [Address], [AccumulatedPoint], [Status]) VALUES (36, N'Kiều Vy', 1, N'vykieu@gmail.com', N'07364726381', N'Quang Trung, Hcm', 1, 1)
INSERT [dbo].[tblCustomers] ([CustomerID], [CustomerName], [Gender], [Email], [Phone], [Address], [AccumulatedPoint], [Status]) VALUES (37, N'Triệu Vương', 0, N'vuongtrieu@gmail.com', N'0746782625', N'Đồng Khởi, Hcm ', 2, 1)
INSERT [dbo].[tblCustomers] ([CustomerID], [CustomerName], [Gender], [Email], [Phone], [Address], [AccumulatedPoint], [Status]) VALUES (38, N'Hoàng Trường', 0, N'hoangtruong@gmail.com', N'0682725378', N'Hàm Nghi, Hcm', 2, 1)
INSERT [dbo].[tblCustomers] ([CustomerID], [CustomerName], [Gender], [Email], [Phone], [Address], [AccumulatedPoint], [Status]) VALUES (39, N'Anh Thư', 1, N'thuanh@gmail.com', N'064726482623', N'Quang Trung, Hcm ', 1, 1)
SET IDENTITY_INSERT [dbo].[tblCustomers] OFF
SET IDENTITY_INSERT [dbo].[tblPets] ON 

INSERT [dbo].[tblPets] ([PetID], [CategoryID], [PetName], [Age], [Gender], [Color], [QuantityInStock], [ImportPrice], [ExportPrice], [Status]) VALUES (1, 1, N'Chó Phú Quốc', 2, 1, N'Black', 3, 3000000.0000, 5000000.0000, 1)
INSERT [dbo].[tblPets] ([PetID], [CategoryID], [PetName], [Age], [Gender], [Color], [QuantityInStock], [ImportPrice], [ExportPrice], [Status]) VALUES (2, 2, N'Mèo Anh lông ngắn', 5, 1, N'Gray', 4, 10000000.0000, 15000000.0000, 1)
INSERT [dbo].[tblPets] ([PetID], [CategoryID], [PetName], [Age], [Gender], [Color], [QuantityInStock], [ImportPrice], [ExportPrice], [Status]) VALUES (3, 3, N'Thỏ Anh', 3, 0, N'White', 6, 2000000.0000, 3000000.0000, 1)
INSERT [dbo].[tblPets] ([PetID], [CategoryID], [PetName], [Age], [Gender], [Color], [QuantityInStock], [ImportPrice], [ExportPrice], [Status]) VALUES (4, 4, N'Chuột hamster campell', 2, 1, N'White-Yellow', 10, 100000.0000, 200000.0000, 1)
INSERT [dbo].[tblPets] ([PetID], [CategoryID], [PetName], [Age], [Gender], [Color], [QuantityInStock], [ImportPrice], [ExportPrice], [Status]) VALUES (5, 1, N'Chó Pug', 2, 1, N'Brown', 5, 10000000.0000, 15000000.0000, 1)
INSERT [dbo].[tblPets] ([PetID], [CategoryID], [PetName], [Age], [Gender], [Color], [QuantityInStock], [ImportPrice], [ExportPrice], [Status]) VALUES (6, 2, N'Mèo Anh lông dài', 3, 1, N'Gray', 5, 10000000.0000, 15000000.0000, 1)
INSERT [dbo].[tblPets] ([PetID], [CategoryID], [PetName], [Age], [Gender], [Color], [QuantityInStock], [ImportPrice], [ExportPrice], [Status]) VALUES (7, 3, N'Thỏ Đức', 2, 0, N'Black', 6, 120000.0000, 300000.0000, 1)
INSERT [dbo].[tblPets] ([PetID], [CategoryID], [PetName], [Age], [Gender], [Color], [QuantityInStock], [ImportPrice], [ExportPrice], [Status]) VALUES (8, 4, N'Chuột hamster Winter White', 3, 0, N'Yellow', 6, 100000.0000, 300000.0000, 1)
INSERT [dbo].[tblPets] ([PetID], [CategoryID], [PetName], [Age], [Gender], [Color], [QuantityInStock], [ImportPrice], [ExportPrice], [Status]) VALUES (9, 1, N'Chó Poodle', 3, 0, N'Black', 3, 8000000.0000, 15000000.0000, 1)
INSERT [dbo].[tblPets] ([PetID], [CategoryID], [PetName], [Age], [Gender], [Color], [QuantityInStock], [ImportPrice], [ExportPrice], [Status]) VALUES (10, 1, N'Chó Beagle', 10, 0, N'Brown', 5, 10000000.0000, 15000000.0000, 1)
INSERT [dbo].[tblPets] ([PetID], [CategoryID], [PetName], [Age], [Gender], [Color], [QuantityInStock], [ImportPrice], [ExportPrice], [Status]) VALUES (11, 1, N'Chó Chihuahua', 5, 1, N'Brown', 10, 5000000.0000, 7000000.0000, 1)
INSERT [dbo].[tblPets] ([PetID], [CategoryID], [PetName], [Age], [Gender], [Color], [QuantityInStock], [ImportPrice], [ExportPrice], [Status]) VALUES (12, 1, N'Chó Corgi', 4, 1, N'Yellow-White', 2, 10000000.0000, 15000000.0000, 1)
INSERT [dbo].[tblPets] ([PetID], [CategoryID], [PetName], [Age], [Gender], [Color], [QuantityInStock], [ImportPrice], [ExportPrice], [Status]) VALUES (13, 2, N'Mèo Ba Tư', 3, 0, N'Brown', 5, 10000000.0000, 20000000.0000, 1)
INSERT [dbo].[tblPets] ([PetID], [CategoryID], [PetName], [Age], [Gender], [Color], [QuantityInStock], [ImportPrice], [ExportPrice], [Status]) VALUES (14, 2, N'Mèo Mucnhkin', 2, 1, N'White', 5, 7000000.0000, 9000000.0000, 1)
INSERT [dbo].[tblPets] ([PetID], [CategoryID], [PetName], [Age], [Gender], [Color], [QuantityInStock], [ImportPrice], [ExportPrice], [Status]) VALUES (15, 2, N'Mèo Scottish tai cụp', 4, 1, N'Gray-White', 3, 5000000.0000, 10000000.0000, 1)
INSERT [dbo].[tblPets] ([PetID], [CategoryID], [PetName], [Age], [Gender], [Color], [QuantityInStock], [ImportPrice], [ExportPrice], [Status]) VALUES (16, 3, N'Thỏ Minilop', 2, 0, N'White', 5, 300000.0000, 500000.0000, 1)
INSERT [dbo].[tblPets] ([PetID], [CategoryID], [PetName], [Age], [Gender], [Color], [QuantityInStock], [ImportPrice], [ExportPrice], [Status]) VALUES (17, 3, N'Thỏ lion', 3, 1, N'Yellow', 8, 10000000.0000, 20000000.0000, 1)
INSERT [dbo].[tblPets] ([PetID], [CategoryID], [PetName], [Age], [Gender], [Color], [QuantityInStock], [ImportPrice], [ExportPrice], [Status]) VALUES (18, 3, N'Thỏ Hymalaya', 7, 0, N'White-Black', 7, 200000.0000, 700000.0000, 1)
INSERT [dbo].[tblPets] ([PetID], [CategoryID], [PetName], [Age], [Gender], [Color], [QuantityInStock], [ImportPrice], [ExportPrice], [Status]) VALUES (19, 4, N' Chuột Hamster Roborovski', 2, 0, N'Gray', 10, 200000.0000, 500000.0000, 1)
INSERT [dbo].[tblPets] ([PetID], [CategoryID], [PetName], [Age], [Gender], [Color], [QuantityInStock], [ImportPrice], [ExportPrice], [Status]) VALUES (20, 4, N'Chuột Hamster Bear (gấu)', 2, 0, N'Brown', 5, 400000.0000, 800000.0000, 1)
INSERT [dbo].[tblPets] ([PetID], [CategoryID], [PetName], [Age], [Gender], [Color], [QuantityInStock], [ImportPrice], [ExportPrice], [Status]) VALUES (21, 4, N'Chuột Hamster Trung Quốc', 3, 1, N'Black', 8, 300000.0000, 500000.0000, 1)
INSERT [dbo].[tblPets] ([PetID], [CategoryID], [PetName], [Age], [Gender], [Color], [QuantityInStock], [ImportPrice], [ExportPrice], [Status]) VALUES (22, 1, N'Chó Husky', 5, 1, N'Black-White', 5, 10000000.0000, 20000000.0000, 1)
INSERT [dbo].[tblPets] ([PetID], [CategoryID], [PetName], [Age], [Gender], [Color], [QuantityInStock], [ImportPrice], [ExportPrice], [Status]) VALUES (23, 1, N'Chó Shiba Inu', 3, 1, N'Light-Yellow', 3, 2000000.0000, 3000000.0000, 1)
INSERT [dbo].[tblPets] ([PetID], [CategoryID], [PetName], [Age], [Gender], [Color], [QuantityInStock], [ImportPrice], [ExportPrice], [Status]) VALUES (24, 1, N'Chó Phú Quốc', 10, 1, N'Brown', 4, 200000.0000, 1000000.0000, 1)
INSERT [dbo].[tblPets] ([PetID], [CategoryID], [PetName], [Age], [Gender], [Color], [QuantityInStock], [ImportPrice], [ExportPrice], [Status]) VALUES (25, 1, N'Chó Phốc Sóc', 5, 0, N'White', 5, 7000000.0000, 12000000.0000, 1)
INSERT [dbo].[tblPets] ([PetID], [CategoryID], [PetName], [Age], [Gender], [Color], [QuantityInStock], [ImportPrice], [ExportPrice], [Status]) VALUES (26, 2, N'Mèo Maine Coon', 5, 0, N'Gray-Black', 5, 10000000.0000, 2000000.0000, 1)
INSERT [dbo].[tblPets] ([PetID], [CategoryID], [PetName], [Age], [Gender], [Color], [QuantityInStock], [ImportPrice], [ExportPrice], [Status]) VALUES (27, 2, N'Mèo Ragdoll', 3, 1, N'White', 3, 5000000.0000, 7000000.0000, 1)
INSERT [dbo].[tblPets] ([PetID], [CategoryID], [PetName], [Age], [Gender], [Color], [QuantityInStock], [ImportPrice], [ExportPrice], [Status]) VALUES (28, 2, N'Mèo Ai Cập', 3, 1, N'Point', 2, 17000000.0000, 25000000.0000, 1)
INSERT [dbo].[tblPets] ([PetID], [CategoryID], [PetName], [Age], [Gender], [Color], [QuantityInStock], [ImportPrice], [ExportPrice], [Status]) VALUES (29, 2, N'Mèo Xiêm ', 7, 0, N'Black-White', 3, 12000000.0000, 20000000.0000, 1)
INSERT [dbo].[tblPets] ([PetID], [CategoryID], [PetName], [Age], [Gender], [Color], [QuantityInStock], [ImportPrice], [ExportPrice], [Status]) VALUES (30, 3, N'Thỏ Ba Lan', 3, 1, N'Brown', 3, 5000000.0000, 7000000.0000, 1)
INSERT [dbo].[tblPets] ([PetID], [CategoryID], [PetName], [Age], [Gender], [Color], [QuantityInStock], [ImportPrice], [ExportPrice], [Status]) VALUES (31, 3, N'Thỏ Havana', 7, 1, N'White', 2, 7000000.0000, 9000000.0000, 1)
INSERT [dbo].[tblPets] ([PetID], [CategoryID], [PetName], [Age], [Gender], [Color], [QuantityInStock], [ImportPrice], [ExportPrice], [Status]) VALUES (32, 3, N'Thỏ Mina Satin', 2, 1, N'Gray', 1, 4000000.0000, 8000000.0000, 1)
INSERT [dbo].[tblPets] ([PetID], [CategoryID], [PetName], [Age], [Gender], [Color], [QuantityInStock], [ImportPrice], [ExportPrice], [Status]) VALUES (33, 3, N'Thỏ Mini Rex', 3, 1, N'Red', 2, 1500000.0000, 3000000.0000, 1)
INSERT [dbo].[tblPets] ([PetID], [CategoryID], [PetName], [Age], [Gender], [Color], [QuantityInStock], [ImportPrice], [ExportPrice], [Status]) VALUES (34, 4, N'Hamster Campell trà sữa', 2, 1, N'Light Brown', 3, 2000000.0000, 2500000.0000, 1)
INSERT [dbo].[tblPets] ([PetID], [CategoryID], [PetName], [Age], [Gender], [Color], [QuantityInStock], [ImportPrice], [ExportPrice], [Status]) VALUES (35, 1, N'Chó Golden', 13, 0, N'Light Yellow', 3, 15000000.0000, 25000000.0000, 1)
INSERT [dbo].[tblPets] ([PetID], [CategoryID], [PetName], [Age], [Gender], [Color], [QuantityInStock], [ImportPrice], [ExportPrice], [Status]) VALUES (36, 1, N'Chó Bully', 15, 1, N'Yellow', 1, 10000000.0000, 12000000.0000, 1)
INSERT [dbo].[tblPets] ([PetID], [CategoryID], [PetName], [Age], [Gender], [Color], [QuantityInStock], [ImportPrice], [ExportPrice], [Status]) VALUES (37, 1, N'Chó Samoyed', 8, 1, N'White', 3, 12000000.0000, 17000000.0000, 1)
INSERT [dbo].[tblPets] ([PetID], [CategoryID], [PetName], [Age], [Gender], [Color], [QuantityInStock], [ImportPrice], [ExportPrice], [Status]) VALUES (38, 1, N'Chó Maltese', 9, 0, N'Brown', 3, 11000000.0000, 15000000.0000, 1)
INSERT [dbo].[tblPets] ([PetID], [CategoryID], [PetName], [Age], [Gender], [Color], [QuantityInStock], [ImportPrice], [ExportPrice], [Status]) VALUES (39, 5, N'Nhím cảnh Pintos', 2, 1, N'Light Brown', 2, 100000.0000, 300000.0000, 1)
INSERT [dbo].[tblPets] ([PetID], [CategoryID], [PetName], [Age], [Gender], [Color], [QuantityInStock], [ImportPrice], [ExportPrice], [Status]) VALUES (40, 5, N'Nhím cảnh Socola – Chocolate', 1, 0, N'Brown', 3, 100000.0000, 200000.0000, 1)
INSERT [dbo].[tblPets] ([PetID], [CategoryID], [PetName], [Age], [Gender], [Color], [QuantityInStock], [ImportPrice], [ExportPrice], [Status]) VALUES (41, 5, N'Nhím cảnh Cam', 3, 1, N'Orange', 2, 100000.0000, 300000.0000, 1)
INSERT [dbo].[tblPets] ([PetID], [CategoryID], [PetName], [Age], [Gender], [Color], [QuantityInStock], [ImportPrice], [ExportPrice], [Status]) VALUES (42, 5, N'Nhím muối tiêu', 2, 1, N'Black-White', 4, 200000.0000, 500000.0000, 1)
INSERT [dbo].[tblPets] ([PetID], [CategoryID], [PetName], [Age], [Gender], [Color], [QuantityInStock], [ImportPrice], [ExportPrice], [Status]) VALUES (43, 5, N'Nhím cảnh trắng', 2, 0, N'White', 2, 150000.0000, 400000.0000, 1)
INSERT [dbo].[tblPets] ([PetID], [CategoryID], [PetName], [Age], [Gender], [Color], [QuantityInStock], [ImportPrice], [ExportPrice], [Status]) VALUES (44, 2, N'Kitty', 1, 0, N'White-Pink', 2, 450000.0000, 600000.0000, 1)
INSERT [dbo].[tblPets] ([PetID], [CategoryID], [PetName], [Age], [Gender], [Color], [QuantityInStock], [ImportPrice], [ExportPrice], [Status]) VALUES (45, 5, N'Nhím Tàu', 1, 0, N'Black', 1, 2320000.0000, 5000000.0000, 1)
SET IDENTITY_INSERT [dbo].[tblPets] OFF
ALTER TABLE [dbo].[tblBillDetails]  WITH CHECK ADD  CONSTRAINT [FK_tblBillDetails_tblBills] FOREIGN KEY([BillID])
REFERENCES [dbo].[tblBills] ([BillID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblBillDetails] CHECK CONSTRAINT [FK_tblBillDetails_tblBills]
GO
ALTER TABLE [dbo].[tblBillDetails]  WITH CHECK ADD  CONSTRAINT [FK_tblBillDetails_tblPets] FOREIGN KEY([PetID])
REFERENCES [dbo].[tblPets] ([PetID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblBillDetails] CHECK CONSTRAINT [FK_tblBillDetails_tblPets]
GO
ALTER TABLE [dbo].[tblBills]  WITH CHECK ADD  CONSTRAINT [FK_tblBills_tblCustomers] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[tblCustomers] ([CustomerID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblBills] CHECK CONSTRAINT [FK_tblBills_tblCustomers]
GO
ALTER TABLE [dbo].[tblPets]  WITH CHECK ADD  CONSTRAINT [FK_tblPets_tblCategories] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[tblCategories] ([CategoryID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblPets] CHECK CONSTRAINT [FK_tblPets_tblCategories]
GO
USE [master]
GO
ALTER DATABASE [PetStore] SET  READ_WRITE 
GO

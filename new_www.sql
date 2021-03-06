USE [master]
GO
/****** Object:  Database [ShopMayIn]    Script Date: 1/1/2021 2:50:02 PM ******/
CREATE DATABASE [ShopMayIn]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ShopMayIn', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\ShopMayIn.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'ShopMayIn_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\ShopMayIn_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [ShopMayIn] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ShopMayIn].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ShopMayIn] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ShopMayIn] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ShopMayIn] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ShopMayIn] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ShopMayIn] SET ARITHABORT OFF 
GO
ALTER DATABASE [ShopMayIn] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ShopMayIn] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [ShopMayIn] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ShopMayIn] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ShopMayIn] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ShopMayIn] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ShopMayIn] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ShopMayIn] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ShopMayIn] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ShopMayIn] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ShopMayIn] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ShopMayIn] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ShopMayIn] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ShopMayIn] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ShopMayIn] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ShopMayIn] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ShopMayIn] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ShopMayIn] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ShopMayIn] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ShopMayIn] SET  MULTI_USER 
GO
ALTER DATABASE [ShopMayIn] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ShopMayIn] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ShopMayIn] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ShopMayIn] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [ShopMayIn]
GO
/****** Object:  Table [dbo].[CT_HoaDon]    Script Date: 1/1/2021 2:50:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CT_HoaDon](
	[maCTHoaDon] [int] IDENTITY(1,1) NOT NULL,
	[soLuong] [int] NULL,
	[thanhTien] [float] NULL,
	[maSanPham] [int] NOT NULL,
	[maHoaDon] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[maCTHoaDon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[HoaDon]    Script Date: 1/1/2021 2:50:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HoaDon](
	[maHoaDon] [int] NOT NULL,
	[tinhtrang] [nvarchar](20) NULL,
	[tongTien] [float] NULL,
	[hokh] [nvarchar](20) NULL,
	[tenkh] [nvarchar](20) NULL,
	[sdtkh] [nvarchar](11) NULL,
	[diachikh] [nvarchar](40) NULL,
	[email] [nvarchar](30) NULL,
	[ngayhoadon] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[maHoaDon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SanPham]    Script Date: 1/1/2021 2:50:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SanPham](
	[maSanPham] [int] IDENTITY(1,1) NOT NULL,
	[tenSanPham] [nvarchar](50) NULL,
	[donGia] [float] NULL,
	[urlHinhAnh] [nvarchar](max) NULL,
	[moTa] [nvarchar](max) NULL,
	[tinhTrang] [nvarchar](50) NULL,
	[soLuongTon] [int] NULL,
	[loaiSanPham] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[maSanPham] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TaiKhoan]    Script Date: 1/1/2021 2:50:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TaiKhoan](
	[maTaiKhoan] [int] IDENTITY(1,1) NOT NULL,
	[username] [nvarchar](20) NOT NULL,
	[passwords] [nvarchar](20) NOT NULL,
	[loaitk] [nvarchar](20) NULL,
 CONSTRAINT [PK_TaiKhoan] PRIMARY KEY CLUSTERED 
(
	[maTaiKhoan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[CT_HoaDon] ON 

INSERT [dbo].[CT_HoaDon] ([maCTHoaDon], [soLuong], [thanhTien], [maSanPham], [maHoaDon]) VALUES (1, 5, 5000000, 1, 10085)
INSERT [dbo].[CT_HoaDon] ([maCTHoaDon], [soLuong], [thanhTien], [maSanPham], [maHoaDon]) VALUES (2, 5, 35000000, 2, 10085)
SET IDENTITY_INSERT [dbo].[CT_HoaDon] OFF
INSERT [dbo].[HoaDon] ([maHoaDon], [tinhtrang], [tongTien], [hokh], [tenkh], [sdtkh], [diachikh], [email], [ngayhoadon]) VALUES (10085, N'da duyet', 40000000, N'nguy?n', N'thu?n', N'123', N'123 abc', N'nguyendinhthuan1698@gmail.com', CAST(0xFE410B00 AS Date))
SET IDENTITY_INSERT [dbo].[SanPham] ON 

INSERT [dbo].[SanPham] ([maSanPham], [tenSanPham], [donGia], [urlHinhAnh], [moTa], [tinhTrang], [soLuongTon], [loaiSanPham]) VALUES (1, N'Máy in s? 1', 1000000, N'may-in-hp-laserjet-pro-m15a.jpg', N'Thông tin máy in s? 1', N'false', 15, N'Máy Scan')
INSERT [dbo].[SanPham] ([maSanPham], [tenSanPham], [donGia], [urlHinhAnh], [moTa], [tinhTrang], [soLuongTon], [loaiSanPham]) VALUES (2, N'Máy in s? 2', 7000000, N'mayin.PNG', N'Thông tin máy in s? 2', N'false', 5, N'Máy in')
SET IDENTITY_INSERT [dbo].[SanPham] OFF
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__TaiKhoan__F3DBC57202098CAA]    Script Date: 1/1/2021 2:50:02 PM ******/
ALTER TABLE [dbo].[TaiKhoan] ADD UNIQUE NONCLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__TaiKhoan__F3DBC572E391C080]    Script Date: 1/1/2021 2:50:02 PM ******/
ALTER TABLE [dbo].[TaiKhoan] ADD UNIQUE NONCLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CT_HoaDon]  WITH CHECK ADD  CONSTRAINT [FK_CT_HoaDon_HoaDon] FOREIGN KEY([maHoaDon])
REFERENCES [dbo].[HoaDon] ([maHoaDon])
GO
ALTER TABLE [dbo].[CT_HoaDon] CHECK CONSTRAINT [FK_CT_HoaDon_HoaDon]
GO
ALTER TABLE [dbo].[CT_HoaDon]  WITH CHECK ADD  CONSTRAINT [FK_CT_HoaDon_SanPham] FOREIGN KEY([maSanPham])
REFERENCES [dbo].[SanPham] ([maSanPham])
GO
ALTER TABLE [dbo].[CT_HoaDon] CHECK CONSTRAINT [FK_CT_HoaDon_SanPham]
GO
ALTER TABLE [dbo].[CT_HoaDon]  WITH CHECK ADD  CONSTRAINT [FK_HoaDon_HoaDon] FOREIGN KEY([maHoaDon])
REFERENCES [dbo].[HoaDon] ([maHoaDon])
GO
ALTER TABLE [dbo].[CT_HoaDon] CHECK CONSTRAINT [FK_HoaDon_HoaDon]
GO
ALTER TABLE [dbo].[CT_HoaDon]  WITH CHECK ADD  CONSTRAINT [FK_HoaDon_SanPham] FOREIGN KEY([maSanPham])
REFERENCES [dbo].[SanPham] ([maSanPham])
GO
ALTER TABLE [dbo].[CT_HoaDon] CHECK CONSTRAINT [FK_HoaDon_SanPham]
GO
USE [master]
GO
ALTER DATABASE [ShopMayIn] SET  READ_WRITE 
GO

USE [master]
GO
/****** Object:  Database [ShopOnline]    Script Date: 12/19/2020 10:23:09 PM ******/
CREATE DATABASE [ShopOnline]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ShopOnline', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\ShopOnline.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'ShopOnline_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\ShopOnline_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [ShopOnline] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ShopOnline].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ShopOnline] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ShopOnline] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ShopOnline] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ShopOnline] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ShopOnline] SET ARITHABORT OFF 
GO
ALTER DATABASE [ShopOnline] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ShopOnline] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [ShopOnline] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ShopOnline] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ShopOnline] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ShopOnline] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ShopOnline] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ShopOnline] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ShopOnline] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ShopOnline] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ShopOnline] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ShopOnline] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ShopOnline] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ShopOnline] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ShopOnline] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ShopOnline] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ShopOnline] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ShopOnline] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ShopOnline] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ShopOnline] SET  MULTI_USER 
GO
ALTER DATABASE [ShopOnline] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ShopOnline] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ShopOnline] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ShopOnline] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [ShopOnline]
GO
/****** Object:  Table [dbo].[CT_HoaDon]    Script Date: 12/19/2020 10:23:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CT_HoaDon](
	[maCTHoaDon] [int] IDENTITY(1,1) NOT NULL,
	[soLuong] [int] NULL,
	[thanhTien] [float] NULL,
	[maSanPham] [nvarchar](20) NOT NULL,
	[maHoaDon] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[maCTHoaDon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[HoaDon]    Script Date: 12/19/2020 10:23:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HoaDon](
	[maHoaDon] [int] IDENTITY(1,1) NOT NULL,
	[tinhtrang] [nvarchar](20) NULL,
	[tongTien] [float] NULL,
	[maTaiKhoan] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[maHoaDon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[KhachHang]    Script Date: 12/19/2020 10:23:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhachHang](
	[maKhachHang] [int] IDENTITY(1,1) NOT NULL,
	[tenKhachHang] [nvarchar](50) NULL,
	[diaChi] [nvarchar](300) NULL,
	[sdt] [nvarchar](11) NULL,
	[email] [nvarchar](50) NULL,
	[maTaiKhoan] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[maKhachHang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SanPham]    Script Date: 12/19/2020 10:23:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SanPham](
	[maSanPham] [nvarchar](20) NOT NULL,
	[tenSanPham] [nvarchar](50) NULL,
	[gia] [float] NULL,
	[URLHinhAnh] [nvarchar](max) NULL,
	[chitietSP] [nvarchar](max) NULL,
	[tinhTrang] [nvarchar](50) NULL,
	[soLuongTon] [int] NULL,
	[loaiSP] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[maSanPham] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TaiKhoan]    Script Date: 12/19/2020 10:23:09 PM ******/
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
INSERT [dbo].[SanPham] ([maSanPham], [tenSanPham], [gia], [URLHinhAnh], [chitietSP], [tinhTrang], [soLuongTon], [loaiSP]) VALUES (N'e', N'e', 10000, N'themes/images/products/Capture.PNG', N'e', N'false', 0, N'may scan')
INSERT [dbo].[SanPham] ([maSanPham], [tenSanPham], [gia], [URLHinhAnh], [chitietSP], [tinhTrang], [soLuongTon], [loaiSP]) VALUES (N'MI00002', N'Máy in laser HP LaserJet Pro M15a (W2G50A)', 2000000, N'themes/images/may-in-hp-laserjet-pro-m15a.jpg', N'Thiết kế nhỏ gọn, dễ dàng bố trí trên bàn làm việc.
Tốc độ in nhanh chóng, tiện lợi. Chất lượng bản in rõ nét, không nhòe màu mực. Tương thích tốt với đa số các thiết bị hiện hành chạy hệ điều hành ', N'true', 20, N'may in')
INSERT [dbo].[SanPham] ([maSanPham], [tenSanPham], [gia], [URLHinhAnh], [chitietSP], [tinhTrang], [soLuongTon], [loaiSP]) VALUES (N'MI00003', N'Máy in laser HP Jet Pro M15w W2G51A wifi', 2500000, N'themes/images/may-in-hp-laserjet-pro-m15w.jpg', N'Thiết kế nhỏ gọn, dễ dàng bố trí trên bàn làm việc.
Tốc độ in nhanh chóng, tiện lợi. Chất lượng bản in rõ nét, không nhòe màu mực. Tương thích tốt với đa số các thiết bị hiện hành chạy hệ điều hành ', N'true', 20, N'may in')
SET IDENTITY_INSERT [dbo].[TaiKhoan] ON 

INSERT [dbo].[TaiKhoan] ([maTaiKhoan], [username], [passwords], [loaitk]) VALUES (1, N'admin', N'admin', N'1')
SET IDENTITY_INSERT [dbo].[TaiKhoan] OFF
/****** Object:  Index [UQ__TaiKhoan__8FFF6A9CFC9C2C77]    Script Date: 12/19/2020 10:23:09 PM ******/
ALTER TABLE [dbo].[TaiKhoan] ADD UNIQUE NONCLUSTERED 
(
	[maTaiKhoan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__TaiKhoan__F3DBC572C505D982]    Script Date: 12/19/2020 10:23:09 PM ******/
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
ALTER TABLE [dbo].[HoaDon]  WITH CHECK ADD  CONSTRAINT [FK_HoaDon_TaiKhoan] FOREIGN KEY([maTaiKhoan])
REFERENCES [dbo].[TaiKhoan] ([maTaiKhoan])
GO
ALTER TABLE [dbo].[HoaDon] CHECK CONSTRAINT [FK_HoaDon_TaiKhoan]
GO
ALTER TABLE [dbo].[KhachHang]  WITH CHECK ADD  CONSTRAINT [FK_KhachHang_Taikhoan] FOREIGN KEY([maTaiKhoan])
REFERENCES [dbo].[TaiKhoan] ([maTaiKhoan])
GO
ALTER TABLE [dbo].[KhachHang] CHECK CONSTRAINT [FK_KhachHang_Taikhoan]
GO
USE [master]
GO
ALTER DATABASE [ShopOnline] SET  READ_WRITE 
GO

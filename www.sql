USE [master]
GO
/****** Object:  Database [ShopMayIn]    Script Date: 12/17/2020 3:55:57 PM ******/
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
/****** Object:  Table [dbo].[SanPham]    Script Date: 12/17/2020 3:55:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SanPham](
	[maSanPham] [nvarchar](20) NOT NULL,
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
INSERT [dbo].[SanPham] ([maSanPham], [tenSanPham], [donGia], [urlHinhAnh], [moTa], [tinhTrang], [soLuongTon], [loaiSanPham]) VALUES (N'MI00002', N'Máy in laser HP LaserJet Pro M15a (W2G50A)', 2000000, N'themes/images/products/may-in-hp-laserjet-pro-m15a.jpg', N'Thiết kế nhỏ gọn, dễ dàng bố trí trên bàn làm việc.
Tốc độ in nhanh chóng, tiện lợi. Chất lượng bản in rõ nét, không nhòe màu mực. Tương thích tốt với đa số các thiết bị hiện hành chạy hệ điều hành ', N'true', 20, N'may in')
INSERT [dbo].[SanPham] ([maSanPham], [tenSanPham], [donGia], [urlHinhAnh], [moTa], [tinhTrang], [soLuongTon], [loaiSanPham]) VALUES (N'MI00003', N'Máy in laser HP Jet Pro M15w W2G51A wifi', 2500000, N'themes/images/products/may-in-hp-laserjet-pro-m15w.jpg', N'Thiết kế nhỏ gọn, dễ dàng bố trí trên bàn làm việc.
Tốc độ in nhanh chóng, tiện lợi. Chất lượng bản in rõ nét, không nhòe màu mực. Tương thích tốt với đa số các thiết bị hiện hành chạy hệ điều hành ', N'true', 20, N'may in')
USE [master]
GO
ALTER DATABASE [ShopMayIn] SET  READ_WRITE 
GO

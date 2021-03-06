USE [master]
GO
/****** Object:  Database [QLMuaBanXe]    Script Date: 12/24/2020 1:37:41 PM ******/
CREATE DATABASE [QLMuaBanXe]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QLMuaBanXe', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\QLMuaBanXe.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'QLMuaBanXe_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\QLMuaBanXe_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [QLMuaBanXe] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QLMuaBanXe].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QLMuaBanXe] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QLMuaBanXe] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QLMuaBanXe] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QLMuaBanXe] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QLMuaBanXe] SET ARITHABORT OFF 
GO
ALTER DATABASE [QLMuaBanXe] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [QLMuaBanXe] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QLMuaBanXe] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QLMuaBanXe] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QLMuaBanXe] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QLMuaBanXe] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QLMuaBanXe] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QLMuaBanXe] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QLMuaBanXe] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QLMuaBanXe] SET  DISABLE_BROKER 
GO
ALTER DATABASE [QLMuaBanXe] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QLMuaBanXe] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QLMuaBanXe] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QLMuaBanXe] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QLMuaBanXe] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QLMuaBanXe] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QLMuaBanXe] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QLMuaBanXe] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [QLMuaBanXe] SET  MULTI_USER 
GO
ALTER DATABASE [QLMuaBanXe] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QLMuaBanXe] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QLMuaBanXe] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QLMuaBanXe] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [QLMuaBanXe] SET DELAYED_DURABILITY = DISABLED 
GO
USE [QLMuaBanXe]
GO
/****** Object:  Table [dbo].[CTHoaDonXe]    Script Date: 12/24/2020 1:37:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CTHoaDonXe](
	[maHoaDon] [nvarchar](6) NOT NULL,
	[maXe] [nvarchar](6) NOT NULL,
	[soLuong] [int] NOT NULL,
	[donGia] [money] NOT NULL,
	[thanhTien] [money] NOT NULL,
	[ngayLap] [datetime] NOT NULL,
 CONSTRAINT [PK_CTHoaDonXe] PRIMARY KEY CLUSTERED 
(
	[maHoaDon] ASC,
	[maXe] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HoaDonXe]    Script Date: 12/24/2020 1:37:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HoaDonXe](
	[maHoaDon] [nvarchar](6) NOT NULL,
	[maNhanVien] [nvarchar](6) NOT NULL,
	[maKhachHang] [nvarchar](6) NOT NULL,
 CONSTRAINT [PK_HoaDonXe_1] PRIMARY KEY CLUSTERED 
(
	[maHoaDon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KhachHang]    Script Date: 12/24/2020 1:37:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhachHang](
	[maKhachHang] [nvarchar](6) NOT NULL,
	[tenKhachHang] [nvarchar](200) NOT NULL,
	[soDienThoai] [nvarchar](10) NOT NULL,
	[CMND] [nvarchar](9) NOT NULL,
	[diaChiKhachHang] [nvarchar](200) NOT NULL,
 CONSTRAINT [PK_KhachHang] PRIMARY KEY CLUSTERED 
(
	[maKhachHang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MauXe]    Script Date: 12/24/2020 1:37:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MauXe](
	[maMau] [nvarchar](6) NOT NULL,
	[tenMau] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_MauXe] PRIMARY KEY CLUSTERED 
(
	[maMau] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NhaCungCap]    Script Date: 12/24/2020 1:37:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhaCungCap](
	[maNCC] [nvarchar](6) NOT NULL,
	[tenNCC] [nvarchar](200) NOT NULL,
	[email] [nvarchar](200) NOT NULL,
	[diaChiNCC] [nvarchar](200) NOT NULL,
 CONSTRAINT [PK_NhaCungCap] PRIMARY KEY CLUSTERED 
(
	[maNCC] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NhanVien]    Script Date: 12/24/2020 1:37:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhanVien](
	[maNhanVien] [nvarchar](6) NOT NULL,
	[tenNhanVien] [nvarchar](200) NOT NULL,
	[soDienThoai] [nvarchar](10) NOT NULL,
	[gioiTinh] [bit] NOT NULL,
	[CMND] [nvarchar](9) NOT NULL,
	[diaChiNV] [nvarchar](200) NOT NULL,
	[tinhTrang] [bit] NOT NULL,
	[chucVu] [bit] NOT NULL,
 CONSTRAINT [PK_NhanVien] PRIMARY KEY CLUSTERED 
(
	[maNhanVien] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NhaSanXuat]    Script Date: 12/24/2020 1:37:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhaSanXuat](
	[maNSX] [nvarchar](6) NOT NULL,
	[tenNSX] [nvarchar](200) NOT NULL,
	[email] [nvarchar](200) NOT NULL,
	[nuocSX] [nvarchar](200) NOT NULL,
	[namSX] [datetime] NOT NULL,
 CONSTRAINT [PK_NuocSanXuat] PRIMARY KEY CLUSTERED 
(
	[maNSX] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TaiKhoan]    Script Date: 12/24/2020 1:37:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TaiKhoan](
	[maNhanVien] [nvarchar](6) NOT NULL,
	[taiKhoan] [nvarchar](50) NOT NULL,
	[matKhau] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_TaiKhoan] PRIMARY KEY CLUSTERED 
(
	[maNhanVien] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Xe]    Script Date: 12/24/2020 1:37:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Xe](
	[maXe] [nvarchar](6) NOT NULL,
	[nhanHieu] [nvarchar](50) NOT NULL,
	[maMau] [nvarchar](6) NOT NULL,
	[dungTich] [int] NOT NULL,
	[maNCC] [nvarchar](6) NOT NULL,
	[maNSX] [nvarchar](6) NOT NULL,
	[soLuong] [int] NOT NULL,
	[giaNhap] [money] NOT NULL,
	[ngayNhap] [datetime] NOT NULL,
 CONSTRAINT [PK_Xe] PRIMARY KEY CLUSTERED 
(
	[maXe] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CTHoaDonXe]  WITH CHECK ADD  CONSTRAINT [FK_CTHoaDonXe_HoaDonXe] FOREIGN KEY([maHoaDon])
REFERENCES [dbo].[HoaDonXe] ([maHoaDon])
GO
ALTER TABLE [dbo].[CTHoaDonXe] CHECK CONSTRAINT [FK_CTHoaDonXe_HoaDonXe]
GO
ALTER TABLE [dbo].[CTHoaDonXe]  WITH CHECK ADD  CONSTRAINT [FK_CTHoaDonXe_Xe] FOREIGN KEY([maXe])
REFERENCES [dbo].[Xe] ([maXe])
GO
ALTER TABLE [dbo].[CTHoaDonXe] CHECK CONSTRAINT [FK_CTHoaDonXe_Xe]
GO
ALTER TABLE [dbo].[HoaDonXe]  WITH CHECK ADD  CONSTRAINT [FK_HoaDonXe_KhachHang] FOREIGN KEY([maKhachHang])
REFERENCES [dbo].[KhachHang] ([maKhachHang])
GO
ALTER TABLE [dbo].[HoaDonXe] CHECK CONSTRAINT [FK_HoaDonXe_KhachHang]
GO
ALTER TABLE [dbo].[HoaDonXe]  WITH CHECK ADD  CONSTRAINT [FK_HoaDonXe_NhanVien] FOREIGN KEY([maNhanVien])
REFERENCES [dbo].[NhanVien] ([maNhanVien])
GO
ALTER TABLE [dbo].[HoaDonXe] CHECK CONSTRAINT [FK_HoaDonXe_NhanVien]
GO
ALTER TABLE [dbo].[TaiKhoan]  WITH CHECK ADD  CONSTRAINT [FK_TaiKhoan_NhanVien] FOREIGN KEY([maNhanVien])
REFERENCES [dbo].[NhanVien] ([maNhanVien])
GO
ALTER TABLE [dbo].[TaiKhoan] CHECK CONSTRAINT [FK_TaiKhoan_NhanVien]
GO
ALTER TABLE [dbo].[Xe]  WITH CHECK ADD  CONSTRAINT [FK_Xe_MauXe] FOREIGN KEY([maMau])
REFERENCES [dbo].[MauXe] ([maMau])
GO
ALTER TABLE [dbo].[Xe] CHECK CONSTRAINT [FK_Xe_MauXe]
GO
ALTER TABLE [dbo].[Xe]  WITH CHECK ADD  CONSTRAINT [FK_Xe_NhaCungCap] FOREIGN KEY([maNCC])
REFERENCES [dbo].[NhaCungCap] ([maNCC])
GO
ALTER TABLE [dbo].[Xe] CHECK CONSTRAINT [FK_Xe_NhaCungCap]
GO
ALTER TABLE [dbo].[Xe]  WITH CHECK ADD  CONSTRAINT [FK_Xe_NuocSanXuat] FOREIGN KEY([maNSX])
REFERENCES [dbo].[NhaSanXuat] ([maNSX])
GO
ALTER TABLE [dbo].[Xe] CHECK CONSTRAINT [FK_Xe_NuocSanXuat]
GO
USE [master]
GO
ALTER DATABASE [QLMuaBanXe] SET  READ_WRITE 
GO

insert into [dbo].[NhanVien] values ('NV001',N'Nguyễn Thị Hảo Anh','0356945125',1,'02575157', N'410, Thới An, Q.12, TP.HCM', 1,1)
insert into [dbo].[NhanVien] values ('NV002',N'Nguyễn Thùy','0856159825', 1,'256952102',N'555, Tân Chánh Hiệp, Q.12, TP.HCM', 1,0)

insert into [dbo].[TaiKhoan] values ('NV001','admin','123')
insert into [dbo].[TaiKhoan] values ('NV002','user','123')

insert into [dbo].[NhaCungCap] values('NCC001',N'Cửa Hàng Xe HP','cuahanghp@gmail.com',N'TP.HCM, Việt Nam')
insert into [dbo].[NhaCungCap] values('NCC002',N'Cửa Hàng Xe AJ','cuahangaj@gmail.com',N'TP.Hải Phòng, Việt Nam')
insert into [dbo].[NhaCungCap] values('NCC003',N'Cửa Hàng Xe WWW','cuahangwww@gmail.com',N'TP.HCM, Việt Nam')

insert into [dbo].[NhaSanXuat] values('NSX001','Honda','honda@gmail.com',N'Việt Nam','20201112')
insert into [dbo].[NhaSanXuat] values('NSX002','Yamaha','yamaha@gmail.com',N'Việt Nam','20201112')
insert into [dbo].[NhaSanXuat] values('NSX003','Honda','honda@gmail.com',N'Thái','20201112')
insert into [dbo].[NhaSanXuat] values('NSX004','Honda','honda@gmail.com',N'Nhật','20201112')
insert into [dbo].[NhaSanXuat] values('NSX005','Yamaha','yamaha@gmail.com',N'Nhật','20201112')

insert into [dbo].[KhachHang] values('KH001',N'Từ','VN','123456789','0958444444')
insert into [dbo].[KhachHang] values('KH002',N'Duyên','VN','123456789','0958444444')

insert into [dbo].[Xe] values ('Xe001','Vision','M001',50,'NCC001','NSX001',6,20000000,'20201012')
insert into [dbo].[Xe] values ('Xe002','Yamaha Exciter','M002',50,'NCC002','NSX002',6,25000000,'20201012')
insert into [dbo].[Xe] values ('Xe003','Vision','M002',50,'NCC001','NSX003',6,20000000,'20201012')
insert into [dbo].[Xe] values ('Xe004','Vision','M003',50,'NCC001','NSX001',6,22500000,'20201012')

insert into [dbo].[MauXe] values ('M001',N'Đen')
insert into [dbo].[MauXe] values ('M002',N'Đỏ')
insert into [dbo].[MauXe] values ('M003',N'Trắng')
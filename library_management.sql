USE [master]
GO
/****** Object:  Database [library_management]    Script Date: 1/10/2022 4:10:03 PM ******/
CREATE DATABASE [library_management]
GO
ALTER DATABASE [library_management] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [library_management].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [library_management] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [library_management] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [library_management] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [library_management] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [library_management] SET ARITHABORT OFF 
GO
ALTER DATABASE [library_management] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [library_management] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [library_management] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [library_management] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [library_management] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [library_management] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [library_management] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [library_management] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [library_management] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [library_management] SET  DISABLE_BROKER 
GO
ALTER DATABASE [library_management] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [library_management] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [library_management] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [library_management] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [library_management] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [library_management] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [library_management] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [library_management] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [library_management] SET  MULTI_USER 
GO
ALTER DATABASE [library_management] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [library_management] SET DB_CHAINING OFF 
GO
ALTER DATABASE [library_management] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [library_management] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [library_management] SET DELAYED_DURABILITY = DISABLED 
GO
USE [library_management]
GO
/****** Object:  Table [dbo].[DANHMUCSACH]    Script Date: 1/10/2022 4:10:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DANHMUCSACH](
	[MaDanhMucSach] [nvarchar](25) NOT NULL,
	[ISBN] [nvarchar](20) NOT NULL,
	[TrangThai] [tinyint] NOT NULL,
 CONSTRAINT [PK_DANHMUCSACH] PRIMARY KEY CLUSTERED 
(
	[MaDanhMucSach] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DAUSACH]    Script Date: 1/10/2022 4:10:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DAUSACH](
	[ISBN] [nvarchar](20) NOT NULL,
	[TenDauSach] [nvarchar](50) NOT NULL,
	[TenLoaiSach] [nvarchar](50) NOT NULL,
	[TacGia] [nvarchar](50) NOT NULL,
	[NhaXuatBan] [nvarchar](50) NOT NULL,
	[NamXuatBan] [smallint] NOT NULL,
 CONSTRAINT [PK_DAUSACH] PRIMARY KEY CLUSTERED 
(
	[ISBN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DOCGIA]    Script Date: 1/10/2022 4:10:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DOCGIA](
	[MaDocGia] [int] NOT NULL,
	[Ho] [nvarchar](50) NOT NULL,
	[Ten] [nvarchar](50) NOT NULL,
	[GioiTinh] [bit] NOT NULL,
	[NgaySinh] [date] NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[SDT] [nvarchar](11) NOT NULL,
	[TrangThai] [bit] NOT NULL,
 CONSTRAINT [PK_DOCGIA] PRIMARY KEY CLUSTERED 
(
	[MaDocGia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PHIEUMUON]    Script Date: 1/10/2022 4:10:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PHIEUMUON](
	[MaPhieuMuon] [int] IDENTITY(1,1) NOT NULL,
	[MaDocGia] [int] NOT NULL,
	[MaDanhMucSach] [nvarchar](25) NOT NULL,
	[NgayMuon] [date] NOT NULL,
	[NgayTra] [date] DEFAULT NULL,
	[TrangThai] [tinyint] NOT NULL,
 CONSTRAINT [PK_PHIEUMUON] PRIMARY KEY CLUSTERED 
(
	[MaPhieuMuon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[THONGTINDANGNHAP]    Script Date: 1/10/2022 4:10:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[THONGTINDANGNHAP](
	[TenDangNhap] [nvarchar](50) NOT NULL,
	[MatKhau] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_THONGTINDANGNHAP] PRIMARY KEY CLUSTERED 
(
	[TenDangNhap] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]


GO
INSERT [dbo].[DAUSACH] VALUES
(N'BGCSDLPT', N'Bài Giảng Cơ Sở Dữ Liệu Phân Tán', N'Công nghệ thông tin', N'Tân Hạnh', N'HVCNBCVT', 2010),
(N'LTM', N'Lập Trình Mạng', N'Công nghệ thông tin', N'Nguyễn Mạnh Hùng', N'DHQGTPHCM', 2020),
(N'THCS2', N'Tin Học Cơ Sở 2', N'Công nghệ thông tin', N'Phan Thị Hà', N'HVCNBCVT', 2020),
(N'CKDT', N'Cấu Kiện Điện Tử', N'Điện tử', N'Trần Thúy Hà', N'HVCNBCVT', 2012),
(N'DTS', N'Điện tử số', N'Điện tử', N'Nguyễn Hồng Hoa', N'DHQGTPHCM', 2009),
(N'CSDLDT', N'Cơ sở đo lường điên tử', N'Điện tử', N'Nguyễn Trung Hiếu', N'HVCNBCVT', 2009),
(N'NMDPT', N'Nhập môn đa phương tiện', N'Đa phương tiện', N'Trần Quốc Trung', N'HVCNBCVT', 2013),
(N'HCSDLDPT', N'Hệ cơ sở dữ liệu đa phương tiện', N'Đa phương tiện', N'Đỗ Trung Tuấn', N'DHQGTPHCM', 2016)

GO
INSERT [dbo].[DANHMUCSACH] VALUES
(N'BGCSDLPT-0', N'BGCSDLPT', 0),
(N'BGCSDLPT-1', N'BGCSDLPT', 0),
(N'BGCSDLPT-2', N'BGCSDLPT', 0),
(N'BGCSDLPT-3', N'BGCSDLPT', 0),
(N'BGCSDLPT-4', N'BGCSDLPT', 0),
(N'LTM-0', N'LTM', 1),
(N'LTM-1', N'LTM', 0),
(N'LTM-2', N'LTM', 0),
(N'LTM-3', N'LTM', 0),
(N'THCS2-0', N'THCS2', 0),
(N'THCS2-1', N'THCS2', 0),
(N'CKDT-0', N'CKDT', 0),
(N'CKDT-1', N'CKDT', 0),
(N'CKDT-2', N'CKDT', 0),
(N'DTS-0', N'DTS', 1),
(N'DTS-1', N'DTS', 0),
(N'DTS-2', N'DTS', 0),
(N'DTS-3', N'DTS', 0),
(N'CSDLDT-0', N'CSDLDT', 0),
(N'CSDLDT-1', N'CSDLDT', 0),
(N'CSDLDT-2', N'CSDLDT', 0),
(N'NMDPT-0', N'NMDPT', 0),
(N'NMDPT-1', N'NMDPT', 0),
(N'NMDPT-2', N'NMDPT', 0),
(N'NMDPT-3', N'NMDPT', 0),
(N'HCSDLDPT-0', N'HCSDLDPT', 1),
(N'HCSDLDPT-1', N'HCSDLDPT', 0)

GO
INSERT [dbo].[DOCGIA] VALUES
(15467, N'Trần Quang', N'Vinh', 	0,	'2000-01-01', N'tranquangvinh@gmail.com',	N'0934172648',	1),
(46452, N'Phạm', N'Thạch', 			1,	'2001-03-30', N'phamthach@gmail.com',		N'0945622546',	1),
(78584, N'Phạm Nguyễn Yến', N'Vy',	1,	'2001-01-23', N'phamnguyenyenvy@gmail.com', N'0856472645',	1),
(45276, N'Võ Thị Vân', N'Trinh', 	1,	'2001-03-04', N'vothivantrinh@gmail.com',	N'0837461625',	1),
(25365, N'Nguyễn Hữu', N'Trưởng', 	0,	'2001-02-12', N'nguyenhuutruong@gmail.com',	N'0325467254',	1),
(89017, N'Phạm Hoàng', N'Long', 	0,	'2002-10-23', N'phamhoanglong@gmail.com',	N'0954361673',	1),
(56371, N'Nguyễn Minh', N'Thùy', 	1,	'2000-04-12', N'nguyenminhthuy@gmail.com',	N'0345615472',	1),
(45361, N'Nguyễn Nhật', N'Thanh', 	0,	'2001-10-26', N'nguyennhatthanh@gmail.com',	N'0982263436',	1)

GO
INSERT [dbo].[PHIEUMUON] VALUES
(15467, N'BGCSDLPT-0', '2020-12-12', '2020-12-18', 1),
(15467, N'LTM-0', '2021-01-02', NULL, 0),
(78584, N'CKDT-0', '2020-12-20', '2021-02-01', 1),
(78584, N'HCSDLDPT-0', '2020-12-20', '2021-01-01', 1),
(56371, N'DTS-0', '2021-01-02', NULL, 0),
(56371, N'HCSDLDPT-0', '2021-01-02', NULL, 0)

GO
INSERT [dbo].[THONGTINDANGNHAP] VALUES
('ad', 'ad')
GO
ALTER TABLE [dbo].[DANHMUCSACH]  WITH CHECK ADD  CONSTRAINT [FK_DANHMUCSACH_DAUSACH] FOREIGN KEY([ISBN])
REFERENCES [dbo].[DAUSACH] ([ISBN])
GO
ALTER TABLE [dbo].[DANHMUCSACH] CHECK CONSTRAINT [FK_DANHMUCSACH_DAUSACH]
GO
ALTER TABLE [dbo].[PHIEUMUON]  WITH CHECK ADD  CONSTRAINT [FK_PHIEUMUON_DANHMUCSACH] FOREIGN KEY([MaDanhMucSach])
REFERENCES [dbo].[DANHMUCSACH] ([MaDanhMucSach])
GO
ALTER TABLE [dbo].[PHIEUMUON] CHECK CONSTRAINT [FK_PHIEUMUON_DANHMUCSACH]
GO
ALTER TABLE [dbo].[PHIEUMUON]  WITH CHECK ADD  CONSTRAINT [FK_PHIEUMUON_DOCGIA] FOREIGN KEY([MaDocGia])
REFERENCES [dbo].[DOCGIA] ([MaDocGia])
GO
ALTER TABLE [dbo].[PHIEUMUON] CHECK CONSTRAINT [FK_PHIEUMUON_DOCGIA]
GO
USE [master]
GO
ALTER DATABASE [library_management] SET  READ_WRITE 
GO

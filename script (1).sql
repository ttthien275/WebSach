CREATE DATABASE [QLBANSACH]
USE [QLBANSACH]
GO
/****** Object:  Table [dbo].[CHITIETDATHANG]    Script Date: 21/07/2021 13:28:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CHITIETDATHANG](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[SoDH] [int] NOT NULL,
	[MaSach] [int] NOT NULL,
	[SoLuong] [int] NULL,
	[DonGia] [decimal](18, 0) NULL,
 CONSTRAINT [PK_CHITIETDATSACH] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CHITIETKM]    Script Date: 21/07/2021 13:28:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CHITIETKM](
	[ID_KM] [int] NOT NULL,
	[ID_SACH] [int] NOT NULL,
 CONSTRAINT [PK_CHITIETKM] PRIMARY KEY CLUSTERED 
(
	[ID_KM] ASC,
	[ID_SACH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CHUDE]    Script Date: 21/07/2021 13:28:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CHUDE](
	[MaCD] [int] IDENTITY(1,1) NOT NULL,
	[TenChuDe] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_ChuDe] PRIMARY KEY CLUSTERED 
(
	[MaCD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CTPHIEUNHAPSACH]    Script Date: 21/07/2021 13:28:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CTPHIEUNHAPSACH](
	[PHIEUNHAPSACH_ID] [bigint] NOT NULL,
	[ID_SACH] [int] NOT NULL,
	[SOLUONGNHAP] [int] NULL,
	[SOLUONGTHUCNHAP] [int] NULL,
	[DONGIA_CTNHAPSACH] [float] NULL,
	[TINHTRANG_CTPHIEUNHAPSACH] [bit] NULL,
	[LYDO_CTPHIEUNHAPSACH] [nvarchar](250) NULL,
	[GHICHU_CTIETPHIEUNHAPSACH] [nvarchar](250) NULL,
	[IS_DELETE] [bit] NULL,
	[CREATEBY] [nvarchar](50) NULL,
	[CREATEDATE] [datetime] NULL,
	[MODIFILEDBY] [nvarchar](50) NULL,
	[MODIFILEDDATE] [datetime] NULL,
 CONSTRAINT [PK_CTPHIEUNHAPSACH] PRIMARY KEY CLUSTERED 
(
	[PHIEUNHAPSACH_ID] ASC,
	[ID_SACH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DONDATHANG]    Script Date: 21/07/2021 13:28:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DONDATHANG](
	[SoDH] [int] IDENTITY(1,1) NOT NULL,
	[ID_TAIKHOAN] [int] NULL,
	[DaThanhToan] [bit] NULL,
	[TinhTrangGiaoHang] [bit] NULL,
	[NgayDat] [datetime] NULL,
	[NgayGiao] [datetime] NULL,
	[HinhThucThanhToan] [bit] NULL,
	[THANHTIEN_HOADON] [float] NULL,
	[TRANGTHAI] [nvarchar](50) NULL,
	[IS_DELETE] [bit] NULL,
	[CREATEBY] [nvarchar](50) NULL,
	[CREATEDATE] [datetime] NULL,
	[MODIFILEDBY] [nvarchar](50) NULL,
	[MODIFILEDDATE] [datetime] NULL,
	[GHICHU_HOADON] [nvarchar](250) NULL,
 CONSTRAINT [PK_DonDatHang] PRIMARY KEY CLUSTERED 
(
	[SoDH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KHUYENMAI]    Script Date: 21/07/2021 13:28:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KHUYENMAI](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ChiTiet] [nvarchar](max) NULL,
	[NgayBD] [datetime] NOT NULL,
	[NgayKT] [datetime] NOT NULL,
	[Sale] [float] NOT NULL,
 CONSTRAINT [PK_KHUYENMAI] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LIENHE]    Script Date: 21/07/2021 13:28:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LIENHE](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[HOTEN] [nvarchar](150) NULL,
	[EMAIL] [varchar](150) NULL,
	[SDT] [varchar](11) NULL,
	[CONTENT] [nvarchar](max) NULL,
	[STATUS] [bit] NULL,
 CONSTRAINT [PK_LIENHE] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LOAITAIKHOAN]    Script Date: 21/07/2021 13:28:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LOAITAIKHOAN](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ChiTietquyen] [nvarchar](max) NULL,
	[GHICHU_LOAITAIKHOAN] [nvarchar](250) NULL,
	[IS_DELETE] [bit] NULL,
	[CREATEBY] [nvarchar](50) NULL,
	[CREATEDATE] [datetime] NULL,
	[MODIFILEDBY] [nvarchar](50) NULL,
	[MODIFILEDDATE] [datetime] NULL,
 CONSTRAINT [PK_LOAITAIKHOAN] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NHAXUATBAN]    Script Date: 21/07/2021 13:28:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NHAXUATBAN](
	[MaNXB] [int] IDENTITY(1,1) NOT NULL,
	[TenNXB] [nvarchar](200) NOT NULL,
	[Diachi] [nvarchar](200) NULL,
	[DienThoai] [varchar](12) NULL,
 CONSTRAINT [PK_NhaXuatBan] PRIMARY KEY CLUSTERED 
(
	[MaNXB] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PHIEUNHAPSACH]    Script Date: 21/07/2021 13:28:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PHIEUNHAPSACH](
	[PHIEUNHAPSACH_ID] [bigint] IDENTITY(1,1) NOT NULL,
	[NXB_ID] [int] NOT NULL,
	[NGAYGIAO] [datetime] NULL,
	[TENPHIEUNHAP] [nvarchar](50) NULL,
	[STATUS] [int] NOT NULL,
	[GHICHU_NHAPSACH] [nvarchar](250) NULL,
	[CREATEBY] [nvarchar](50) NULL,
	[CREATEDATE] [datetime] NULL,
	[MODIFILEDBY] [nvarchar](50) NULL,
	[MODIFILEDDATE] [datetime] NULL,
 CONSTRAINT [PK_PHIEUNHAPSACH] PRIMARY KEY CLUSTERED 
(
	[PHIEUNHAPSACH_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RATING]    Script Date: 21/07/2021 13:28:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RATING](
	[IDUser] [int] NOT NULL,
	[ID_SACH] [int] NOT NULL,
	[Star] [int] NOT NULL,
 CONSTRAINT [PK_RATING] PRIMARY KEY CLUSTERED 
(
	[IDUser] ASC,
	[ID_SACH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SACH]    Script Date: 21/07/2021 13:28:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SACH](
	[MaSach] [int] IDENTITY(1,1) NOT NULL,
	[TenSach] [nvarchar](100) NOT NULL,
	[GiaBan] [decimal](18, 0) NULL,
	[GiaBia] [int] NULL,
	[MoTa] [nvarchar](max) NULL,
	[AnhBia] [varchar](250) NULL,
	[NgayCapNhat] [datetime] NULL,
	[SoLuongTon] [int] NULL,
	[MaCD] [int] NULL,
	[MaNXB] [int] NULL,
	[Status] [int] NULL,
	[Size] [nvarchar](150) NULL,
	[Weight] [nvarchar](50) NULL,
 CONSTRAINT [PK_Sach] PRIMARY KEY CLUSTERED 
(
	[MaSach] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SLIDE]    Script Date: 21/07/2021 13:28:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SLIDE](
	[ID] [int] NOT NULL,
	[IMAGE] [nvarchar](250) NULL,
	[LINK] [nvarchar](250) NULL,
	[from_DATE] [datetime] NULL,
	[to_DATE] [datetime] NULL,
	[STATUS] [int] NULL,
	[IS_DELETE] [bit] NULL,
	[CREATEBY] [nvarchar](50) NULL,
	[CREATEDATE] [datetime] NULL,
 CONSTRAINT [PK_SLIDE] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TACGIA]    Script Date: 21/07/2021 13:28:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TACGIA](
	[MaTG] [int] IDENTITY(1,1) NOT NULL,
	[TenTG] [nvarchar](50) NOT NULL,
	[DiaChi] [nvarchar](100) NULL,
	[TieuSu] [nvarchar](max) NULL,
	[DienThoai] [varchar](15) NULL,
 CONSTRAINT [PK_TACGIA] PRIMARY KEY CLUSTERED 
(
	[MaTG] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TAIKHOAN]    Script Date: 21/07/2021 13:28:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TAIKHOAN](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ID_LOAITK] [int] NULL,
	[HOTEN] [nvarchar](max) NULL,
	[USERNAME] [varchar](150) NULL,
	[MATKHAU] [varchar](50) NULL,
	[EMAIL_TK] [varchar](250) NULL,
	[DIACHI_TK] [nvarchar](max) NULL,
	[SDT] [varchar](11) NULL,
	[GHICHU_TK] [nvarchar](250) NULL,
	[IS_DELETE] [bit] NULL,
	[CREATEBY] [nvarchar](50) NULL,
	[CREATEDATE] [datetime] NULL,
	[MODIFILEDBY] [nvarchar](50) NULL,
	[MODIFILEDDATE] [datetime] NULL,
	[STATUS] [bit] NULL,
 CONSTRAINT [PK_TAIKHOAN] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VIETSACH]    Script Date: 21/07/2021 13:28:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VIETSACH](
	[MaTG] [int] NOT NULL,
	[MaSach] [int] NOT NULL,
	[VaiTro] [nvarchar](50) NULL,
	[ViTri] [nvarchar](50) NULL,
 CONSTRAINT [PK_VietSach] PRIMARY KEY CLUSTERED 
(
	[MaTG] ASC,
	[MaSach] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[CHITIETDATHANG] ON 

INSERT [dbo].[CHITIETDATHANG] ([ID], [SoDH], [MaSach], [SoLuong], [DonGia]) VALUES (1, 14, 1, 210000, CAST(210000 AS Decimal(18, 0)))
INSERT [dbo].[CHITIETDATHANG] ([ID], [SoDH], [MaSach], [SoLuong], [DonGia]) VALUES (2, 15, 3, 1, CAST(690000 AS Decimal(18, 0)))
INSERT [dbo].[CHITIETDATHANG] ([ID], [SoDH], [MaSach], [SoLuong], [DonGia]) VALUES (4, 5, 3, 2, CAST(129000 AS Decimal(18, 0)))
INSERT [dbo].[CHITIETDATHANG] ([ID], [SoDH], [MaSach], [SoLuong], [DonGia]) VALUES (5, 9, 1, 1, CAST(67000 AS Decimal(18, 0)))
INSERT [dbo].[CHITIETDATHANG] ([ID], [SoDH], [MaSach], [SoLuong], [DonGia]) VALUES (6, 15, 3, 2, CAST(690000 AS Decimal(18, 0)))
INSERT [dbo].[CHITIETDATHANG] ([ID], [SoDH], [MaSach], [SoLuong], [DonGia]) VALUES (7, 9, 1, 2, CAST(67000 AS Decimal(18, 0)))
INSERT [dbo].[CHITIETDATHANG] ([ID], [SoDH], [MaSach], [SoLuong], [DonGia]) VALUES (8, 10, 3, 3, CAST(630000 AS Decimal(18, 0)))
SET IDENTITY_INSERT [dbo].[CHITIETDATHANG] OFF
GO
INSERT [dbo].[CHITIETKM] ([ID_KM], [ID_SACH]) VALUES (1, 1)
INSERT [dbo].[CHITIETKM] ([ID_KM], [ID_SACH]) VALUES (1, 2)
INSERT [dbo].[CHITIETKM] ([ID_KM], [ID_SACH]) VALUES (2, 3)
INSERT [dbo].[CHITIETKM] ([ID_KM], [ID_SACH]) VALUES (2, 4)
INSERT [dbo].[CHITIETKM] ([ID_KM], [ID_SACH]) VALUES (2, 5)
INSERT [dbo].[CHITIETKM] ([ID_KM], [ID_SACH]) VALUES (2, 6)
INSERT [dbo].[CHITIETKM] ([ID_KM], [ID_SACH]) VALUES (2, 12)
INSERT [dbo].[CHITIETKM] ([ID_KM], [ID_SACH]) VALUES (2, 13)
INSERT [dbo].[CHITIETKM] ([ID_KM], [ID_SACH]) VALUES (2, 18)
INSERT [dbo].[CHITIETKM] ([ID_KM], [ID_SACH]) VALUES (3, 11)
INSERT [dbo].[CHITIETKM] ([ID_KM], [ID_SACH]) VALUES (3, 12)
INSERT [dbo].[CHITIETKM] ([ID_KM], [ID_SACH]) VALUES (3, 16)
INSERT [dbo].[CHITIETKM] ([ID_KM], [ID_SACH]) VALUES (3, 17)
INSERT [dbo].[CHITIETKM] ([ID_KM], [ID_SACH]) VALUES (3, 19)
INSERT [dbo].[CHITIETKM] ([ID_KM], [ID_SACH]) VALUES (4, 6)
INSERT [dbo].[CHITIETKM] ([ID_KM], [ID_SACH]) VALUES (4, 14)
INSERT [dbo].[CHITIETKM] ([ID_KM], [ID_SACH]) VALUES (4, 15)
INSERT [dbo].[CHITIETKM] ([ID_KM], [ID_SACH]) VALUES (4, 21)
INSERT [dbo].[CHITIETKM] ([ID_KM], [ID_SACH]) VALUES (4, 22)
GO
SET IDENTITY_INSERT [dbo].[CHUDE] ON 

INSERT [dbo].[CHUDE] ([MaCD], [TenChuDe]) VALUES (1, N'Sống đẹp- Tư duy tích cực')
INSERT [dbo].[CHUDE] ([MaCD], [TenChuDe]) VALUES (2, N'Kỹ năng')
INSERT [dbo].[CHUDE] ([MaCD], [TenChuDe]) VALUES (3, N'Kinh doanh')
INSERT [dbo].[CHUDE] ([MaCD], [TenChuDe]) VALUES (4, N'Văn học')
INSERT [dbo].[CHUDE] ([MaCD], [TenChuDe]) VALUES (5, N'Y học ')
INSERT [dbo].[CHUDE] ([MaCD], [TenChuDe]) VALUES (6, N'Hạt giống tâm hồn')
INSERT [dbo].[CHUDE] ([MaCD], [TenChuDe]) VALUES (7, N'Sách thiếu nhi')
INSERT [dbo].[CHUDE] ([MaCD], [TenChuDe]) VALUES (8, N'Hồi ký')
INSERT [dbo].[CHUDE] ([MaCD], [TenChuDe]) VALUES (9, N'Sách Danh nhân')
INSERT [dbo].[CHUDE] ([MaCD], [TenChuDe]) VALUES (10, N'Sách giáo khoa')
INSERT [dbo].[CHUDE] ([MaCD], [TenChuDe]) VALUES (11, N'Nghệ thuật sống')
INSERT [dbo].[CHUDE] ([MaCD], [TenChuDe]) VALUES (12, N'Giáo dục')
SET IDENTITY_INSERT [dbo].[CHUDE] OFF
GO
SET IDENTITY_INSERT [dbo].[DONDATHANG] ON 

INSERT [dbo].[DONDATHANG] ([SoDH], [ID_TAIKHOAN], [DaThanhToan], [TinhTrangGiaoHang], [NgayDat], [NgayGiao], [HinhThucThanhToan], [THANHTIEN_HOADON], [TRANGTHAI], [IS_DELETE], [CREATEBY], [CREATEDATE], [MODIFILEDBY], [MODIFILEDDATE], [GHICHU_HOADON]) VALUES (1, 1, 0, 0, CAST(N'2021-06-21T00:00:00.000' AS DateTime), CAST(N'2021-06-21T00:00:00.000' AS DateTime), NULL, 500000, N'chưa giao', 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DONDATHANG] ([SoDH], [ID_TAIKHOAN], [DaThanhToan], [TinhTrangGiaoHang], [NgayDat], [NgayGiao], [HinhThucThanhToan], [THANHTIEN_HOADON], [TRANGTHAI], [IS_DELETE], [CREATEBY], [CREATEDATE], [MODIFILEDBY], [MODIFILEDDATE], [GHICHU_HOADON]) VALUES (2, 2, 1, 0, CAST(N'2021-06-22T00:00:00.000' AS DateTime), CAST(N'2021-06-25T00:00:00.000' AS DateTime), NULL, 30000, N'chưa giao', 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DONDATHANG] ([SoDH], [ID_TAIKHOAN], [DaThanhToan], [TinhTrangGiaoHang], [NgayDat], [NgayGiao], [HinhThucThanhToan], [THANHTIEN_HOADON], [TRANGTHAI], [IS_DELETE], [CREATEBY], [CREATEDATE], [MODIFILEDBY], [MODIFILEDDATE], [GHICHU_HOADON]) VALUES (5, 3, 0, 0, CAST(N'2020-12-28T00:00:00.000' AS DateTime), CAST(N'2021-02-01T00:00:00.000' AS DateTime), NULL, 300000, N'chưa giao', 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DONDATHANG] ([SoDH], [ID_TAIKHOAN], [DaThanhToan], [TinhTrangGiaoHang], [NgayDat], [NgayGiao], [HinhThucThanhToan], [THANHTIEN_HOADON], [TRANGTHAI], [IS_DELETE], [CREATEBY], [CREATEDATE], [MODIFILEDBY], [MODIFILEDDATE], [GHICHU_HOADON]) VALUES (6, 4, 0, 0, CAST(N'2021-05-17T00:00:00.000' AS DateTime), CAST(N'2021-05-21T00:00:00.000' AS DateTime), NULL, 4444444, N'chưa giao', 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DONDATHANG] ([SoDH], [ID_TAIKHOAN], [DaThanhToan], [TinhTrangGiaoHang], [NgayDat], [NgayGiao], [HinhThucThanhToan], [THANHTIEN_HOADON], [TRANGTHAI], [IS_DELETE], [CREATEBY], [CREATEDATE], [MODIFILEDBY], [MODIFILEDDATE], [GHICHU_HOADON]) VALUES (7, 5, 0, 1, CAST(N'2021-05-16T00:00:00.000' AS DateTime), CAST(N'2021-05-21T00:00:00.000' AS DateTime), NULL, 666666, N'đã giao', 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DONDATHANG] ([SoDH], [ID_TAIKHOAN], [DaThanhToan], [TinhTrangGiaoHang], [NgayDat], [NgayGiao], [HinhThucThanhToan], [THANHTIEN_HOADON], [TRANGTHAI], [IS_DELETE], [CREATEBY], [CREATEDATE], [MODIFILEDBY], [MODIFILEDDATE], [GHICHU_HOADON]) VALUES (8, 6, 0, 0, CAST(N'2021-03-20T00:00:00.000' AS DateTime), CAST(N'2021-03-21T00:00:00.000' AS DateTime), NULL, 555555, N'chưa giao', 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DONDATHANG] ([SoDH], [ID_TAIKHOAN], [DaThanhToan], [TinhTrangGiaoHang], [NgayDat], [NgayGiao], [HinhThucThanhToan], [THANHTIEN_HOADON], [TRANGTHAI], [IS_DELETE], [CREATEBY], [CREATEDATE], [MODIFILEDBY], [MODIFILEDDATE], [GHICHU_HOADON]) VALUES (9, 7, 0, 1, CAST(N'2021-05-21T00:00:00.000' AS DateTime), CAST(N'2021-05-22T00:00:00.000' AS DateTime), NULL, 777777777777, N'đã giao', 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DONDATHANG] ([SoDH], [ID_TAIKHOAN], [DaThanhToan], [TinhTrangGiaoHang], [NgayDat], [NgayGiao], [HinhThucThanhToan], [THANHTIEN_HOADON], [TRANGTHAI], [IS_DELETE], [CREATEBY], [CREATEDATE], [MODIFILEDBY], [MODIFILEDDATE], [GHICHU_HOADON]) VALUES (10, 8, 1, 0, CAST(N'2021-03-22T00:00:00.000' AS DateTime), CAST(N'2021-05-21T00:00:00.000' AS DateTime), NULL, 8888888, N'chưa giao', 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DONDATHANG] ([SoDH], [ID_TAIKHOAN], [DaThanhToan], [TinhTrangGiaoHang], [NgayDat], [NgayGiao], [HinhThucThanhToan], [THANHTIEN_HOADON], [TRANGTHAI], [IS_DELETE], [CREATEBY], [CREATEDATE], [MODIFILEDBY], [MODIFILEDDATE], [GHICHU_HOADON]) VALUES (11, 8, 0, 1, CAST(N'2021-01-05T00:00:00.000' AS DateTime), CAST(N'2021-01-10T00:00:00.000' AS DateTime), NULL, 999999, N'đã giao', 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DONDATHANG] ([SoDH], [ID_TAIKHOAN], [DaThanhToan], [TinhTrangGiaoHang], [NgayDat], [NgayGiao], [HinhThucThanhToan], [THANHTIEN_HOADON], [TRANGTHAI], [IS_DELETE], [CREATEBY], [CREATEDATE], [MODIFILEDBY], [MODIFILEDDATE], [GHICHU_HOADON]) VALUES (12, 4, 0, 0, CAST(N'2021-02-08T00:00:00.000' AS DateTime), CAST(N'2021-02-10T00:00:00.000' AS DateTime), NULL, 2111111, N'chưa giao', 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DONDATHANG] ([SoDH], [ID_TAIKHOAN], [DaThanhToan], [TinhTrangGiaoHang], [NgayDat], [NgayGiao], [HinhThucThanhToan], [THANHTIEN_HOADON], [TRANGTHAI], [IS_DELETE], [CREATEBY], [CREATEDATE], [MODIFILEDBY], [MODIFILEDDATE], [GHICHU_HOADON]) VALUES (13, 3, 0, 0, CAST(N'2020-12-08T00:00:00.000' AS DateTime), CAST(N'2021-12-09T00:00:00.000' AS DateTime), NULL, 3243242, N'chưa giao', 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DONDATHANG] ([SoDH], [ID_TAIKHOAN], [DaThanhToan], [TinhTrangGiaoHang], [NgayDat], [NgayGiao], [HinhThucThanhToan], [THANHTIEN_HOADON], [TRANGTHAI], [IS_DELETE], [CREATEBY], [CREATEDATE], [MODIFILEDBY], [MODIFILEDDATE], [GHICHU_HOADON]) VALUES (14, 5, 1, 1, CAST(N'2021-06-19T00:00:00.000' AS DateTime), CAST(N'2021-06-21T00:00:00.000' AS DateTime), NULL, 5464423, N'đã giao', 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DONDATHANG] ([SoDH], [ID_TAIKHOAN], [DaThanhToan], [TinhTrangGiaoHang], [NgayDat], [NgayGiao], [HinhThucThanhToan], [THANHTIEN_HOADON], [TRANGTHAI], [IS_DELETE], [CREATEBY], [CREATEDATE], [MODIFILEDBY], [MODIFILEDDATE], [GHICHU_HOADON]) VALUES (15, 3, 0, 0, CAST(N'2021-03-21T00:00:00.000' AS DateTime), CAST(N'2021-03-22T00:00:00.000' AS DateTime), NULL, 76573, N'chưa giao', 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DONDATHANG] ([SoDH], [ID_TAIKHOAN], [DaThanhToan], [TinhTrangGiaoHang], [NgayDat], [NgayGiao], [HinhThucThanhToan], [THANHTIEN_HOADON], [TRANGTHAI], [IS_DELETE], [CREATEBY], [CREATEDATE], [MODIFILEDBY], [MODIFILEDDATE], [GHICHU_HOADON]) VALUES (16, 2, 1, 1, CAST(N'2021-07-13T00:00:00.000' AS DateTime), CAST(N'2021-07-13T00:00:00.000' AS DateTime), NULL, 200000, N'đã giao', 0, NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[DONDATHANG] OFF
GO
SET IDENTITY_INSERT [dbo].[KHUYENMAI] ON 

INSERT [dbo].[KHUYENMAI] ([ID], [ChiTiet], [NgayBD], [NgayKT], [Sale]) VALUES (1, N'Ngày lễ quốc khánh', CAST(N'2021-06-27T00:00:00.000' AS DateTime), CAST(N'2021-07-12T00:00:00.000' AS DateTime), 0.3)
INSERT [dbo].[KHUYENMAI] ([ID], [ChiTiet], [NgayBD], [NgayKT], [Sale]) VALUES (2, N'Ngày nhập học', CAST(N'2021-08-20T00:00:00.000' AS DateTime), CAST(N'2021-08-30T00:00:00.000' AS DateTime), 0.2)
INSERT [dbo].[KHUYENMAI] ([ID], [ChiTiet], [NgayBD], [NgayKT], [Sale]) VALUES (3, N'Thành viên tiềm năng', CAST(N'2021-03-01T00:00:00.000' AS DateTime), CAST(N'2021-06-01T00:00:00.000' AS DateTime), 0.45)
INSERT [dbo].[KHUYENMAI] ([ID], [ChiTiet], [NgayBD], [NgayKT], [Sale]) VALUES (4, N'Thành viên VIP', CAST(N'2021-08-05T00:00:00.000' AS DateTime), CAST(N'2021-09-05T00:00:00.000' AS DateTime), 0.7)
SET IDENTITY_INSERT [dbo].[KHUYENMAI] OFF
GO
SET IDENTITY_INSERT [dbo].[LIENHE] ON 

INSERT [dbo].[LIENHE] ([ID], [HOTEN], [EMAIL], [SDT], [CONTENT], [STATUS]) VALUES (1, NULL, NULL, NULL, N'Đánh giá chất lượng tốt', 1)
INSERT [dbo].[LIENHE] ([ID], [HOTEN], [EMAIL], [SDT], [CONTENT], [STATUS]) VALUES (2, NULL, NULL, NULL, N'Phản ánh chất lượng phục vụ', 1)
INSERT [dbo].[LIENHE] ([ID], [HOTEN], [EMAIL], [SDT], [CONTENT], [STATUS]) VALUES (3, NULL, NULL, NULL, N'Giải đáp :"Có thể xem được review chi tiết sách không?"', 1)
INSERT [dbo].[LIENHE] ([ID], [HOTEN], [EMAIL], [SDT], [CONTENT], [STATUS]) VALUES (4, NULL, NULL, NULL, N'Thanh toán', 1)
INSERT [dbo].[LIENHE] ([ID], [HOTEN], [EMAIL], [SDT], [CONTENT], [STATUS]) VALUES (5, NULL, NULL, NULL, N'Sản phẩm mới', 1)
INSERT [dbo].[LIENHE] ([ID], [HOTEN], [EMAIL], [SDT], [CONTENT], [STATUS]) VALUES (6, NULL, NULL, NULL, N'Tìm kiếm sách thiếu nhi', 1)
INSERT [dbo].[LIENHE] ([ID], [HOTEN], [EMAIL], [SDT], [CONTENT], [STATUS]) VALUES (7, NULL, NULL, NULL, N'Gia hạn sách', 1)
INSERT [dbo].[LIENHE] ([ID], [HOTEN], [EMAIL], [SDT], [CONTENT], [STATUS]) VALUES (8, NULL, NULL, NULL, N'Xin thông tin nhà xuất bản', 1)
INSERT [dbo].[LIENHE] ([ID], [HOTEN], [EMAIL], [SDT], [CONTENT], [STATUS]) VALUES (9, NULL, NULL, NULL, N'Xin thông tin nhà văn Nguyễn Ngọc Ký', 1)
SET IDENTITY_INSERT [dbo].[LIENHE] OFF
GO
SET IDENTITY_INSERT [dbo].[LOAITAIKHOAN] ON 

INSERT [dbo].[LOAITAIKHOAN] ([ID], [ChiTietquyen], [GHICHU_LOAITAIKHOAN], [IS_DELETE], [CREATEBY], [CREATEDATE], [MODIFILEDBY], [MODIFILEDDATE]) VALUES (1, N'Admin', NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[LOAITAIKHOAN] ([ID], [ChiTietquyen], [GHICHU_LOAITAIKHOAN], [IS_DELETE], [CREATEBY], [CREATEDATE], [MODIFILEDBY], [MODIFILEDDATE]) VALUES (2, N'Nhân viên', NULL, 0, N'admin', NULL, NULL, NULL)
INSERT [dbo].[LOAITAIKHOAN] ([ID], [ChiTietquyen], [GHICHU_LOAITAIKHOAN], [IS_DELETE], [CREATEBY], [CREATEDATE], [MODIFILEDBY], [MODIFILEDDATE]) VALUES (3, N'Khách hàng', NULL, 0, N'admin', NULL, NULL, NULL)
INSERT [dbo].[LOAITAIKHOAN] ([ID], [ChiTietquyen], [GHICHU_LOAITAIKHOAN], [IS_DELETE], [CREATEBY], [CREATEDATE], [MODIFILEDBY], [MODIFILEDDATE]) VALUES (4, N'Giao hàng', NULL, 0, N'admin', NULL, NULL, NULL)
INSERT [dbo].[LOAITAIKHOAN] ([ID], [ChiTietquyen], [GHICHU_LOAITAIKHOAN], [IS_DELETE], [CREATEBY], [CREATEDATE], [MODIFILEDBY], [MODIFILEDDATE]) VALUES (5, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[LOAITAIKHOAN] OFF
GO
SET IDENTITY_INSERT [dbo].[NHAXUATBAN] ON 

INSERT [dbo].[NHAXUATBAN] ([MaNXB], [TenNXB], [Diachi], [DienThoai]) VALUES (1, N'Nhà xuất bản Trẻ', N'Tp.HCM', N'19001560')
INSERT [dbo].[NHAXUATBAN] ([MaNXB], [TenNXB], [Diachi], [DienThoai]) VALUES (2, N'NXB Thống kê', N'Đồng Nai', N'19001511')
INSERT [dbo].[NHAXUATBAN] ([MaNXB], [TenNXB], [Diachi], [DienThoai]) VALUES (3, N'NXB Kim đồng', N'Tp.HCM', N'19001570')
INSERT [dbo].[NHAXUATBAN] ([MaNXB], [TenNXB], [Diachi], [DienThoai]) VALUES (4, N'NXB Đại học quốc gia', N'Tp.HCM', N'0908419981')
INSERT [dbo].[NHAXUATBAN] ([MaNXB], [TenNXB], [Diachi], [DienThoai]) VALUES (5, N'NXB Văn hóa nghệ thuật', N'Đà Nẵng', N'0903118833')
INSERT [dbo].[NHAXUATBAN] ([MaNXB], [TenNXB], [Diachi], [DienThoai]) VALUES (6, N'NXB Văn hóa', N'Bình Dương', N'0913336677')
INSERT [dbo].[NHAXUATBAN] ([MaNXB], [TenNXB], [Diachi], [DienThoai]) VALUES (7, N'NXB Lao động - Xã hội', N'Tp.HCM', N'0989888888')
INSERT [dbo].[NHAXUATBAN] ([MaNXB], [TenNXB], [Diachi], [DienThoai]) VALUES (8, N'NXB Khoa Học & Kỹ Thuật', N'Hà Nội', N'8351056')
INSERT [dbo].[NHAXUATBAN] ([MaNXB], [TenNXB], [Diachi], [DienThoai]) VALUES (9, N'NXB First New', N'Hà Nội', N'0947472374')
SET IDENTITY_INSERT [dbo].[NHAXUATBAN] OFF
GO
INSERT [dbo].[RATING] ([IDUser], [ID_SACH], [Star]) VALUES (1, 2, 4)
INSERT [dbo].[RATING] ([IDUser], [ID_SACH], [Star]) VALUES (1, 8, 3)
INSERT [dbo].[RATING] ([IDUser], [ID_SACH], [Star]) VALUES (1, 12, 4)
INSERT [dbo].[RATING] ([IDUser], [ID_SACH], [Star]) VALUES (2, 5, 3)
INSERT [dbo].[RATING] ([IDUser], [ID_SACH], [Star]) VALUES (2, 11, 3)
INSERT [dbo].[RATING] ([IDUser], [ID_SACH], [Star]) VALUES (3, 6, 5)
INSERT [dbo].[RATING] ([IDUser], [ID_SACH], [Star]) VALUES (3, 9, 2)
INSERT [dbo].[RATING] ([IDUser], [ID_SACH], [Star]) VALUES (3, 21, 3)
INSERT [dbo].[RATING] ([IDUser], [ID_SACH], [Star]) VALUES (4, 7, 5)
INSERT [dbo].[RATING] ([IDUser], [ID_SACH], [Star]) VALUES (4, 10, 1)
GO
SET IDENTITY_INSERT [dbo].[SACH] ON 

INSERT [dbo].[SACH] ([MaSach], [TenSach], [GiaBan], [GiaBia], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaCD], [MaNXB], [Status], [Size], [Weight]) VALUES (1, N'Muôn kiếp nhân sinh AB2', CAST(134000 AS Decimal(18, 0)), 184400, N'“Muôn kiếp nhân sinh” là tác phẩm do Giáo sư John Vũ - Nguyên Phong viết từ năm 2017 và hoàn tất đầu năm 2020 ghi lại những câu chuyện, trải nghiệm tiền kiếp kỳ lạ từ nhiều kiếp sống của người bạn tâm giao lâu năm, ông Thomas – một nhà kinh doanh tài chính nổi tiếng ở New York. Những câu chuyện chưa từng tiết lộ này sẽ giúp mọi người trên thế giới chiêm nghiệm, khám phá các quy luật về luật Nhân quả và Luân hồi của vũ trụ giữa lúc trái đất đang gặp nhiều tai ương, biến động, khủng hoảng từng ngày.', N'muonkiepnhansinh.jpg', CAST(N'2021-06-22T00:00:00.000' AS DateTime), 120, 6, 9, 1, N'180 x 90 x 70', N'2 Kilogram')
INSERT [dbo].[SACH] ([MaSach], [TenSach], [GiaBan], [GiaBia], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaCD], [MaNXB], [Status], [Size], [Weight]) VALUES (2, N'Muôn kiếp nhân sinh 2', CAST(210000 AS Decimal(18, 0)), 3000401, N'Muôn Kiếp Nhân Sinh tập 2 của tác giả Nguyên Phong tiếp tục là những câu chuyện tiền kiếp, nhân quả luân hồi hấp dẫn gắn liền với những kiến giải uyên bác về quá khứ, hiện tại, tương lai của nhân loại và thế giới thông qua góc nhìn của cả khoa học và tâm linh. Chúng ta là ai, chúng ta đến từ đâu và sẽ đi về đâu? Làm cách nào để chữa lành thế giới này, hành tinh này trước những biến cố lớn đang và sẽ diễn ra trong tương lai gần?

Trong tập 2, hành trình thức tỉnh tâm linh của nhân vật Thomas sẽ dẫn dắt người đọc đến với những tầng cõi năng lượng gắn chặt với thế giới hữu hình của con người thông qua sự vận động của nghiệp lực, nhân quả, để giải thích về thứ năng lượng huyền bí luôn biến chuyển trong chu kỳ bất tận của vũ trụ. Không chỉ là trải nghiệm ly kỳ tại tiền kiếp cổ đại ở Assiria, Hy Lạp, độc giả còn được khám phá hành trình của linh hồn đến những tầng cõi – trạm trung chuyển khác nhau, được xâu chuỗi lại bằng cả triết học, tín ngưỡng, lịch sử và khoa học thế giới từ Đông sang Tây, từ cổ đại đến hiện đại. Năng lượng không tự nhiên sinh ra và cũng không tự nhiên mất đi, sự sống này cũng vậy, khởi đầu và kết thúc - tuy hai mà một, và chỉ có nhân quả sẽ luôn tuần hoàn vận hành bất tận.', N'muonkiepnhansinh2.jpg', CAST(N'2021-06-23T00:00:00.000' AS DateTime), 25, 6, 9, 1, N'180 x 90 x 70', N'2 Kilogram')
INSERT [dbo].[SACH] ([MaSach], [TenSach], [GiaBan], [GiaBia], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaCD], [MaNXB], [Status], [Size], [Weight]) VALUES (3, N'Bước vào cửa hiệu nhiệm màu', CAST(115000 AS Decimal(18, 0)), 130000, N'“Bước vào cửa hiệu nhiệm màu” là lời giải đáp khoa học về những bí ẩn của não bộ trong sự liên kết chặt chẽ với trái tim, tìm đến cội nguồn của hạnh phúc với ý nghĩa bản chất nhất của từ này. Sách cũng là câu chuyện chân thật, đầy cảm động về hành trình vươn lên trong cuộc sống của chính tác giả.', N'buocvaocuahieunhiemmau.jpg', CAST(N'2021-06-21T00:00:00.000' AS DateTime), 23, 6, 9, 1, N'180 x 90 x 70', N'2 Kilogram')
INSERT [dbo].[SACH] ([MaSach], [TenSach], [GiaBan], [GiaBia], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaCD], [MaNXB], [Status], [Size], [Weight]) VALUES (4, N'Người giàu có nhất thành Babylon', CAST(84000 AS Decimal(18, 0)), 102000, N'Trước mắt bạn, tương lai đang trải rộng con đường dẫn tới những miền đất xa xôi đầy hứa hẹn. Trên con đường đó, bạn háo hức, mong muốn thực hiện nhiều ước mơ, dự định, khát khao… của riêng mình.

Để những nguyện vọng của mình được thực hiện, ít nhất bạn phải thành công về mặt tiền bạc. Quyển sách này sẽ giúp bạn biết cách vận dụng những nguyên lý quan trọng để phát triển tài chính. Hãy để cuốn sách dẫn dắt bạn đi từ một hoàn cảnh khó khăn, tiêu biểu là một cái túi lép xẹp, đến một cuộc sống đầy đủ và hạnh phúc, tiêu biểu là một túi tiền căng phồng, sung túc.', N'nguoigiauconhatbabylon.jpg', CAST(N'2021-06-21T00:00:00.000' AS DateTime), 240, 6, 9, 1, N'180 x 90 x 70', N'2 Kilogram')
INSERT [dbo].[SACH] ([MaSach], [TenSach], [GiaBan], [GiaBia], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaCD], [MaNXB], [Status], [Size], [Weight]) VALUES (5, N'Bí quyết học nhanh nhớ lâu', CAST(43000 AS Decimal(18, 0)), 60900, N'Quyển sách Bí quyết học nhanh nhớ lâu là những bí quyết đơn thuần giúp bạn ghi nhớ lâu hơn, khai thác nhiều hơn tiềm năng não bộ của mình.

Nói một cách đơn giản, não trái đảm nhiệm việc tư duy, phân tích và não phải nhận thức về không gian, sáng tạo. Bạn sẽ không thể nhớ lâu hay học nhanh nếu không biết kết hợp cả hai bán cầu não này. Đó chính là một trong những bí quyết để bạn có thể ghi nhớ tốt hơn.

Jonathan Hancock – người hai lần đạt kỷ lục Guinness và là cựu vô địch thế giới về Trí nhớ đã tiết lộ trong quyển sách “Bí quyết học nhanh nhớ lâu” của mình lời giải đáp cho câu hỏi: “Vì sao có nhiều người có thể vừa học đã nhớ và nhớ rất lâu, nhưng ngược lại cũng có những người dù học thế nào cũng không thể nhớ hết các kiến thức, đến khi nhớ rồi thì cũng rất nhanh quên đi.”', N'biquyethocnhanhnholau.jpg', CAST(N'2021-06-19T00:00:00.000' AS DateTime), 16, 2, 1, 1, N'180 x 90 x 70', N'2 Kilogram')
INSERT [dbo].[SACH] ([MaSach], [TenSach], [GiaBan], [GiaBia], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaCD], [MaNXB], [Status], [Size], [Weight]) VALUES (6, N'Lãnh đạo bằng sức mạnh trí tuệ cảm xúc', CAST(167000 AS Decimal(18, 0)), 192000, N'Định kiến về sự phiền nhiễu của cảm xúc tại nơi làm việc đã cắm rễ quá sâu trong suy nghĩ của hầu hết chúng ta. Trên thực tế, mặc dù năng lực nhận thức thuần túy và năng lực chuyên môn là cần thiết cho công việc, nhưng chính các năng lực trí nhớ cảm xúc mới giúp phân định ra nhà lãnh đạo xuất chúng.', N'lanhdaobangtrituecamxuc.jpg', CAST(N'2021-06-17T00:00:00.000' AS DateTime), 16, 3, 5, 1, N'180 x 90 x 70', N'2 Kilogram')
INSERT [dbo].[SACH] ([MaSach], [TenSach], [GiaBan], [GiaBia], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaCD], [MaNXB], [Status], [Size], [Weight]) VALUES (7, N'Giáo trình SQL Server', CAST(180000 AS Decimal(18, 0)), 210000, N'Hệ quản trị cơ sở dữ liệu SQl Server 2003. Khi quản lý dự án đã trở thành một phương pháp quản lý được công nhận rộng rãi hơn, chính phủ, cá nhân và cả các tổ chức khu vực công và tư nhân đã trở nên quan tâm đến các khuôn khổ và tiêu chuẩn mô tả mức độ hiệu quả nơi làm việc chấp nhận được cho nhân viên dự án.

Trong cuốn sách này, tác giả đề xuất một loại hình dựa trên việc quản lý các dự án công công tạo thành quan hệ đối tác với các khu vực tư nhân. Tiếp cận dựa trên hai biến chính: (1) Sự gần gũi của mục tiêu và (2) Khả năng tạo dự án. Sau đó, chúng ta có thể xác định các thách thức quản lý, rủi ro và các vấn đề chính của từng loại hình PPP được mô tả để hỗ trợ các nhóm quản lý và đóng góp vào việc phát triển kiến thức hữu ích trong lĩnh vực này.', N'giaotrinhsql.png', CAST(N'2021-06-10T00:00:00.000' AS DateTime), 6, 12, 6, 1, N'180 x 90 x 70', N'2 Kilogram')
INSERT [dbo].[SACH] ([MaSach], [TenSach], [GiaBan], [GiaBia], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaCD], [MaNXB], [Status], [Size], [Weight]) VALUES (8, N'Dinh dưỡng chữa bệnh rau củ', CAST(61000 AS Decimal(18, 0)), 90000, N'Cuộc sống hiện đại ngày nay, do nhiều nguyên nhân khác nhau, rất nhiều người, nhất là người ở độ tuổi trung niên và người cao tuổi thường mắc bệnh cao huyết áp, bệnh tim, tiểu đường…Vì vậy họ luôn quan tâm đến một chế độ ăn uống lành mạnh, đầy đủ dưỡng chất cho cơ thể mà không ảnh hưởng tới sức khỏe. Bộ sách "Thực phẩm chữa bệnh" sẽ là một món quà vô cùng ý nghĩa dành tặng cho chính bản thân của mỗi người, để tiếp thêm nguồn kiến thức, sinh lực nuôi dưỡng một "sức khỏe vàng" tốt nhất có thể.', N'dinhduongchuabenhraucu.jpg', CAST(N'2021-06-12T00:00:00.000' AS DateTime), 36, 5, 8, 1, N'180 x 90 x 70', N'2 Kilogram')
INSERT [dbo].[SACH] ([MaSach], [TenSach], [GiaBan], [GiaBia], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaCD], [MaNXB], [Status], [Size], [Weight]) VALUES (9, N'Cẩm nang chăm sóc bà mẹ và em bé', CAST(67000 AS Decimal(18, 0)), 120100, N'Cẩm nang chăm sóc bà mẹ & em bé sẽ hướng dẫn cho bạn một cách tường tận cách chăm sóc con từng bước một, với hơn 800 hình ảnh minh họa thực tế trình bày quá trình mang thai, sinh nở và nuôi con, cùng các giải pháp hiệu quả và tối ưu cho tất cả các vấn đề mà một người mẹ thường gặp phải.

Các phương pháp nuôi dưỡng và giáo dục con được đưa ra trong sách là những phương pháp khoa học nhất được đúc kết từ trước đến nay cùng các cách chẩn đoán bệnh, chữa trị hiệu quả cho tất cả các loại bệnh mà con bạn thường gặp. ', N'camnangchamsocbamevaembe.jpg', CAST(N'2021-06-14T00:00:00.000' AS DateTime), 16, 5, 6, 1, N'180 x 90 x 70', N'2 Kilogram')
INSERT [dbo].[SACH] ([MaSach], [TenSach], [GiaBan], [GiaBia], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaCD], [MaNXB], [Status], [Size], [Weight]) VALUES (10, N'Thay đổi cuộc sống với Nhân số học', CAST(210000 AS Decimal(18, 0)), 324000, N'Cuốn sách Thay đổi cuộc sống với Nhân số học là tác phẩm được chị Lê Đỗ Quỳnh Hương phát triển từ tác phẩm gốc “The Complete Book of Numerology” của tiến sỹ David A. Phillips, khiến bộ môn Nhân số học khởi nguồn từ nhà toán học Pythagoras trở nên gần gũi, dễ hiểu hơn với độc giả Việt Nam.', N'thaydoicuocsongnhansohoc.jpg', CAST(N'2021-06-14T00:00:00.000' AS DateTime), 6, 1, 3, 1, N'180 x 90 x 70', N'2 Kilogram')
INSERT [dbo].[SACH] ([MaSach], [TenSach], [GiaBan], [GiaBia], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaCD], [MaNXB], [Status], [Size], [Weight]) VALUES (11, N'Học vui, hiểu rộng, biết nhiều- Khám phá cơ thể', CAST(261000 AS Decimal(18, 0)), 450000, N'Với mục đích đem lại nhiều kiến thức khoa học với cách giải thích và trình bày dễ hiểu nhất, cũng như gợi niềm đam mê tìm tòi, hiểu biết của các bạn nhỏ, tác giả Ruth Owen đã cho ra đời bộ sách “Học Vui, hiểu rộng, biết nhiều” với nhiều chủ đề khác nhau về con người, tự nhiên và các kiến thức khoa học. Bộ sách trang bị những kiến thức khoa học thường thức cơ bản, được thiết kế riêng như một món quà cho các bạn nhỏ yêu thích tìm tòi, khám phá.

 “Khám phá cơ thể” là một tập sách nằm trong bộ sách “Học Vui, hiểu rộng, biết nhiều”.', N'khamphacothe.jpg', CAST(N'2021-06-01T00:00:00.000' AS DateTime), 16, 12, 8, 1, N'180 x 90 x 70', N'2 Kilogram')
INSERT [dbo].[SACH] ([MaSach], [TenSach], [GiaBan], [GiaBia], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaCD], [MaNXB], [Status], [Size], [Weight]) VALUES (12, N'Thí nghiệm tuyệt vời ông mặt trời', CAST(21000 AS Decimal(18, 0)), 30000, N'Bạn đã từng nghe nói đến hệ thống giáo dục STEM dành cho các em học sinh chưa? STEM là viết tắt của các từ Science (Khoa học), Technology (Công nghệ), Engineering (Kỹ thuật) và Math (Toán học). 
 
Giáo dục STEM về bản chất được hiểu là trang bị cho người...', N'101-thi-nghiem-tuyet-voi-ong-mat-troi.jpg', CAST(N'2021-05-01T00:00:00.000' AS DateTime), 16, 10, 7, 1, N'180 x 90 x 70', N'2 Kilogram')
INSERT [dbo].[SACH] ([MaSach], [TenSach], [GiaBan], [GiaBia], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaCD], [MaNXB], [Status], [Size], [Weight]) VALUES (13, N'Thực hành ngữ pháp tiếng Anh', CAST(85000 AS Decimal(18, 0)), 90000, N'30 phút mỗi ngày để luyện kỹ năng viết câu tiếng Anh là một cuốn sách bài tập dành cho những học sinh/sinh viên,
 nghiêm túc quan tâm đến tầm quan trọng của việc nâng cao những yếu tố kỹ thuật cho kỹ năng viết của mình. 
 Rèn luyện để viết cho tốt chẳng khác gì tự trang bị cho mình một sức mạnh cần thiết để thành công - 
 khi đi học cũng như khi ra ngoài xã hội. Trui rèn được một trình độ viết “cứng” không hề là chuyện bỗng nhiên trời cho mà có được; 
 đó phải là kết quả của một quá trình phấn đấu bền bỉ và rèn luyện chăm chỉ.
Đặc nét của sách này là sử dụng cách tiếp cận những kỹ thuật kết hợp câu cơ bản, có nghĩa là, 
sách không chỉ quan tâm đến việc tránh những sai lỗi, mà còn đặt mục tiêu tạo dựng được những câu hay, 
linh hoạt, và thể hiện một phong cách riêng. Cạnh đó, sách còn có những điểm đáng lưu ý như: 
- Bàn thảo rõ ràng về những qui tắc và kỹ thuật giúp viết tốt.
- Giải thích súc tích, hạn chế dùng những thuật ngữ ngữ pháp.
- Lương bài tập phong phú, đa dạng, từ những câu hỏi điền vào chỗ trống với mục đích xác định các từ loại cho đến những câu hỏi,
 kết hợp những câu ngắn thành những câu văn dài hơn, ý tứ “duyên” hơn.
- Đáp án cuối sách nhằm giúp học sinh/sinh viên học và nghiên cứu nhanh chậm theo trình độ và ý thích của mình, 
đồng thời kiểm tra được bài làm trong quá trình học tập.
Học sinh/sinh viên tiếp thu tốt nhất khi họ tham gia tích cực và quá trình học. 
Họ rất thích những bài tập nào rèn cho họ được những kỹ năng viết họ cần đồng thời có giá trị thông tin nào đó hoặc vui vui. 
Đó chính là lý do cuốn sách này sử dụng đủ loại chủ đề thú vị trong các bài tập. Cũng vì lý do tương tự, 
sách có phần trình bày và giảng giải rất ngắn gọn những đưa ra rất nhiều những ví dụ và minh họa mở rộng.
Sử dụng cuốn 30 phút mỗi ngày để luyện kỹ năng viết câu tiếng Anh này sẽ giúp học sinh/sinh viên viết “có nghề” và tự tin hơn".', N'hoctienganh.jpg', CAST(N'2021-06-21T00:00:00.000' AS DateTime), 16, 10, 1, 1, N'180 x 90 x 70', N'2 Kilogram')
INSERT [dbo].[SACH] ([MaSach], [TenSach], [GiaBan], [GiaBia], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaCD], [MaNXB], [Status], [Size], [Weight]) VALUES (14, N'7 Thói quen để trẻ hạnh phúc', CAST(210000 AS Decimal(18, 0)), 230000, N'Ở 7 Cây Sồi, bạn sẽ không có một giây phút nào để ù lì. Nếu không chơi đá banh với thỏ Jumper thì sẽ trồng vườn với chồn Lily… những người bạn này lúc nào cũng vui vẻ và luôn sẵn sàng học hỏi những điều mới mẻ. Với 7 câu chuyện được minh họa sống động, bạn sẽ thấy việc luôn ghi nhớ 7 Thói Quen quan trọng như thế nào. Thông qua những nhân vật đáng yêu và những câu chuyện vui nhộn, quyển sách này giúp trẻ tiếp cận với những giá trị và nguyên tắc bất hủ được đề cập trong cuốn 7 Thói quen của những người thành đạt­ – từ việc làm sao để chịu trách nhiệm với cuộc sống của chính mình đến việc khám phá vì sao cần giữ cân bằng trong cuộc sống.', N'7-thoi-quen-de-tre-hanh-phuc.jpg', CAST(N'2021-06-22T00:00:00.000' AS DateTime), 17, 2, 2, 1, N'180 x 90 x 70', N'2 Kilogram')
INSERT [dbo].[SACH] ([MaSach], [TenSach], [GiaBan], [GiaBia], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaCD], [MaNXB], [Status], [Size], [Weight]) VALUES (15, N'Xin đừng làm mẹ khóc', CAST(230000 AS Decimal(18, 0)), 345000, N'Tuyển tập những câu chuyện Hạt Giống Tâm Hồn hay nhất về Mẹ: XIN ĐỪNG LÀM MẸ KHÓC   “Mẹ! Có nghĩa là mãi mãi Là – cho – đi – không – đòi – lại – bao – giờ” (Thanh Nguyên) Trong mỗi người chúng ta, mẹ không chỉ là người sinh ra và nuôi nấng ta, mà còn là người có vị trí thật đặc biệt. Có những món ăn, không ai nấu ngon bằng mẹ, có những sở thích của ta, chỉ mẹ là người hiểu rõ nhất. Ấy mà, cũng có khi, ta làm mẹ buồn, cũng có khi ta mãi vui chơi bên ngoài mà quên mất mẹ đang chờ ta ở nhà, có đôi khi ta làm mẹ khóc chỉ vì những hành động quá vô tâm của ta!', N'xindunglammekhoc.jpg', CAST(N'2021-05-02T00:00:00.000' AS DateTime), 16, 1, 3, 1, N'180 x 90 x 70', N'2 Kilogram')
INSERT [dbo].[SACH] ([MaSach], [TenSach], [GiaBan], [GiaBia], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaCD], [MaNXB], [Status], [Size], [Weight]) VALUES (16, N'Đứa trẻ lạc loài', CAST(143200 AS Decimal(18, 0)), 154300, N'Cuốn sách này là tập kế tiếp của tự truyện Không nơi nương tựa, với nội dung kể lại phần đời tiếp theo của cậu bé 5 tuổi luôn bị mẹ hành hạ và bỏ đói trong suốt nhiều năm. Đây là phân đoạn được chờ đợi từ lâu của Dave Pelzer sau khi cậu được giải thoát khỏi người mẹ độc ác. Những câu trả lời sẽ được hé lộ, những chuyến phiêu lưu mạo hiểm của tác giả – lúc này đã là một cậu bé vị thành niên – sẽ được kể lại trong câu chuyện đầy lôi cuốn này.

Hãy hình dung về một cậu bé chưa bao giờ có được một mái nhà. Tài sản duy nhất của cậu là những bộ quần áo cũ kỹ rách nát đựng trong một chiếc túi bằng giấy. Thế giới của cậu tràn ngập trong bóng tối và nỗi sợ hãi. Cho dù đã được giải thoát khỏi người mẹ nghiện ngập, nhưng những tổn thương của cậu bé này thực sự mới chỉ bắt đầu – bởi cậu không có nơi nào để gọi là nhà. Giờ đây, với thân phận là một đứa con nuôi, cậu bé David lại chịu cảnh thay đổi chỗ ở liên tục với tổng cộng sáu gia đình trong suốt thời niên thiếu. Nước mắt và nụ cười, sự thất vọng và hy vọng – tất cả đan quyện trong cuộc hành trình liều lĩnh của cậu bé lạc loài này trên con đường tìm kiếm một mái ấm gia đình.', N'duatrelacloai.jpg', CAST(N'2021-06-20T00:00:00.000' AS DateTime), 90, 6, 9, 1, N'180 x 90 x 70', N'2 Kilogram')
INSERT [dbo].[SACH] ([MaSach], [TenSach], [GiaBan], [GiaBia], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaCD], [MaNXB], [Status], [Size], [Weight]) VALUES (17, N'Tôi học đại học', CAST(200000 AS Decimal(18, 0)), 210000, N'TỰ TRUYỆN CỦA NHÀ VĂN - NHÀ GIÁO ƯU TÚ NGUYỄN NGỌC KÝ Tôi học đại học“Có những con người như hạt giống trong ta…”               

Thầy Nguyễn Ngọc Ký sinh ngày 28-06-1947 tại Hải Thanh, Hải Hậu, Nam Định. Thầy bị liệt đôi tay từ năm 4 tuổi; 7 tuổi đi học và dùng chân để viết. Hai lần thầy được Bác Hồ thưởng huy hiệu vì thành tích vượt khó học giỏi. Năm 1970, Nguyễn Ngọc Ký tốt nghiệp Đại học Tổng hợp Hà Nội, khoa Ngữ Văn, sau đó đi dạy và trở thành Nhà giáo Ưu tú năm 1992 và là nhà văn Việt Nam đầu tiên viết bằng chân.

Thầy Nguyễn Ngọc Ký được tuổi trẻ cả nước biết đến trong suốt 50 năm qua và xem thầy là tấm gương sáng qua các bài trong sách giáo khoa như EM KÝ ĐI HỌC (sách Tập đọc lớp 3 từ 1964-1983,) ANH KÝ ĐI HỌC (sách Kể chuyện lớp 4 từ 1983-2000), BÀN CHÂN KỲ DIỆU (sách Tiếng Việt lớp 4 từ 2000 đến nay). Nếu quyển sách Tôi đi học, bạn đọc đã biết đến một Nguyễn Ngọc Ký 12 năm đèn sách thì nay, quyển tự truyện thứ hai Tôi học Đại học, bạn đọc sẽ càng hiểu và cảm phục hơn về những năm tháng Nguyễn Ngọc Ký phải rời xa quê hương, mọi việc phải nhờ đến đôi chân, nhất là trong hoàn cảnh vô cùng khó khăn khi mọi trường học phải rời xa thành phố sơ tán về học ở các tỉnh miền núi mà vẫn luôn học tốt.', N'toihocdaihoc.jpg', CAST(N'2021-05-11T00:00:00.000' AS DateTime), 16, 8, 5, 1, N'180 x 90 x 70', N'2 Kilogram')
INSERT [dbo].[SACH] ([MaSach], [TenSach], [GiaBan], [GiaBia], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaCD], [MaNXB], [Status], [Size], [Weight]) VALUES (18, N'Vị tu sĩ bán chiếc Ferrari', CAST(25000 AS Decimal(18, 0)), 300000, N'Vị Tu Sĩ Bán Chiếc Ferrari không phải là một cuốn sách xa lạ, cuốn sách này là một trong những ấn phẩm kinh điển của thế giới về đề tài truyền cảm hứng, theo đuổi lý tưởng sống, và hướng về một cuộc sống hạnh phúc. Đây cũng là cuốn...', N'vitusibanchiecferrari..jpg', CAST(N'2021-03-18T00:00:00.000' AS DateTime), 23, 6, 9, 1, N'180 x 90 x 70', N'2 Kilogram')
INSERT [dbo].[SACH] ([MaSach], [TenSach], [GiaBan], [GiaBia], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaCD], [MaNXB], [Status], [Size], [Weight]) VALUES (19, N'Không nghĩ đến thật bại', CAST(16800 AS Decimal(18, 0)), 200000, N'"Không bao giờ là thất bại! Tất cả là thử thách" 
Tự truyện nổi tiếng của cố chủ tịch tập đoàn Huyndai
Đây là ấn phẩm đạt số lượng phát hành kỷ lục - 500.000 bản tại Việt Nam. Trải qua 15 năm, "Không bao giờ là thất bại! Tất cả là thử thách" đã vượt khỏi khuôn khổ tựa đề một cuốn sách, trở thành phương châm sống của rất nhiều bạn trẻ Việt Nam.

“Không bao giờ là thất bại! Tất cả là thử thách” thuật lại chi tiết cuộc đời và sự nghiệp của Chung Ju Yung - cố chủ tịch tập đoàn Huyndai. Không chỉ kể lại hành trình và kinh nghiệm của người sáng lập nên một trong những thương hiệu nổi tiếng nhất thế giới mà còn chứa đựng những bài học ấn tượng về quản trị, kinh doanh cũng như đạo làm người, đây là quyển sách gối đầu giường của rất nhiều thế hệ doanh nhân', N'khong-bao-gio-la-that-bai-tat-ca chi-la-thu-thach.jpg', CAST(N'2021-03-24T00:00:00.000' AS DateTime), 16, 9, 9, 1, N'180 x 90 x 70', N'2 Kilogram')
INSERT [dbo].[SACH] ([MaSach], [TenSach], [GiaBan], [GiaBia], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaCD], [MaNXB], [Status], [Size], [Weight]) VALUES (20, N'Bush và quyền lực nước Mỹ', CAST(220000 AS Decimal(18, 0)), 245000, N'Đây một cuốn sách hay và là công trình khảo cứu công phu nhất về nội các chiến tranh của chính quyền Mỹ và phân tích sâu sắc các nguyên nhân thực sự và diễn tiến bên trong hai cuộc chiến tranh Afganistan và Iraq đang diễn ra do First News và Đại tướng Mai Chí Thọ thực hiện.         

Ngày 11-9 là một ngày...', N'bushb.jpg', CAST(N'2021-06-21T00:00:00.000' AS DateTime), 21, 9, 8, 1, N'180 x 90 x 70', N'2 Kilogram')
INSERT [dbo].[SACH] ([MaSach], [TenSach], [GiaBan], [GiaBia], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaCD], [MaNXB], [Status], [Size], [Weight]) VALUES (21, N'Adobe Photoshop 6.0 và ImageReady 3.0 ', CAST(21000 AS Decimal(18, 0)), 24000, N'Cuốn sách Adobe Photoshop 6.0 và ImageReady 3.0 này sẽ giúp bạn tìm hiểu những tính năng tuyệt vời của phiên bản 6.0, 
nó cũng là con đường ngắn nhất cho những người mới sử dụng Photoshop lần đầu. Với bạn đọc đã sử dụng cuốn sách 
"Adobe Photoshop 5.5 và ImageReady 2.0" do MK.PUB biên soạn trước đây, cuốn sách này là một cách cập nhật nhanh chóng nhất.
Adobe Photoshop 6.0 và ImageReady 3.0 gồm hai phần chính, đan xen nhau: 
Adobe Photoshop 6.0: trình bày các kỹ thuật xử lý ảnh cao cấp, các tính năng mới, giúp bạn tạo được các ảnh đẹp, 
rõ nét và mang tính mỹ thuật cao, hỗ trợ đắc lực cho các chương trình dàn trang và tách màu điện tử. 
Đặc biệt trong phiên bản này, để đáp ứng cho mong mỏi từ lâu của người dùng, 
các hình thể vector bắt đầu được đưa vào sử dụng trong môi trường Photoshop.', N'adobe.jpg', CAST(N'2021-05-28T00:00:00.000' AS DateTime), 74, 12, 5, 1, N'180 x 90 x 70', N'2 Kilogram')
INSERT [dbo].[SACH] ([MaSach], [TenSach], [GiaBan], [GiaBia], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaCD], [MaNXB], [Status], [Size], [Weight]) VALUES (22, N'Nhân vật số một Validin Putin', CAST(250000 AS Decimal(18, 0)), 264000, N'Cuộc đời của Putin là một chuỗi những sự kiện, biến động nhưng con đường vươn đến nắm quyền điều khiển nước Nga được đánh giá là nhanh và bất ngờ. Xuất thân là một sĩ quan KGB (nay là FSB), Putin đã từng nắm giữ chức vụ Phó chủ tịch Hội đồng Thành phố St. Petersburg và sau đó là giám đốc Cục An Ninh Quốc gia (FSB), Thủ tướng Nga, Quyền Tổng thống Nga và chính thức là Tổng thống Nga sau thắng lợi tại cuộc bầu cử tổng thống 5 tháng sau đó.

Từ cảm xúc một người Nga Tôi nhớ lại giọng nói của một trong những người bạn Nga kể về niềm vui sâu sắc khi chứng kiến ánh mắt xúc động của những cựu chiến binh từng là Hồng Quân Xô Viết khi nghe tiếng nhạc quốc thiều vang lên tại lễ duyệt binh trên Quảng Trường Đỏ ngày 7/11/2000 và lễ kỷ niệm chiến thắng phát xít Đức ngày 30/4/2001. Vâng, người bạn Nga của tôi đã đồng cảm với những chiến sĩ Hồng Quân năm xưa khi được nghe lại giai điệu của “Cuộc chiến tranh thần thánh” đã từng gắn bó, đi suốt mấy chục năm trời với con người Xô Viết. Người bạn mà gần cả chục năm trở lại đây tôi chỉ đọc được những nỗi buồn trầm lặng và luyến tiếc qua ánh mắt không lời mỗi khi nhắc tới nước Nga trước kia. Những giờ phút cuối cùng của đêm 31/12/1999 qua đi không chỉ mở ra cho thế giới một kỷ nguyên mới mà còn có ý nghĩa vô cùng quan trọng với nước Nga, khi đất nước rộng lớn nhất thế giới này đang bên bờ vực thẳm với bao biến động đi xuống tưởng chừng không thể có phép màu nào kìm hãm được về kinh tế, chính trị, đối nội, đối ngoại... đón chào vị tổng thống thứ hai trong lịch sử của mình, đó là Vladimir Putin.

Mọi người đã từng nghĩ nước Nga sẽ mãi mãi mất đi hình ảnh của một cường quốc hàng đầu thế giới và lòng tự hào bất tận, quá khứ hào hùng của người Nga. Những kỷ niệm về đất nước và con người Xô Viết những tưởng chỉ còn trong hoài niệm tiếc nuối của ký ức. Con tàu lớn nước Nga đang lạc trong sóng gió trong đêm tối được trao quyền cho người thuyền trưởng mới: Putin. Và không chỉ sinh ra như một người để “cứu nước Nga”, sinh ra để “làm người Nga” như mọi người từng biết.

Các bạn hãy cùng cuốn sách mới này khám phá một tính cách trầm lặng độc đáo, một bản lĩnh khôn khéo và một sự thông minh không khuất phục của một công dân hàng đầu nước Nga - một chính khách độc lập và đầy tự tin - người mà sự nghiệp và ảnh hưởng đối với thế giới chúng ta chỉ mới đang bắt đầu. Và hơn thế nữa - không phải quá sớm để nói điều này - Putin đã chứng minh một điều mà trước nay ít từng xảy ra: một cá nhân, một con người có tầm nhìn xa trông rộng, biết vận dụng thông minh và hành động không khoan nhượng có thể làm thay đổi vận mệnh cả một quốc gia và tác động tích cực đến các quốc gia khác trên thế giới - cho dù hoàn cảnh khồng hề thuận lợi, dù xung quanh ít bạn nhiều thù - có thể khôi phục, lấy lại những gì tưởng chừng đã mất bằng chính sức lực của mình - đó là niềm tự hào và lý tưởng dân tộc.

Tính cách người thuyền trưởng Trước khi lên nắm giữ chức tổng thống Nga và thậm chí trong suốt thời gian được Boris Yeltsin bổ nhiệm làm Thủ tướng Nga thì đối với chính giới, Putin vẫn ít người biết đến và được coi là một nhân vật bí ẩn. Cuộc đời của Putin là một chuỗi những sự kiện, biến động nhưng con đường vươn đến nắm quyền điều khiển nước Nga được đánh giá là nhanh và bất ngờ. Xuất thân là một sĩ quan KGB (nay là FSB), Putin đã từng nắm giữ chức vụ Phó chủ tịch Hội đồng Thành phố St. Petersburg và sau đó là giám đốc Cục An Ninh Quốc gia (FSB), Thủ tướng Nga, Quyền Tổng thống Nga và chính thức là Tổng thống Nga sau thắng lợi tại cuộc bầu cử tổng thống 5 tháng sau đó. First Person không chỉ đơn thuần liệt kê tiểu sử hay kể về Putin. Và First Person chắc chắn sẽ không thành công và đặc biệt như ấn bản các bạn đang đọc nếu chỉ tổng kết những gì đã trải qua của Putin để trả lời cho câu hỏi “Putin là ai?” mà nhà báo Trudy Rubin của tờ Philadelphia Inquirer đã hỏi các chính trị gia và thương gia Nga vào tháng 2 năm 2000 tại Davos mà còn trả lời cho câu hỏi “Putin là người như thế nào?” First Person là một bức chân dung tự họa gần gũi và chân thực về nhân vật nắm trong tay mình tương lai và vận mệnh của nước Nga.', N'putinb.jpg', CAST(N'2021-06-20T00:00:00.000' AS DateTime), 16, 9, 4, 1, N'180 x 90 x 70', N'2 Kilogram')
INSERT [dbo].[SACH] ([MaSach], [TenSach], [GiaBan], [GiaBia], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaCD], [MaNXB], [Status], [Size], [Weight]) VALUES (23, N'Thái độ quyết định thành công', CAST(168000 AS Decimal(18, 0)), 201000, N'Trong cuộc sống, có những người dù có tài và học thức cao nhưng vẫn không thành công. Ngược lại, có những người tuy rất bình thường nhưng thành công vẫn luôn mỉm cười với họ. Chuyện thành – bại, hay được – mất phụ thuộc rất lớn vào thái độ sống của mỗi chúng ta.

Ai đó từng nói rằng “tương lai thuộc về người biết đón nhận và giữ lấy nó”. Thật vậy, không ít người dù trong khó khăn vẫn luôn tìm thấy cơ hội cho mình, nhưng cũng không ít người khi cơ hội đến, họ lại chần chừ, rồi bỏ qua vì ngại gian khổ. Có người vượt qua trở ngại bằng thái độ lạc quan, lại có người chao đảo bởi những ý nghĩ tiêu cực. Bởi vậy, không quá khi nói rằng “Thái độ đóng vai trò quyết định chuyện thành - bại của mỗi người”. Không đơn giản là yếu tố thuộc về cảm xúc, cũng không phải là kết quả của bất kỳ tác động bên ngoài nào, thái độ là yếu tố thuộc về nhân sinh quan của chúng ta.', N'thaidoquyetdinhthanhcong.jpg', CAST(N'2021-06-14T00:00:00.000' AS DateTime), 77, 1, 5, 1, N'180 x 90 x 70', N'2 Kilogram')
SET IDENTITY_INSERT [dbo].[SACH] OFF
GO
SET IDENTITY_INSERT [dbo].[TACGIA] ON 

INSERT [dbo].[TACGIA] ([MaTG], [TenTG], [DiaChi], [TieuSu], [DienThoai]) VALUES (1, N'Sean Covey', N'197 Trần Hưng Đạo', N'', N'98877668')
INSERT [dbo].[TACGIA] ([MaTG], [TenTG], [DiaChi], [TieuSu], [DienThoai]) VALUES (2, N'Johnthan Hamcock', N'179 Chánh hưng - F.4 - Q.8 Tp.HCM', N'', N'19001611')
INSERT [dbo].[TACGIA] ([MaTG], [TenTG], [DiaChi], [TieuSu], [DienThoai]) VALUES (3, N'Nhóm tác giả', N'45 Lý Thái Tổ-F2.Q.3 Tp.HCM', N'', N'19001570')
INSERT [dbo].[TACGIA] ([MaTG], [TenTG], [DiaChi], [TieuSu], [DienThoai]) VALUES (4, N'Jame R Doty .MD', NULL, NULL, NULL)
INSERT [dbo].[TACGIA] ([MaTG], [TenTG], [DiaChi], [TieuSu], [DienThoai]) VALUES (5, N'Bos Woodward', NULL, NULL, NULL)
INSERT [dbo].[TACGIA] ([MaTG], [TenTG], [DiaChi], [TieuSu], [DienThoai]) VALUES (6, N'Elizabeth Fenwick', NULL, NULL, NULL)
INSERT [dbo].[TACGIA] ([MaTG], [TenTG], [DiaChi], [TieuSu], [DienThoai]) VALUES (7, N'Nguyễn Mai Trung', NULL, NULL, NULL)
INSERT [dbo].[TACGIA] ([MaTG], [TenTG], [DiaChi], [TieuSu], [DienThoai]) VALUES (8, N'Trần Nguyễn Hoàng Long', NULL, NULL, NULL)
INSERT [dbo].[TACGIA] ([MaTG], [TenTG], [DiaChi], [TieuSu], [DienThoai]) VALUES (9, N'Dave Pelzer', NULL, NULL, NULL)
INSERT [dbo].[TACGIA] ([MaTG], [TenTG], [DiaChi], [TieuSu], [DienThoai]) VALUES (10, N'Trần Quang Thân (Chủ biên)', NULL, NULL, NULL)
INSERT [dbo].[TACGIA] ([MaTG], [TenTG], [DiaChi], [TieuSu], [DienThoai]) VALUES (11, N'Nguyễn Thành Yến', NULL, NULL, NULL)
INSERT [dbo].[TACGIA] ([MaTG], [TenTG], [DiaChi], [TieuSu], [DienThoai]) VALUES (12, N'Ruth Owen', NULL, NULL, NULL)
INSERT [dbo].[TACGIA] ([MaTG], [TenTG], [DiaChi], [TieuSu], [DienThoai]) VALUES (13, N'Chung Ju Yung', N'Hyandai- Korea', N'', N'8504122')
INSERT [dbo].[TACGIA] ([MaTG], [TenTG], [DiaChi], [TieuSu], [DienThoai]) VALUES (14, N'Daniel GoelMan', N'124 Bắc Hải P.6 Q.TB', N'', N'0918121188')
INSERT [dbo].[TACGIA] ([MaTG], [TenTG], [DiaChi], [TieuSu], [DienThoai]) VALUES (15, N'GS. John Vu Nguyên Phong', N'', N'', N'')
INSERT [dbo].[TACGIA] ([MaTG], [TenTG], [DiaChi], [TieuSu], [DienThoai]) VALUES (16, N'George Samuel Clason', N'', N'', N'')
INSERT [dbo].[TACGIA] ([MaTG], [TenTG], [DiaChi], [TieuSu], [DienThoai]) VALUES (17, N'Wayne Cordeiro', NULL, NULL, NULL)
INSERT [dbo].[TACGIA] ([MaTG], [TenTG], [DiaChi], [TieuSu], [DienThoai]) VALUES (18, N'Lê Đỗ Quỳnh Hương', NULL, NULL, NULL)
INSERT [dbo].[TACGIA] ([MaTG], [TenTG], [DiaChi], [TieuSu], [DienThoai]) VALUES (19, N'Nhà giáo ƯT Nguyễn Ngọc Kí', NULL, NULL, NULL)
INSERT [dbo].[TACGIA] ([MaTG], [TenTG], [DiaChi], [TieuSu], [DienThoai]) VALUES (20, N'Robin Sharma', NULL, NULL, NULL)
INSERT [dbo].[TACGIA] ([MaTG], [TenTG], [DiaChi], [TieuSu], [DienThoai]) VALUES (21, N'Richard Boyatzis', NULL, NULL, NULL)
INSERT [dbo].[TACGIA] ([MaTG], [TenTG], [DiaChi], [TieuSu], [DienThoai]) VALUES (22, N'Annie Mckee', NULL, NULL, NULL)
INSERT [dbo].[TACGIA] ([MaTG], [TenTG], [DiaChi], [TieuSu], [DienThoai]) VALUES (23, N'Nguyễn Thôn Dã', NULL, NULL, NULL)
INSERT [dbo].[TACGIA] ([MaTG], [TenTG], [DiaChi], [TieuSu], [DienThoai]) VALUES (24, N'Đức Nhật', NULL, NULL, NULL)
INSERT [dbo].[TACGIA] ([MaTG], [TenTG], [DiaChi], [TieuSu], [DienThoai]) VALUES (25, N'Uyên Linh', NULL, NULL, NULL)
INSERT [dbo].[TACGIA] ([MaTG], [TenTG], [DiaChi], [TieuSu], [DienThoai]) VALUES (26, N'Nguyễn Hoàng Phương Thảo', N'Khám phá cơ thể', NULL, NULL)
INSERT [dbo].[TACGIA] ([MaTG], [TenTG], [DiaChi], [TieuSu], [DienThoai]) VALUES (27, N'Hoàng Huấn', N'Hà NỘI', NULL, NULL)
INSERT [dbo].[TACGIA] ([MaTG], [TenTG], [DiaChi], [TieuSu], [DienThoai]) VALUES (28, N'Lê Huy Khoa', N'Không nghĩ đến thật bại', NULL, NULL)
INSERT [dbo].[TACGIA] ([MaTG], [TenTG], [DiaChi], [TieuSu], [DienThoai]) VALUES (29, N'Kim Vân- Nhã Viện', NULL, NULL, NULL)
INSERT [dbo].[TACGIA] ([MaTG], [TenTG], [DiaChi], [TieuSu], [DienThoai]) VALUES (30, N'Cẩm Xuân', NULL, NULL, NULL)
INSERT [dbo].[TACGIA] ([MaTG], [TenTG], [DiaChi], [TieuSu], [DienThoai]) VALUES (31, N'Susan Curtis', NULL, NULL, NULL)
INSERT [dbo].[TACGIA] ([MaTG], [TenTG], [DiaChi], [TieuSu], [DienThoai]) VALUES (32, N'Pat Thomas', NULL, NULL, NULL)
INSERT [dbo].[TACGIA] ([MaTG], [TenTG], [DiaChi], [TieuSu], [DienThoai]) VALUES (33, N'Dragana Vilinac', NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[TACGIA] OFF
GO
SET IDENTITY_INSERT [dbo].[TAIKHOAN] ON 

INSERT [dbo].[TAIKHOAN] ([ID], [ID_LOAITK], [HOTEN], [USERNAME], [MATKHAU], [EMAIL_TK], [DIACHI_TK], [SDT], [GHICHU_TK], [IS_DELETE], [CREATEBY], [CREATEDATE], [MODIFILEDBY], [MODIFILEDDATE], [STATUS]) VALUES (1, 1, N'nguyễn trọng nhân', N'trongnhan', N'123', N'nguyennhan@gmail.com', N'cần thơ', NULL, NULL, 0, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[TAIKHOAN] ([ID], [ID_LOAITK], [HOTEN], [USERNAME], [MATKHAU], [EMAIL_TK], [DIACHI_TK], [SDT], [GHICHU_TK], [IS_DELETE], [CREATEBY], [CREATEDATE], [MODIFILEDBY], [MODIFILEDDATE], [STATUS]) VALUES (2, 3, N'nguyễn văn hà', N'vanha', N'123', N'ha@gmail.com', N'tp HCM', NULL, NULL, 0, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[TAIKHOAN] ([ID], [ID_LOAITK], [HOTEN], [USERNAME], [MATKHAU], [EMAIL_TK], [DIACHI_TK], [SDT], [GHICHU_TK], [IS_DELETE], [CREATEBY], [CREATEDATE], [MODIFILEDBY], [MODIFILEDDATE], [STATUS]) VALUES (3, 3, N'trương triệu thiên', N'trieuthien', N'123', N'thien@gmail.com', N'sài gòn', NULL, NULL, 0, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[TAIKHOAN] ([ID], [ID_LOAITK], [HOTEN], [USERNAME], [MATKHAU], [EMAIL_TK], [DIACHI_TK], [SDT], [GHICHU_TK], [IS_DELETE], [CREATEBY], [CREATEDATE], [MODIFILEDBY], [MODIFILEDDATE], [STATUS]) VALUES (4, 2, N'phạm văn điền', N'vandien', N'123', N'dien@gmail.com', N'ninh thuận', NULL, NULL, 0, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[TAIKHOAN] ([ID], [ID_LOAITK], [HOTEN], [USERNAME], [MATKHAU], [EMAIL_TK], [DIACHI_TK], [SDT], [GHICHU_TK], [IS_DELETE], [CREATEBY], [CREATEDATE], [MODIFILEDBY], [MODIFILEDDATE], [STATUS]) VALUES (5, 4, N'Nguyễn Văn A', N'a', N'123456', N'a@gmail.com', N'12 Trần Huy Liệu', NULL, NULL, 0, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[TAIKHOAN] ([ID], [ID_LOAITK], [HOTEN], [USERNAME], [MATKHAU], [EMAIL_TK], [DIACHI_TK], [SDT], [GHICHU_TK], [IS_DELETE], [CREATEBY], [CREATEDATE], [MODIFILEDBY], [MODIFILEDDATE], [STATUS]) VALUES (6, 3, N'Nguyễn Trọng Nhân 2', N'NTN-Hacker', N'123456', N'nguyennhan8521@gmail.com', N'KTX Đại học quốc gia', NULL, NULL, 0, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[TAIKHOAN] ([ID], [ID_LOAITK], [HOTEN], [USERNAME], [MATKHAU], [EMAIL_TK], [DIACHI_TK], [SDT], [GHICHU_TK], [IS_DELETE], [CREATEBY], [CREATEDATE], [MODIFILEDBY], [MODIFILEDDATE], [STATUS]) VALUES (7, 1, N'Nguyễn Văn Hà 2', N'ha', N'123456', N'ha@hgmail.com', N'32 Sư Vạn Hạnh', NULL, NULL, 0, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[TAIKHOAN] ([ID], [ID_LOAITK], [HOTEN], [USERNAME], [MATKHAU], [EMAIL_TK], [DIACHI_TK], [SDT], [GHICHU_TK], [IS_DELETE], [CREATEBY], [CREATEDATE], [MODIFILEDBY], [MODIFILEDDATE], [STATUS]) VALUES (8, 1, N'Phạm Văn Điền 2', N'dien', N'123456', N'dien@gmail.com', N'12 Khu chung cư', NULL, NULL, 0, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[TAIKHOAN] ([ID], [ID_LOAITK], [HOTEN], [USERNAME], [MATKHAU], [EMAIL_TK], [DIACHI_TK], [SDT], [GHICHU_TK], [IS_DELETE], [CREATEBY], [CREATEDATE], [MODIFILEDBY], [MODIFILEDDATE], [STATUS]) VALUES (10, 3, N'Nguyễn Thế Giang', N'giang', N'123', N'giang@gmail.com', N'179 Chánh hung - F.4 - Q.8 Tp.HCM', NULL, NULL, 0, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[TAIKHOAN] ([ID], [ID_LOAITK], [HOTEN], [USERNAME], [MATKHAU], [EMAIL_TK], [DIACHI_TK], [SDT], [GHICHU_TK], [IS_DELETE], [CREATEBY], [CREATEDATE], [MODIFILEDBY], [MODIFILEDDATE], [STATUS]) VALUES (11, 2, N'Lê Việt Nhân', N'nhan', N'123', N'nhan@gmail.com', N'45 Lý Thái T?-F2.Q.3 Tp.HCM', NULL, NULL, 0, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[TAIKHOAN] ([ID], [ID_LOAITK], [HOTEN], [USERNAME], [MATKHAU], [EMAIL_TK], [DIACHI_TK], [SDT], [GHICHU_TK], [IS_DELETE], [CREATEBY], [CREATEDATE], [MODIFILEDBY], [MODIFILEDDATE], [STATUS]) VALUES (12, 1, N'Nguyễn Tấn Tín', N'tin', N'123', N'in@gmail.com', N'179 Chánh Hung F.4 Q.8 Tp.HCM', NULL, NULL, 0, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[TAIKHOAN] ([ID], [ID_LOAITK], [HOTEN], [USERNAME], [MATKHAU], [EMAIL_TK], [DIACHI_TK], [SDT], [GHICHU_TK], [IS_DELETE], [CREATEBY], [CREATEDATE], [MODIFILEDBY], [MODIFILEDDATE], [STATUS]) VALUES (13, 2, N'Phạm Phan Trung', N'trung', N'123', N'atrung@gmail.com', N'124 B?c H?i P.6 Q.TB', NULL, NULL, 0, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[TAIKHOAN] ([ID], [ID_LOAITK], [HOTEN], [USERNAME], [MATKHAU], [EMAIL_TK], [DIACHI_TK], [SDT], [GHICHU_TK], [IS_DELETE], [CREATEBY], [CREATEDATE], [MODIFILEDBY], [MODIFILEDDATE], [STATUS]) VALUES (16, 3, N'nguyễn thúy hậu 2', N'hau2', N'123', N'nguye@gmail.com', N'cantho city', N'0245678', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[TAIKHOAN] ([ID], [ID_LOAITK], [HOTEN], [USERNAME], [MATKHAU], [EMAIL_TK], [DIACHI_TK], [SDT], [GHICHU_TK], [IS_DELETE], [CREATEBY], [CREATEDATE], [MODIFILEDBY], [MODIFILEDDATE], [STATUS]) VALUES (17, 3, N'user_vitual', N'user1', N'123456', N'nguye@gmail.com', N'tp HCM', N'02154545', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[TAIKHOAN] ([ID], [ID_LOAITK], [HOTEN], [USERNAME], [MATKHAU], [EMAIL_TK], [DIACHI_TK], [SDT], [GHICHU_TK], [IS_DELETE], [CREATEBY], [CREATEDATE], [MODIFILEDBY], [MODIFILEDDATE], [STATUS]) VALUES (20, 3, N'nhan', N'user2', N'123', N's@dsd.com', N'long an', N'2912342', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[TAIKHOAN] ([ID], [ID_LOAITK], [HOTEN], [USERNAME], [MATKHAU], [EMAIL_TK], [DIACHI_TK], [SDT], [GHICHU_TK], [IS_DELETE], [CREATEBY], [CREATEDATE], [MODIFILEDBY], [MODIFILEDDATE], [STATUS]) VALUES (21, 3, N'nhan', N'nh', N'123', N'nguye@gmail.com', N'5 Trường Thọ- Cần Thơ', N'09472374', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[TAIKHOAN] ([ID], [ID_LOAITK], [HOTEN], [USERNAME], [MATKHAU], [EMAIL_TK], [DIACHI_TK], [SDT], [GHICHU_TK], [IS_DELETE], [CREATEBY], [CREATEDATE], [MODIFILEDBY], [MODIFILEDDATE], [STATUS]) VALUES (22, 3, N'nguyễn thúy hậu 2', N'kgd', N'123', N'd@gmail.com', N'mg', N'123', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[TAIKHOAN] ([ID], [ID_LOAITK], [HOTEN], [USERNAME], [MATKHAU], [EMAIL_TK], [DIACHI_TK], [SDT], [GHICHU_TK], [IS_DELETE], [CREATEBY], [CREATEDATE], [MODIFILEDBY], [MODIFILEDDATE], [STATUS]) VALUES (23, 3, N'nguyễn thúy hậu 2', N'fsakjfsajjdsakgjdaksmvvodsaodsapfpdsapfpdsafkdkspfkskfsdkagpkdmsdfsakjfsajjdsakgjdaksmvvodsaodsapfpdsapfpdsafkdkspfkskfsdkagpkdmsdbmdmpbfdmfbmdmpbfdmf', N'fdskf', N'dfs@gmai', N'fdsfds', N'fds', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[TAIKHOAN] ([ID], [ID_LOAITK], [HOTEN], [USERNAME], [MATKHAU], [EMAIL_TK], [DIACHI_TK], [SDT], [GHICHU_TK], [IS_DELETE], [CREATEBY], [CREATEDATE], [MODIFILEDBY], [MODIFILEDDATE], [STATUS]) VALUES (24, 3, N'nguyễn nhân', N'nhan', N'123', N'd@gmail.com', N'cần thơ', N'02545886', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[TAIKHOAN] ([ID], [ID_LOAITK], [HOTEN], [USERNAME], [MATKHAU], [EMAIL_TK], [DIACHI_TK], [SDT], [GHICHU_TK], [IS_DELETE], [CREATEBY], [CREATEDATE], [MODIFILEDBY], [MODIFILEDDATE], [STATUS]) VALUES (25, 3, N'nhân nguyễn', N'nhan0944', N'123', N'd@gmail.com', N'tp HCM', N'02154554', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[TAIKHOAN] ([ID], [ID_LOAITK], [HOTEN], [USERNAME], [MATKHAU], [EMAIL_TK], [DIACHI_TK], [SDT], [GHICHU_TK], [IS_DELETE], [CREATEBY], [CREATEDATE], [MODIFILEDBY], [MODIFILEDDATE], [STATUS]) VALUES (26, 3, N'user', N'user5', N'123', N'nguye@gmail.com', N'Bình Thuận', N'123456', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[TAIKHOAN] ([ID], [ID_LOAITK], [HOTEN], [USERNAME], [MATKHAU], [EMAIL_TK], [DIACHI_TK], [SDT], [GHICHU_TK], [IS_DELETE], [CREATEBY], [CREATEDATE], [MODIFILEDBY], [MODIFILEDDATE], [STATUS]) VALUES (27, 3, N'user6', N'user6', N'123456', N'nhannguyen@gmail.com', N'cần thơ', N'021458558', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[TAIKHOAN] ([ID], [ID_LOAITK], [HOTEN], [USERNAME], [MATKHAU], [EMAIL_TK], [DIACHI_TK], [SDT], [GHICHU_TK], [IS_DELETE], [CREATEBY], [CREATEDATE], [MODIFILEDBY], [MODIFILEDDATE], [STATUS]) VALUES (28, 3, N'nhan', N'hau2', N'123', N'nguye@gmail.com', N'01125554', N'024555', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[TAIKHOAN] ([ID], [ID_LOAITK], [HOTEN], [USERNAME], [MATKHAU], [EMAIL_TK], [DIACHI_TK], [SDT], [GHICHU_TK], [IS_DELETE], [CREATEBY], [CREATEDATE], [MODIFILEDBY], [MODIFILEDDATE], [STATUS]) VALUES (29, 3, N'nguyễn thúy hậu 2', N'hau2', N'123', N'mjh@gmail.com', N'bhvg', N'45166', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[TAIKHOAN] ([ID], [ID_LOAITK], [HOTEN], [USERNAME], [MATKHAU], [EMAIL_TK], [DIACHI_TK], [SDT], [GHICHU_TK], [IS_DELETE], [CREATEBY], [CREATEDATE], [MODIFILEDBY], [MODIFILEDDATE], [STATUS]) VALUES (30, 3, N'user6', N'user6', N'123', N'nguyen8521@gmail.com', N'52 Hải phòng', N'0214455', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[TAIKHOAN] ([ID], [ID_LOAITK], [HOTEN], [USERNAME], [MATKHAU], [EMAIL_TK], [DIACHI_TK], [SDT], [GHICHU_TK], [IS_DELETE], [CREATEBY], [CREATEDATE], [MODIFILEDBY], [MODIFILEDDATE], [STATUS]) VALUES (31, 3, N'nhân', N'nhannguyen123', N'123', N'nguyen@gmail.com', N'Hà Nội', N'0212455', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[TAIKHOAN] ([ID], [ID_LOAITK], [HOTEN], [USERNAME], [MATKHAU], [EMAIL_TK], [DIACHI_TK], [SDT], [GHICHU_TK], [IS_DELETE], [CREATEBY], [CREATEDATE], [MODIFILEDBY], [MODIFILEDDATE], [STATUS]) VALUES (32, 3, N'user8', N'user8', N'123', N'mjh@gmail.com', N'52 Xuân Quỳnh, Bình Thạnh, TP HCM', N'02145678', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[TAIKHOAN] ([ID], [ID_LOAITK], [HOTEN], [USERNAME], [MATKHAU], [EMAIL_TK], [DIACHI_TK], [SDT], [GHICHU_TK], [IS_DELETE], [CREATEBY], [CREATEDATE], [MODIFILEDBY], [MODIFILEDDATE], [STATUS]) VALUES (33, 3, N'user8', N'user8', N'123', N'mjh@gmail.com', N'52 Xuân Quỳnh, Bình Thạnh, TP HCM', N'02145678', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[TAIKHOAN] ([ID], [ID_LOAITK], [HOTEN], [USERNAME], [MATKHAU], [EMAIL_TK], [DIACHI_TK], [SDT], [GHICHU_TK], [IS_DELETE], [CREATEBY], [CREATEDATE], [MODIFILEDBY], [MODIFILEDDATE], [STATUS]) VALUES (34, 3, N'user9', N'user9', N'123', N'user9@gmail.com', N'Hà Nội', N'021245552', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[TAIKHOAN] ([ID], [ID_LOAITK], [HOTEN], [USERNAME], [MATKHAU], [EMAIL_TK], [DIACHI_TK], [SDT], [GHICHU_TK], [IS_DELETE], [CREATEBY], [CREATEDATE], [MODIFILEDBY], [MODIFILEDDATE], [STATUS]) VALUES (35, 3, N'nhan', N'user10', N'123', N'user10@gmail.com', N'Hải Phòng', N'02456878', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[TAIKHOAN] ([ID], [ID_LOAITK], [HOTEN], [USERNAME], [MATKHAU], [EMAIL_TK], [DIACHI_TK], [SDT], [GHICHU_TK], [IS_DELETE], [CREATEBY], [CREATEDATE], [MODIFILEDBY], [MODIFILEDDATE], [STATUS]) VALUES (36, 3, N'user13', N'user13', N'20-2C-B9-62-AC-59-07-5B-96-4B-07-15-2D-23-4B-70', N'user13@gmail.com', N'Hải Phòng', N'0214554855', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[TAIKHOAN] ([ID], [ID_LOAITK], [HOTEN], [USERNAME], [MATKHAU], [EMAIL_TK], [DIACHI_TK], [SDT], [GHICHU_TK], [IS_DELETE], [CREATEBY], [CREATEDATE], [MODIFILEDBY], [MODIFILEDDATE], [STATUS]) VALUES (37, 3, N'user14', N'user14', N'EF-06-D5-CB-F3-53-86-FF-22-03-D1-86-EE-FF-79-23', N'user14@gmail.com', N'hp', N'0214666', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[TAIKHOAN] ([ID], [ID_LOAITK], [HOTEN], [USERNAME], [MATKHAU], [EMAIL_TK], [DIACHI_TK], [SDT], [GHICHU_TK], [IS_DELETE], [CREATEBY], [CREATEDATE], [MODIFILEDBY], [MODIFILEDDATE], [STATUS]) VALUES (38, 1, N'admin', N'admin', N'EF-06-D5-CB-F3-53-86-FF-22-03-D1-86-EE-FF-79-23', N'user15@gmail.com', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[TAIKHOAN] ([ID], [ID_LOAITK], [HOTEN], [USERNAME], [MATKHAU], [EMAIL_TK], [DIACHI_TK], [SDT], [GHICHU_TK], [IS_DELETE], [CREATEBY], [CREATEDATE], [MODIFILEDBY], [MODIFILEDDATE], [STATUS]) VALUES (39, 3, N'user21', N'admin', N'21-23-2F-29-7A-57-A5-A7-43-89-4A-0E-4A-80-1F-C3', N'mjh@gmail.com', N'12CT', N'0214552255', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[TAIKHOAN] ([ID], [ID_LOAITK], [HOTEN], [USERNAME], [MATKHAU], [EMAIL_TK], [DIACHI_TK], [SDT], [GHICHU_TK], [IS_DELETE], [CREATEBY], [CREATEDATE], [MODIFILEDBY], [MODIFILEDDATE], [STATUS]) VALUES (40, 1, N'admin', N'admin', N'21-23-2F-29-7A-57-A5-A7-43-89-4A-0E-4A-80-1F-C3', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[TAIKHOAN] OFF
GO
INSERT [dbo].[VIETSACH] ([MaTG], [MaSach], [VaiTro], [ViTri]) VALUES (1, 14, N'Tác giả', N'Biên soạn')
INSERT [dbo].[VIETSACH] ([MaTG], [MaSach], [VaiTro], [ViTri]) VALUES (2, 5, N'Tác giả', N'Biên soạn')
INSERT [dbo].[VIETSACH] ([MaTG], [MaSach], [VaiTro], [ViTri]) VALUES (3, 12, N'Tác giả', N'Biên soạn')
INSERT [dbo].[VIETSACH] ([MaTG], [MaSach], [VaiTro], [ViTri]) VALUES (3, 13, N'Tác giả', N'Biên soạn')
INSERT [dbo].[VIETSACH] ([MaTG], [MaSach], [VaiTro], [ViTri]) VALUES (3, 15, N'Tác giả', N'Biên soạn')
INSERT [dbo].[VIETSACH] ([MaTG], [MaSach], [VaiTro], [ViTri]) VALUES (3, 22, N'Tác giả', N'Biên soạn Dịch thuật')
INSERT [dbo].[VIETSACH] ([MaTG], [MaSach], [VaiTro], [ViTri]) VALUES (4, 3, N'Tác giả', N'Biên soạn')
INSERT [dbo].[VIETSACH] ([MaTG], [MaSach], [VaiTro], [ViTri]) VALUES (5, 20, N'Tác giả', N'Biên soạn')
INSERT [dbo].[VIETSACH] ([MaTG], [MaSach], [VaiTro], [ViTri]) VALUES (6, 9, N'Tác giả', N'Biên soạn')
INSERT [dbo].[VIETSACH] ([MaTG], [MaSach], [VaiTro], [ViTri]) VALUES (7, 8, N'Biên dịch', N'Dịch thuật')
INSERT [dbo].[VIETSACH] ([MaTG], [MaSach], [VaiTro], [ViTri]) VALUES (8, 21, N'Tác giả', N'Biên soạn')
INSERT [dbo].[VIETSACH] ([MaTG], [MaSach], [VaiTro], [ViTri]) VALUES (9, 6, N'Tác giả', N'Biên soạn')
INSERT [dbo].[VIETSACH] ([MaTG], [MaSach], [VaiTro], [ViTri]) VALUES (9, 16, N'Tác giả', N'Biên soạn')
INSERT [dbo].[VIETSACH] ([MaTG], [MaSach], [VaiTro], [ViTri]) VALUES (10, 7, N'Tác giả', N'Biên soạn')
INSERT [dbo].[VIETSACH] ([MaTG], [MaSach], [VaiTro], [ViTri]) VALUES (12, 11, N'Tác giả', N'Biên soạn')
INSERT [dbo].[VIETSACH] ([MaTG], [MaSach], [VaiTro], [ViTri]) VALUES (13, 19, N'Tác giả', N'Biên soạn')
INSERT [dbo].[VIETSACH] ([MaTG], [MaSach], [VaiTro], [ViTri]) VALUES (15, 1, N'Tác giả', N'Biên soạn')
INSERT [dbo].[VIETSACH] ([MaTG], [MaSach], [VaiTro], [ViTri]) VALUES (15, 2, N'Tác giả', N'Biên soạn')
INSERT [dbo].[VIETSACH] ([MaTG], [MaSach], [VaiTro], [ViTri]) VALUES (16, 4, N'Tác giả', N'Biên soạn')
INSERT [dbo].[VIETSACH] ([MaTG], [MaSach], [VaiTro], [ViTri]) VALUES (17, 23, N'Tác giả', N'Biên soạn')
INSERT [dbo].[VIETSACH] ([MaTG], [MaSach], [VaiTro], [ViTri]) VALUES (18, 10, N'Tác giả', N'Biên soạn')
INSERT [dbo].[VIETSACH] ([MaTG], [MaSach], [VaiTro], [ViTri]) VALUES (19, 17, N'Tác giả', N'Biên soạn')
INSERT [dbo].[VIETSACH] ([MaTG], [MaSach], [VaiTro], [ViTri]) VALUES (20, 18, N'Tác giả', N'Biên soạn')
INSERT [dbo].[VIETSACH] ([MaTG], [MaSach], [VaiTro], [ViTri]) VALUES (21, 6, N'Đồng Tác giả', N'Biên soạn')
INSERT [dbo].[VIETSACH] ([MaTG], [MaSach], [VaiTro], [ViTri]) VALUES (22, 6, N'Đồng tác giả', N'Biên soạn')
INSERT [dbo].[VIETSACH] ([MaTG], [MaSach], [VaiTro], [ViTri]) VALUES (24, 5, N'Biên dịch', N'Dịch thuật')
INSERT [dbo].[VIETSACH] ([MaTG], [MaSach], [VaiTro], [ViTri]) VALUES (25, 14, N'Biên dịch', N'Dịch thuật')
INSERT [dbo].[VIETSACH] ([MaTG], [MaSach], [VaiTro], [ViTri]) VALUES (27, 6, N'Biên dịch', N'Dịch thuật')
INSERT [dbo].[VIETSACH] ([MaTG], [MaSach], [VaiTro], [ViTri]) VALUES (27, 7, N'Tác giả', N'Biên so?n')
INSERT [dbo].[VIETSACH] ([MaTG], [MaSach], [VaiTro], [ViTri]) VALUES (28, 19, N'Biên dịch', N'Dịch thuật')
INSERT [dbo].[VIETSACH] ([MaTG], [MaSach], [VaiTro], [ViTri]) VALUES (29, 23, N'Biên dịch', N'Dịch thuật')
INSERT [dbo].[VIETSACH] ([MaTG], [MaSach], [VaiTro], [ViTri]) VALUES (30, 3, N'Biên dịch', N'Dịch thuật')
INSERT [dbo].[VIETSACH] ([MaTG], [MaSach], [VaiTro], [ViTri]) VALUES (31, 8, N'Tác giả', N'Biên Soạn')
INSERT [dbo].[VIETSACH] ([MaTG], [MaSach], [VaiTro], [ViTri]) VALUES (32, 8, N'Tác giả', N'Biên soạn')
INSERT [dbo].[VIETSACH] ([MaTG], [MaSach], [VaiTro], [ViTri]) VALUES (33, 8, N'Đồng tác giả', N'Biên soạn')
GO
ALTER TABLE [dbo].[CTPHIEUNHAPSACH] ADD  CONSTRAINT [DF_CTPHIEUNHAPSACH_SOLUONGNHAP]  DEFAULT ((0)) FOR [SOLUONGNHAP]
GO
ALTER TABLE [dbo].[CTPHIEUNHAPSACH] ADD  CONSTRAINT [DF_CTPHIEUNHAPSACH_SOLUONGTHUCNHAP]  DEFAULT ((0)) FOR [SOLUONGTHUCNHAP]
GO
ALTER TABLE [dbo].[CTPHIEUNHAPSACH] ADD  CONSTRAINT [DF_CTPHIEUNHAPSACH_DONGIA_CTNHAPHANG]  DEFAULT ((0)) FOR [DONGIA_CTNHAPSACH]
GO
ALTER TABLE [dbo].[DONDATHANG] ADD  CONSTRAINT [DF__DONDATHAN__DaTha__37A5467C]  DEFAULT ((0)) FOR [DaThanhToan]
GO
ALTER TABLE [dbo].[DONDATHANG] ADD  CONSTRAINT [DF__DONDATHAN__TinhT__38996AB5]  DEFAULT ((0)) FOR [TinhTrangGiaoHang]
GO
ALTER TABLE [dbo].[DONDATHANG] ADD  CONSTRAINT [DF_DONDATHANG_TRANGTHAI]  DEFAULT (N'chưa giao') FOR [TRANGTHAI]
GO
ALTER TABLE [dbo].[DONDATHANG] ADD  CONSTRAINT [DF_DONDATHANG_IS_DELETE]  DEFAULT ((0)) FOR [IS_DELETE]
GO
ALTER TABLE [dbo].[PHIEUNHAPSACH] ADD  CONSTRAINT [DF_PHIEUNHAPSACH_STATUS]  DEFAULT ((0)) FOR [STATUS]
GO
ALTER TABLE [dbo].[PHIEUNHAPSACH] ADD  CONSTRAINT [DF_PHIEUNHAPSACH_CREATEDATE]  DEFAULT (getdate()) FOR [CREATEDATE]
GO
ALTER TABLE [dbo].[TAIKHOAN] ADD  CONSTRAINT [DF_TAIKHOAN_IS_DELETE]  DEFAULT ((0)) FOR [IS_DELETE]
GO
ALTER TABLE [dbo].[CHITIETDATHANG]  WITH CHECK ADD  CONSTRAINT [FK_CTDH_DDH] FOREIGN KEY([SoDH])
REFERENCES [dbo].[DONDATHANG] ([SoDH])
GO
ALTER TABLE [dbo].[CHITIETDATHANG] CHECK CONSTRAINT [FK_CTDH_DDH]
GO
ALTER TABLE [dbo].[CHITIETDATHANG]  WITH CHECK ADD  CONSTRAINT [FK_CTDH_Sach] FOREIGN KEY([MaSach])
REFERENCES [dbo].[SACH] ([MaSach])
GO
ALTER TABLE [dbo].[CHITIETDATHANG] CHECK CONSTRAINT [FK_CTDH_Sach]
GO
ALTER TABLE [dbo].[CHITIETKM]  WITH CHECK ADD  CONSTRAINT [FK_CHITIETKM_KHUYENMAI] FOREIGN KEY([ID_KM])
REFERENCES [dbo].[KHUYENMAI] ([ID])
GO
ALTER TABLE [dbo].[CHITIETKM] CHECK CONSTRAINT [FK_CHITIETKM_KHUYENMAI]
GO
ALTER TABLE [dbo].[CHITIETKM]  WITH CHECK ADD  CONSTRAINT [FK_CHITIETKM_SACH] FOREIGN KEY([ID_SACH])
REFERENCES [dbo].[SACH] ([MaSach])
GO
ALTER TABLE [dbo].[CHITIETKM] CHECK CONSTRAINT [FK_CHITIETKM_SACH]
GO
ALTER TABLE [dbo].[CTPHIEUNHAPSACH]  WITH CHECK ADD  CONSTRAINT [FK_CTPHIEUNHAPSACH_PHIEUNHAPSACH] FOREIGN KEY([PHIEUNHAPSACH_ID])
REFERENCES [dbo].[PHIEUNHAPSACH] ([PHIEUNHAPSACH_ID])
GO
ALTER TABLE [dbo].[CTPHIEUNHAPSACH] CHECK CONSTRAINT [FK_CTPHIEUNHAPSACH_PHIEUNHAPSACH]
GO
ALTER TABLE [dbo].[CTPHIEUNHAPSACH]  WITH CHECK ADD  CONSTRAINT [FK_CTPHIEUNHAPSACH_SACH] FOREIGN KEY([ID_SACH])
REFERENCES [dbo].[SACH] ([MaSach])
GO
ALTER TABLE [dbo].[CTPHIEUNHAPSACH] CHECK CONSTRAINT [FK_CTPHIEUNHAPSACH_SACH]
GO
ALTER TABLE [dbo].[DONDATHANG]  WITH CHECK ADD  CONSTRAINT [FK_DONDATHANG_TAIKHOAN] FOREIGN KEY([ID_TAIKHOAN])
REFERENCES [dbo].[TAIKHOAN] ([ID])
GO
ALTER TABLE [dbo].[DONDATHANG] CHECK CONSTRAINT [FK_DONDATHANG_TAIKHOAN]
GO
ALTER TABLE [dbo].[PHIEUNHAPSACH]  WITH CHECK ADD  CONSTRAINT [FK_PHIEUNHAPSACH_NHAXUATBAN] FOREIGN KEY([NXB_ID])
REFERENCES [dbo].[NHAXUATBAN] ([MaNXB])
GO
ALTER TABLE [dbo].[PHIEUNHAPSACH] CHECK CONSTRAINT [FK_PHIEUNHAPSACH_NHAXUATBAN]
GO
ALTER TABLE [dbo].[RATING]  WITH CHECK ADD  CONSTRAINT [FK_RATING_SACH] FOREIGN KEY([ID_SACH])
REFERENCES [dbo].[SACH] ([MaSach])
GO
ALTER TABLE [dbo].[RATING] CHECK CONSTRAINT [FK_RATING_SACH]
GO
ALTER TABLE [dbo].[RATING]  WITH CHECK ADD  CONSTRAINT [FK_RATING_TAIKHOAN] FOREIGN KEY([IDUser])
REFERENCES [dbo].[TAIKHOAN] ([ID])
GO
ALTER TABLE [dbo].[RATING] CHECK CONSTRAINT [FK_RATING_TAIKHOAN]
GO
ALTER TABLE [dbo].[SACH]  WITH CHECK ADD  CONSTRAINT [FK_Sach_ChuDe] FOREIGN KEY([MaCD])
REFERENCES [dbo].[CHUDE] ([MaCD])
GO
ALTER TABLE [dbo].[SACH] CHECK CONSTRAINT [FK_Sach_ChuDe]
GO
ALTER TABLE [dbo].[SACH]  WITH CHECK ADD  CONSTRAINT [FK_Sach_NXB] FOREIGN KEY([MaNXB])
REFERENCES [dbo].[NHAXUATBAN] ([MaNXB])
GO
ALTER TABLE [dbo].[SACH] CHECK CONSTRAINT [FK_Sach_NXB]
GO
ALTER TABLE [dbo].[TAIKHOAN]  WITH CHECK ADD  CONSTRAINT [FK_TAIKHOAN_LOAITAIKHOAN] FOREIGN KEY([ID_LOAITK])
REFERENCES [dbo].[LOAITAIKHOAN] ([ID])
GO
ALTER TABLE [dbo].[TAIKHOAN] CHECK CONSTRAINT [FK_TAIKHOAN_LOAITAIKHOAN]
GO
ALTER TABLE [dbo].[VIETSACH]  WITH CHECK ADD  CONSTRAINT [FK_VietSach_Sach] FOREIGN KEY([MaSach])
REFERENCES [dbo].[SACH] ([MaSach])
GO
ALTER TABLE [dbo].[VIETSACH] CHECK CONSTRAINT [FK_VietSach_Sach]
GO
ALTER TABLE [dbo].[VIETSACH]  WITH CHECK ADD  CONSTRAINT [FK_VietSach_TacGia] FOREIGN KEY([MaTG])
REFERENCES [dbo].[TACGIA] ([MaTG])
GO
ALTER TABLE [dbo].[VIETSACH] CHECK CONSTRAINT [FK_VietSach_TacGia]
GO
ALTER TABLE [dbo].[CHITIETDATHANG]  WITH CHECK ADD  CONSTRAINT [CK__CHITIETDA__DonGi__3D5E1FD2] CHECK  (([DonGia]>=(0)))
GO
ALTER TABLE [dbo].[CHITIETDATHANG] CHECK CONSTRAINT [CK__CHITIETDA__DonGi__3D5E1FD2]
GO
ALTER TABLE [dbo].[CHITIETDATHANG]  WITH CHECK ADD  CONSTRAINT [CK__CHITIETDA__SoLuo__3C69FB99] CHECK  (([SoLuong]>(0)))
GO
ALTER TABLE [dbo].[CHITIETDATHANG] CHECK CONSTRAINT [CK__CHITIETDA__SoLuo__3C69FB99]
GO
ALTER TABLE [dbo].[SACH]  WITH CHECK ADD  CONSTRAINT [CK__SACH__GiaBan__2E1BDC42] CHECK  (([Giaban]>=(0)))
GO
ALTER TABLE [dbo].[SACH] CHECK CONSTRAINT [CK__SACH__GiaBan__2E1BDC42]
GO
ALTER TABLE [dbo].[SACH]  WITH CHECK ADD  CONSTRAINT [CK__SACH__SoLuongTon__2F10007B] CHECK  (([SoLuongTon]>(0)))
GO
ALTER TABLE [dbo].[SACH] CHECK CONSTRAINT [CK__SACH__SoLuongTon__2F10007B]
GO

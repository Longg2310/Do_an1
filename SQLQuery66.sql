CREATE DATABASE PLC
GO
USE PLC

-- Tạo Bảng và khóa chính
CREATE TABLE SanPham 
(
MaSP VARCHAR(10) PRIMARY KEY,
TenSP VARCHAR(50),
IDLoaihang VARCHAR(10),
ThongTinSP TEXT,
SoLuong INT,
Gia FLOAT
)
CREATE TABLE LoaiHang
(
ID VARCHAR(10) PRIMARY KEY,
TenLoaiHang VARCHAR(50)
)
CREATE TABLE ChiTietHD
(
ID CHAR(10) PRIMARY KEY,
MaHD VARCHAR(10),
MaSP VARCHAR(10),
SoLuong INT
)
CREATE TABLE HoaDon
(
MaHD VARCHAR(10) PRIMARY KEY,
MaKH VARCHAR(10),
MaNV VARCHAR(10),
NgayxuatHD DATE
)
CREATE TABLE KhachHang
(
MaKH VARCHAR(10) PRIMARY KEY,
TenKH NVARCHAR(50),
DiaChi NVARCHAR(50),
SDT FLOAT
)
CREATE TABLE NhanVien
(
MaNV VARCHAR(10) PRIMARY KEY,
TenNV NVARCHAR(50),
DiaChi NVARCHAR(50),
SDT FLOAT
)
CREATE TABLE ChiTietNhap
(
ID VARCHAR(10) PRIMARY KEY,
MaNH VARCHAR(10),
MaSP VARCHAR(10),
SoLuong FLOAT
)
CREATE TABLE Nhap
(
MaNH VARCHAR(10) PRIMARY KEY,
MaDVPP VARCHAR(10),
MaNguoiNH VARCHAR(10),
NgayNhap DATE
)
CREATE TABLE DonViPhanPhoi
(
MaDVPP VARCHAR(10) PRIMARY KEY,
TenDVPP NVARCHAR(50),
DiaChi NVARCHAR(50),
SDT FLOAT
)
-- Tạo FOREIGN KEY
ALTER TABLE dbo.SanPham ADD FOREIGN KEY(IDLoaihang) REFERENCES dbo.LoaiHang -- IDLoaihang(SanPham) liên kết vs PRIMARY KEY bảng LoaiHang
ALTER TABLE dbo.ChiTietHD ADD FOREIGN KEY(MaHD) REFERENCES dbo.HoaDon       -- MaHD(ChiTietHD) liên kết với PRIMARY KEY bảng HoaDon
ALTER TABLE dbo.ChiTietHD ADD FOREIGN KEY(MaSP) REFERENCES dbo.SanPham      -- MaSP(ChiTietHD) liên kết với PRIMARY KEY bảng SanPham
ALTER TABLE dbo.HoaDon ADD FOREIGN KEY(MaKH) REFERENCES dbo.KhachHang       -- MaKH(HoaDon) liên kết với PRIMARY KEY bảng KhachHang
ALTER TABLE dbo.HoaDon ADD FOREIGN KEY(MaNV) REFERENCES dbo.NhanVien        -- MaNV(HoaDon) liên kết với PRIMARY KEY bảng NhanVien
ALTER TABLE dbo.ChiTietNhap ADD FOREIGN KEY(MaNH) REFERENCES dbo.Nhap       -- MaNH(ChiTietNhap) liên kết với PRIMARY KEY bảng Nhap
ALTER TABLE dbo.ChiTietNhap ADD FOREIGN KEY(MaSP) REFERENCES dbo.SanPham    -- MaSP(ChiTietNhap) liên kết với PRIMARY KEY bảng SanPham
ALTER TABLE dbo.Nhap ADD FOREIGN KEY(MaDVPP) REFERENCES dbo.DonViPhanPhoi   -- MaDVPP(Nhap) liên kết với PRIMARY KEY bảng  DonViPhanPhoi
ALTER TABLE dbo.Nhap ADD FOREIGN KEY(MaNguoiNH) REFERENCES dbo.NhanVien     --MaNguoiNH(Nhap) liên kết với PRIMARY KEY bảng NhanVien

-- Nhập dữ liệu vào bảng
INSERT INTO dbo.LoaiHang VALUES('UB','Ultrabook')
INSERT INTO dbo.LoaiHang VALUES('LG','Laptop Gaming')
INSERT INTO dbo.LoaiHang VALUES('LW','Laptop Workstation')
INSERT INTO dbo.LoaiHang VALUES('PG','PC Gaming')
INSERT INTO dbo.LoaiHang VALUES('PO','PC Office')
INSERT INTO dbo.LoaiHang VALUES('PW','PC Workstation')
INSERT INTO dbo.LoaiHang VALUES('MB','Macbook')
INSERT INTO dbo.LoaiHang VALUES('IM','IMac')

INSERT INTO dbo.SanPham VALUES('001','Thinkpad X1 carbon gen 8','UB','i5 10210u,8gb,ssd 256gb',25,27900000)
INSERT INTO dbo.SanPham VALUES('002','Thinkpad X1 nano','UB','i7 1185g7,16gb,ssd 512gb',10,54900000)
INSERT INTO dbo.SanPham VALUES('003','Thinkpad X1 E490s','UB','i5 10210u,8gb,ssd 256gb',30,15400000)
INSERT INTO dbo.SanPham VALUES('004','Asus ux425','UB','i5 1135g7,8gb,ssd 256gb',30,22900000)
INSERT INTO dbo.SanPham VALUES('005','Hp pavilion 14','UB','i3 1115g4,4gb,ssd 256gb',30,11400000)
INSERT INTO dbo.SanPham VALUES('006','Dell XPS 9310','UB','i5 1135g7,16gb,ssd 512gb',15,34900000)
INSERT INTO dbo.SanPham VALUES('007','Asus ROG G531','LG','i5 9300H,Gtx 1650,8gb,ssd 512Gb',20,23990000)
INSERT INTO dbo.SanPham VALUES('008','HP Omen 15 2020','LG','R5 4600h,Gtx 1660Ti,8gb,ssd 512gb',15,30000000)
INSERT INTO dbo.SanPham VALUES('009','Thinkpad P1 gen 1','LW','i5-8400H,Quadro P1000,16GB,ssd 256GB',10,29490000)
INSERT INTO dbo.SanPham VALUES('010','Macbook air 2020','MB','M1,8gb,ssd 256gb',50,27000000)
INSERT INTO dbo.SanPham VALUES('011','Macbook pro 13 2020','MB','M1,8gb,ssd 256gb',30,37000000)
INSERT INTO dbo.SanPham VALUES('012','Macbook pro 16 2020','MB','i7,Radeon 5300M,16gb,ssd 512gb',8,46990000)
INSERT INTO dbo.SanPham VALUES('013','iMac Pro 2020','IM','Intel Xeon W,Radeon Pro Vega 56,32GB ECC,ssd 1Tb',3,133000000)
INSERT INTO dbo.SanPham VALUES('014','IMac 21.5'' 2019','IM','i5,Radeon Pro 555X,8GB,ssd 1Tb',12,28000000)
INSERT INTO dbo.SanPham VALUES('015','Ashe3070','PG','i5 10400, RTX 3070,16gb,ssd 512Gb,HDD 1TB',20,35000000)
INSERT INTO dbo.SanPham VALUES('016','Sona1650','PG','i3 10100F, GTX 1650,8gb,ssd 256Gb',30,12000000)
INSERT INTO dbo.SanPham VALUES('017','RDR2','PG','i9 10900k, RTX 3080,16gb,ssd 1TB,HDD 2TB',5,50000000)
INSERT INTO dbo.SanPham VALUES('018','HP Elitedesk','PO','i5 10400,8gb,ssd 256Gb',100,8000000)
INSERT INTO dbo.SanPham VALUES('019','Lenovo Thinkcentre','PO','i3 10100,8gb,ssd 128',100,6500000)
INSERT INTO dbo.SanPham VALUES('020','Dell Vostro 3471','PO','i7 10700,8gb,ssd 512gb',50,13500000)
INSERT INTO dbo.SanPham VALUES('021','PC AI','PW','Dual Xeon P8280,5x Quadro RTX 4000,Ram 1536GB,Ssd 40TB',1,1800000000)
INSERT INTO dbo.SanPham VALUES('022','PC Server','PW','Dual Xeon E5 2678 V3,64G ECC,5x ssd 480Gb',5,47900000)
INSERT INTO dbo.SanPham VALUES('023','PC Render','PW','RYZEN 7 2700X,16GB,RTX 2060,Ssd 240Gb',20,19400000)

INSERT INTO dbo.NhanVien VALUES('PPL2310',N'Phạm Phúc Long',N'Long Biên,Hà Nội',84657475869)
INSERT INTO dbo.NhanVien VALUES('PDT2212',N'Phan Đức Thắng',N'Hà Đông,Hà Nội',84047239874)
INSERT INTO dbo.NhanVien VALUES('NCV0874',N'Nguyễn Cao Việt',N'An Dương,Hải Phòng',84294738098)
INSERT INTO dbo.NhanVien VALUES('TQV2134',N'Vượng',N'Lĩnh Nam,Hà Nội',84039488392)

INSERT INTO dbo.DonViPhanPhoi VALUES('HNC',N'HanoiComputer',N'43 Thái Hà, Đống Đa, Hà Nội', 19001001)
INSERT INTO dbo.DonViPhanPhoi VALUES('TP',N'ThinkPro',N'562 Láng, Đống Đa, Hà Nội',19001015)
INSERT INTO dbo.DonViPhanPhoi VALUES('NC',N'NguyenCongPC',N'192 Lê Thanh Nghị, Hai Bà Trưng, Hà Nội',19003965)

INSERT INTO dbo.KhachHang VALUES('10001',N'Nguyễn Quang Huy',N'Tây Hồ, Hà Nội',84837485902)
INSERT INTO dbo.KhachHang VALUES('10686',N'Phùng Thanh Độ',N'Cao Bằng',84837478859)
INSERT INTO dbo.KhachHang VALUES('18479',N'Vũ Thị Huê',N'An Dương, Hải Phòng',84837495098)
INSERT INTO dbo.KhachHang VALUES('66699',N'Nguyễn Văn Lộc',N'Sóc Sơn, Hà Nội',84465739985)
INSERT INTO dbo.KhachHang VALUES('21987',N'Lê Xuân Thành',N'Hoàng Mai, Hà Nội',84930293776)
INSERT INTO dbo.KhachHang VALUES('23480',N'Chu Quang Huy',N'Phú Thọ',84109987367)

INSERT INTO dbo.Nhap VALUES('Lap1566','TP','PPL2310','20201109')
INSERT INTO dbo.Nhap VALUES('MB1566','TP','PDT2212','20201115')
INSERT INTO dbo.Nhap VALUES('PG874','HNC','NCV0874','20200924')
INSERT INTO dbo.Nhap VALUES('PW2314','HNC','TQV2134','20201010')

INSERT INTO dbo.ChiTietNhap VALUES('001','Lap1566','002',20)
INSERT INTO dbo.ChiTietNhap VALUES('002','Lap1566','001',20)
INSERT INTO dbo.ChiTietNhap VALUES('003','Lap1566','006',10)
INSERT INTO dbo.ChiTietNhap VALUES('004','MB1566','011',10)
INSERT INTO dbo.ChiTietNhap VALUES('005','MB1566','012',3)
INSERT INTO dbo.ChiTietNhap VALUES('006','PG874','015',50)
INSERT INTO dbo.ChiTietNhap VALUES('007','PW2314','021',5)

INSERT INTO dbo.HoaDon VALUES('HN343','10001','PDT2212','20201130')
INSERT INTO dbo.HoaDon VALUES('HN567','18479','NCV0874','20201012')
INSERT INTO dbo.HoaDon VALUES('HN145','66699','PDT2212','20201119')
INSERT INTO dbo.HoaDon VALUES('HN776','10686','TQV2134','20200922')
INSERT INTO dbo.HoaDon VALUES('HN426','21987','NCV0874','20201023')
INSERT INTO dbo.HoaDon VALUES('HN634','23480','TQV2134','20200925')

INSERT INTO dbo.ChiTietHD VALUES('12001','HN343','007',1)
INSERT INTO dbo.ChiTietHD VALUES('12002','HN567','013',2)
INSERT INTO dbo.ChiTietHD VALUES('12003','HN567','021',1)
INSERT INTO dbo.ChiTietHD VALUES('12004','HN145','006',1)
INSERT INTO dbo.ChiTietHD VALUES('12005','HN145','010',1)
INSERT INTO dbo.ChiTietHD VALUES('12006','HN776','017',1)
INSERT INTO dbo.ChiTietHD VALUES('12007','HN426','016',20)
INSERT INTO dbo.ChiTietHD VALUES('12008','HN426','015',10)
INSERT INTO dbo.ChiTietHD VALUES('12009','HN634','010',1)


-- Thông Tin Nhân viên
SELECT * FROM dbo.NhanVien;

-- Thông tin Khách Hàng
SELECT * FROM dbo.KhachHang;

-- Những sản phẩm có giá lớn hơn 20tr và nhỏ hơn 50tr
SELECT * FROM dbo.SanPham
WHERE Gia >= 20000000 AND Gia <= 50000000

-- 5 sản phẩm có giá cao nhất trong cửa hàng
SELECT TOP (5) TenSP, Gia FROM dbo.SanPham
ORDER BY Gia DESC

-- Sản phẩm bán chạy nhất
SELECT TenSP,
SUM(ChiTietHD.SoLuong) AS N'Số lượng đã bán' 
FROM dbo.ChiTietHD INNER JOIN dbo.SanPham
ON SanPham.MaSP = ChiTietHD.MaSP
GROUP BY TenSP
ORDER BY SUM(ChiTietHD.SoLuong) DESC

-- Thông tin các hóa đơn đã xuất
SELECT 
HD.MaHD, SP.TenSP, SP.ThongTinSP, SP.Gia, CHD.SoLuong, KH.TenKH, NV.TenNV, HD.NgayxuatHD, 
CHD.SoLuong * SP.Gia * 1.1 AS N'Thành Tiền'
FROM dbo.ChiTietHD AS CHD,dbo.HoaDon AS HD, dbo.KhachHang AS KH, dbo.SanPham AS SP, dbo.NhanVien AS NV
WHERE CHD.MaHD = HD.MaHD AND HD.MaKH = KH.MaKH AND CHD.MaSP = SP.MaSP AND HD.MaNV = NV.MaNV

-- Tổng tiền hóa đơn HN426
SELECT dbo.ChiTietHD.MaHD, 
SUM(ChiTietHD.SoLuong * dbo.SanPham.Gia * 1.1 ) AS 'Thành Tiền' 
FROM dbo.ChiTietHD, dbo.SanPham
WHERE dbo.ChiTietHD.MaSP = dbo.SanPham.MaSP
GROUP BY MaHD
HAVING MaHD = 'HN426'

-- Những người mua hàng trong tháng 10 năm 2020
SELECT  KH.TenKH, SP.TenSP, HD.NgayxuatHD
FROM dbo.ChiTietHD AS CHD,dbo.HoaDon AS HD, dbo.KhachHang AS KH, dbo.SanPham AS SP
WHERE CHD.MaHD = HD.MaHD AND HD.MaKH = KH.MaKH AND CHD.MaSP = SP.MaSP
AND MONTH(HD.NgayxuatHD) = 10 AND YEAR(HD.NgayxuatHD) = 2020;

-- Những sản phẩm bán được trong tháng 10 năm 2020
SELECT SP.TenSP, CHD.SoLuong, HD.NgayxuatHD 
FROM dbo.ChiTietHD AS CHD,dbo.HoaDon AS HD, dbo.SanPham AS SP
WHERE CHD.MaHD = HD.MaHD AND CHD.MaSP = SP.MaSP
AND MONTH(HD.NgayxuatHD) = 10 AND YEAR(HD.NgayxuatHD) = 2020;

-- Những khách hàng mua nhiều hơn 1 loại sản phẩm trong 1 lần mua
SELECT KH.TenKH FROM dbo.HoaDon AS HD INNER JOIN dbo.KhachHang AS KH
ON KH.MaKH = HD.MaKH
WHERE 1<
(
	SELECT COUNT(*) FROM dbo.ChiTietHD
	WHERE MaHD = HD.MaHD
)

-- Tổng doanh thu tháng 10 năm 2020
SELECT SUM(CHD.SoLuong * SP.Gia * 1.1) AS N'Tổng doanh thu tháng 10 năm 2020'
FROM dbo.ChiTietHD AS CHD,dbo.HoaDon AS HD, dbo.SanPham AS SP
WHERE CHD.MaHD = HD.MaHD AND CHD.MaSP = SP.MaSP
AND MONTH(HD.NgayxuatHD) = 10 AND YEAR(HD.NgayxuatHD) = 2020

-- Tổng doanh thu trong quý 4 năm 2020
SELECT SUM(CHD.SoLuong * SP.Gia * 1.1) AS N'Tổng doanh thu quý 4 năm 2020'
FROM dbo.ChiTietHD AS CHD,dbo.HoaDon AS HD, dbo.SanPham AS SP
WHERE CHD.MaHD = HD.MaHD AND CHD.MaSP = SP.MaSP
AND MONTH(HD.NgayxuatHD) >= 10 AND YEAR(HD.NgayxuatHD) = 2020
AND MONTH(HD.NgayxuatHD) <= 12 AND YEAR(HD.NgayxuatHD) = 2020;

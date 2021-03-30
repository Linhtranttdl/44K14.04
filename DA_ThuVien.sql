create database DA_QuanLyThuVien
go
use DA_QuanLyThuVien
go

set dateformat DMY

create table NHANVIEN
(
	MaNV char(20) not null primary key,
	TenNV nvarchar(50),
	NgayTruc date
)
create table LOAISH
(
	MaLoai char(20) not null primary key,
	TenLoai nvarchar(50)
)
create table SACH
(
   MASH CHAR(20) NOT NULL PRIMARY KEY,
   TENSH NVARCHAR(30),
   MALOAI CHAR(20),
   NXB NVARCHAR(100),
   NAMXB INT,
   TACGIA NVARCHAR(30),
   TINHTRANG NVARCHAR(30) DEFAULT N'Chưa Mượn',
   SOLUONG INT
)

create table DOCGIA
(
	MaDG char(20) not null primary key,
	TenDG nvarchar(50),
	SDT char(12),
	Email char(100),
	constraint uni_email unique(Email)
)
create table MUONSH
(
	MaSH char(20) not null,
	MaDG char(20) not null,
	MaNV char(20),
	NgayMuon date not null,
	NgayTra date,
	CONSTRAINT PK_MUONSH PRIMARY KEY(MADG,MASH,NgayMuon)
)
	alter table MUONSH
	add TinhTrang nvarchar(20)
	alter table SACH
	add constraint fk_sh_maloai FOREIGN KEY(MALOAI) REFERENCES LOAISH(MaLoai)
	alter table MUONSH
	add constraint fk_muonsh_sh FOREIGN KEY(MaSH) REFERENCES SACH(MaSH)
	alter table MUONSH
	add constraint fk_muonsh_dg FOREIGN KEY(MaDG) REFERENCES DOCGIA(MaDG)
	alter table MUONSH
	add constraint fk_muonsh_nv FOREIGN KEY(MaNV) REFERENCES NHANVIEN(MaNV)

alter table MUONSH
add constraint chk_date check(NgayMuon<=NgayTra)
alter table sach
add constraint un_tensh unique(TENSH)


insert into NHANVIEN
values  ('NV001',N'Trần Thanh Thiện','12/8/2020'),
		('NV002',N'Nguyễn Văn An','13/8/2020')

insert into LOAISH
VALUES ('CTPT',N'Chính trị-Pháp luật'),
		('KHCNKT',N'Khoa học công nghệ-Kinh tế'),
		('VHXHLS',N'Văn hóa xã hội-Lịch sử'),
		('VHNT',N'Văn học nghệ thuật'),
		('GT',N'Giáo trình'),
		('TR',N'Truyện'),
		('TT',N'Tiểu thuyết'),
		('TLTL',N'Tâm lý-Tâm linh-Tôn giáo'),
		('TN',N'Sách thiếu nhi')


insert into SACH(MASH,TENSH,MALOAI,NXB,NAMXB,TACGIA,SOLUONG)
VALUES('L01',N'Bộ Luật Dân Sự','CTPT',N'Chính Trị Quốc Gia Sự Thật',2015,N'Quốc Hội',10),
('L02',N'Bộ Luật Lao Động','CTPT',N'Lao Động',2019,N'Quốc Hội',10),

('KH01',N'Con người trong kỷ nguyên trí tuệ nhân tạo','KHCNKT',N'Thế Giới',2015,N'Max Tegmark',10),
('KH02',N'Chạy đua với ROBOT','KHCNKT',N'Thế Giới',2019,N' Joseph E.Aoun',10),

('VH01',N'Sáng tạo - Văn hóa của sự đổi mới không ngừng','VHXHLS',N'Lao Động Xã Hội',2015,N'Marty Neumeier',10),
('VH02',N'Đô thị cổ Hội An - Di sản văn hóa thế giới','VHXHLS',N'Thời Đại',2015,N' Nguyễn Trung Hiếu',10),

('NT01',N'Vấn đề quốc học','VHNT',N'Hội Nhà Văn',2017,N'Kim Địch',10),
('NT02',N'Đọc sách như một nghệ thuật','VHNT',N'Lao Động Xã Hội',2015,N' Mortimer J.Adler',10),

('GT01',N'Giáo trình ngôn ngữ học đại cương','GT',N'Khoa Học Xã Hội',2017,N'Ferdinand De Saussure',10),
('GT02',N'Tiêu chuẩn kỹ thuật công trình giao thông','GT',N' Giao Thông Vận Tải',2015,N'Bộ Giao thông vận tải',10),

('TR01',N'Bộ Giao thông vận tải','TR',N'Thông Tin Và Truyền Thông',2017,N'Mai Tuyết',10),
('TR02',N'Truyện Kiều đọc ngược','TR',N'Thanh Niên',2015,N'Phạm Đan Quế',10),

('TT01',N'Đồi Gió Hú','TT',N'Thomas Cautley Newby',1847,N'Emily Brontë',10),
('TT02',N'Không Gia Đình','TT',N'Văn học',1878,N'Hector Malot',10),

('TL01',N'Nghệ Thuật Hiểu Thấu Tâm Lý Người Khác','TLTL',N'Thanh Niên',2019,N'Nguyễn Công Khanh',10),
('TL02',N'Sự Tích Và Triết Lí Đức Phật Thích Ca','TLTL',N'Văn hóa Văn nghệ',2015,N'Trần Hữu Danh',10),

('TN01',N'Marnie Yêu Dấu','TN',N' Kim Đồng',2015,N'Joan G.Robinson',10),
('TN02',N'Mia Và Chú Sư Tử Trắng','TN',N'Kim Đồng',1957,N'Prune De Maistre',10)


insert into DOCGIA
values	 ('DG001',N'Nguyễn Thanh Nam','0975095105','namnt2k@gmail.com'),
		 ('DG002',N'Lê Văn Anh','0756983254','vananhle99@gmail.com'),
		 ('DG003',N'Trần Thanh Bình','0569863258','binhtran123@gmail.com')
SET dateformat dmy
insert into MUONSH
values ('TN01','DG003','NV001','05/1/2020','05/8/2020',N'Đang mượn'),
	   ('TN02','DG001','NV002','06/01/2020','06/02/2020',N'Đã Trả')
select *from NHANVIEN
select* from LOAISH
select*from SACH
select* from DOCGIA
select*from MUONSH

select MaSH,TenSH,NamXB,TACGIA,TINHTRANG  from SACH,LOAISH where SACH.MaLoai=LOAISH.MaLoai

insert into SACH

insert into SACH
VALUES('',N'','',N'',2015,N'',N'')
insert into SACH(MASH,TENSH,MALOAI,NXB,NAMXB,TACGIA)
VALUES('L04',N'Bô','CTPT',N'Chính Trị Quốc Gia Sự Thật',2015,N'Quốc Hội')

SELECT MASH,TENSH,NXB,NAMXB,TACGIA,TINHTRANG,SOLUONG  FROM SACH

CREATE TRIGGER MUONSACH
ON MUONSH
FOR INSERT
AS
     BEGIN
	    UPDATE SACH
	    SET SOLUONG=SOLUONG-1 WHERE SACH.MASH=inserted.MASH
		SELECT*FROM inserted
	 END

insert into DOCGIA
values	 ('',N'','','')
drop database if exists quanlyresort;

CREATE DATABASE quanlyresort;
USE quanlyresort;

CREATE TABLE Vi_Tri(	
	IDViTri int primary key not null,
    TenViTri varchar(45));

CREATE TABLE Trinh_Do(
	IDTrinhDo int primary key not null,
    TrinhDo varchar(45) not null);
    
CREATE TABLE Bo_Phan(
	IDBoPhan int primary key not null,
    TenBoPhan varchar(45) not null);

CREATE TABLE Nhan_Vien(
	IDNhanVien int primary key,
    HoTen varchar(45)not null,
    IDViTri int not null,
    IDTrinhDo int not null,
    IDBoPhan int not null,
    NgaySinh date not null,
    SoCMTND varchar(45)not null,
    Luong varchar(45),
    SDT varchar(45),
    Email varchar(45),
    DiaChi varchar(45)
    );

ALTER TABLE nhan_vien ADD CONSTRAINT fk_Nhan_vien_Vi_Tri FOREIGN KEY (IDViTri) REFERENCES Vi_Tri(IDViTri);
ALTER TABLE nhan_vien ADD CONSTRAINT fk_Nhan_vien_Trinh_Do FOREIGN KEY (IDTrinhDo) REFERENCES Trinh_Do(IDTRinhDo);
ALTER TABLE nhan_vien ADD CONSTRAINT fk_Nhan_vien_Bo_Phan FOREIGN KEY (IDBoPhan) REFERENCES Bo_Phan(IDBoPhan);

CREATE TABLE Loai_Khach(
	IDLoaiKhach int not null,
    TenLoaiKhach varchar(45),
    primary key (IDLoaiKhach)
    );
    
CREATE TABLE Khach_Hang(
	IDKhachHang int not null,
    IDLoaiKhach int,
    HoTen varchar(45),
    NgaySinh date,
    SoCMTND varchar(45),
    SDT varchar(45),
    Email varchar(45),
    DiaChi varchar(45),
    primary key(IDKhachHang,SoCMTND,Email)
    );

-- ALTER TABLE Khach_Hang ADD CONSTRAINT fk_Khach_hang_Loai_Khach FOREIGN KEY (IDLoaiKhach) REFERENCES Loai_Khach(IDLoaiKhach);

CREATE TABLE Kieu_Thue(
	IDKieuThue int primary key,
    TenKieuTHue varchar(45),
    Gia int);
    
CREATE TABLE Loai_Dich_Vu(
	IDLoaiDichVu int,
    TenLoaiDichVu varchar(60),
    primary key(IDLoaiDichVu)
    );

CREATE TABLE Dich_Vu(
	IDDichVu  int primary key not null,
    TenDichVu varchar(45),
    DienTich int,
    SoTang int,
    SoNguoiToiDa varchar(45),
    ChiPhiThue varchar(45),
    IDKieuThue int,
    IDLoaiDichVu int,
    TrangThai varchar(45)
    );
    
-- ALTER TABLE Dich_Vu ADD CONSTRAINT fk_Dich_Vu_Kieu_Thue FOREIGN KEY (IDKieuThue) REFERENCES Kieu_Thue(IDKieuThue);
-- ALTER TABLE Dich_Vu ADD CONSTRAINT fk_Dich_Vu_Loai_Dich_Vu FOREIGN KEY (IDLoaiDichVu) REFERENCES Loai_Dich_Vu(IDLoaiDichVu);

CREATE TABLE Hop_Dong(
	IDHopDong int not null,
    IDNhanVien int,
    IDKhachHang int,
    IDDichVu int,
    NgayLamHopDong date not null,
    NgayKetThuc date not null,
    TienDatCoc int,
    TongTien int,
    primary key (IDHopDong)
    );

-- ALTER TABLE Hop_Dong ADD CONSTRAINT fk_Hop_Dong_Nhan_Vien FOREIGN KEY (IDNhanVien) REFERENCES Nhan_Vien(IDNhanVien);
-- ALTER TABLE Hop_Dong ADD CONSTRAINT fk_Hop_Dong_Khach_Hang FOREIGN KEY (IDKhachHang) REFERENCES Khach_Hang(IDKhachHang);
-- ALTER TABLE Hop_Dong ADD CONSTRAINT fk_Hop_Dong_Dich_Vu FOREIGN KEY (IDDichVu) REFERENCES Dich_Vu(IDDichVu);

CREATE TABLE Dich_Vu_Di_Kem(
	IDDichVuDiKem int,
    TenDichVuDiKem varchar(45),
    Gia INT,
    DonVi int,
    TrangThaiKhaDung varchar(45),
    primary key (IDDichVuDiKem)
    );
    
CREATE TABLE Hop_Dong_Chi_Tiet(
	IDHopDongChiTiet int,
    SoLuong int,
    IDDichVuDiKem int,
    IDHopDong int,
    primary key(IDHopDongChiTiet)
    );
-- drop table Hop_Dong_Chi_Tiet;
-- ALTER TABLE Hop_Dong_Chi_Tiet  DROP CONSTRAINT fk_Hop_Dong_Chi_Tiet_Hop_Dong;

-- ALTER TABLE Hop_Dong_Chi_Tiet ADD CONSTRAINT fk_Hop_Dong_Chi_Tiet_Hop_Dong FOREIGN KEY (IDHopDong) REFERENCES Hop_Dong(IDHopDong);
-- ALTER TABLE Hop_Dong_Chi_Tiet ADD CONSTRAINT fk_Hop_Dong_Chi_Tiet_Dich_Vu_Di_Kem FOREIGN KEY (IDDichVuDiKem) REFERENCES Dich_Vu_Di_Kem(IDDichVuDiKem);

insert into Vi_Tri(IDViTri,TenViTri) 
value
(01,'Le Tan'),
(02,'Phuc Vu'),
(03,'Chuyen Vien'),
(04,'Giam Sat'),
(05,'Quan Ly');

insert into Trinh_Do(IDTrinhDo,TrinhDo)
value
(01,'Trung Cap'),
(02,'Cao Dang'),
(03,'Dai hoc'),
(04,'Sau Dai Hoc');

insert into Bo_Phan(IDBoPhan,TenBoPhan) 
value
(01,'Sale-Marketing'),
(02,'Hanh Chinh'),
(03,'Phuc Vu'),
(04,'Quan Ly');


insert into Nhan_Vien(IDNhanVien,HoTen,IDViTri,IDTrinhDo,IDBoPhan,NgaySinh,SoCMTND,Luong,SDT,Email,DiaChi)
values
(01,'Nguyen Van K',01,02,03,'1994-12-31','123412341234','2000','0987234234','nguyenvank@gmail.com','Da Nang'),
(02,'Le Van Hoang',02,03,03,'2000-1-31','123412340987','21500',0934234345,'levanhoang@gmail.com','Hue'),
(03,'Tran Van Minh',03,01,04,'1997-09-30','111412349345','1000',0723412234,'tranvanminh@gmail.com','Vinh'),
(04,'Tran Duy K',03,02,04,'1999-09-30','200012312323','1500',201300210021,'tranduyk@gmail.com','Quang Tri'),
(05,'Hoang Minh T',05,03,04,'1992-10-30','201112312323','1200',201123423445,'hoangminht@gmail.com','Quang Nam');

-- update Nhan_Vien set SoCMTND = '200012312323' where IDNhanVien = 04; -- update data column id 04 
-- update Nhan_Vien set SoCMTND = '201112312323' where IDNhanVien = 05;

insert into Loai_Khach(IDLoaiKhach,TenLoaiKhach)
values
(01,'Diamond'),
(02,'Platinium'),
(03,'Gold'),
(04,'Silver'),
(05,'Member');

insert into Khach_Hang(IDKhachHang,IDLoaiKhach,HoTen,NgaySinh,SoCMTND,SDT,Email,DiaChi)
values
(01,01,'Nguyen Van A', '1998-7-9', '201803330215', '0774041503','nguyenvana@gmail.com', 'Da Nang'),
(02,04,'Le Van Minh','1967-3-2','199023453456','0123234123','levanminh@gmail.com','Hue'),
(03,02,'Hoang Minh T','1990-5-7','194067842345','0453123423','hoangminht@gmail.com','Vinh'),
(04,05,'Van Tien Minh','2000-4-2','123412341234','0932123456','vantienminh@gmail.com','Quang Tri'),
(05,01,'Nguyen Dinh B', '1832-7-9', '123402202156', '0775065032','nguyendinhb@gmail.com', 'Hue'),
(06,01,'Mac Van A', '1945-7-9', '70321234234', '0744041503','macvana@gmail.com', 'Da Nang');



-- insert into Hop_Dong_Chi_Tiet (IDHopDongChiTiet,SoLuong,DichVuDiKem_IDDichVuDiKem ,HopDong_IDHopDong)
-- values
-- (01,01,01,01),
-- (02,01,02,02);

-- insert into Dich_Vu_Di_Kem(IDDichVuDiKem,TenDichVuDiKem,Gia,DonVi,TrangThaiKhaDung)
-- values
-- (01,'Massage',200,2,'VC'),
-- (02,'Karaoke',100,3,'OC'),
-- (03,'Thuc an',50,1,'OC'),
-- (04,'Nuoc',2,5,'OC'),
-- (05,'Thue xe',40,5,'VC');

insert into Loai_Dich_Vu(IDLoaiDichVu ,TenLoaiDichVu)
values
(01,'Villa'),
(02,'House'),
(03,'Room');

insert into Kieu_Thue(IDKieuTHue,TenKieuTHue,Gia)
values
(01,'Nam',3000),
(02,'Thang',300),
(03,'Ngay',80),
(04,'Gio',25);

insert into Dich_Vu(IDDichVu,TenDichVu,DienTich,SoTang,SoNguoiToiDa,ChiPhiThue,IDKieuThue,IDLoaiDichVu,TrangThai)
values
(01,'Villa',100,3,'4','100',04,01,'VC'),
(02,'House',40,1,'2','50',03,02,'OC'),
(03,'Room',40,1,'0','50',03,02,'VC'),
(04,'House',40,1,'2','50',03,02,'OC'),
(05,'Room',40,1,'0','50',03,02,'OC');


insert into Hop_Dong(IDHopDong,IDNhanVien,IDKhachHang,IDDichVu,NgayLamHopDong,NgayKetThuc,TienDatCoc,TongTien)
values
(01,01,02,01,'2010-02-09','2010-012-15',1200,1500),
(02,02,01,01,'2019-03-09','2020-03-09',1300,1700),
(03,03,02,03,'2019-04-09','2019-04-29',1700,2000),
(04,05,03,02,'2018-05-09','2018-05-30',500,2500),
(05,04,04,04,'2018-07-09','2018-07-15',750,1000),
(06,03,05,05,'2018-04-08','2018-04-21',900,1500);

-- cau 2:
SELECT * FROM quanlyresort.nhan_vien where (Hoten like 'H%' or Hoten like 'T%' or Hoten like 'K%') and (length(HoTen) <= 15);

-- cau 3:
SELECT * FROM quanlyresort.khach_hang where (year(curdate())-year(NgaySinh)) > 18 and (year(curdate())-year(NgaySinh)) <50 and(DiaChi in ('Da Nang','Quang Tri'));


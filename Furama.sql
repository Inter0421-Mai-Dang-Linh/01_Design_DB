-- drop database if exists quanlyresort;

CREATE DATABASE quanlyresort;
USE quanlyresort;

CREATE TABLE Vi_Tri(	
	IDViTri int primary key not null,
    TenViTri varchar(45));
    
-- delete from Vitri where IDVitri = 1;

-- select * from ViTri;

CREATE TABLE Trinh_Do(
	IDTrinhDo int primary key not null,
    TrinhDo varchar(45) not null);
    

-- ALTER TABLE TrinhDo ADD FOREIGN KEY(IDTrinhDo) references NhanVien(IDTrinhDo);
-- select * from TrinhDo;

CREATE TABLE Bo_Phan(
	IDBoPhan int primary key not null,
    TenBoPhan varchar(45) not null);

-- select * from BoPhan;

CREATE TABLE Nhan_Vien(
	IDNhanVien int primary key,
    HoTen varchar(45)not null,
    NgaySinh date not null,
    SoCMTND varchar(45)not null,
    Luong varchar(45),
    SDT varchar(45),
    Email varchar(45),
    DiaChi varchar(45),
    Vi_Tri_IDViTri int,
    Trinh_Do_IDTrinhDo int,
    Bo_Phan_IDBoPhan int,
    
    constraint Nhan_vien_ibfk1
	foreign key (Vi_Tri_IDViTri) references Vi_Tri (IDViTri),
    foreign key (Trinh_Do_IDTrinhDo) references Trinh_Do (IDTrinhDo),
    foreign key (Bo_Phan_IDBoPhan) references Bo_Phan(IDBoPhan)
    );

-- select * from NhanVien;

CREATE TABLE Dich_Vu_Di_Kem(
	IDDichVuDiKem int,
    TenDichVuDiKem varchar(45),
    Gia INT,
    DonVi int,
    TrangThaiKhaDung varchar(45),
    primary key (IDDichVuDiKem));
    
CREATE TABLE Loai_Khach(
	IDLoaiKhach int not null,
    TenLoaiKhach varchar(45),
    primary key (IDLoaiKhach));
    
CREATE TABLE Khach_Hang(
	IDKhachHang int,
    HoTen varchar(45),
    NgaySinh date,
    SoCMTND varchar(45),
    SDT varchar(45),
    Email varchar(45),
    DiaChi varchar(45),
    primary key(IDKhachHang,SoCMTND,Email),
    Loai_Khach_IDLoaiKhach int,
    
    foreign key(Loai_Khach_IDLoaiKhach) references Loai_Khach(IDLoaiKhach));
    
    CREATE TABLE Kieu_Thue(
	IDKieuTHue int primary key,
    TenKieuTHue varchar(45),
    Gia int);
    
    CREATE TABLE Loai_Dich_Vu(
	IDLoaiDichVu int,
    TenLoaiDichVu varchar(60),
    primary key(IDLoaiDichVu));
    
    CREATE TABLE Dich_Vu(
	IDDichVu  int primary key not null,
    TenDichVu varchar(45),
    DienTich int,
    SoTang int,
    SoNguoiToiDa varchar(45),
    ChiPhiThue varchar(45),
    TrangThai varchar(45),
    
    Kieu_THue_IDKieuThue int,
    Loai_Dich_Vu_IDLoaiDichVu int,
    foreign key(Kieu_THue_IDKieuThue) references Kieu_Thue (IDKieuThue),
    foreign key(Loai_Dich_Vu_IDLoaiDichVu) references Loai_Dich_Vu(IDLoaiDichVu)
    );
    
CREATE TABLE Hop_Dong(
	IDHopDong int not null,
    NgayLamHopDong date not null,
    TienDatCoc int,
    TongTien int,
    primary key (IDHopDong),
    Khach_Hang_IDKhachHang int,
    Dich_Vu_IDDichVu int,
    Nhan_Vien_IDNhanVien int,
    
    foreign key(Khach_Hang_IDKhachHang) references Khach_Hang(IDKhachHang),
	foreign key(Dich_Vu_IDDichVu) references  Dich_Vu(IDDichVu),
    foreign key(Nhan_Vien_IDNhanVien) references Nhan_Vien(IDNhanVien)
    );
    
CREATE TABLE Hop_Dong_Chi_Tiet(
	IDHopDongChiTiet int,
    SoLuong int,
    Dich_Vu_Di_Kem_IDDichVuDiKem int,
    Hop_Dong_IDHopDong int,
    primary key(IDHopDongChiTiet),
    
    foreign key(Dich_Vu_Di_Kem_IDDichVuDiKem) references Dich_Vu_Di_Kem(IDDichVuDiKem),
	foreign key(Hop_Dong_IDHopDong) references Hop_Dong(IDHopDong)
    );





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

SET FOREIGN_KEY_CHECKS = 0;
insert into Nhan_Vien(IDNhanVien,HoTen,NgaySinh ,SoCMTND,Luong,SDT,Email,DiaChi ,Vi_Tri_IDViTri,Trinh_Do_IDTrinhDo,Bo_Phan_IDBoPhan)
value
(01,'Nguyen Van K','1994-12-31','123412341234','2000','0987234234','nguyenvank@gmail.com','Da Nang',01,02,03),
(02,'Le Van Hoang','2000-1-31','123412340987','21500',0934234345,'levanhoang@gmail.com','Hue',02,03,02),
(03,'Tran Van Minh','1997-09-30','111412349345','1000',0723412234,'tranvanminh@gmail.com','Vinh',03,01,04);
SET FOREIGN_KEY_CHECKS = 1;
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

-- insert into Hop_Dong(IDHopDong,NgayLamHopDong,TienDatCoc,TongTien,KhachHang_IDKhachHang,DichVu_IDDichVu,NhanVien_IDNhanVien)
-- values
-- (01,'2010-04-09',1000,1500,01,02,04);

insert into Loai_Khach(IDLoaiKhach,TenLoaiKhach)
values
(01,'Diamond'),
(02,'Platinium'),
(03,'Gold'),
(04,'Silver'),
(05,'Member');

SET FOREIGN_KEY_CHECKS = 1;
insert into Khach_Hang(IDKhachHang,HoTen,NgaySinh,SoCMTND,SDT,Email,DiaChi,Loai_Khach_IDLoaiKhach)
values
(01,'Nguyen Van A', '1998-7-9', '201803330215', '0774041503','nguyenvana@gmail.com', 'Da Nang',01),
(02,'Le Van Minh','1967-3-2','199023453456','0123234123','levanminh@gmail.com','Hue',04),
(03,'Hoang Minh T','1990-5-7','194067842345','0453123423','hoangminht@gmail.com','Vinh',02),
(04,'Van Tien Minh','2000-4-2','123412341234','0932123456','vantienminh@gmail.com','Quang Tri',05);

insert into Khach_Hang(IDKhachHang,HoTen,NgaySinh,SoCMTND,SDT,Email,DiaChi,Loai_Khach_IDLoaiKhach)
values
(05,'Nguyen Dinh B', '1832-7-9', '123402202156', '0775065032','nguyendinhb@gmail.com', 'Hue',01),
(06,'Mac Van A', '1945-7-9', '70321234234', '0744041503','macvana@gmail.com', 'Da Nang',01);

-- insert into Kieu_Thue(IDKieuTHue,TenKieuTHue,Gia)
-- values
-- (01,'Nam',3000),
-- (02,'Thang',300),
-- (03,'Ngay',70),
-- (04,'Gio',15);
--     
-- insert into Loai_Dich_Vu(IDLoaiDichVu ,TenLoaiDichVu)
-- values
-- (01,'Villa'),
-- (02,'House'),
-- (03,'Room');
--     
-- insert into Dich_Vu(IDDichVu,TenDichVu,DienTich,SoTang,SoNguoiToiDa,ChiPhiThue,TrangThai,KieuTHue_IDKieuThue,LoaiDichVu_IDLoaiDichVu)
-- values
-- (01,'Villa',100,3,'4','100','VC',04,01),
-- (02,'House',40,1,'2','50','OC',03,02);




    

	




	

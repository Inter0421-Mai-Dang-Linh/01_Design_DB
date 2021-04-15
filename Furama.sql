drop database if exists quanlyresort;
CREATE DATABASE quanlyresort;
-- DROP database quanlyresort;
USE quanlyresort;
CREATE TABLE ViTri(	
	IDViTri int primary key not null,
    TenViTri varchar(45));
    
-- delete from Vitri where IDVitri = 1;

-- select * from ViTri;

CREATE TABLE TrinhDo(
	IDTrinhDo int primary key not null,
    TrinhDo varchar(45) not null);
    
insert into TrinhDo(IDTrinhDo,TrinhDo) value(01,'Trung Cap');
insert into TrinhDo(IDTrinhDo,TrinhDo) value(02,'Cao Dang');
insert into TrinhDo(IDTrinhDo,TrinhDo) value(03,'Dai hoc');
insert into TrinhDo(IDTrinhDo,TrinhDo) value(04,'Sau Dai Hoc');

ALTER TABLE TrinhDo ADD FOREIGN KEY(IDTrinhDo) references NhanVien(IDTrinhDo);
select * from TrinhDo;

CREATE TABLE BoPhan(
	IDBoPhan int primary key not null,
    TenBoPhan varchar(45) not null);
    
insert into BoPhan(IDBoPhan,TenBoPhan) value(01,'Sale-Marketing');
insert into BoPhan(IDBoPhan,TenBoPhan) value(02,'Hanh Chinh');
insert into BoPhan(IDBoPhan,TenBoPhan) value(03,'Phuc Vu');
insert into BoPhan(IDBoPhan,TenBoPhan) value(04,'Quan Ly');

ALTER TABLE BoPhan ADD FOREIGN KEY(IDBoPhan) references NhanVien(IDBoPhan);

select * from BoPhan;

CREATE TABLE NhanVien(
	IDNhanVien int primary key,
    HoTen varchar(45)not null,
    NgaySinh date not null,
    SoCMTND varchar(45)not null,
    Luong varchar(45),
    SDT varchar(45),
    Email varchar(45),
    DiaChi varchar(45),
    ViTri_IDViTri int,
    TrinhDo_IDTrinhDo int,
    BoPhan_IDBoPhan int,
    
	foreign key (ViTri_IDViTri) references ViTri (IDViTri),
    foreign key (TrinhDo_IDTrinhDo) references TrinhDo (IDTrinhDo),
    foreign key (BoPhan_IDBoPhan) references BoPhan(IDBoPhan)
    );

-- select * from NhanVien;

CREATE TABLE HopDongChiTiet(
	IDHopDongChiTiet int primary key,
    SoLuong int,
    DichVuDiKem_IDDichVuDiKem int,
    HopDong_IDHopDong int,
    primary key(IDHopDongChiTiet),
    
    foreign key(DichVuDiKem_IDDichVuDiKem) references DichVuDiKem(IDDichVuDiKem),
	foreign key(HopDong_IDHopDong) references HopDong(IDHopDong)
    );
    
CREATE TABLE DichVuDiKem(
	IDDichVuDiKem int,
    TenDichVuDiKem varchar(45),
    DonVi int,
    TrangThaiKhaDung varchar(45),
    primary key (IDDichVuDiKem));
    
CREATE TABLE HopDong(
	IDHopDong int primary key not null,
    NgayLamHopDong date not null,
    TienDatCoc int,
    TongTien int,
    primary key (IDHopDong,IDNhanVien,IDKhachHang,IDDichVu),
    KhachHang_IDKhachHang int,
    DichVu_IDDichVu int,
    NhanVien_IDNhanVien int
    );

CREATE TABLE LoaiKhach(
	IDLoaiKhach int primary key not null,
    TenLoaiKhach varchar(45));
    

CREATE TABLE KhachHang(
	IDKhachHang int,
    HoTen varchar(45),
    NgaySinh date,
    SoCMTND varchar(45),
    SDT varchar(45),
    Email varchar(45),
    DiaChi varchar(45),
    primary key(IDKhachHang,IDLoaiKhach,SoCMTND,Email),
    LoaiKhach_IDKhachHang int,
    
    foreign key(LoaiKhach_IDKhachHang) references LoaiKhach(IDKhachHang));
    
CREATE TABLE KieuThue(
	IDKieuTHue int primary key,
    TenKieuTHue varchar(45),
    Gia int);
    
CREATE TABLE LoaiDichVu(
	IDLoaiDichVu int,
    TenLoaiDichVu varchar(60),
    primary key(IDLoaiDichVu));
    
CREATE TABLE DichVu(
	IDDichVu  int primary key not null,
    TenDichVu varchar(45),
    DienTich int,
    SoTang int,
    SoNguoiToiDa int,
    ChiPhiThue varchar(45),
    TrangThai varchar(45),
    
    KieuTHue_IDKieuThue int,
    LoaiDichVu_IDLoaiDichVu int,
    foreign key(KieuTHue_IDKieuThue) references kieuThue (IDKieuThue),
    foreign key(LoaiDichVu_IDLoaiDichVu) references LoaiDichVu(IDLoaiDichVu)
    );

insert into ViTri(IDViTri,TenViTri) value(01,'Le Tan');
insert into ViTri(IDViTri,TenViTri) value(02,'Phuc Vu');
insert into ViTri(IDViTri,TenViTri) value(03,'Chuyen Vien');
insert into ViTri(IDViTri,TenViTri) value(04,'Giam Sat');
insert into ViTri(IDViTri,TenViTri) value(05,'Quan Ly');

insert into TrinhDo(IDTrinhDo,TrinhDo) value(01,'Trung Cap');
insert into TrinhDo(IDTrinhDo,TrinhDo) value(02,'Cao Dang');
insert into TrinhDo(IDTrinhDo,TrinhDo) value(03,'Dai hoc');
insert into TrinhDo(IDTrinhDo,TrinhDo) value(04,'Sau Dai Hoc');

insert into BoPhan(IDBoPhan,TenBoPhan) value(01,'Sale-Marketing');
insert into BoPhan(IDBoPhan,TenBoPhan) value(02,'Hanh Chinh');
insert into BoPhan(IDBoPhan,TenBoPhan) value(03,'Phuc Vu');
insert into BoPhan(IDBoPhan,TenBoPhan) value(04,'Quan Ly');

insert into NhanVien(IDNhanVien,HoTen,NgaySinh ,SoCMTND,Luong,SDT,Email,DiaChi ,ViTri_IDViTri,TrinhDo_IDTrinhDo,BoPhan_IDBoPhan)
value(01,'Nguyen Van K','1994-12-31','123412341234','2000','0987234234','nguyenvank@gmail.com','3 Duongk',01,02,03);
insert into NhanVien(IDNhanVien,HoTen,IDViTri,IDTrinhDo,IDBoPhan,NgaySinh,SoCMTND,Luong,SDT,Email,DiaChi)
value(02,'Le Van Hoang','1994-12-31','123412340987','21500',0934234345,'levanhoang@gmail.com','5 NVL',02,03,02);
insert into NhanVien(IDNhanVien,HoTen,IDViTri,IDTrinhDo,IDBoPhan,NgaySinh,SoCMTND,Luong,SDT,Email,DiaChi)
value(03,'Tran Van Minh','1994-12-31','123412349345','1000',0723412234,'tranvanminh@gmail.com','4 TDT',03,01,04);

insert into HopDongChiTiet (IDHopDongChiTiet ,SoLuong ,DichVuDiKem_IDDichVuDiKem ,HopDong_IDHopDong)
values
();

insert into DichVuDiKem(IDDichVuDiKem,TenDichVuDiKem,DonVi,TrangThaiKhaDung)
value
();

insert into HopDong(IDHopDong,NgayLamHopDong,TienDatCoc,TongTien,KhachHang_IDKhachHang,DichVu_IDDichVu,NhanVien_IDNhanVien)
value
();


    

	




	

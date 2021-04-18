SELECT Hop_Dong.IDHopDong,Khach_Hang.HoTen, count(Hop_Dong.IDKhachHang) as Solan
from Hop_Dong inner join Khach_Hang  on Hop_Dong.IDKhachHang = Khach_Hang.IDKhachHang
where Khach_Hang.IDLoaiKhach = 1 group by Hop_Dong.IDKhachHang  order by Solan asc;

-- Select chọn ra các thông số để hiển thị các cột trong bảng cần tìm
-- liên kết 2 bảng với cùng giá trị đối chiếu 
SELECT Khach_Hang.IDKhachHang,Khach_Hang.HoTen,Loai_Khach.TenLoaiKhach,Hop_Dong.IDHopDong,Dich_Vu.TenDichVu,Dich_Vu.NgayLamHopDong,Dich_Vu.NgayKetThuc
from  Khach_Hang Join
 (
  select Loai_Khach.IDLoaiKhach 
  from Loai_Khach
  )where LK.IDLoaiKhach = Khach_Hang.IDLoaiKhach group by Khach_Hang.IDKhachHang;


SELECT DISTINCT HoTen from Khach_hang;
SELECT Hoten from Khach_Hang group by Hoten;
select Hoten from Khach_Hang group by Hoten having count(Hoten) =1 union select Hoten from Khach_hang  having count(Hoten) > 1;

SELECT * FROM nhan_vien WHERE (SUBSTRING_INDEX(SUBSTRING_INDEX( HoTen , ' ', -1 ),' ',2) 
LIKE "H%" OR SUBSTRING_INDEX(SUBSTRING_INDEX( HoTen , ' ', -1 ),' ',2) LIKE "T%" 
OR SUBSTRING_INDEX(SUBSTRING_INDEX( HoTen , ' ', -1 ),' ',2) LIKE "K%" )  and length(HoTen) <=15;
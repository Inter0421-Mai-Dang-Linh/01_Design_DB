# 01_Design_DB
Project Database - internship CodeGym 

cau 2:
SELECT * FROM quanlyresort.nhan_vien where (Hoten like 'H%' or Hoten like 'T%' or Hoten like 'K%') and (length(HoTen) <= 15);

cau 3:
SELECT * FROM quanlyresort.khach_hang where (year(curdate())-year(NgaySinh)) > 18 and (year(curdate())-year(NgaySinh)) <50 and(DiaChi in ('Da Nang','Quang Tri'));
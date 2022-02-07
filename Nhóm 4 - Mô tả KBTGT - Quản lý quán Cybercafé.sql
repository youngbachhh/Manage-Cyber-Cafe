create database test
use test

create table nhan_vien (
	id_nhan_vien varchar(10) not null,
	ten_nhan_vien nvarchar(30) not null,
	ngay_sinh char(10),
	so_dien_thoai char(10),
	dia_chi nvarchar(50),
	chuc_vu nvarchar(20) not null,
	luong_co_dinh int default 5000000,
	constraint NV_id_nhan_vien primary key (id_nhan_vien),
)


insert into nhan_vien(id_nhan_vien, ten_nhan_vien, ngay_sinh, so_dien_thoai, dia_chi, chuc_vu)
values 
('CB00', N'Nguyễn Van An','07/01/1992','0178936893',N'Thanh Xuân', N'Quản lí'), 
('CB03', N'Trần Thị Dung','03/10/1995','0845782123',N'Hà Ðông', N'Kế toán'),
('CB02', N'Trần Khắc Ðạt','10/12/1998','0946389146',N'Hà Ðông', N'Lễ Tân'),
('CB01', N'Nguyễn Thị Tú Anh','01/02/1998','0162089115',N'Thanh Xuân', N'Lễ Tân'),
('CB05', N'Lương Văn Phong','13/12/1997','0383011999',N'Hoàng Mai', N'Lễ Tân'),
('CB06', N'Kiều Thị Trang','05/09/1999','0169487406',N'Thanh Xuân', N'Lễ Tân'),
('CB04', N'Nguyễn Hữu Nam','13/9/1998','0818609906',N'Thanh Xuân', N'Lễ Tân')

update nhan_vien
set 
ngay_sinh = convert(varchar(10), convert(date, ngay_sinh, 105), 23) 

select * from nhan_vien

create table luong (
	id_nhan_vien varchar(10) not null,
	so_buoi_lam int not null,
	foreign key (id_nhan_vien) references nhan_vien
)

select * from luong

insert into luong(id_nhan_vien, so_buoi_lam)
values
('CB00', 30),
('CB01', 28),
('CB02', 29),
('CB03', 30),
('CB04', 29),
('CB05', 29),
('CB06', 30)



create table khach_hang(
	id_khach_hang varchar(10) not null,
	ten_khach_hang nvarchar(30) not null,
	so_dien_thoai char(10),
	dia_chi nvarchar(50),
	constraint KH_id_khach_hang primary key (id_khach_hang)
)


insert into khach_hang(id_khach_hang, ten_khach_hang, so_dien_thoai, dia_chi)
values
('KH024', N'Nguyễn Ngọc Phúc Anh', '0187379257', N'Cầu Giấy'),
('KH056', N'Nguyễn Văn Bách', '0818622338', N'Tân Triều'),
('KH078', N'Nguyễn Trọng Chính', '0913785786', N'Hoàng Mai'),
('KH134', N'Mai Ðại Duong', '0343786285', N'Tân Triều'),
('KH140', N'Nguyễn Ngọc Duy', '0945789235', N'Hoàng Mai'),
('KH346', N'Hà Duyên Hùng', '0169904783', N'Hà Ðông'),
('KH502', N'Phí Minh Quang', '0162786486', N'Tân Triều'),
('KH518', N'Bùi Anh Quân', '0784682952', N'Hai Bà Trung'),
('KH535', N'Vu Hữu Quân', '0845678367', N'Hà Ðông'),
('KH603', N'Phạm Thanh Son', '0987123789', N'Cầu Giấy')



create table ncc_nguyen_lieu(
	id_ncc_nl varchar(10) not null,
	ten_ncc nvarchar(30) not null,
	dia_chi nvarchar(50),
	so_dien_thoai char(10),
	constraint NCCNL_id_ncc_nl primary key (id_ncc_nl)
)


insert into ncc_nguyen_lieu(id_ncc_nl, ten_ncc, dia_chi, so_dien_thoai)
values
('NCC1', N'Trung Van',N'Thườnng Tín', '0368278265'),
('NCC2', N'Ðại Nam',N'Thanh Xuân', '0989678467'),
('NCC3', N'Khánh An',N'Hai Bà Trung', '0169678426')



create table nha_cc_tb(
	id_ncc_tb varchar(10) not null,
	ten_ncc nvarchar(30) not null,
	dia_chi nvarchar(50),
	so_dien_thoai char(10),
	constraint NCCTB_id_ncc primary key (id_ncc_tb)
)


insert into nha_cc_tb(id_ncc_tb, ten_ncc, dia_chi, so_dien_thoai)
values
('CCTB01', N'Razer', N'Hồ Chí Minh', '0978372863'),
('CCTB02', N'Gigabyte', N'Hà Nội', '0972682684'),
('CCTB03', N'Gearvn', N'Hà Nội', '0888462684'),
('CCTB04', N'MSI', N'Hà Nội', '0168672682')



create table thiet_bi_cc_internet(
	id_thiet_bi varchar(10) not null,
	id_ncc_tb varchar(10) not null,
	gia int,
	constraint TBCC_id_thiet_bi primary key (id_thiet_bi),
	foreign key (id_ncc_tb) references nha_cc_tb
)


insert into thiet_bi_cc_internet(id_thiet_bi, id_ncc_tb, gia)
values 
('TB01','CCTB01', 15000),
('TB02','CCTB02', 12000),
('TB03','CCTB03', 8000),
('TB04','CCTB04', 10000)



create table cyber_cafe(
	id_cyber_cafe varchar(10) not null,
	dia_chi nvarchar(50) not null,
	so_dien_thoai char(10) not null,
	constraint Cyber_id_cyber_cafe primary key(id_cyber_cafe)
)


insert into cyber_cafe
values('C1', N'Thanh Xuân', '0373641889')



create table menu (
	id_mon varchar(4) not null,
	ten_mon nvarchar(20) not null unique,
	gia int not null,
	loai_mon nvarchar(20),
	constraint MN_id_mon primary key (id_mon)
)


insert into menu(id_mon, ten_mon, gia,loai_mon)
values
('DA01',N'Khoai tây chiên', 15000, N'Đồ ăn'),
('DA02',N'Lạp xưởng', 20000, N'Đồ ăn'),
('DA03',N'Mì tôm', 10000, N'Đồ ăn'),
('DA04',N'Bánh mì', 10000, N'Đồ ăn'),
('DU01',N'Sting', 15000, N'Đồ uống'),
('DU02',N'Aquafina', 8000, N'Đồ uống'),
('DU03',N'Bia 333', 21000, N'Đồ uống'),
('DU04',N'Bia Heneiken', 22000, N'Đồ uống'),
('DU05',N'Bia Tiger', 26000, N'Đồ uống')



create table do_an(
	ten_mon nvarchar(20) not null unique,
	loai_do_an nvarchar(20) not null,
	foreign key (ten_mon) references menu(ten_mon)
)


insert into do_an (ten_mon, loai_do_an)
values
(N'Khoai tây chiên', N'Chiên'),
(N'Lạp xưởng', N'Chiên'),
(N'Mì tôm', N'Nhanh'),
(N'Bánh mì', N'Nhanh')



create table do_uong(
	ten_mon nvarchar(20) not null unique,
	loai_do_uong nvarchar(20) not null,
	foreign key (ten_mon) references menu(ten_mon)
)


insert into do_uong(ten_mon, loai_do_uong)
values
(N'Sting',N'Có ga'),
(N'Aquafina',N'Không'),
(N'Bia 333',N'Có cồn'),
(N'Bia Heneiken',N'Có cồn'),
(N'Bia Tiger',N'Có cồn')



create table ban(
	id_ban varchar(5) not null,
	so_cho int not null,
	gia int not null,
	constraint CK_id_ban primary key (id_ban)
)


insert into ban(id_ban, so_cho, gia)
values 
('A01', 1,30000),
('A02', 1,25000),
('A03', 1,28000),
('A04', 1,20000),
('A05', 2,15000),
('A06', 2,10000),
('A07', 2,10000),
('A08', 2,8000),
('A09', 4,8000),
('A10', 4,8000),
('A11', 4,8000),
('A12', 4,8000),
('A13', 4,8000),
('A14', 4,5000),
('A15', 4,5000)



create table hoa_don_nhap(
	id_hoa_don_nhap varchar(10) not null,
	id_ncc varchar(10) not null,
	id_cyber_cafe varchar(10) not null default 'C1', 
	ngay_nhap char(10) not null,
	tong_tien int not null,
	constraint HDN_id_hoa_don_nhap primary key (id_hoa_don_nhap),
	foreign key (id_ncc) references ncc_nguyen_lieu,
	foreign key (id_cyber_cafe) references cyber_cafe
)


insert into  hoa_don_nhap(id_hoa_don_nhap, id_ncc,ngay_nhap, tong_tien)
values
('NH001', 'NCC1', '12/01/2020', 2000000),
('NH002', 'NCC2', '14/01/2020', 3000000),
('NH003', 'NCC1', '20/02/2020', 5000000),
('NH004', 'NCC3', '20/02/2020', 3000000),
('NH005', 'NCC1', '05/03/2020', 7000000),
('NH006', 'NCC1', '09/03/2020', 5000000),
('NH007', 'NCC2', '29/03/2020', 5000000),
('NH008', 'NCC3', '01/05/2020', 7000000),
('NH009', 'NCC3', '06/06/2020', 5000000)

update hoa_don_nhap
set
ngay_nhap = convert(varchar(10), convert(date, ngay_nhap, 105), 23) 



create table hoa_don_ban_hang(
	id_hoa_don_ban_hang varchar(10) not null,
	id_khach_hang varchar(10) not null,
	ngay_ban char(10) not null,
	tong_tien int not null,
	thoi_gian int not null,
	id_cyber_cafe varchar(10) not null default 'C1',
	constraint HDBH_id_hoa_don primary key (id_hoa_don_ban_hang),
	foreign key (id_khach_hang) references khach_hang,
	foreign key (id_cyber_cafe) references cyber_cafe
)



insert into hoa_don_ban_hang(id_hoa_don_ban_hang, id_khach_hang, ngay_ban, tong_tien, thoi_gian)
values
( 'TT0001', 'KH502', '08/11/2020', 86000, 4),
( 'TT0002', 'KH140', '08/11/2020', 40000, 4),
( 'TT0003', 'KH346', '08/11/2020',88000, 4),
( 'TT0004', 'KH024', '08/11/2020',46000, 2),
( 'TT0005', 'KH535', '08/11/2020', 54000, 4),
( 'TT0006', 'KH056', '08/11/2020',40000, 3),
( 'TT0007', 'KH078', '08/11/2020', 90000, 4),
( 'TT0008', 'KH603', '08/11/2020', 20000, 1),
( 'TT0009', 'KH535', '08/11/2020', 128000, 4),
( 'TT0010', 'KH024','08/11/2020', 160000, 5),
( 'TT0011', 'KH134', '08/11/2020', 54000, 4),
( 'TT0012', 'KH603', '08/11/2020', 45000, 3),
( 'TT0013', 'KH134', '08/11/2020', 104000, 3),
( 'TT0014', 'KH603', '08/11/2020', 42000, 2),
( 'TT0015', 'KH078', '08/11/2020', 58000, 4),
( 'TT0016', 'KH134', '08/11/2020', 120000, 4),
( 'TT0017', 'KH134', '08/11/2020', 77000, 2),
( 'TT0018', 'KH078', '08/11/2020', 32000, 2),
( 'TT0019', 'KH024', '08/11/2020', 50000, 3),
( 'TT0020', 'KH518', '08/11/2020', 138000, 4)

update hoa_don_ban_hang
set
ngay_ban = convert(varchar(10), convert(date, ngay_ban, 105), 23) 



create table phuc_vu(
	id_khach_hang varchar(10) not null,
	id_nhan_vien varchar(10) not null,
	id_thiet_bi varchar(10),
	id_mon varchar(4) not null,
	id_ban varchar(5) not null,
	id_hoa_don_ban_hang varchar(10) not null primary key,
	foreign key (id_khach_hang) references khach_hang,
	foreign key (id_nhan_vien) references nhan_vien,
	foreign key (id_thiet_bi) references thiet_bi_cc_internet,
	foreign key (id_mon) references menu,
	foreign key (id_ban) references ban,
	foreign key (id_hoa_don_ban_hang) references hoa_don_ban_hang
)



insert into phuc_vu(id_khach_hang, id_nhan_vien, id_thiet_bi, id_mon, id_ban, id_hoa_don_ban_hang)
values 
('KH502', 'CB01', 'TB01', 'DU05', 'A05', 'TT0001'),
('KH140', 'CB04', 'TB04', 'DU02', 'A12', 'TT0002'),
('KH346', 'CB05', 'TB02', 'DU02', 'A04', 'TT0003'),
('KH024', 'CB06', 'TB01', 'DU05', 'A06', 'TT0004'),
('KH535', 'CB02', 'TB04', 'DU04', 'A13', 'TT0005'),
('KH056', 'CB06', 'TB03', 'DU03', 'A07', 'TT0006'),
('KH078', 'CB02', 'TB04', 'DU04', 'A04', 'TT0007'),
('KH603', 'CB05', 'TB02', 'DU01', 'A15', 'TT0008'),
('KH535', 'CB06', 'TB02', 'DU02', 'A01', 'TT0009'),
('KH024', 'CB02', 'TB03', 'DU02', 'A03', 'TT0010'),
('KH134', 'CB05', 'TB04', 'DU04', 'A13', 'TT0011'),
('KH603', 'CB04', 'TB03', 'DU01', 'A08', 'TT0012'),
('KH134', 'CB05', 'TB02', 'DU02', 'A03', 'TT0013'),
('KH603', 'CB02', 'TB04', 'DU05', 'A09', 'TT0014'),
('KH078', 'CB01', 'TB03', 'DU05', 'A11', 'TT0015'),
('KH134', 'CB04', 'TB03', 'DU02', 'A02', 'TT0016'),
('KH134', 'CB05', 'TB01', 'DU03', 'A03', 'TT0017'),
('KH078', 'CB06', 'TB01', 'DU04', 'A14', 'TT0018'),
('KH024', 'CB01', 'TB02', 'DU05', 'A10', 'TT0019'),
('KH518', 'CB05', 'TB04', 'DU05', 'A03', 'TT0020')




--======================================================================================================--
--==============TẠO VIEW==============--

--View lấy danh sách nhân viên phục vụ
create view ds_nv_pv 
as 
select 
id_nhan_vien as N'Mã nhân viên',
ten_nhan_vien as N'Tên nhân viên', 
year(getdate())-year(ngay_sinh) as N'Tuổi',
so_dien_thoai as N'Số điện thoại'
from nhan_vien
where chuc_vu = N'Lễ Tân'




--View lấy danh sách nhân viên quản lý
create view ds_nv_ql  as
select 
id_nhan_vien as N'Mã nhân viên',
ten_nhan_vien as N'Tên nhân viên', 
year(getdate())-year(ngay_sinh) as N'Tuổi',
so_dien_thoai as N'Số điện thoại'
from nhan_vien
where chuc_vu = N'Quản lí'


select * from ds_nv_ql



--View lấy danh sách nhân viên kế toán
create view ds_nv_kt as 
select 
id_nhan_vien as N'Mã nhân viên',
ten_nhan_vien as N'Tên nhân viên', 
year(getdate())-year(ngay_sinh) as N'Tuổi',
so_dien_thoai as N'Số điện thoại'
from nhan_vien
where chuc_vu = N'Kế toán'


select * from ds_nv_kt



--View lấy bảng lương của nhân viên phục vụ
create view bang_luong_nv_pv as 
select 
nhan_vien.id_nhan_vien as N'Mã nhân viên',
nhan_vien.ten_nhan_vien as N'Tên nhân viên', 
format(nhan_vien.luong_co_dinh*luong.so_buoi_lam*1.2/26, 'C0', 'vn-VN') as N'Lương nhận',
month(getdate()) as N'Tháng',
year(getdate()) as N'Năm'
from nhan_vien
join luong on nhan_vien.id_nhan_vien = luong.id_nhan_vien
where chuc_vu = N'Lễ Tân'


select * from bang_luong_nv_pv



--View lấy bảng lương của nhân viên kế toán
create view bang_luong_nv_kt as 
select 
nhan_vien.id_nhan_vien as N'Mã nhân viên',
nhan_vien.ten_nhan_vien as N'Tên nhân viên', 
format(nhan_vien.luong_co_dinh*luong.so_buoi_lam*1.8/26, 'C0', 'vn-VN') as N'Lương nhận',
month(getdate()) as N'Tháng',
year(getdate()) as N'Năm'
from nhan_vien
join luong on nhan_vien.id_nhan_vien = luong.id_nhan_vien
where chuc_vu = N'Kế toán' 

select * from bang_luong_nv_kt



--View lấy bảng lương của nhân viên quản lí
create view bang_luong_nv_ql as 
select 
nhan_vien.id_nhan_vien as N'Mã nhân viên',
nhan_vien.ten_nhan_vien as N'Tên nhân viên', 
format(nhan_vien.luong_co_dinh*luong.so_buoi_lam*2.4/26, 'C0', 'vn-VN') as N'Lương nhận',
month(getdate()) as N'Tháng',
year(getdate()) as N'Năm'
from nhan_vien
join luong on nhan_vien.id_nhan_vien = luong.id_nhan_vien
where chuc_vu = N'Quản lí' 

select * from bang_luong_nv_ql



--View lấy lấy danh sách khách hàng
create view ds_khach_hang as 
select 
ten_khach_hang as N'Tên khách hàng', 
dia_chi as N'Ðịa chỉ'
from khach_hang




--View lấy lấy danh sách nhà cung cấp nguyên liệu
create view ds_ncc_nl as 
select 
id_ncc_nl as N'Mã nhà cung cấp',
ten_ncc as N'Nhà cung cấp', 
dia_chi as N'Ðịa chỉ',
so_dien_thoai as N'Số điện thoại'
from ncc_nguyen_lieu

select * from ds_ncc_nl


--View lấy lấy danh sách hoá đơn nhập
create view ds_hoa_don_nhap as 
select 
hoa_don_nhap.id_cyber_cafe as N'Mã chi nhánh',
hoa_don_nhap.id_hoa_don_nhap as N'Mã hoá đơn',
ncc_nguyen_lieu.ten_ncc as N'Tên nhà cung cấp',
ncc_nguyen_lieu.dia_chi as N'Địa chỉ nhà cung cấp',
hoa_don_nhap.ngay_nhap as N'Ngày xuất hoá đơn',
format(hoa_don_nhap.tong_tien, 'C0', 'vn-VN') as N'Tổng tiền'
from hoa_don_nhap
join ncc_nguyen_lieu on ncc_nguyen_lieu.id_ncc_nl = hoa_don_nhap.id_ncc


select * from ds_hoa_don_nhap







--View lấy lấy danh sách nhà cung cấp thiết bị
create view ds_ncc_tb as 
select 
id_ncc_tb as N'Mã nhà cung cấp',
ten_ncc as N'Nhà cung cấp', 
dia_chi as N'Ðịa chỉ',
so_dien_thoai as N'Số điện thoại'
from nha_cc_tb

select * from ds_ncc_tb



--View lấy lấy danh sách các thiết bị cung cấp internet và nguồn cung cấp
create view ds_tb_internet as 
select 
thiet_bi_cc_internet.id_thiet_bi as N'Mã thiết bị',
thiet_bi_cc_internet.id_ncc_tb as N'Mã nhà cung cấp', 
nha_cc_tb.ten_ncc as N'Nhà cung cấp',
format(thiet_bi_cc_internet.gia, 'C0', 'vn-VN') as N'Giá'
from thiet_bi_cc_internet
join nha_cc_tb on thiet_bi_cc_internet.id_ncc_tb = nha_cc_tb.id_ncc_tb

select * from ds_tb_internet





--View lấy ra danh sách các bàn
create view ds_ban
as
select 
id_ban as N'Mã bàn',
so_cho as N'Số chỗ',
gia as N'Giá'
from ban



--==============TRUY VẤN==============--


--Thêm nhân viên
--Khi thêm nhân viên có chức vụ nào thì sẽ chỉ hiển thị các nhân viên có cùng chức vụ trong bảng
create procedure them_nhan_vien
@id varchar(10), 
@ten nvarchar(30),
@ngay_sinh char(10),
@so_dt char(10),
@dia_chi nvarchar(50),
@chuc_vu nvarchar(20),
@luong_co_dinh int = 5000000
as 
begin

	insert into nhan_vien
	values(@id, @ten, @ngay_sinh, @so_dt, @dia_chi, @chuc_vu, @luong_co_dinh)

	update nhan_vien
	set 
	ngay_sinh = convert(varchar(10), convert(date, ngay_sinh, 105), 23) 
	where @id = id_nhan_vien

	if @chuc_vu = N'Lễ Tân'
	select * from ds_nv_pv
	
	if @chuc_vu = N'Kế toán' 
	select * from ds_nv_kt

	if @chuc_vu = N'Quản lí'
	select * from ds_nv_ql

end


them_nhan_vien 'CB07', N'Nguyễn Văn Hải','07/11/1996','0178922893',N'Thanh Xuân', N'Quản lí'

-- Xoá nhân viên
create procedure xoa_nhan_vien
@id varchar(10),
@chuc_vu nvarchar(20) = N'Lễ Tân'
as
begin
    
	set @chuc_vu = (
		select chuc_vu from nhan_vien
		where @id = id_nhan_vien
	)

	delete from nhan_vien
	where id_nhan_vien = @id

	if @chuc_vu = N'Lễ Tân'
	select * from ds_nv_pv
	
	if @chuc_vu = N'Kế toán' 
	select * from ds_nv_kt

	if @chuc_vu = N'Quản lí'
	select * from ds_nv_ql
end


--Vd: Xoá nhân viên có id = CB07
xoa_nhan_vien @id='CB07'



--Sửa nhân viên (VD: sửa chức vụ)
create procedure sua_chuc_vu
@id varchar(10),
@chuc_vu_moi nvarchar(20)
as
begin
	update nhan_vien
	set chuc_vu = @chuc_vu_moi
	where id_nhan_vien = @id
	set @chuc_vu_moi = (select chuc_vu from nhan_vien where id_nhan_vien = @id)
	if @chuc_vu_moi = N'Lễ Tân'
	select * from ds_nv_pv
	
	if @chuc_vu_moi = N'Kế toán' 
	select * from ds_nv_kt

	if @chuc_vu_moi = N'Quản lí'
	select * from ds_nv_ql
end
--Vd: Sửa chức vụ của nhân viên có id = CB00
sua_chuc_vu @id='CB00', @chuc_vu_moi=N'Lễ Tân'



--Thêm vào data Luong
create procedure them_data_luong
@id_nhan_vien varchar(10), 
@so_buoi_lam int
as 
begin
	insert into luong
	values(@id_nhan_vien, @so_buoi_lam)
end



-- Thêm khách hàng
create procedure them_khach_hang
@id varchar(10), 
@ten nvarchar(30),
@so_dt char(10),
@dia_chi nvarchar(50) = N'Hà Nội'
as 
begin
	insert into khach_hang
	values(@id, @ten, @so_dt, @dia_chi)
	select * from ds_khach_hang
end

them_khach_hang 'KH089', N'Nguyễn Hữu Thắng', '0187378892', N'Cầu Giấy'



--Thêm nhà cung cấp nguyên liệu
create procedure them_ncc_nguyen_lieu
@id_ncc varchar(10), 
@ten_ncc nvarchar(30), 
@dia_chi nvarchar(50),
@so_dt char(10)
as 
begin
	insert into ncc_nguyen_lieu
	values(@id_ncc, @ten_ncc, @dia_chi, @so_dt)
end



--Thêm nhà cung cấp thiết bị
create procedure them_ncc_thiet_bi
@id_ncc varchar(10), 
@ten_ncc nvarchar(30), 
@dia_chi nvarchar(50),
@so_dt char(10)
as 
begin
	insert into nha_cc_tb
	values(@id_ncc, @ten_ncc, @dia_chi, @so_dt)
end



--Thêm thiết bị cung cấp internet
create procedure them_thiet_bi_cc_internet
@id_thiet_bi varchar(10), 
@id_ncc_tb varchar(10), 
@gia int
as 
begin
	insert into thiet_bi_cc_internet
	values(@id_thiet_bi, @id_ncc_tb, @gia)
end



--Thêm món vào menu
create procedure them_mon
@id_mon varchar(10), 
@ten_mon nvarchar(20), 
@gia int,
@loai_mon nvarchar(20)
as 
begin
	insert into menu
	values(@id_mon, @ten_mon, @gia, @loai_mon)

	select 
	id_mon as N'Mã',
	ten_mon as N'Tên món',
	loai_mon as N'Loại món',
	gia as N'Giá'
	from menu
	order by loai_mon, id_mon asc
end

them_mon @id_mon='DA09', @ten_mon=N'Lẩu tự sôi', @gia=100000, @loai_mon=N'Đồ ăn'



--Sửa giá trong menu
create procedure sua_gia_menu
@id_mon varchar(10),
@gia int
as 
begin
	select 
	id_mon as N'Mã món',
	gia as N'Giá'
	from menu
	where id_mon = @id_mon

	update menu
	set gia = @gia
	where id_mon = @id_mon

	select 
	id_mon as N'Mã món',
	gia as N'Giá mới'
	from menu
	where id_mon = @id_mon
end

--Ví dụ sửa giá của món có id = DA01 thành 20000
sua_gia_menu @id_mon='DA01', @gia=20000



--Xoá món trong menu
create procedure xoa_mon
@id_mon varchar(10)
as 
begin
	delete from menu 
	where id_mon = @id_mon

	select 
	id_mon as N'Mã',
	ten_mon as N'Tên món',
	loai_mon as N'Loại món',
	gia as N'Giá'
	from menu
	order by loai_mon, id_mon asc
end

--Ví dụ xoá món có id = DA09
xoa_mon @id_mon = 'DA09'



--Thêm bàn
create procedure them_ban
@id_ban varchar(5), 
@so_cho int,
@gia int
as 
begin
	insert into ban
	values(@id_ban, @so_cho, @gia)
	select * from ds_ban
end

them_ban @id_ban='A18', @so_cho=4, @gia=5000

-- Thêm hoá đơn nhập
create procedure them_hoa_don_nhap
@id_hoa_don_nhap varchar(10), 
@id_ncc varchar(10), 
@id_cyber varchar(10) = 'C1',
@ngay_nhap char(10),
@tong_tien int
as 
begin
	insert into  hoa_don_nhap
	values(@id_hoa_don_nhap, @id_ncc, @id_cyber, @ngay_nhap, @tong_tien)
end



--Thêm phiếu phục vụ
create procedure them_phieu_phuc_vu
@id_khach_hang varchar(10), 
@id_nhan_vien varchar(10),
@id_thiet_bi varchar(10),
@id_mon varchar(4),
@id_ban varchar(5),
@id_hoa_don_ban_hang varchar(10)  
as 
begin
	insert into phuc_vu
	values(@id_khach_hang, @id_nhan_vien, @id_thiet_bi, @id_mon, @id_ban, @id_hoa_don_ban_hang)
end



--Thêm hoá đơn bán hàng
create procedure them_hoa_don_ban_hang
@id_hoa_don varchar(10), 
@id_khach varchar(10), 
@ngay_ban char(10),
@tong_tien int,
@thoi_gian int,
@id_cyber varchar(10) = 'C1'
as 
begin
	insert into hoa_don_ban_hang
	values(@id_hoa_don, @id_khach, @ngay_ban, @tong_tien, @thoi_gian, @id_cyber)
end



--Lấy danh sách hoá đơn bán hàng

select 
hoa_don_ban_hang.id_cyber_cafe as N'Mã chi nhánh',
phuc_vu.id_hoa_don_ban_hang as N'Mã hoá đơn',
khach_hang.ten_khach_hang as N'Tên khách hàng',
hoa_don_ban_hang.thoi_gian as N'Tgian sử dụng',
hoa_don_ban_hang.ngay_ban as N'Ngày xuất hoá đơn',
format(hoa_don_ban_hang.tong_tien, 'C0', 'vn-VN') as N'Tổng tiền'
from hoa_don_ban_hang
join phuc_vu on phuc_vu.id_hoa_don_ban_hang = hoa_don_ban_hang.id_hoa_don_ban_hang
join khach_hang on khach_hang.id_khach_hang = phuc_vu.id_khach_hang
order by phuc_vu.id_hoa_don_ban_hang asc



--Lấy ra danh sách các món trong menu

select 
id_mon as N'Mã',
ten_mon as N'Tên món',
loai_mon as N'Loại món',
gia as N'Giá'
from menu
order by loai_mon, id_mon asc

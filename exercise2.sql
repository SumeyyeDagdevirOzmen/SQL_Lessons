create table sehirler1(
alan_kodu char(5) primary key,
isim varchar(15),
nufus varchar(15)	
);

create table sehirler2(
alan_kodu char(5),
isim varchar(15),
nufus varchar(15),	
constraint  alankodu_pk primary key(alan_kodu)
);
select * from sehirler2;
 drop table if exists tedarikciler3;
create table tedarikciler3(
tedarikci_id char(10) primary key,
tedarikci_ismi varchar(20),
iletisim_isim varchar(20)	

);
drop table if exists urunler;
create table urunler(
tedarikci_id char(7),
urun_id char(7),
	
	constraint urun_fk foreign key(tedarikci_id) references tedarikciler3(tedarikci_id)	
);
select * from tedarikciler3;
select * from urunler;

drop table if exists calisanlar;
create table calisanlar(
id char(10) primary key,
isim varchar(20) unique,
maas real not null,
ise_baslama date	

);
drop table if exists adresler;
create table adresler(
adres_id char(10),
sokak varchar(20),
cadde varchar(20),
sehir varchar(15),
constraint adres_fk foreign key (adres_id) references calisanlar(id)
	on delete cascade
);

INSERT INTO calisanlar VALUES('10002', 'Mehmet Yılmaz' ,12000, '2018-04-14'); 
INSERT INTO calisanlar VALUES('10008', null, 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('10010', 'Mehmet Yılmaz', 5000, '2018-04-14'); --isim unique olmali
INSERT INTO calisanlar VALUES('10004', 'Veli Han', 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('10005', 'Mustafa Ali', 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('10006', 'Canan Yaş', NULL, '2019-04-12'); --maas not null constraint
INSERT INTO calisanlar VALUES('10003', 'CAN', 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('10007', 'CAN', 5000, '2018-04-14'); --isim unique olmali
INSERT INTO calisanlar VALUES('10009', 'cem', '', '2018-04-14'); 
INSERT INTO calisanlar VALUES('', 'osman', 2000, '2018-04-14');
INSERT INTO calisanlar VALUES('', 'osman can', 2000, '2018-04-14');--primary key constraint
INSERT INTO calisanlar VALUES( '10002', 'ayse Yılmaz' ,12000, '2018-04-14');--primary key constraint
INSERT INTO calisanlar VALUES( null, 'filiz ' ,12000, '2018-04-14');--not null constraint

select * from calisanlar;
delete from calisanlar;
select * from adresler;

CREATE TABLE ogrenciler6
(
id int,
isim VARCHAR(50),
veli_isim VARCHAR(50),
yazili_notu int 
);



INSERT INTO ogrenciler6 VALUES(123, 'Ali Can', 'Hasan',75);
INSERT INTO ogrenciler6 VALUES(124, 'Merve Gul', 'Ayse',85);
INSERT INTO ogrenciler6 VALUES(125, 'Kemal Yasa', 'Hasan',85);
INSERT INTO ogrenciler6 VALUES(126, 'Nesibe Yilmaz', 'Ayse',95);
INSERT INTO ogrenciler6 VALUES(127, 'Mustafa Bak', 'Can',99);
INSERT INTO ogrenciler6 VALUES(127, 'Mustafa Bak', 'Ali', 99);

select * from ogrenciler6;
delete from ogrenciler6;
truncate table ogrenciler6;
delete from ogrenciler6 where isim='Merve Gul'
delete from ogrenciler6 where id in(123,125)
delete from ogrenciler6 where yazili_notu between 75 and 95
delete from ogrenciler6 where veli_isim='Can' or veli_isim='Ali'
drop table if exists musteriler;
CREATE TABLE musteriler 
(
urun_id int, 
musteri_isim varchar(50), 
urun_isim varchar(50)
);
INSERT INTO musteriler VALUES (10, 'Mark', 'Orange'); 
INSERT INTO musteriler VALUES (10, 'Mark', 'Orange'); 
INSERT INTO musteriler VALUES (20, 'John', 'Apple'); 
INSERT INTO musteriler VALUES (30, 'Amy', 'Palm'); 
INSERT INTO musteriler VALUES (20, 'Mark', 'Apple'); 
INSERT INTO musteriler VALUES (10, 'Adem', 'Orange'); 
INSERT INTO musteriler VALUES (40, 'John', 'Apricot');
INSERT INTO musteriler VALUES (20, 'Eddie', 'Apple');
select * from musteriler;

select * from musteriler where urun_isim in('Orange','Apple','Palm')
select * from musteriler where urun_id>=20 and urun_id<=40
select * from musteriler where urun_id not between 20 and 40;


CREATE table personel1
(
id char(4),
isim varchar(50),
maas int
)
insert into personel1 values('1001', 'Sena Can', 70000);
insert into personel1 values('1002', 'Veli Mert', 85000);
insert into personel1 values('1003', 'Ayşe Tan', 65000);
insert into personel1 values('1004', 'Derya Soylu', 95000);
insert into personel1 values('1005', 'Yavuz Bal', 80000);
insert into personel1 values('1006', 'Sena Beyaz', 100000);
insert into personel1 values('1006', 'Sena', 70000);


select * from personel1;
delete from personel1;
/*
Practice 6
- id'si 1003 ile 1005 arasında olan personel bilgilerini listeleyiniz

- D ile Y arasında olmayan personel bilgilerini listeleyiniz

*/
select * from personel1 where id not between '1003' and '1005'--sor
-- D ile Y arasındaki personel bilgilerini listeleyiniz
select * from personel1 where isim not between 'D' and 'Y'--sor
--Maaşı 70000 ve ismi Sena olan personeli listeleyiniz
select * from personel1 where isim='Sena' or maas=95000;




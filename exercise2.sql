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
insert into personel1 values('1006', 'Zehra', 70000);

select * from personel1;
delete from personel1;
/*
Practice 6
- id'si 1003 ile 1005 arasında olan personel bilgilerini listeleyiniz

- D ile Y arasında olmayan personel bilgilerini listeleyiniz

*/
select * from personel1 where id not between '1003' and '1005'
-- D ile Y arasındaki personel bilgilerini listeleyiniz
select * from personel1 where isim between 'D' and 'Y';--sor
--Maaşı 70000 ve ismi Sena olan personeli listeleyiniz
select * from personel1 where isim='Sena' or maas=95000;
select * from personel1 where isim ~* '^[^D-Y]'
select * from personel1 where isim !~* '^[D-Y]'
--DELETE -DML
drop table ogrenciler;
CREATE TABLE ogrenciler
(
id int,
isim VARCHAR(50),
veli_isim VARCHAR(50),
yazili_notu int 
);
INSERT INTO ogrenciler VALUES(123, 'Ali Can', 'Hasan',75);
INSERT INTO ogrenciler VALUES(124, 'Merve Gul', 'Ayse',85);
INSERT INTO ogrenciler VALUES(125, 'Kemal Yasa', 'Hasan',85);
INSERT INTO ogrenciler VALUES(126, 'Nesibe Yilmaz', 'Ayse',95);
INSERT INTO ogrenciler VALUES(127, 'Mustafa Bak', 'Can',99);
INSERT INTO ogrenciler VALUES(127, 'Mustafa Bak', 'Ali', 99);

select * from ogrenciler

delete from ogrenciler;
delete from ogrenciler where isim='Nesibe Yilmaz';
select * from ogrenciler order  by id;

-- id'si 124 olan ogrenciyi siliniz.
delete from ogrenciler where id=124;
-- ismi Kemal Yasa olan satırını siliniz.
delete from ogrenciler where isim='Kemal Yasa'

-- ismi Nesibe Yilmaz veya Mustafa Bak olan kayıtları silelim.
delete from ogrenciler where isim='Nesibe Yilmaz' or isim='Mustafa Bak';

Practice 7:
-- İsmi Ali Can ve id'si 123 olan kaydı siliniz.
delete from ogrenciler where isim='Ali Can' or id=123
-- id 'si 126'dan büyük olan kayıtları silelim.
delete from ogrenciler where id>126;
-- id'si 123, 125 veya 126 olanları silelim.
delete from ogrenciler where id in(123,125,126);
delete from ogrenciler where id=123 or id =125 or id= 126

/*
TRUNCATE komutu DELETE komutu gibi bir tablodaki verilerin 
tamamını siler.
Ancak, seçmeli silme yapamaz.
TRUNCATE TABLE where ...... OLMAZ
TRUNCATE TABLE ogrenciler;
-- tablodaki verileri siler
*/

/*
ON DELETE CASCADE
- Her defasında önce child tablodaki verileri silmek yerine ON DELETE CASCADE
silme özelliğini aktif hale getirebiliriz.
Bunun için FK olan satırın en sonuna ON DELETE CASCADE komutunu yazmak yeterli

-- on delete cascade sayesinde parent taki silinen bir kayıt ile ilişkili olan tüm 
child kayıtlarını silebiliriz
-- cascade yoksa önce child temizlenir sonra parent

DROP TABLE talebeler CASCADE; -- İlişkili tablolardan parent 
olan talebeler tablosunu siler

*/

--     SUBQUERIES
--SUBQUERY baska bir SORGU(query)’nun icinde calisan SORGU’dur.
--1) WHERE’ den sonra kullanilabilir
CREATE TABLE calisanlar7 
(
id int, 
isim VARCHAR(50), 
sehir VARCHAR(50), 
maas int, 
isyeri VARCHAR(20)
);

INSERT INTO calisanlar7 VALUES(123456789, 'Ali Seker', 'Istanbul', 2500, 'Vakko');
INSERT INTO calisanlar7 VALUES(234567890, 'Ayse Gul', 'Istanbul', 1500, 'LCWaikiki');
INSERT INTO calisanlar7 VALUES(345678901, 'Veli Yilmaz', 'Ankara', 3000, 'Vakko');
INSERT INTO calisanlar7 VALUES(456789012, 'Veli Yilmaz', 'Izmir', 1000, 'Pierre Cardin');
INSERT INTO calisanlar7 VALUES(567890123, 'Veli Yilmaz', 'Ankara', 7000, 'Adidas');
INSERT INTO calisanlar7 VALUES(456789012, 'Ayse Gul', 'Ankara', 1500, 'Pierre Cardin');
INSERT INTO calisanlar7 VALUES(123456710, 'Fatma Yasa', 'Bursa', 2500, 'Vakko');

CREATE TABLE markalar1
(
marka_id int, 
marka_isim VARCHAR(20), 
calisan_sayisi int
);

INSERT INTO markalar1 VALUES(100, 'Vakko', 12000);
INSERT INTO markalar1 VALUES(101, 'Pierre Cardin', 18000);
INSERT INTO markalar1 VALUES(102, 'Adidas', 10000);
INSERT INTO markalar1 VALUES(103, 'LCWaikiki', 21000);
select * from markalar1;
select * from calisanlar7;

-- Çalisan sayisi 15.000’den cok olan markalarin isimlerini ve 
--bu markada calisanlarin isimlerini ve maaşlarini listeleyin
select isim,maas,isyeri from calisanlar7 where isyeri in 
(select marka_isim from markalar1 where calisan_sayisi>15.000); --sor
-- marka_id’si 101’den büyük olan marka çalişanlarinin isim, maaş ve şehirlerini listeleyiniz.
select isim,maas,sehir from calisanlar7 where isyeri in
(select marka_isim from markalar1 where marka_id>101)

-- Ankara’da calisani olan markalarin marka id'lerini ve calisan sayilarini listeleyiniz.

select marka_id,calisan_sayisi from markalar1 where marka_isim in(select isyeri from calisanlar7 where sehir='Ankara')



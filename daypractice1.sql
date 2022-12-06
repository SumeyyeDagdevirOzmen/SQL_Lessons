create table ogrenciler
(
id int,
isim varchar(40),
adres varchar(100),
sinav_notu int
);
--- INSERT:Veritabanına yeni veri ekler.
insert into ogrenciler values(120, 'Ali Can', 'Ankara', 75);
insert into ogrenciler values(121, 'Veli Mert', 'Trabzon', 85);
insert into ogrenciler values(122, 'Ayşe Tan', 'Bursa', 65);
insert into ogrenciler values(123, 'Derya Soylu', 'Istanbul', 95);
insert into ogrenciler values(124, 'Yavuz Bal', 'Ankara', 85);
insert into ogrenciler values(125, 'Emre Gül', 'Hatay', 90);
insert into ogrenciler values(126, 'Harun Reşit', 'Isparta', 100);
select * from ogrenciler;

--Soru:ogrenciler tablosundaki id ve isim sutununu getiriniz.
select id,isim from ogrenciler;

--SORU: Sınav notu 80'den büyük olan öğrencilerin tüm bilgilerini listele
select * from ogrenciler where sinav_notu>80;

--SORU: Adresi Ankara olan ögrencilerin tüm bilgilerini listele
select * from ogrenciler where adres='Ankara';

--SORU: Sınav notu 85 ve adresi Ankara olan öğrenci ismini listele
select isim from ogrenciler where adres='Ankara' and sinav_notu=85;

--SORU: .Sınav notu 65 veya 85 olan ogrencilerin tüm bilgilerini listele
select * from ogrenciler where sinav_notu=85 or sinav_notu=65;
SELECT *
FROM ogrenciler
WHERE sinav_notu  IN (65,85);

--SORU: Sınav notu 65 ve 85 arasında olan ogrencilerin tüm bilgilerini listele
select * from ogrenciler where sinav_notu between 65 and 85;

--SORU: id'si 122 ve 125 arasında olmayan ögrencilerin isim ve sınav notu listele
select isim,sinav_notu from ogrenciler where id not between 122 and 125;--122 ve 125 dahil

--SORU: sinav_notu 75 olan satırı siliniz
delete from ogrenciler where sinav_notu=75;

--SORU: adres'i Trabzon olan satırı siliniz
delete from ogrenciler where adres='Trabzon';

--SORU: ismi Derya Soylu veya Yavuz Bal olan satırları siliniz
delete from ogrenciler where isim='Derya Soylu' or isim='Yavuz Bal';
--delete from ogrenciler where isim in('Derya Soylu','Yavuz Bal');Boyle de yazilir.

--SORU: sınav notu 100 den küçük olan satırları siliniz

delete from ogrenciler where sinav_notu<100;

--SORU: Tablodaki tüm satırları siliniz
delete from ogrenciler;

/*
CONSTRAINT
UNIQUE-Bir sütundaki tüm değerlerin BENZERSİZ/TEKRARSIZ yani tek olmasını sağlar.
NOT NULL-Bir Sütunun NULL içermemesini yani boş olmamasını sağlar.
NOT NULL kısıtlaması için constraint ismi tanımlanmaz. Bu kısıtlama veri türünden hemen sonra yerleştirilir
PRIMARY KEY-Bir sütünün NULL içermemesini ve sütundaki verilerin
BENZERSİZ olmasını sağlar. (NOT NULL ve UNIQUE)
FOREIGN KEY-Başka bir tablodaki Primary Key’i referans göstermek için kullanılır. Böylelikle, tablolar arasında ilişki kurulmuş olur.
*/
/*
SORU: memurlar isminde bir tablo oluşturunuz. id, isim, maas sutunları olsun.
id sutununun data tipi int olsun. PRİMARY KRY kısıtlaması olsun.
isim sutununun data tipi varchar(30) olsun. UNIQUE kısıtlaması olsun.
maas sutununun data tipi int olsun. maas 5000 buyuk olsun. NOT NULL kısıtlaması olsun.
*/


CREATE TABLE memurlar
(
id int PRIMARY KEY,
isim varchar(30) UNIQUE,
maas int check (maas>500) NOT NULL	
) ;

/*
SORU: insanlar isminde bir tablo oluşturunuz. isim, soyisim sutunları olsun.
isim sutununun data tipi int olsun. PRİMARY KEY kısıtlaması olsun. Kısıtlamanın ismi pr_ks olsun
soyisim sutununun data tipi varchar(30) olsun. UNIQUE kısıtlaması olsun. Kısıtlamanın ismi uni_ks olsun
*/
 create table insanlar(
isim int,
soyisim varchar(30) unique,
	 
constraint pr_ks primary key(isim),
constraint uni_ks unique(soyisim)	 
	 
 
 )
 select * from insanlar;
 
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
INSERT INTO ogrenciler6 VALUES(127, 'Merve Gul', null, 99);
INSERT INTO ogrenciler6 VALUES(127, 'Mustafa Bak', 'Ali', null);

--id'si 124 olan ogrenciyi siliniz
delete from ogrenciler6 where id=124; 
 select * from ogrenciler6;
 
 -- ismi Kemal Yasa olan satırını siliniz
 delete from ogrenciler6 where isim='Kemal Yasa'; 
 
 -- ismi Nesibe Yilmaz veya Mustafa Bak olan kayıtları silelim
 DELETE FROM ogrenciler6
WHERE isim = 'Nesibe Yilmaz' or isim='Mustafa Bak';

 DELETE FROM ogrenciler6
WHERE isim = 'Ali Can' or id=127;

DELETE FROM ogrenciler6
WHERE id between 123 and 127;

delete from ogrenciler6
where veli_isim is null or yazili_notu is null;

delete from ogrenciler6;--tablonun icindeki herseyi sildi

delete from ogrenciler6 where exists(select yazili_notu from ogrenciler6);--tablonun icindeki herseyi sildi

TRUNCATE TABLE ogrenciler6;
-- tablodaki verileri siler

--ON DELETE CASCADE

CREATE TABLE talebeler
(
id CHAR(3) primary key, 
isim VARCHAR(50),
veli_isim VARCHAR(50),
yazili_notu int
);

CREATE TABLE notlar( 
talebe_id char(3),
ders_adi varchar(30),
yazili_notu int,
CONSTRAINT notlar_fk FOREIGN KEY (talebe_id) 
REFERENCES talebeler(id)
on delete cascade
);

INSERT INTO talebeler VALUES(123, 'Ali Can', 'Hasan',75);
INSERT INTO talebeler VALUES(124, 'Merve Gul', 'Ayse',85);
INSERT INTO talebeler VALUES(125, 'Kemal Yasa', 'Hasan',85);
INSERT INTO talebeler VALUES(126, 'Nesibe Yılmaz', 'Ayse',95);
INSERT INTO talebeler VALUES(127, 'Mustafa Bak', 'Can',99);
INSERT INTO notlar VALUES ('123','kimya',75);
INSERT INTO notlar VALUES ('124', 'fizik',65);
INSERT INTO notlar VALUES ('125', 'tarih',90);
INSERT INTO notlar VALUES ('126', 'Matematik',90);

select * from talebeler;


delete from notlar where talebe_id='123';
delete from talebeler where id='126'

CREATE TABLE calisanlar6 
(
id int, 
isim VARCHAR(50), 
sehir VARCHAR(50), 
maas int, 
isyeri VARCHAR(20),
	constraint calisanlar6_pk primary key(isim,sehir),
	constraint calisan6 unique(maas,isyeri)
);
select * from calisanlar6

--****************************************
CREATE TABLE calisanlar2 
(
id int, 
isim VARCHAR(50), 
sehir VARCHAR(50), 
maas int, 
isyeri VARCHAR(20),
	
);


CREATE TABLE markalar
(
marka_id int, 
marka_isim VARCHAR(20), 
calisan_sayisi int
);

INSERT INTO calisanlar2 VALUES(123456789, 'Ali Seker', 'Istanbul', 2500, 'Vakko');
INSERT INTO calisanlar2 VALUES(234567890, 'Ayse Gul', 'Istanbul', 1500, 'LCWaikiki');
INSERT INTO calisanlar2 VALUES(345678901, 'Veli Yilmaz', 'Ankara', 3000, 'Vakko');
INSERT INTO calisanlar2 VALUES(456789012, 'Veli Yilmaz', 'Izmir', 1000, 'Pierre Cardin');
INSERT INTO calisanlar2 VALUES(567890123, 'Veli Yilmaz', 'Ankara', 7000, 'Adidas');
INSERT INTO calisanlar2 VALUES(456789012, 'Ayse Gul', 'Ankara', 1500, 'Pierre Cardin');
INSERT INTO calisanlar2 VALUES(123456710, 'Fatma Yasa', 'Bursa', 2500, 'Vakko');
INSERT INTO markalar VALUES(100, 'Vakko', 12000);
INSERT INTO markalar VALUES(101, 'Pierre Cardin', 18000);
INSERT INTO markalar VALUES(102, 'Adidas', 10000);
INSERT INTO markalar VALUES(103, 'LCWaikiki', 21000);

 select * from calisanlar2;
 
 -- Çalisan sayisi 15.000’den cok olan markalarin isimlerini 
 --ve bu markada calisanlarin isimlerini ve maaşlarini listeleyin.
 
SELECT isim, maas,isyeri from calisanlar2
where isyeri in (select marka_isim from markalar where calisan_sayisi>15000);

-- marka_id’si 101’den büyük olan marka çalişanlarinin isim, maaş ve şehirlerini listeleyiniz.
SELECT isim, maas, sehir from calisanlar2
where isyeri in (select marka_isim from markalar where marka_id > 101 );

-- Ankara’da calisani olan markalarin 
--marka id'lerini ve calisan sayilarini listeleyiniz

--Her markanin id’sini, ismini ve toplam kaç şehirde
--bulunduğunu listeleyen bir SORGU yaziniz.
select marka_id,marka_isim,
(select count(sehir) as toplam_sehir_sayisi from calisanlar2 where marka_isim=isyeri)
from markalar;

-- Her markanin ismini, calisan sayisini ve o markaya ait calisanlarin toplam maaşini listeleyiniz
SELECT marka_isim, calisan_sayisi, 
(SELECT sum(maas) FROM calisanlar2 WHERE marka_isim = isyeri) 
as toplam_maas FROM markalar;

-- Her markanin ismini, calisan sayisini ve 
--o markaya ait calisanlarin maksimum ve minumum maaşini listeleyen bir Sorgu yaziniz.

create view max_min_maas as
SELECT marka_isim, calisan_sayisi, 
(SELECT max(maas) FROM calisanlar2 WHERE marka_isim = isyeri) as max_maas,
(SELECT min(maas) FROM calisanlar2 WHERE marka_isim = isyeri) as min_maas
FROM markalar;


--EXISTS Condition subquery’ler ile kullanilir. 
--IN ifadesinin kullanımına benzer
--olarak, EXISTS ve NOT EXISTS ifadeleri de alt sorgudan getirilen değerlerin içerisinde
--bir değerin olması veya olmaması durumunda işlem yapılmasını sağlar.

CREATE TABLE mart
(
urun_id int,
musteri_isim varchar(50), 
urun_isim varchar(50)
);
INSERT INTO mart VALUES (10, 'Mark', 'Honda');
INSERT INTO mart VALUES (20, 'John', 'Toyota');
INSERT INTO mart VALUES (30, 'Amy', 'Ford');
INSERT INTO mart VALUES (20, 'Mark', 'Toyota');
INSERT INTO mart VALUES (10, 'Adam', 'Honda');
INSERT INTO mart VALUES (40, 'John', 'Hyundai');
INSERT INTO mart VALUES (20, 'Eddie', 'Toyota');

CREATE TABLE nisan 
(
urun_id int ,
musteri_isim varchar(50), 
urun_isim varchar(50)
);
INSERT INTO nisan VALUES (10, 'Hasan', 'Honda');
INSERT INTO nisan VALUES (10, 'Kemal', 'Honda');
INSERT INTO nisan VALUES (20, 'Ayse', 'Toyota');
INSERT INTO nisan VALUES (50, 'Yasar', 'Volvo');
INSERT INTO nisan VALUES (20, 'Mine', 'Toyota');

select * from mart;


--MART VE NİSAN aylarında aynı URUN_ID ile satılan ürünlerin
--URUN_ID’lerini listeleyen ve aynı zamanda bu ürünleri MART ayında alan
--MUSTERI_ISIM 'lerini listeleyen bir sorgu yazınız. 

select musteri_isim,urun_id from mart 
WHERE exists (select urun_id FROM nisan WHERE mart.urun_id=nisan.urun_id);

--Her iki ayda birden satılan ürünlerin URUN_ISIM'lerini ve bu ürünleri
--NİSAN ayında satın alan MUSTERI_ISIM'lerini listeleyen bir sorgu yazınız.

SELECT urun_isim,musteri_isim FROM nisan
WHERE exists (SELECT urun_isim FROM mart where mart.urun_isim=nisan.urun_isim);

--Her iki ayda birden satilmayan ürünlerin URUN_ISIM'lerini ve bu ürünleri
--NİSAN ayında satın alan MUSTERI_ISIM'lerini listeleyen bir sorgu yazınız.

select urun_isim,musteri_isim from nisan
WHERE not exists (SELECT urun_isim FROM mart where mart.urun_isim=nisan.urun_isim);

--Her iki ayda birden satilmayan ürünlerin URUN_ISIM'lerini ve bu ürünleri
--MART ayında satın alan MUSTERI_ISIM'lerini listeleyen bir sorgu yazınız.

select urun_isim,musteri_isim from mart
WHERE not exists (SELECT urun_isim FROM nisan where mart.urun_isim=nisan.urun_isim);

select * from mart;




 
 





--ismi Ali Can ve id si 123 olan kaydi siliniz
--id si 126 dan buyuk olan kayitlari silelim
--id si 123,125 veya 126 olanlari silelim
CREATE TABLE ogrenciler3
(
id int,
isim VARCHAR(50),
veli_isim VARCHAR(50),
yazili_notu int
);
INSERT INTO ogrenciler3 VALUES(123, 'Ali Can', 'Hasan',75);
INSERT INTO ogrenciler3 VALUES(124, 'Merve Gul', 'Ayse',85);
INSERT INTO ogrenciler3 VALUES(125, 'Kemal Yasa', 'Hasan',85);
INSERT INTO ogrenciler3 VALUES(126, 'Nesibe Yilmaz', 'Ayse',95);
INSERT INTO ogrenciler3 VALUES(127, 'Mustafa Bak', 'Can',99);
INSERT INTO ogrenciler3 VALUES(127, 'Mustafa Bak', 'Ali', 99);
select *from ogrenciler3;
--ismi Nesibe Yilmaz veya Mustafa Bak olan kayitlari silelim
DELETE FROM ogrenciler3 WHERE isim='Mustafa Bak' or isim='Nesibe Yilmaz';
--Veli ismi Hasan olan datayi silelim
DELETE FROM ogrenciler3 WHERE veli_isim='Hasan';
--TRUNCATE--
--BiR TABLODAKİ TUM VERİLERİ GERİ ALAMAYACAGIMIZ SEKİLDE SİLER. Sartli silme yapmaz
TRUNCATE TABLE ogrenciler3;
---ON DELETE CASCADE
DROP TABLE if exists adresler;--eger tablo varsa tabloyu siler
DROP TABLE if exists notlar;
CREATE TABLE talebe
(
id CHAR(3) primary key,
isim VARCHAR(50),
veli_isim VARCHAR(50),
yazili_notu int
);
CREATE TABLE not1(
talebe_id char(3),
ders_adi varchar(30),
yazili_notu int,
CONSTRAINT notlar_fk FOREIGN KEY (talebe_id) REFERENCES talebe(id)
on delete cascade--bunu yazmazsak asagıda parent dan verileri silemem
);
INSERT INTO talebe VALUES(123, 'Ali Can', 'Hasan',75);
INSERT INTO talebe VALUES(124, 'Merve Gul', 'Ayse',85);
INSERT INTO talebe VALUES(125, 'Kemal Yasa', 'Hasan',85);
INSERT INTO talebe VALUES(126, 'Nesibe Yılmaz', 'Ayse',95);
INSERT INTO talebe VALUES(127, 'Mustafa Bak', 'Can',99);
INSERT INTO not1 VALUES ('123','kimya',75);
INSERT INTO not1 VALUES ('124', 'fizik',65);
INSERT INTO not1 VALUES ('125', 'tarih',90);
INSERT INTO not1 VALUES ('126', 'Matematik',90);
--notlar tablosundan talebe_id'si 123 olan datayi silin
DELETE FROM notlar WHERE talebe_id='123';
/*
1. tablolardan veri silmek icin.. normalde oncelikle  childdaki datayi silmemiz gerekir.
2. child da on delete cascade kullanirsak... parent'dan datayi silebiliriz.
3. bu durumda data hem parenttan hemde childdan silinir.
*/
CREATE TABLE talebe
(
id CHAR(3) primary key,
isim VARCHAR(50),
veli_isim VARCHAR(50),
yazili_notu int
);
CREATE TABLE not1(
talebe_id char(3),
ders_adi varchar(30),
yazili_notu int,
CONSTRAINT notlar_fk FOREIGN KEY (talebe_id) REFERENCES talebe(id)
on delete cascade--bunu yazmazsak asagıda parent dan verileri silemem. bunu yazınca hep parent dan hem child dan siler
);
select * from talebe;
select * from not1;
--talebeler tablosundan id'si 126 olan datayi silin
DELETE FROM talebe WHERE id='126';
--IN CONDITION--
DROP TABLE if exists musteriler;
CREATE TABLE musteriler  (
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
--musteriler tablosundan urun ismi orange, apple veya apricot olan tum verileri listeleyiniz
SELECT * FROM musteriler WHERE urun_isim='Orange' OR urun_isim='Apple' OR urun_isim='Apricot';
SELECT * FROM musteriler WHERE urun_isim IN ('Orange','Apple','Apricot');--IN CONDITION--
--NOT IN -->Yazdigimiz verilerin disindakileri getirir
SELECT * FROM musteriler WHERE urun_isim NOT IN ('Orange','Apple','Apricot');
--mustriler tablosundan urun_id leri '10' ve urun_ismi 'orange' olanı getir
SELECT * FROM musteriler WHERE urun_isim='Orange' AND urun_id=10;
--BETWEEN CONDITION
/*
BETWEEN Condition iki mantiksal ifade ile tanimlayabilecegimiz durumlari tek komutla
yazabilme imkani verir. Yazdigimiz 2 sinirda araliga dahildir
*/
--musteriler tablosundan urun_id'si 20 ile 40 arasinda olan tum verileri listeleyiniz
SELECT * FROM musteriler WHERE urun_id>=20 AND urun_id<=40;
SELECT * FROM musteriler WHERE urun_id BETWEEN 20 AND 40;--BETWEEN CONDITION
--NOT BETWEEN CONDITION
SELECT * FROM musteriler WHERE urun_id NOT BETWEEN 20 AND 40;--20 VE 40 disindakileri listeler
                       --SUBQUERIES(ALT SORGU)
--Iki tablodan gecici olarak tek bir tabloda sorgulama--> sorgu icinde sorgu
CREATE TABLE calisanlar2
(
id int,
isim VARCHAR(50),
sehir VARCHAR(50),
maas int,
isyeri VARCHAR(20)
);
CREATE TABLE markalar (
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
select * from markalar;
-- Çalisan sayisi 15.000’den cok olan markalarin isimlerini ve
--bu markada calisanlarin isimlerini ve maaşlarini listeleyin.
SELECT isim,maas, isyeri FROM calisanlar2
WHERE isyeri IN (SELECT marka_isim FROM markalar WHERE calisan_sayisi>15000);


-- marka_id’si 101’den büyük olan marka çalişanlarinin 
--isim, maaş ve şehirlerini listeleyiniz
SELECT isim,maas,sehir FROM calisanlar2
WHERE isyeri IN (SELECT marka_isim FROM markalar WHERE marka_id>101);

-- 							AGGREGATE METOT KULLANIMI
/*Aggregate Metotlari (SUM,COUNT, MIN, MAX, AVG) Subquery içinde
kullanilabilir.
Ancak, Sorgu tek bir değer döndürüyor olmalidir.
SYNTAX: sum() şeklinde olmalı sum ile () arasında boşluk olmamalı
*/
--Calisanlar tablosundan maksimum maasi listeleyelim
SELECT max(maas) AS maximum_maas FROM calisanlar2;

/*
    Eğer bir sutuna geçici olarak bir isim vermek istersek AS komutunu yazdıktan sonra
vermek istediğimiz ismi yazarız
*/
--Calisanlar tablosundan maaslarin toplamini listeleyelim
SELECT min(maas) AS min_maas FROM calisanlar2;

SELECT sum(maas)  FROM calisanlar2;
--Calisanlar tablosundan maaslarin ortalamasini listeleyelim
SELECT round(avg(maas))  FROM calisanlar2;--yuvarlamak istersem round'u kullanirim

SELECT round(avg(maas),2)  FROM calisanlar2;--noktadan sonra kac tane virgul istersem ona gore sayi yazilir

--Calisanlar tablosundan maaslarin sayisini listeleyelim
SELECT count(maas) FROM calisanlar2
SELECT * from calisanlar2







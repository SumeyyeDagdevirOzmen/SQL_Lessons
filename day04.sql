--                ODEV *******************
--Her iki ayda ortak satilmayan ürünlerin URUN_ISIM'lerini ve bu ürünleri
 --NİSAN ayında satın alan MUSTERI_ISIM'lerini listeleyen bir sorgu yazınız.
 select urun_isim,musteri_isim from nisan where not exists(select urun_isim from mart where mart.urun_isim=nisan.urun_isim );
 
 --ALIASES
 --Aliases kodu ile tablo yazdirilirken, field isimleri sadece o cikti icin degistirilebilir
 select * from calisanlar
 drop table if exists calisanlar;
 CREATE TABLE calisanlar3(
calisan_id char(9),
calisan_isim varchar(50),
calisan_dogdugu_sehir varchar(50)
);
INSERT INTO calisanlar3 VALUES(123456789, 'Ali Can','Istanbul'); 
INSERT INTO calisanlar3 VALUES(234567890, 'Veli Cem', 'Ankara');
INSERT INTO calisanlar3 VALUES(345678901, 'Mine Bulut', 'Izmir');

select * from calisanlar3;
--select calisan_id as id from calisanlar;

--Eger iki sutunun verilerini birlestirmek istersek concat sembolu  || kullaniriz.

select calisan_id AS id, calisan_isim||' '||calisan_dogdugu_sehir AS calisan_bilgisi FROM calisanlar3;


--2. YOl
SELECT calisan_id AS id, concat (calisan_isim,' ',calisan_dogdugu_sehir) AS calisan_bilgisi FROM calisanlar3;

--IS NULL CONDITION
-- Arama yapilan field’da NULL degeri almis kayitlari getirir
CREATE TABLE insanlar1
(
ssn char(9),
isim varchar(50), 
adres varchar(50)
);

INSERT INTO insanlar1 VALUES(123456789, 'Ali Can' ,'Istanbul'); 
INSERT INTO insanlar1 VALUES(234567890, 'Veli Cem', 'Ankara'); 
INSERT INTO insanlar1 VALUES(345678901, 'Mine Bulut', 'Izmir'); 
INSERT INTO insanlar1 (ssn, adres) VALUES(456789012, 'Bursa'); 
INSERT INTO insanlar1 (ssn, adres) VALUES(567890123, 'Denizli');

select * from insanlar1;

--Name sutununda null olan degerleri listeleyelim.

select isim from insanlar1 WHERE isim is null

--Insanlar tablosunda sadece null olmayan degerleri listeleyiniz.
SELECT isim
FROM insanlar1
WHERE isim IS NOT NULL;

--Insanlar tablosunda null deger almis verileri no name olarak degistiriniz.
UPDATE insanlar1
SET isim = 'Isim Girilmemis' 
WHERE isim IS NULL;

--ORDER BY CLAUSE
/*
Tablolardaki verileri siralamak icin ORDER BY komutu kullaniriz.
Buyukten kucuge ya da kucukten buyuge siralama yapabiliriz.
Default olarak kucukten buyuge siralama yapar. ASCENDING 
Eger buyukten kucuge siralamak istersek ORDER BY komutundan sonra DESC komutunu kullaniriz.
*/
--ASC siralama yapar
--ORDER BY komutu belli bir field’a gore NATURAL ORDER olarak siralama
--yapmak icin kullanilir
--ORDER BY komutu sadece SELECT komutu Ile kullanilir
--ascend(cikmak)-kucukten buyuge siralama X descend(inmek)-buyukten kucuge siralama
drop table if exists insanlar

CREATE TABLE insanlar
(
ssn char(9),
isim varchar(50),
soyisim varchar(50), adres
varchar(50)
)

INSERT INTO insanlar VALUES(123456789, 'Ali','Can', 'Istanbul');
INSERT INTO insanlar VALUES(234567890, 'Veli','Cem', 'Ankara');  
INSERT INTO insanlar VALUES(345678901, 'Mine','Bulut', 'Ankara');  
INSERT INTO insanlar VALUES(256789012, 'Mahmut','Bulut', 'Istanbul'); 
INSERT INTO insanlar VALUES (344678901, 'Mine','Yasa', 'Ankara');  
INSERT INTO insanlar VALUES (345678901, 'Veli','Yilmaz', 'Istanbul');

select * from insanlar;

SELECT *
FROM insanlar
ORDER BY adres;

select * from insanlar order by soyisim;

--Insanlar tablosundaki ismi Mine olanlari SSN sirali olarak listeleyin
select * from insanlar where isim='Mine' order by ssn;

--NOT : Order By komutundan sonra field(Sutun) ismi yerine field numarasi da kullanilabilir
--Insanlar tablosundaki soyismi Bulut olanlari isim sirali olarak listeleyin 

select * from insanlar where soyisim='Bulut' order by 2;

--ORDER BY field_name DESC CLAUSE
--Insanlar tablosundaki tum kayitlari SSN numarasi buyukten kucuge olarak siralayin
SELECT *
FROM insanlar
ORDER BY ssn DESC;

--Insanlar tablosundaki tum kayitlari isimler Natural sirali, Soyisimler ters sirali olarak listeleyin
SELECT *
FROM insanlar
ORDER BY isim ASC, soyisim DESC;

--ORDER BY field_name DESC CLAUSE
--İsim ve soyisim değerlerini soyisim kelime uzunluklarına göre sıralayınız
SELECT isim, soyisim
FROM insanlar
ORDER BY LENGTH (soyisim);
--Eger sutun uzunluguna gore siralamak istersek LENGTH komutu kullaniriz
--Ve yine uzunlugu buyukten kucuge siralamak istersek sonuna DESC komutunu ekleriz.
SELECT isim, soyisim
FROM insanlar
ORDER BY LENGTH (soyisim)DESC;

-- Tüm isim ve soyisim değerlerini aynı sutunda çağırarak her bir sütun değerini uzunluğuna göre sıralayınız.
--1.Yol:
SELECT CONCAT (isim, ‘ ’ , soyisim) AS isim_soyisim
FROM insanlar
ORDER BY LENGTH(isim)+LENGTH(soyisim);
--2.Yol:
select isim||' '||soyisim AS isim_soyisim from insanlar order by length(isim||soyisim)
--3.Yol:
select concat(isim,' ',soyisim) AS isim_soyisim from insanlar order by length(isim||soyisim)
--4.yol:
select isim || ' ' || soyisim as isim_soyisim from insanlar order by length (concat(isim, soyisim));

--GROUP BY CLAUSE KULLANIMI
CREATE TABLE manav
(
isim varchar(50), 
Urun_adi varchar(50), 
Urun_miktar int
);


INSERT INTO manav VALUES( 'Ali', 'Elma', 5);
INSERT INTO manav VALUES( 'Ayse', 'Armut', 3);
INSERT INTO manav VALUES( 'Veli', 'Elma', 2);
INSERT INTO manav VALUES( 'Hasan', 'Uzum', 4);
INSERT INTO manav VALUES( 'Ali', 'Armut', 2);
INSERT INTO manav VALUES( 'Ayse', 'Elma', 3);
INSERT INTO manav VALUES( 'Veli', 'Uzum', 5);
INSERT INTO manav VALUES( 'Ali', 'Armut', 2);
INSERT INTO manav VALUES( 'Veli', 'Elma', 3);
INSERT INTO manav VALUES( 'Ayse', 'Uzum', 2);

select * from manav;

--Isme gore alinan toplam urunleri  listeleyiniz.

SELECT isim, SUM(urun_miktar) AS Alinan_Toplam_Meyve 
FROM manav
GROUP BY isim;


--Isme gore alinan toplam urunleri bulun ve urunleri buyukten kucuge listeleyiniz.
SELECT isim, SUM(urun_miktar) AS Alinan_Toplam_Meyve 
FROM manav
GROUP BY isim
ORDER BY  Alinan_Toplam_Meyve DESC;

-- Urun ismine gore urunu alan toplam kisi sayisi
select urun_adi, count(isim) as urun_alan_kisi_sayisi from manav
group by urun_adi;
-- Urun adina gore urunun kac kez satıldıgını listeleyiniz
select isim,count(urun_adi) as aldigi_urun_cesidi from manav group by isim;














CREATE TABLE ogrenciler1
(
	
ogrenci_no char(7),
isim varchar(20),
soyisim varchar(25),
not_ort real,-- Ondalikli sayilar icin kullanilir(Double gibi)
kayit_tarih date

);

--VAROLAN BIR TABLODAN YENI BIR TABLO OLUSTURMA
CREATE TABLE NOTLAR
AS
SELECT isim,not_ort from ogrenciler1;

select * from notlar;

--INSERT INTO- TABLO ICINE VERI EKLEME

INSERT INTO notlar VALUES ('Fatma',95.5);
INSERT INTO notlar VALUES ('Orhan',75.5);
INSERT INTO notlar VALUES ('Mustafa',65.5);
INSERT INTO notlar VALUES ('Muserref',100);
select * from notlar;

Create table talebeler
(
	isim varchar(10),
	notlar real
);

INSERT INTO talebeler VALUES ('Fatma',95.5);
INSERT INTO talebeler VALUES ('Orhan',75.5);
INSERT INTO talebeler VALUES ('Mustafa',65.5);
INSERT INTO talebeler VALUES ('Muserref',100);
INSERT INTO talebeler VALUES ('Sumeyye',100);

select * from talebeler;
select notlar from talebeler;

--CONSTRAINT --KISITLAMALAR
--UNIQUE
--NOT NULL
--CHECK:Bir sütuna yerleştirilebilecek değer aralığını sınırlamak için kullanılır .


CREATE TABLE ogrenciler2
(
	
ogrenci_no char(7) unique,-- Uzunluğunu bildiğimiz stringler için CHAR kullanılır
isim varchar(20) not null, -- Uzunluğunu bilmediğimiz stringler için VARCHAR kullanırız
soyisim varchar(25),
not_ort real,-- Ondalikli sayilar icin kullanilir(Double gibi)
kayit_tarih date

);
select * from ogrenciler2;

INSERT INTO ogrenciler2 VALUES ('1234567','Sumeyye','Dagdeviren',85.5,now());
INSERT INTO ogrenciler2 VALUES ('1234568','Ali','Veli',85.5,now());
INSERT INTO ogrenciler2 (ogrenci_no,soyisim,not_ort) VALUES ('1234569','Evren',85.5);--NOT NULL kisitlamasi oldugu icin bu veri eklenemez.

--PRIMARY KEY ATAMASI

CREATE TABLE ogrenciler3
(
	
ogrenci_no char(7) PRIMARY KEY,
isim varchar(20),
soyisim varchar(25),
not_ort real,-- Ondalikli sayilar icin kullanilir(Double gibi)
kayit_tarih date

);

--PRIMARY KEY ATAMASI 2.YOL
--Eger Constraint ismini kendimiz vermek istersek bu yolu kullanabiliriz.

CREATE TABLE ogrenciler4
(
	
ogrenci_no char(7),
isim varchar(20),
soyisim varchar(25),
not_ort real,-- Ondalikli sayilar icin kullanilir(Double gibi)
kayit_tarih date,
CONSTRAINT ogr PRIMARY KEY(ogrenci_no)	

);

--3.YOL:

CREATE TABLE ogrenciler5
(
	
ogrenci_no char(7),
isim varchar(20),
soyisim varchar(25),
not_ort real,-- Ondalikli sayilar icin kullanilir(Double gibi)
kayit_tarih date,
PRIMARY KEY(ogrenci_no)	

);

--“tedarikciler3” isimli bir tablo olusturun. Tabloda “tedarikci_id”, “tedarikci_ismi”, “iletisim_isim” field’lari olsun ve “tedarikci_id” yi Primary Key yapin.
--“urunler” isminde baska bir tablo olusturun “tedarikci_id” ve “urun_id” field’lari olsun ve
--“tedarikci_id” yi Foreign Key yapin.

CREATE TABLE tedarikciler3
(
	tedarikci_id char(5),
	tedarikci_ismi varchar(20),
	iletisim_isim varchar(20),
	PRIMARY KEY(tedarikci_id)	
);

CREATE TABLE urunler(
tedarikci_id char(5),
urun_id char(5),
FOREIGN KEY	(tedarikci_id)	REFERENCES tedarikciler3(tedarikci_id)
	
);

--2.YOL:
CREATE TABLE urunler(
tedarikci_id char(5),
urun_id char(5),
CONSTRAINT urun_fk FOREIGN KEY	(tedarikci_id)	REFERENCES tedarikciler3(tedarikci_id)
	
);
select * from tedarikciler3;
select * from urunler;

--“calisanlar” isimli bir Tablo olusturun. Icinde “id”, “isim”, “maas”, “ise_baslama” field’lari olsun. “id” yi Primary Key yapin, “isim” i Unique, “maas” i Not Null yapın.
--“adresler” isminde baska bir tablo olusturun.Icinde “adres_id”, “sokak”, “cadde” ve “sehir” fieldlari olsun. “adres_id” field‘i ile Foreign Key oluşturun.

CREATE TABLE calisanlar
( 
	id char(5) PRIMARY KEY,
	isim varchar(20) UNIQUE,
	maas int NOT NULL,
	ise_baslama date
	
);

CREATE TABLE adresler
(
	adres_id char(5),
	sokak varchar(15) , 
	cadde varchar(15),
	sehir varchar(15),
	FOREIGN KEY (adres_id) 	REFERENCES calisanlar(id)
	
);

--INSERT INTO calisanlar VALUES('10002', 'Mehmet Yılmaz' ,12000, '2018-04-14');
--INSERT INTO calisanlar VALUES('10008', null, 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('10010', 'Mehmet Yılmaz', 5000, '2018-04-14');--UNIQUE CONSTRAINT OLDUGU ICIN KABUL ETMEDI
--INSERT INTO calisanlar VALUES('10004', 'Veli Han', 5000, '2018-04-14');
--INSERT INTO calisanlar VALUES('10005', 'Mustafa Ali', 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('10006', 'Canan Yaş', NULL, '2019-04-12');--NOT NULL CONS. kabul emez
INSERT INTO calisanlar VALUES('10003', 'CAN', 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('10007', 'CAN', 5000, '2018-04-14');--unique constraint kabul etmez
INSERT INTO calisanlar VALUES('10009', 'cem', '', '2018-04-14');--INT/string kabul etmez.
INSERT INTO calisanlar VALUES('', 'osman', 2000, '2018-04-14');--primary key hicligi kabul etti
INSERT INTO calisanlar VALUES('', 'osman can', 2000, '2018-04-14');--PRIMARY KEY ikinci hicligi kabul etmez.
INSERT INTO calisanlar VALUES( '10002', 'ayse Yılmaz' ,12000, '2018-04-14');--PRIMARY KEY
INSERT INTO calisanlar VALUES( null, 'filiz ' ,12000, '2018-04-14');--PRIMARY KEY

INSERT INTO adresler VALUES('10003','Mutlu Sok', '40.Cad.','IST');
INSERT INTO adresler VALUES('10003','Can Sok', '50.Cad.','Ankara');
INSERT INTO adresler VALUES('10002','Ağa Sok', '30.Cad.','Antep');
-- Parent tabloda olmayan id ile child a ekleme yapamayiz
INSERT INTO adresler VALUES('10012','Ağa Sok', '30.Cad.','Antep');--insert or update on table "adresler" violates foreign key constraint Kabul etmez
-- FK'ye null değeri atanabilir.
INSERT INTO adresler VALUES(NULL,'Ağa Sok', '30.Cad.','Antep');
INSERT INTO adresler VALUES(NULL,'Ağa Sok', '30.Cad.','Maraş');

SELECT * FROM calisanlar;
SELECT * FROM adresler;

--	CHECK CONSTRAINT

CREATE TABLE calisanlar2
( 
	id char(5) PRIMARY KEY,
	isim varchar(20) UNIQUE,
	maas int CHECK(maas>10000) NOT NULL,
	ise_baslama date
	
);

INSERT INTO calisanlar2 VALUES('10002', 'Mehmet Yılmaz' ,19000, 2018-04-14);

--DQL DATA QUERY LANG. --WHERE KULLANIMI

SELECT * FROM calisanlar;
SELECT isim FROM calisanlar;


--Calisanlar tablosundan maasi 5000 den buyuk olan isimleri listeleyiniz.
SELECT isim,maas FROM calisanlar WHERE maas>5000;
--calisanlar tablosundan ismi velihan olan tum verileri listeleyiniz.
SELECT * FROM calisanlar WHERE isim='Veli Han';

--Calisanlar tablosundan maasi 5000 olan tum verileri listeleyiniz.

SELECT * FROM calisanlar WHERE maas=5000;


--DATA MANIPULATION LANGUAGE(TABLONUN ICI ==MIMAR) DELETE KOMUTU

DELETE FROM calisanlar;--Eger parent tablo baska bir child tablo ile iliskili ise once child table silinmelidir.
DELETE FROM adresler;
SELECT * FROM adresler;

--Adresler tablosundan sehri Antep olan verileri silelim.
DELETE FROM adresler WHERE sehir='Antep';


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
--INSERT INTO ogrenciler6 VALUES(127, 'Mustafa Bak', 'Ali', 99);

select * from ogrenciler6;

-- ismi Nesibe Yilmaz veya Mustafa Bak olan kayıtları silelim.
DELETE FROM ogrenciler6 WHERE isim='Mustafa Bak';
DELETE FROM ogrenciler6 WHERE isim='Nesibe Yilmaz';




































































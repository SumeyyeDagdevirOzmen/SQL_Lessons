--DATABASE(Veritabani) Olusturma
Create dataBase sumeyye;

create database Dagdeviren;

--DDL -DATA DEFINITION LANG.
--CREATE -TABLO OLUSTURMA
CREATE TABLE ogrenciler1
(
	
ogrenci_no char(7),
isim varchar(20),
soyisim varchar(25),
not_ort real,-- Ondalikli sayilar icin kullanilir(Double gibi)
kayit_tarih date

);

--VAROLAN TABLODAN YENI BIR TABLO OLUSTURMA
CREATE TABLE ogrenci_notlari 
AS --Benzer tablodaki basliklarla ve data tipleriyle yeni bir
--tablo olusturmak icin normal tablo olusturuken ki parantezler yerine 
--AS kullanıp Select komutuyla almak istediğimiz verileri alırız
SELECT isim,soyisim,not_ort FROM ogrenciler;--AS kullanıp Select komutuyla almak istediğimiz verileri alırız

--DML -DATA MANUPULATION LANGUAGE
--INSERT (DATABASE'E VERI EKLEME)

INSERT INTO ogrenciler VALUES('1234567','Said','ILHAN',85.5,now());
INSERT INTO ogrenciler VALUES('1234567','Said','ILHAN',85.5,'2022-12-11');

-- BIR TABLOYA PARCALI VERI EKLEMEK ISTERSEK 

INSERT INTO ogrenciler (isim,soyisim) VALUES ('Erol','Evren');

--DQL -DATA QUERY LANGUAGE
--SELECT

select * FROM ogrenciler;-- Burdaki * sembolü herşeyi anlamındadır











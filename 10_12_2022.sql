drop table personel;
CREATE TABLE personel 
(
id int,
isim varchar(50), 
sehir varchar(50), 
maas int, 
sirket varchar(20) );
INSERT INTO personel VALUES(123456789, 'Johnny Walk', 'New Hampshire', 2500, 'IBM');
INSERT INTO personel VALUES(234567891, 'Brian Pitt', 'Florida', 1500, 'LINUX');
INSERT INTO personel VALUES(245678901, 'Eddie Murphy', 'Texas', 3000, 'WELLS FARGO');
INSERT INTO personel VALUES(456789012, 'Teddy Murphy', 'Virginia', 1000, 'GOOGLE');
INSERT INTO personel VALUES(567890124, 'Eddie Murphy', 'Massachuset', 7000, 'MICROSOFT'); 
INSERT INTO personel VALUES(456789012, 'Brad Pitt', 'Texas', 1500, 'TD BANK');
INSERT INTO personel VALUES(123456719, 'Adem Stone', 'New Jersey', 2500, 'IBM');

drop table isciler;
CREATE TABLE isciler
(
id char(9), 
isim varchar(50),
sehir varchar(50),
maas int,
sirket varchar(20)
);

INSERT INTO isciler VALUES('123456789', 'John Walker', 'Florida', 2500, 'IBM');
INSERT INTO isciler VALUES('234567890', 'Brad Pitt', 'Florida', 1500, 'APPLE');
INSERT INTO isciler VALUES('345678901', 'Eddie Murphy', 'Texas', 3000, 'IBM');
INSERT INTO isciler VALUES(456789012, 'Eddie Murphy', 'Virginia', 1000, 'GOOGLE'); 
INSERT INTO isciler VALUES(567890123, 'Eddie Murphy', 'Texas', 7000, 'MICROSOFT'); 
INSERT INTO isciler VALUES(456789012, 'Brad Pitt', 'Texas', 1500, 'GOOGLE');
INSERT INTO isciler VALUES('123456710', 'Mark Stone', 'Pennsylvania', 2500, 'IBM');

select * from personel;
--1)Her iki tablodaki ortak id’leri ve personel tablosunda bu id’ye sahip isimleri listeleyen query
--yaziniz
select isim,id from personel 
where  id in (select id from isciler where personel.id=isciler.id) ;

--2) Her iki tablodaki ortak id ve isme sahip kayitlari listeleyen query yaziniz
select  isim|| ' '||id as ortak_isimveid from personel 
intersect
select isim|| ' '||id as ortak_isimveid from isciler

select  concat(isim,' ->',id) as ortak_isimveid from personel 
intersect
select  concat(isim,' ->',id) as ortak_isimveid from isciler

--3) Personel tablosunda kac farkli sehirden personel var
select  count(distinct sehir) as farkli_sehir_sayisi from personel  
select  isim,count(distinct sirket) as farkli_sirket_sayisi from personel  group by isim

--4) Personel tablosunda id’si cift sayi olan personel’in 
--tum bilgilerini listeleyen Query yaziniz
select * from personel where id%2=0;
SELECT *
FROM personel 
WHERE MOD (id,2)=1;--ID si tek olanlari verir.

--5) Personel tablosunda kac tane kayit oldugunu gosteren query yazin
select count(isim) as kayit_sayisi from personel
--6) Isciler tablosunda en yuksek maasi alan kisinin 
--tum bilgilerini gosteren query yazin
select * from isciler order by maas desc limit 1;
SELECT MAX(maas) AS max_maas 
FROM isciler;

SELECT *
FROM isciler
WHERE maas IN (SELECT MAX(maas) FROM isciler);
--id si 12 ile baslayan iscilerin tum bilgilerini listeleyin
select * from isciler where id like '12%' ;

--7) Personel tablosunda en dusuk maasi alan kisinin 
--tum bilgilerini gosteren query yazin
select * from personel where maas  in(select min(maas) from personel)
select * from personel order by maas limit 1 ;

--8) Isciler tablosunda ikinci en yuksek maasi maasi gosteren query yazin
select * from isciler order by maas desc offset 1 limit 1;
SELECT MAX(maas)
FROM isciler
WHERE maas <>(SELECT MAX(maas)
FROM isciler);

--9) Isciler tablosunda ikinci en dusuk maasi alan iscinin tum bilgilerini gosteren query yazin
select * from isciler order by maas offset 1 limit 1;
SELECT *
FROM isciler 
ORDER BY maas 
OFFSET 1 ROW
FETCH NEXT 1 ROW ONLY;

--10) Isciler tablosunda en yuksek maasi alan iscinin disindaki tum iscilerin, tum bilgilerini
--gosteren query yazin

select * from isciler order by  maas desc; 
select * from isciler order by maas desc offset 1;

SELECT *
FROM isciler
WHERE maas<>( SELECT MAX(maas)
FROM isciler) 
ORDER BY maas DESC;

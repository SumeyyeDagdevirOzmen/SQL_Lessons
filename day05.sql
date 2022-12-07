CREATE TABLE personel
(
id int,
isim varchar(50),  sehir varchar(50),  maas int,  
sirket varchar(20)
);
INSERT INTO personel VALUES(123456789, 'Ali Yilmaz', 'Istanbul', 5500, 'Honda');  
INSERT INTO personel VALUES(234567890, 'Veli Sahin', 'Istanbul', 4500, 'Toyota');  
INSERT INTO personel VALUES(345678901, 'Mehmet Ozturk', 'Ankara', 3500, 'Honda');  
INSERT INTO personel VALUES(456789012, 'Mehmet Ozturk', 'Izmir', 6000, 'Ford');  
INSERT INTO personel VALUES(567890123, 'Mehmet Ozturk', 'Ankara', 7000, 'Tofas');  
INSERT INTO personel VALUES(456789012, 'Veli Sahin', 'Ankara', 4500, 'Ford');  
INSERT INTO personel VALUES(123456710, 'Hatice Sahin', 'Bursa', 4500, 'Honda');
delete from personel;
select * from personel;

--1)Isme gore toplam maaslari bulun
select isim,sum(maas) as toplam_maas from personel group by isim;

--Personel tablosundaki isimleri gruplayiniz.
SELECT isim FROM personel GROUP BY isim;
SELECT isim,count(sehir) FROM personel GROUP BY isim;
--Sirketlere gore maasi 5000 liradan fazla olan personel sayisini bulun
SELECT sirket, COUNT (*) AS calisan_sayisi 
FROM personel
WHERE maas>5000
GROUP BY sirket;

-- 									HAVING CLAUSE
-- HAVING, AGGREGATE FUNCTION’lar ile birlikte kullanilan FILTRELEME komutudur.
--Having komutu yalnizca group by komutu ile kullanilir.
--Eger gruplamadan sonra bir sart varsa HAVING komutu kullanilir
--Where kullanimi ile ayni mantikta calisir.

--1) Her sirketin MIN maaslarini eger 4000’den buyukse goster
SELECT sirket, MIN (maas) AS en_dusuk_maas
FROM personel 
GROUP BY sirket
HAVING MIN (maas) >4000;

-- 2) Ayni isimdeki kisilerin aldigi toplam gelir 10000 liradan fazla ise ismi
-- ve toplam maasi gosteren sorgu yaziniz

SELECT isim, SUM (maas) AS toplam_maas 
FROM personel
GROUP BY isim
HAVING SUM (maas) >10000;

--3) Eger bir sehirde calisan personel sayisi 1’den coksa sehir ismini ve personel sayisini veren sorgu yaziniz

SELECT sehir, COUNT (isim) AS toplam_personel_sayisi 
FROM personel
GROUP BY sehir
HAVING COUNT (isim) >1;

-- 4) Eger bir sehirde alinan MAX maas 5000’den dusukse
-- sehir ismini ve MAX maasi veren sorgu yaziniz
SELECT sehir, MAX (maas) AS max_maas 
FROM personel
GROUP BY sehir
HAVING MAX (maas) <5000;

--                          UNION OPERATOR
--Iki farkli sorgulamanin sonucunu birlestiren islemdir. Iki ayri sutunu tek sutunda birlestirir.
--Secilen Field SAYISI ve DATA TYPE’i ayni olmalidir

-- 1) Maasi 4000’den cok olan isci isimlerini ve 5000 liradan fazla maas alinan
-- sehirleri gosteren sorguyu yaziniz

select * from personel;

select isim as isim_ve_sehirler, maas from personel where maas>4000
UNION
select sehir,maas from personel where maas>5000

--2) Mehmet Ozturk ismindeki kisilerin aldigi maaslari ve Istanbul’daki personelin maaslarini
--bir tabloda gosteren sorgu yaziniz

SELECT sehir AS isci_veya_sehir_ismi ,maas
FROM personel 
WHERE sehir='Istanbul' 
UNION
SELECT isim AS isci_veya_sehir_ismi , maas 
FROM personel
WHERE isim = 'Mehmet Ozturk';

SELECT isim as isim_ve_sehir,maas FROM personel WHERE isim='Mehmet Ozturk'
union
SELECT sehir,maas FROM personel WHERE sehir='Istanbul' 
ORDER BY maas DESC;

--   UNION OPERATOR
--2 Tablodan Data Birlestirme
drop table if exists personel;
CREATE TABLE personel
(
id int,
isim varchar(50),  
sehir varchar(50), 
maas int,  
sirket varchar(20),
CONSTRAINT personel_pk PRIMARY KEY (id)
	);
	
INSERT INTO personel VALUES(123456789, 'Ali Yilmaz', 'Istanbul', 5500, 'Honda');  
INSERT INTO personel VALUES(234567890, 'Veli Sahin', 'Istanbul', 4500, 'Toyota');  
INSERT INTO personel VALUES(345678901, 'Mehmet Ozturk', 'Ankara', 3500, 'Honda');  
INSERT INTO personel VALUES(456789012, 'Mehmet Ozturk', 'Izmir', 6000, 'Ford');  
INSERT INTO personel VALUES(567890123, 'Mehmet Ozturk', 'Ankara', 7000, 'Tofas');  
INSERT INTO personel VALUES(456715012, 'Veli Sahin', 'Ankara', 4500, 'Ford');  
INSERT INTO personel VALUES(123456710, 'Hatice Sahin', 'Bursa', 4500, 'Honda');
	
	
CREATE TABLE personel_bilgi  (
id int,
tel char(10) UNIQUE ,  
cocuk_sayisi int,
CONSTRAINT personel_bilgi_fk FOREIGN KEY (id) REFERENCES personel(id)
);
INSERT INTO personel_bilgi VALUES(123456789, '5302345678', 5);  
INSERT INTO personel_bilgi VALUES(234567890, '5422345678', 4);
INSERT INTO personel_bilgi VALUES(345678901, '5354561245', 3);
INSERT INTO personel_bilgi VALUES(456789012, '5411452659', 3);
INSERT INTO personel_bilgi VALUES(567890123, '5551253698', 2);
INSERT INTO personel_bilgi VALUES(456789012, '5524578574', 2);
INSERT INTO personel_bilgi VALUES(123456710, '5537488585', 1);
	
	select * from personel;
	select * from personel_bilgi;
	
-- id’si 123456789 olan personelin Personel tablosundan sehir ve maasini, 
-- personel_bilgi  tablosundan da tel ve cocuk sayisini yazdirin
	
select sehir as sehir_ve_tel,maas  as maas_ve_cocuksayisi from personel where id=123456789
union
select tel,cocuk_sayisi from personel_bilgi where id=123456789

/*
NOT : Union islemi yaparken
1)Her 2 QUERY’den elde edeceginiz tablolarin sutun sayilari esit olmali
2)Alt alta gelecek sutunlarin data type’lari ayni olmali
*/
/*
UNION islemi 2 veya daha cok SELECT isleminin sonuc KUMELERINI birlestirmek icin kullanilir,
Ayni kayit birden fazla olursa, sadece bir tanesini alir.
UNION ALL ise tekrarli elemanlari, tekrar sayisinca yazar.
NOT : UNION ALL ile birlestirmelerde de
1)Her 2 QUERY’den elde edeceginiz tablolarin sutun sayilari esit olmali
2)Alt alta gelecek sutunlarin data type’lari ayni olmali
UNION tekrarli verileri teke dusurur ve bize o sekilde sonuc verir.
UNION ALL ise tekrarli verilerle birlikte tum sorgulari getirir.
*/

--1) Personel tablosundada maasi 5000’den az olan tum isimleri ve maaslari bulunuz
SELECT isim,maas 
FROM personel 
WHERE maas<5000
union all
SELECT isim,maas 
FROM personel 
WHERE maas<5000

--              INTERSECT OPERATOR(Kesisim)
--SQL INTERSECT operatörü, 2 veya daha fazla SELECT ifadesinin sonuçlarını döndürmek için kullanılır.
--Ancak, yalnızca tüm sorgular veya veri kümeleri tarafından seçilen satırları döndürür. 
--Bir sorguda bir kayıt varsa ve diğerinde yoksa,
--INTERSECT sonuçlarından çıkarılacaktır.
/*Farkli iki tablodaki ortak verileri
intersect komutu ile getirebiliriz.
*/

--1) Personel tablosundan Istanbul veya Ankara’da calisanlarin id’lerini yazdir
--2) Personel_bilgi tablosundan 2 veya 3 cocugu olanlarin id lerini yazdirin
select id from personel where sehir in('Istanbul','Ankara')
intersect 
select id from personel_bilgi where cocuk_sayisi in(2,3)

-- 1) Maasi 4800’den az olanlar veya 5000’den cok olanlarin id’lerini listeleyin
-- 2) Personel_bilgi tablosundan 2 veya 3 cocugu olanlarin id lerini yazdirin
-- 3) Iki sorguyu INTERSECT ile birlestirin
select id from personel where maas<4800 or maas>5000
INTERSECT
select id from personel_bilgi where cocuk_sayisi in(2,3);

-- Honda,Ford ve Tofas’ta calisan ortak isimde personel varsa listeleyin
select isim from personel where sirket='Honda'
INTERSECT
select isim from personel where sirket='Ford'
INTERSECT
select isim from personel where sirket='Tofas'

--               EXCEPT(MINUS) OPERATOR
--iki sorgulamada harici bir sorgulama istenirse EXCEPT komutu kullanilir.
--MINUS Mysql ve Oracle'da kullaniliyor except yerine.

--1) 5000’den az maas alip Honda’da calismayanlari yazdirin
select isim,sirket from personel where maas<5000 
EXCEPT
select isim,sirket from personel where sirket='Honda'



































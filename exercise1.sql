/*Practice 4:
“tedarikciler3” isimli bir tablo olusturun. Tabloda “tedarikci_id”, “tedarikci_ismi”, 
“iletisim_isim” field’lari olsun ve “tedarikci_id” yi Primary Key yapin.
“urunler” isminde baska bir tablo olusturun “tedarikci_id” ve “urun_id” field’lari olsun ve
“tedarikci_id” yi Foreign Key yapin.*/

create table tedarikciler2(
tedarikci_id char(5),
tedarikci_ismi varchar(20),	
iletisim_isim varchar(20),	
constraint tedarikci_id_pk primary key(tedarikci_id)	
);
create table urunler
(
	tedarikci_id char(5),
	product_id char(10),
	constraint urunler_fk foreign key(tedarikci_id) references tedarikciler2(tedarikci_id)
);
/*
Practice 5:
“calisanlar” isimli bir Tablo olusturun. Icinde “id”, “isim”, “maas”
, 
“ise_baslama” field’lari 
olsun. “id” yi Primary Key yapin, “isim” i Unique, “maas” i Not Null yapın.
“adresler” isminde baska bir tablo olusturun.Icinde “adres_id”
,
“sokak”
, 
“cadde” ve “sehir”
fieldlari olsun. “adres_id” field‘i ile Foreign Key oluşturun
*/

create table calisanlar(
id char(5) primary key,
isim varchar(15) unique,
maas int not null,
ise_baslama date
);

create table adresler(
adres_id char(5),
sokak varchar(15),
cadde varchar(15),	
sehir varchar(15),
	constraint adresler_fk foreign key (adres_id) references calisanlar(id)
);
INSERT INTO calisanlar VALUES('10002', 'Mehmet Yilmaz' ,12000, '2018-04-14'); 
INSERT INTO calisanlar VALUES('10008', null, 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('10010', 'Mehmet Yilmaz', 5000, '2018-04-14'); --isim unique olmali
INSERT INTO calisanlar VALUES('10004', 'Veli Han', 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('10005', 'Mustafa Ali', 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('10006', 'Canan Yaş', NULL, '2019-04-12'); --not null constraint hatasi
INSERT INTO calisanlar VALUES('10003', 'CAN', 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('10007', 'CAN', 5000, '2018-04-14'); --isim unique olmali
INSERT INTO calisanlar VALUES('10009', 'cem', '', '2018-04-14'); --maas int olmali
INSERT INTO calisanlar VALUES('', 'osman', 2000, '2018-04-14');
INSERT INTO calisanlar VALUES('', 'osman can', 2000, '2018-04-14');--id unique olmali
INSERT INTO calisanlar VALUES( '10002', 'ayse Yılmaz' ,12000, '2018-04-14'); --id unique olmali
INSERT INTO calisanlar VALUES( null, 'filiz ' ,12000, '2018-04-14');--id primary null olmaz
INSERT INTO adresler VALUES('10003','Mutlu Sok', '40.Cad.','IST');
INSERT INTO adresler VALUES('10003','Can Sok', '50.Cad.','Ankara');
INSERT INTO adresler VALUES('10002','Ağa Sok', '30.Cad.','Antep');
-- Parent tabloda olmayan id ile child a ekleme yapamayiz
INSERT INTO adresler VALUES('10012','Ağa Sok', '30.Cad.','Antep');

-- FK'ye null değeri atanabilir.
INSERT INTO adresler VALUES(NULL,'Ağa Sok', '30.Cad.','Antep');
INSERT INTO adresler VALUES(NULL,'Ağa Sok', '30.Cad.','Maraş');

--update adresler set adres_id=10002 where adres_id=NULL;--calismadi
select * from adresler;
create table sehirler(

alan_kodu int ,
isim varchar(20),
nufus int CHECK (nufus>0)
);
insert into sehirler(nufus) values(15000);	
select * from sehirler;
update sehirler set isim='istanbul' where isim is null;
update sehirler set isim='Ankara' where isim='istanbul';
update sehirler set alan_kodu=850510 where alan_kodu is null;
update sehirler set isim='istanbul',nufus=30000 where isim='Ankara' and nufus=15000;

select * from calisanlar;
select maas from calisanlar where maas>5000;
select * from calisanlar where isim='Mehmet Yılmaz';
select * from calisanlar where maas>2000 and maas<9000;
select * from calisanlar where maas in (2000,5000);
select * from calisanlar where maas between 2000 and 5000;
select * from calisanlar where maas=(select max(maas) from calisanlar);
select * from calisanlar order by maas desc
offset 1 row fetch next 1 row only;--en yuksek 2. maas

select * from calisanlar order by maas desc-- yukaridan asagiya siraliyor.
offset 2 row fetch next 1 row only;--en yuksek 2. maas


drop table if exists insanlar;
CREATE TABLE insanlar
(
ssn char(9),
isim varchar(50),
soyisim varchar(50), adres
varchar(50)
);
INSERT INTO insanlar VALUES(123456789, 'Ali','Can', 'Istanbul');
INSERT INTO insanlar VALUES(234567890, 'Veli','Cem', 'Ankara'); 
INSERT INTO insanlar VALUES(345678901, 'Mine','Bulut', 'Ankara'); 
INSERT INTO insanlar VALUES(256789012, 'Mahmut','Bulut', 'Istanbul'); 
INSERT INTO insanlar VALUES (344678901, 'Mine','Yasa', 'Ankara'); 
INSERT INTO insanlar VALUES (345678901, 'Veli','Yilmaz', 'Istanbul');
select * from insanlar;

select * from insanlar order by isim asc,soyisim desc;
--İsim ve soyisim değerlerini soyisim kelime uzunluklarına göre sıralayınız
select isim,soyisim from insanlar order by length(soyisim);
--Tüm isim ve soyisim değerlerini aynı sutunda çağırarak her bir sütun değerini uzunluğuna göre sıralayınız

select isim||' '||soyisim as isim_ve_soyisim from insanlar;
select concat(isim,' ',soyisim) as isim_ve_soyisim from insanlar order by length(isim)+length(soyisim)desc;
CREATE TABLE manav
(
isim varchar(50), 
Urun_adi varchar(50), 
Urun_miktar int
);
drop table if exists personel;
select * from manav;
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
--1) Isme gore alinan toplam urunleri bulun
select isim,sum(Urun_miktar) as toplam_urun_miktar from manav group by isim;

--2) Urun ismine gore urunu alan toplam kisi sayisi listeleyiniz.
select count(isim) as kisi_sayisi,urun_adi from manav group by urun_adi;
--3) Alinan kilo miktarina gore musteri sayisi listele
select count(isim)as kisi_sayisi,urun_miktar from manav group by urun_miktar;


CREATE TABLE personel 
(
id int primary key,
isim varchar(50), 
sehir varchar(50), 
maas int, 
sirket varchar(20)
);


INSERT INTO personel VALUES(123456789, 'Ali Yilmaz', 'Istanbul', 5500, 'Honda'); 
INSERT INTO personel VALUES(234567890, 'Veli Sahin', 'Istanbul', 4500, 'Toyota'); 
INSERT INTO personel VALUES(345678901, 'Mehmet Ozturk', 'Ankara', 3500, 'Honda'); 
INSERT INTO personel VALUES(456789012, 'Mehmet Ozturk', 'Izmir', 6000, 'Ford'); 
INSERT INTO personel VALUES(567890123, 'Mehmet Ozturk', 'Ankara', 7000, 'Tofas'); 
INSERT INTO personel VALUES(456789013, 'Veli Sahin', 'Ankara', 4500, 'Ford'); 
INSERT INTO personel VALUES(123456710, 'Hatice Sahin', 'Bursa', 4500, 'Honda');
--1) Isme gore toplam maaslari bulun
select isim,sum(maas) from personel group by isim;
--2) sehre gore toplam personel sayisini bulun
select sirket,count(isim) as calisan_sayisi from personel group by sirket;
--3) Sirketlere gore maasi 5000 liradan fazla olan personel sayisini bulun
select sirket,count(isim) from personel  where maas>5000 group by sirket;

--1) Her sirketin MIN maaslarini eger 2000’den buyukse goster
select sirket,min(maas) from personel group by sirket having min(maas)>4000;

--2)Ayni isimdeki kisilerin aldigi toplam gelir 10000 liradan fazla ise ismi 
--ve toplam maasi gosteren sorgu yaziniz

select isim,sum(maas) from personel group by (isim) having sum(maas)>10000;

--3) Eger bir sehirde calisan personel sayisi 1’den coksa sehir ismini ve personel sayisini veren sorgu yaziniz

select sehir,count(isim) from personel group by(sehir) having count(isim)>1;

--4) Eger bir sehirde alinan MAX maas 5000’den dusukse sehir ismini ve MAX maasi veren sorgu yaziniz

select sehir,max(maas) from personel group by sehir having max(maas)<6500;

--UNION OPERATOR

--1) Maasi 4000’den cok olan isci isimlerini ve 5000 liradan fazla maas alinan
--sehirleri gosteren sorguyu yaziniz
select isim as isim_veya_sehir,maas from personel  where maas>4000
union
select sehir,maas from personel where maas>5000

--2) Mehmet Ozturk ismindeki kisilerin aldigi maaslari ve 
--Istanbul’daki personelin maaslarini bir tabloda gosteren sorgu yaziniz

select isim as isim_veya_sehir ,maas from personel where isim='Mehmet Ozturk'
union 
select sehir,maas from personel where sehir='Istanbul' order by isim_veya_sehir desc

--3) Sehirlerden odenen ucret 3000’den fazla olanlari ve personelden ucreti 5000’den az
--olanlari bir tabloda maas miktarina gore sirali olarak gosteren sorguyu yaziniz

select sehir,maas from personel where maas>3000
union
select isim,maas from personel where maas<5000 order by maas desc;

CREATE TABLE personel_bilgi (
id int,
tel char(10) UNIQUE , 
cocuk_sayisi int,
CONSTRAINT personel_bilgi_fk FOREIGN KEY 
(id) REFERENCES personel(id)
);

INSERT INTO personel_bilgi VALUES(123456789, '5302345678' , 5); 
INSERT INTO personel_bilgi VALUES(234567890, '5422345678', 4);
INSERT INTO personel_bilgi VALUES(345678901, '5354561245', 3);
INSERT INTO personel_bilgi VALUES(456789012, '5411452659', 3);
INSERT INTO personel_bilgi VALUES(567890123, '5551253698', 2);
INSERT INTO personel_bilgi VALUES(456789012, '5524578574', 2);
INSERT INTO personel_bilgi VALUES(123456710, '5537488585', 1);

select * from personel_bilgi;

--id’si 12345678 olan personelin Personel tablosundan sehir ve maasini, 
--personel_bilgi tablosundan da tel ve cocuk sayisini yazdirin

select sehir,maas as sehir_veya_maas from personel where id='123456789'
union
select tel,cocuk_sayisi from personel_bilgi where id='123456789';
--1) Personel tablosundan Istanbul veya Ankara’da calisanlarin id’lerini yazdir
select id from personel where sehir in('Istanbul','Ankara');

--2) Personel_bilgi tablosundan 2 veya 3 cocugu olanlarin id lerini yazdirin
select id from personel_bilgi where cocuk_sayisi in (2,3)
intersect
select id from personel where sehir in('Istanbul','Ankara');

--1) Maasi 4800’den az olanlar veya 5000’den cok olanlarin id’lerini
--listeleyin
--2) Personel_bilgi tablosundan 2 veya 3 cocugu olanlarin id lerini yazdirin
select id from personel where maas not between 4800 and 5000
intersect
select id from personel_bilgi where cocuk_sayisi in (2,3)

--3) Honda,Ford ve Tofas’ta calisan ortak isimde personel varsa listeleyin
select isim as ortak_kisiler from personel where sirket='Honda'
intersect
select isim from personel where sirket='Ford'
intersect
select isim from personel where sirket='Tofas'
--   EXCEPT
select isim as ortak_kisiler from personel where sirket='Toyota'
intersect
select isim from personel where sirket='Ford'
except
select isim from personel where sirket='Tofas'

CREATE TABLE sirketler 
(
sirket_id int, 
sirket_isim varchar(20)
);
drop table sirketler;

INSERT INTO sirketler VALUES(100, 'Toyota'); 
INSERT INTO sirketler VALUES(101, 'Honda'); 
INSERT INTO sirketler VALUES(102, 'Ford'); 
INSERT INTO sirketler VALUES(103, 'Hyundai');
drop table siparisler;
CREATE TABLE siparisler 
(
siparis_id int, 
sirket_id int, 
siparis_tarihi date
);

INSERT INTO siparisler VALUES(11, 101,'17-Apr-2020');
INSERT INTO siparisler VALUES(22, 102,'18-Apr-2020');
INSERT INTO siparisler VALUES(33, 103,'19-Apr-2020');
INSERT INTO siparisler VALUES(44, 104,'20-Apr-2020');
INSERT INTO siparisler VALUES(55, 105,'21-Apr-2020');

select * from sirketler;
--SORU) Iki Tabloda sirket_id’si ayni olanlarin sirket_ismi, siparis_id ve
--siparis_tarihleri ile yeni bir tablo olusturun

select siparisler.siparis_id,siparis_tarihi,sirketler.sirket_id
from sirketler inner join siparisler on sirketler.sirket_id=siparisler.sirket_id;


select siparis_id,siparis_tarihi,sirket_isim
from sirketler inner join siparisler on sirketler.sirket_id=siparisler.sirket_id;

select siparis_id,siparis_tarihi,sirket_isim
from sirketler left join siparisler on sirketler.sirket_id=siparisler.sirket_id;

select siparis_id,siparis_tarihi,sirket_isim
from sirketler right join siparisler on sirketler.sirket_id=siparisler.sirket_id;

select siparis_id,siparis_tarihi,sirket_isim
from sirketler full join siparisler on sirketler.sirket_id=siparisler.sirket_id;

--           SELF JOIN
drop table personel;
CREATE TABLE personel 
(
id int,
isim varchar(20), 
title varchar(60), 
yonetici_id int
);
INSERT INTO personel VALUES(1, 'Ali Can', 'SDET', 2);
INSERT INTO personel VALUES(2, 'Veli Cem', 'QA', 3);
INSERT INTO personel VALUES(3, 'Ayse Gul', 'QA Lead', 4); 
INSERT INTO personel VALUES(4, 'Fatma Can', 'CEO', 5);

select * from personel;
--Her personelin yanina yonetici ismini yazdiran bir tablo olusturun

select p1.isim as personel_isim,p2.isim as yonetici_isim
from personel p1 inner join personel p2
on p1.yonetici_id=p2.id;
--LIKE CONDITION
drop table kelimeler
CREATE TABLE kelimeler 
(
id int UNIQUE,
kelime varchar(50) NOT NULL, 
Harf_sayisi int
);


INSERT INTO kelimeler VALUES (1001, 'hot', 3); 
INSERT INTO kelimeler VALUES (1002, 'hat', 3); 
INSERT INTO kelimeler VALUES (1003, 'hit', 3); 
INSERT INTO kelimeler VALUES (1004, 'hbt', 3); 
INSERT INTO kelimeler VALUES (1008, 'hct', 3); 
INSERT INTO kelimeler VALUES (1005, 'adem', 4); 
INSERT INTO kelimeler VALUES (1006, 'selim', 5); 
INSERT INTO kelimeler VALUES (1007, 'yusuf', 5);

--SORU : Ilk harfi h,son harfi t olup 
--2.harfi a ile k arasinda olan 3 harfli kelimelerin tum bilgilerini 
--yazdiran QUERY yazin
select * from kelimeler
where kelime ~'h[a-k]t';

select * from kelimeler
where kelime ~'^[ha](.*)[mk]$';-- .*==% demektir
--   LIKE
select * from kelimeler
where kelime like 'h%t';

select * from kelimeler
where kelime ~*'^[^ha](.*)[^f]$';

--SORU : a veya s ile baslayan kelimelerin tum bilgilerini yazdiran QUERY yazin
select * from kelimeler
where kelime !~*'(.*a)';

select * from kelimeler
where kelime !~*'(.*)a(.*)';

select * from kelimeler
where kelime ~*'(.*)a(.*)';

select * from kelimeler
where kelime !~*'(.*a)'

--DISTINCT
drop table musteri_urun
CREATE TABLE musteri_urun 
(
urun_id int, 
musteri_isim varchar(50),
urun_isim varchar(50) 
);
INSERT INTO musteri_urun VALUES (10, 'Ali', 'Portakal'); 
INSERT INTO musteri_urun VALUES (10, 'Ali', 'Portakal'); 
INSERT INTO musteri_urun VALUES (20, 'Veli', 'Elma'); 
INSERT INTO musteri_urun VALUES (30, 'Ayse', 'Armut'); 
INSERT INTO musteri_urun VALUES (20, 'Ali', 'Elma'); 
INSERT INTO musteri_urun VALUES (10, 'Adem', 'Portakal'); 
INSERT INTO musteri_urun VALUES (40, 'Veli', 'Kaysi'); 
INSERT INTO musteri_urun VALUES (20, 'Elif', 'Elma');

Tabloda kac farkli meyve vardir ?
SELECT COUNT(DISTINCT urun_isim) AS urun_cesit_sayisi 
FROM musteri_urun;
select * from musteri_urun;
--3) Sirali tablodan 4. kayittan 7.kayida kadar olan kayitlari listeleyin
select * from musteri_urun
order by musteri_urun
offset 3 limit 4;

select urun_id from musteri_urun
group by urun_id

select * from musteri_urun
order by urun_id desc,musteri_isim desc;

--  ALTER
alter table musteri_urun
add fiyat int ;

alter table musteri_urun
add fiyat2 int default 0;

update musteri_urun
set fiyat=5;

update musteri_urun
set fiyat=25
where musteri_isim='Ali' and urun_isim='Elma';

alter table musteri_urun
drop column fiyat2;

alter table musteri_urun
rename column fiyat to urun_fiyati;

select * from musteri_urun;

alter table musteri_urun
alter column urun_id type varchar(5) using(urun_id::varchar)

alter table musteri_urun
alter column urun_id type int using(urun_id::int)










































	




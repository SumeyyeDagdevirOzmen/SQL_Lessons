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






	




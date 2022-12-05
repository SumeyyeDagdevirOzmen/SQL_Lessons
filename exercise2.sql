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

create table tedarikciler3(
tedarikci_id char(10) primary key,
tedarikci_ismi varchar(20),
iletisim_isim varchar(20)	

);

create table urunler(
tedarikci_id char(7),
urun_id char(7),
	
	foreign key(tedarikci_id) references tedarikciler3(tedarikci_id)	
);
select * from tedarikciler3;
select * from urunler;


create table calisanlar(
id char(10) primary key,
isim varchar(20) unique,
maas real not null,
ise_baslama date	

);
create table adresler(
adres_id char(10),
sokak varchar(20),
cadde varchar(20),
sehir varchar(15),
foreign key (adres_id) references calisanlar(id)
);

INSERT INTO calisanlar VALUES('10002', 'Mehmet Yılmaz' ,12000, '2018-04-14'); 
INSERT INTO calisanlar VALUES('10008', null, 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('10010', Mehmet Yılmaz, 5000, '2018-04-14'); --isim unique olmali
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
select * from adresler;





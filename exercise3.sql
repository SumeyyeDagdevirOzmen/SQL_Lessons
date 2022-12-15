create table family_members(
	
	id int,
	name varchar(15),
	gender char(7),
	species char(7),
	num_books_read int
	
	);
insert into family_members values(1,'Dave','male','human',200); 
insert into family_members values(2,'Mary','female','human',180;) 
insert into family_members values(3,'Pickles','male','dog',0); 
--1-Tüm verileri tek bir tabloda gösteren query yazın.
select * from family_members;

--2-name and species  sütunlarını gösteren query yazın. 
select name,species from family_members;

--3-dog a ait tüm satırları döndüren query yazın. 
select * from family_members where species='dog';

--4- num_books_read değeri 190'dan büyük olan aile 
--üyelerine a ait tüm satırları döndüren query yazın.
select * from family_members where num_books_read>190;

create table character(
id int,
name  varchar(20)	

);
insert into character values(1,'Doogie Howser');
insert into character values(2,'Barney Stinson');
insert into character values(3,'Lily Aldrin');
insert into character values(4,'Willow Rosenberg');

create table character_tv_show(
id int,
character_id int,
tv_show_name varchar(30)
	);
	
insert into character_tv_show values(1,4,'Buffy the Vampire Slayer');
insert into character_tv_show values(2,3,'How I Met Your Mother');
insert into character_tv_show values(3,2,'How I Met Your Mother');
insert into character_tv_show values(4,1,'Doogie Howser');

create table character_actor(
id int,
character_id int,
actor_name	varchar(30)
);
insert into character_actor values(1,4,'Alyson Hannigan');
insert into character_actor values(2,3,'Alyson Hannigan');
insert into character_actor values(3,2,'Neil Patrick Harris');
insert into character_actor values(4,1,'Neil Patrick Harris');
	
	select * from character;
	select * from character_tv_show;
	select * from character_actor;

--5- Her character adını onları oynayan actor  eşleştirmek için inner join kullanarak query yazın. 
select name,actor_name from character
inner join character_actor
on character.id=character_actor.character_id;


 
	
	
	



















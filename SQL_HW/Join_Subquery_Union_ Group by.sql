create table City(
	id serial primary key,
	City_name varchar (40) unique not null
);

create  table Person (
	id serial primary key,
	person_name varchar (40),
	city_id int not null
);

insert into City (City_name)
values ('Kiyv'),
	   ('Minsk'),
	   ('Berlin'),
	   ('Lviv'),
	   ('Kharkiv');

	  
	  
insert into Person (person_name, city_id)
values ('Vadim', 4),
	   ('Nikolay', 7),
	   ('Veronika', 9),
	   ('Elena', 1),       --пізніше зробили зміну, додали неіснуючих Nikolay, Veronika
	   ('Nataliia', 5),
	   ('Nikita', 1);       


select * from City;
select * from Person;

select Person.person_name, Person.city_id, City.City_name, City.id    -- фактично це inner join	(виводить все, що співпало)
from Person join City 
on Person.city_id = City.id;

select Person.person_name, Person.city_id, City.City_name, City.id		--виводить все, що співпало + залишок зліва
from Person left join City 
on Person.city_id = City.id;

select Person.person_name, Person.city_id, City.City_name, City.id		--виводить все, що співпало + залишок зправа
from Person right join City 
on Person.city_id = City.id;

select Person.person_name, Person.city_id, City.City_name, City.id 		-- фактично це full outer join	(виводить все, що співпало + залишок зліва + залишок зправа)
from Person full join City 
on Person.city_id = City.id;











create table phones_apple(
 id serial primary key,
 model varchar(40),
 ram int not null,
 front_camera int,
 price int
);


insert into phones_apple(model, ram, front_camera, price)
values ('X', 4, 8, 400),
    ('11', 6, 10, 700),
    ('12', 8, 12, 1000),
    ('7', 4, 12, 400),
    ('XR', 6, 12, 800),
    ('XS', 6, 12, 1000),
    ('13', 6, 12, 1500),
    ('8', 4, 10, 700),
    ('SE2020', 6, 8, 700),
    ('X65', 6, 10, 350),
    ('X75', 8, 10, 450),
    ('X85', 4, 16, 550),
    ('X95', 12, 10, 650),
    ('X105', 8, 12, 760),
    ('X115', 6, 10, 820)
 ;
 



create table phones_samsung(
 id serial primary key,
 model varchar(40),
 ram int not null,
 front_camera int,
 price int
);

 
insert into phones_samsung(model, ram, front_camera, price)
values ('A50', 6, 10, 300),
    ('A50', 8, 10, 400),
    ('A52', 8, 16, 500),
    ('S20', 8, 24, 1500),
    ('S21', 8, 12, 1000),
    ('S22', 6, 12, 1200),
    ('A71', 6, 12, 1200),
    ('A91', 4, 12, 1900),
    ('A57', 8, 8, 900),
    ('A32', 8, 4, 800),
    ('A33', 8, 5, 750),
    ('A43', 8, 5, 850)
 ;


insert into phones_samsung(model, ram, front_camera, price)
values ('A65', 6, 10, 350),
    ('A75', 8, 10, 450),
    ('A85', 4, 16, 550),
    ('A95', 12, 10, 650),
    ('A105', 8, 12, 760),
    ('A115', 6, 10, 820)
 ;
 

create table samsung_orders(
 id serial primary key,
 phone_id int
)

create table apple_orders(
 id serial primary key,
 phone_id int
)



insert into apple_orders(phone_id)
values (3),
    (9),
    (5),
    (1),
    (4);
    
   
insert into samsung_orders(phone_id)
values (2),
    (1),
    (5);
    
   
select * from samsung_orders;
select * from apple_orders;
select * from phones_apple;
select * from phones_samsung;



select avg(price) from phones_apple;

select * from phones_apple
where price  (select max(price) from phones_samsung);



select price from phones_samsung;

select * from phones_apple
where price in (select price from phones_samsung);				  --ціни apple'ів які доривнюють цінам samsung'ам



select price from phones_apple where ram < 8;

select * from phones_samsung
where price < all(select price from phones_apple where ram < 8)   -- мінімальна ціна нижча за ціни apple

select * from phones_samsung
where price > all(select price from phones_apple where ram < 8)   -- максимальна ціна вища за ціни apple

select * from phones_samsung
where price = all(select price from phones_apple where ram < 8)   -- ціна samsung яка дорівнює одночасно декільком цінам apple !неможливо  

select * from phones_samsung
where price <> all(select price from phones_apple where ram < 8)  --ціни samsung не дорівнюють цінам aplle



select * from phones_samsung
where price > any (select price from phones_apple where ram < 8)  --більше мінімального

select * from phones_samsung
where price < any (select price from phones_apple where ram < 8)  -- меньше максимального

select * from phones_samsung
where price = any (select price from phones_apple where ram < 8)  -- logical or може дорівнювати декільком значенням



select model, price from phones_apple where price < 1000
union 
select model, price from phones_samsung where price < 1000;     -- unique table by result joined vertically



select model, price from phones_apple where price < 1000
union all 
select model, price from phones_samsung where price < 1000;     -- table with all values by result joined vertically


select count(*) from phones_apple								--how many phones with 8gb ram
where ram = 8;

select ram, count(*) from phones_apple							-- group pnones by ram (all values)
group by ram;


select ram, avg (price) from phones_apple							-- group pnones by ram with avg price for each ram capacity
group by ram;


select front_camera, avg (price) from phones_apple		-- the same by front_camera. обрали колонку, обробили по іншому (колонки) середньому значенню і згрупували по обраній колонці 
group by front_camera


select front_camera, avg (price), count(*)  from phones_apple		-- the same like previous + quantity devises 
group by front_camera

--SQL_DDL

create table employees (
	id serial primary key,
	employee_name varchar (50) not null
);


insert into employees (employee_name )
values ('Мартин'),
	   ('Юрій'),
	   ('Ждан'),
	   ('Хвала'),
	   ('Йоханес'),
	   ('Орест'),
	   ('Рудан'),
	   ('Максим'),
	   ('Здоровега'),
	  ('Никодим'),
	   ('Шерлок'),
	   ('Євген'),
	   ('Євстафій'),
	   ('Герасим'),
	   ('Києслав'),
	   ('Святолюб'),
	   ('Зорегляд'),
	   ('Вакула'),
	   ('Юлій'),
	   ('Тригост'), 
	  ('Спас'),
		('Людислав'),
		('Еммануїл'), 
		('Шарль'),
		('Велемир'),
		('Честислав'), 
		('Фауст '),
		('Ясен'),
		('Петро'),
		('Геннадій'), 
		('Худан'),
		('Назарій'),
		('Татомир'),
		('Уличан'),
		('Еразм'),
		('Миколай'),
		('Тарас'),	
		('Божан'),
		('Едуард'),
		('Петро'),
	   ('Хвалибог'),
		('Яромил'),
		('Градислав'), 
		('Йосип'),
		('Остап'),
		('Еміль'),
		('Йоган'), 
		('Ус'),
		('Никифор'),
		('Злотода'), 
	   ('Ярослав'),
		('Флор'),
		('Зорепад'),
		('Божемир'),
		('Миролюб'),
		('Цвітан'),
		('Макар'),
		('Щастибог'),
		('Братислав'), 
		('Святослав'),
	   ('Устим'),
		('Ревун'),
		('Іван'), 
		('Царук'), 
		('Божедар'),
		('Богдан'), 
		('Олег'), 
		('Ігор'),
		('Юліан '),
		('Володимир');
	
	
	
select  * from employees;



create table salary (
	id serial primary key,
	monthly_salary int not null
)


insert into salary (monthly_salary)
values (1000),
	   (1100),
	   (1200),
	   (1300),
	   (1400),
	   (1500),
	   (1600),
	   (1700),
	   (1800),
	   (1900),
	   (2000),
	   (2100),
	   (2200),
	   (2300),
	   (2400),
	   (2500);

select * from salary;


create table employee_salary (
	id serial primary key,
	employee_id Int not null unique,
	salary_id Int not null
);

insert into employee_salary (employee_id, salary_id)
values (12, 3),
	   ( 5, 2),
	   ( 1, 3),
	   ( 8, 5),
	   ( 6, 4),
	   ( 14, 8),
	   ( 2, 6),
	   ( 9, 7),
	   ( 3, 4),
	   ( 4, 12),
	   ( 11, 11),
	   ( 29, 5),
	   ( 7, 3),
	   (10, 2),
	   (18, 10),
	   ( 21, 9),
	   ( 17, 4),
	   ( 30, 8),
	   ( 24, 1),
	   ( 19, 5),
	   ( 26, 15),
	   ( 20, 6),
	   ( 13, 2),
	   ( 16, 8),
	   ( 22, 6),
	   ( 15, 3),
	   ( 25, 4),
	   ( 31, 14),
	   ( 27, 12),
	   ( 78, 2),
	   ( 65,4),
	   ( 49, 8),
	   ( 121, 9),
	   ( 89, 3),
	   ( 51, 2),
	   ( 93, 4),
	   ( 59, 8),
	   ( 291029, 9),
	   ( 235, 15),
	   ( 412, 12);
	  
select * from employee_salary;


create table roles (
	id serial  primary key,
	role_name int not null unique
);


alter table roles
alter column role_name type varchar (30);

 

insert  into roles (id, role_name)
values (1, 'Junior Python developer'),
	   (2, 'Middle Python developer'),
	   (3, 'Senior Python developer'),
	   (4, 'Junior Java developer'), --J
	   (5, 'Middle Java developer'),
	   (6, 'Senior Java developer'),
	   (7, 'Junior JavaScript developer'), --J
	   (8, 'Middle JavaScript developer'),
	   (9, 'Senior JavaScript developer'),
	   (10, 'Junior Manual QA engineer'), --J
	   (11, 'Middle Manual QA engineer'),
	   (12, 'Senior Manual QA engineer'),
	   (13, 'Project Manager'),
	   (14, 'Designer'),
	   (15, 'HR'),
	   (16, 'CEO'),
	   (17, 'Sales manager'),
	   (18, 'Junior Automation QA engineer'), --J
	   (19, 'Middle Automation QA engineer'),
	   (20, 'Senior Automation QA engineer');

select * from roles;
	  
create table roles_employee (
	 id serial  primary key,
	 employee_id Int not null unique, --внешний ключ для таблицы employees, поле id
	 role_id Int not null,			  --внешний ключ для таблицы roles, поле id
	 foreign key (employee_id)
	 	references employees (id),
	 foreign key (role_id)
	 	references roles (id)
);


insert into roles_employee
values (1, 5, 20),
	   (2, 6, 19),
	   (3, 7, 18),
	   (4, 8, 17),
	   (5, 9, 16),
	   (6, 1, 13),
	   (7, 3, 15),
	   (8, 2, 14),
	   (9, 4, 12),
	   (10, 11, 11),
	   (11, 19, 1),
	   (12, 10, 18),
	   (13, 12, 3),
	   (14, 18, 4),
	   (15, 13, 2),
	   (16, 15, 9),
	   (17, 14, 5),
	   (18, 16, 6),
	   (19, 17, 19),
	   (20, 29, 1),
	   (21, 23, 4),
	   (22, 25, 11),
	   (23, 28, 2),
	   (24, 21, 3),
	   (25, 24, 7),
	   (26, 34, 8),
	   (27, 26, 7),
	   (28, 32, 10),
	   (29, 43, 14),
	   (30, 47, 19),
	   (31, 20, 15),
	   (32, 39, 10),
	   (33, 31, 4),
	   (34, 37, 2),
	   (35, 30, 5),
	   (36, 38, 1),
	   (37, 36, 10),
	   (38, 33, 18),
	   (39, 45, 13),
	   (40, 42, 15);

select * from roles_employee


drop table employees;
drop table salary;
drop table employee_salary;
drop table roles;

drop table roles_employee;





--SQL HomeWork 2. Joins

--Подключится к
--Host: 159.69.151.133
--Port: 5056
--DB: подключение к той таблице где делали DDL операции
--User: подключение к тем пользователем каким делали DDL операции
--Pass: 123

--Если для какого-то кейса надо сделать дополнительную таблицу, наполнить её данными, то делайте )


--1. Вывести всех работников чьи зарплаты есть в базе, вместе с зарплатами.
select Employees.employee_name, salary.monthly_salary
from Employees join Employee_salary
on employees.id = employee_salary.employee_id
join salary 
on salary.id = employee_salary.salary_id;

--2. Вывести всех работников у которых ЗП меньше 2000.
select Employees.employee_name, salary.monthly_salary
from Employees join Employee_salary
on employees.id = employee_salary.employee_id
join salary 
on salary.id = employee_salary.salary_id
where monthly_salary < (2000);

--3. Вывести все зарплатные позиции, но работник по ним не назначен. (ЗП есть, но не понятно кто её получает.)
select Employees.employee_name, salary.monthly_salary
from Employees join Employee_salary
on Employees.id = employee_salary.employee_id
right join salary
on salary.id = employee_salary.salary_id
where employee_salary is null ;

--4. Вывести все зарплатные позиции меньше 2000 но работник по ним не назначен. (ЗП есть, но не понятно кто её получает.)
select Employees.employee_name, salary.monthly_salary
from Employees join Employee_salary
on Employees.id = employee_salary.employee_id
right join salary
on salary.id = employee_salary.salary_id
where employee_salary is null and employee_salary.salary_id < 2000;

--5. Найти всех работников кому не начислена ЗП.
select Employees.employee_name, salary.monthly_salary 
from Employees left join Employee_salary
on Employees.id = Employee_salary.employee_id
left join salary
on salary.id = Employee_salary.salary_id 
where Employee_salary.salary_id is null ;

--6. Вывести всех работников с названиями их должности.
select Employees.employee_name, employees.id, roles_employee.role_id, roles.role_name 
from employees join roles_employee
on employees.id = roles_employee.employee_id 
join roles
on roles.id = roles_employee.role_id ;

--7. Вывести имена и должность только Java разработчиков.
select  Employees.employee_name, employees.id, roles_employee.role_id, roles.role_name 
from Employees join roles_employee
on Employees.id = roles_employee.employee_id  
join roles
on roles.id = roles_employee.role_id 
where roles.role_name like '%Java developer%';

--8. Вывести имена и должность только Python разработчиков.
select  Employees.employee_name, roles.role_name 
from employees join roles_employee
on employees.id = roles_employee.employee_id 
join roles
on roles.id = roles_employee.role_id 
where roles.role_name like '%Python%';

--9. Вывести имена и должность всех QA инженеров.
select  Employees.employee_name,  roles.role_name 
from employees join roles_employee
on employees.id = roles_employee.employee_id 
join roles
on roles.id = roles_employee.role_id 
where roles.role_name like '%engineer%';

--10. Вывести имена и должность ручных QA инженеров.
select  Employees.employee_name, employees.id, roles_employee.role_id,roles.role_name 
from employees join roles_employee
on employees.id = roles_employee.employee_id 
join roles
on roles.id = roles_employee.role_id 
where roles.role_name like '%Manual%';

--11. Вывести имена и должность автоматизаторов QA
select  Employees.employee_name,  roles.role_name 
from employees join roles_employee
on employees.id = roles_employee.employee_id 
join roles
on roles.id = roles_employee.role_id 
where roles.role_name like '%Automation QA engineer%';

--12. Вывести имена и зарплаты Junior специалистов
select  Employees.employee_name,  roles.role_name,salary.monthly_salary  
from employees join roles_employee
on employees.id = roles_employee.employee_id 
join roles
on roles.id = roles_employee.role_id 
join employee_salary 
on employees.id = employee_salary.employee_id
join salary
on salary.id = employee_salary.salary_id
where roles.role_name like '%Junior %';

--13. Вывести имена и зарплаты Middle специалистов
select  Employees.employee_name,  roles.role_name, salary.monthly_salary 
from employees join roles_employee
on employees.id = roles_employee.employee_id 
join roles on roles.id = roles_employee.role_id 
join employee_salary on employees.id = employee_salary.employee_id
join salary
on salary.id = employee_salary.salary_id
where roles.role_name like '%Middle %';

--14. Вывести имена и зарплаты Senior специалистов
select Employees.employee_name, roles.role_name, salary.monthly_salary 
from employees join roles_employee 
on employees.id = roles_employee.employee_id 
join roles on roles.id = roles_employee.role_id 
join employee_salary on employees.id = employee_salary.employee_id
join salary
on salary.id = employee_salary.salary_id
where roles.role_name like '%Senior %';

--15. Вывести зарплаты Java разработчиков
select Roles.role_name,  salary.monthly_salary
from Roles join employee_salary
on Roles.id = employee_salary.employee_id 
join salary 
on salary.id = employee_salary.salary_id 
where Roles.role_name like '%Java%';

--16. Вывести зарплаты Python разработчиков
select Roles.role_name,  salary.monthly_salary
from Roles join employee_salary
on Roles.id = employee_salary.employee_id 
join salary 
on salary.id = employee_salary.salary_id 
where Roles.role_name like '%Python%';

--17. Вывести имена и зарплаты Junior Python разработчиков
select  Employees.employee_name,  roles.role_name, salary.monthly_salary  
from employees join roles_employee
on employees.id = roles_employee.employee_id 
join roles
on roles.id = roles_employee.role_id 
join employee_salary 
on employees.id = employee_salary.employee_id
join salary
on salary.id = employee_salary.salary_id
where roles.role_name like '%Junior Python %';

--18. Вывести имена и зарплаты Middle JS разработчиков
select  Employees.employee_name,  roles.role_name, salary.monthly_salary  
from employees join roles_employee
on employees.id = roles_employee.employee_id 
join roles
on roles.id = roles_employee.role_id 
join employee_salary 
on employees.id = employee_salary.employee_id
join salary
on salary.id = employee_salary.salary_id
where roles.role_name like '%Middle JavaScript%';

--19. Вывести имена и зарплаты Senior Java разработчиков
select  Employees.employee_name,  roles.role_name, salary.monthly_salary  
from employees join roles_employee
on employees.id = roles_employee.employee_id 
join roles
on roles.id = roles_employee.role_id 
join employee_salary 
on employees.id = employee_salary.employee_id
join salary
on salary.id = employee_salary.salary_id
where roles.role_name like '%Senior Java %';

--20. Вывести зарплаты Junior QA инженеров
select Roles.role_name,  salary.monthly_salary
from Roles join employee_salary
on Roles.id = employee_salary.employee_id 
join salary 
on salary.id = employee_salary.salary_id 
where Roles.role_name like '%Junior %' and Roles.role_name like '%QA%';

--21. Вывести среднюю зарплату всех Junior специалистов
select Roles.role_name,  salary.monthly_salary
from Roles join employee_salary
on Roles.id = employee_salary.employee_id 
join salary 
on salary.id = employee_salary.salary_id 
where Roles.role_name like '%Junior %'


--22. Вывести сумму зарплат JS разработчиков
--23. Вывести минимальную ЗП QA инженеров
--24. Вывести максимальную ЗП QA инженеров
--25. Вывести количество QA инженеров
--26. Вывести количество Middle специалистов.
--27. Вывести количество разработчиков
--28. Вывести фонд (сумму) зарплаты разработчиков.
--29. Вывести имена, должности и ЗП всех специалистов по возрастанию
--30. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП от 1700 до 2300
--31. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП меньше 2300
--32. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП равна 1100, 1500, 2000
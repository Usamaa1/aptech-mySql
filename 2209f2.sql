create database aptech;
use aptech;

create table department(dep_id int primary key auto_increment, dep_name varchar(20),depLabs int);


drop table department;
drop database aptech;

show columns from department;

insert into department(dep_name, depLabs) values 
('Marketing',450),
('Faculty',467),
('SRO',900);

select * from department;

select * from department where dep_name = 'faculty';

select dep_name,depLabs as departmentLab from department;


create table employees(emp_id int auto_increment primary key, emp_name varchar(50),emp_depart varchar(100));

insert into employees(emp_name,emp_depart) values 
('Mohib','HR'),
('Taihaam','Admin'),
('Ali Ahmed','Gamer'),
('Haseeb','Peon'),
('Hammad','Khoka'),
('Talib','Clerk');

select * from employees;

alter table employees add column dep_id int;


alter table employees add constraint foreign key(dep_id) references department(dep_id); 


update employees set dep_id = 1 where emp_id = 2;

insert into employees(emp_name) values ('Haris');

insert into department(dep_name) values ('Manager Acadamics');
insert into department(dep_name) values ('SRO');


-- JOINS

select 
	employees.emp_id,
	department.dep_id,
	employees.emp_name, 
	department.dep_name 
from employees 
right join department on employees.dep_id = department.dep_id;


select *
from employees 
left join department on employees.dep_id = department.dep_id;


select * from employees as emp1 inner join employees as emp2 on emp1.dep_id = emp2.emp_id;



create table class3(stud_id_name varchar(30) default 'student', stud_id int primary key auto_increment ,stud_name varchar(30),stud_batch varchar(20));
alter table class3 auto_increment = 565;
create table class2(stud_id int primary key auto_increment,stud_name varchar(30),stud_batch varchar(20));

drop table class3;

select concat(stud_id_name, stud_id ) as student_id, stud_name, stud_batch from class3;


insert into class1(stud_name, stud_batch) values 
('Talib','2209E2'),
('Azeem','2209E2'),
('Shazaib','2209E2'),
('Taihaam','2209E2'),
('Amjad','2209E2'),
('Asfar','2209E2');

select * from class1 union select * from class2 order by stud_id;

 

insert into class2(stud_name, stud_batch) values 
('Kamran','2209F2'),
('Mohib','2209F2'),
('Subhan','2209F2'),
('Afnan','2209F2'),
('Ali','2209F2'),
('Zahid','2209F2');


insert into class3(stud_name, stud_batch) values 
('Kamran','2209F2'),
('Mohib','2209F2'),
('Subhan','2209F2'),
('Afnan','2209F2'),
('Ali','2209F2'),
('Zahid','2209F2');

update class3 set stud_name = 'Imran' where stud_id = 565;

select * from class3;


-- AND, OR, NOT Operators

select * from class3 where stud_id_name = 'student' and stud_id = 566;
select * from class3 where not stud_id = 566;
select * from class3 where stud_id_name = 'gsdf' or stud_id = 566;
select * from class3 where stud_id in(566,568);
select * from class3 where stud_id between 567 and 569;


-- wildcard

select * from employees where emp_name like 'A%';
select * from employees where emp_name like '_A%';
select * from employees where emp_name like '%h%';
select * from employees where emp_name like 'h%d';
select * from employees where emp_name like 'h%m%d';
select * from employees where emp_name like '___i%';

select count(emp_name) from employees;
select avg(emp_id) from employees;
select sum(emp_id) from employees;
select min(emp_id) from employees;
select max(emp_id) as 'max_employee' from employees;

select abs('8.999jfkjdsf');
select cos('120');
select mod(5,6);
select sqrt(5);
select curdate();
select current_timestamp();



select emp_name, dep_id from employees group by emp_name;




-- views

create view emp_info as
select emp_name, emp_depart from employees;


select * from emp_info;



-- index

create index employeeName on employees(emp_name);

drop index employeeName on employees;

show index from employees;

select * from employees;


create table class(class_name varchar(100), class_id int primary key);

drop table class;
truncate class;
select * from class;




create table employee (emp_no int primary key,date_of_birth date,first_name varchar(200),
last_name varchar(200),middle_names varchar(200),gender varchar(200),date_of_hiring date,date_of_termination date);

INSERT INTO employee (emp_no,date_of_birth,first_name,last_name,middle_names,gender,date_of_hiring,date_of_termination)
VALUES (10001,'1953-09-02','Georgi','Facello','','M','1986-06-26','2222-01-01'),
(10002,'1964-06-02','Bezalel','Simmel','','F','1985-11-21','2222-01-01'),
(10003,'1959-12-03','Parto','Bamford','','M','1986-08-28','2222-01-01'),
(10004,'1954-05-01','Chirstian','Koblick','','M','1986-12-01','2222-01-01'),
(10005,'1955-01-21','Kyoichi','Maliniak','','M','1989-09-12','2222-01-01'),
(10006,'1953-04-20','Anneke','Preusig','','F','1989-06-02','2222-01-01'),
(10007,'1957-05-23','Tzvetan','Zielinski','','F','1989-02-10','2222-01-01'),
(10008,'1958-02-19','Saniya','Kalloufi','','M','1994-09-15','2222-01-01'),
(10009,'1952-04-19','Sumant','Peac','','F','1985-02-18','2222-01-01'),
(10010,'1963-06-01','Duangkaew','Piveteau','','F','1989-08-24','2222-01-01'),
(10011,'1953-11-07','Mary','Sluis','','F','1990-01-22','2222-01-01'),
(10012,'1960-10-04','Patricio','Bridgland','','M','1992-12-18','2222-01-01'),
(10013,'1963-06-07','Eberhardt','Terkki','','M','1985-10-20','2222-01-01'),
(10014,'1956-02-12','Berni','Genin','','M','1987-03-11','2222-01-01'),
(10015,'1959-08-19','Guoxiang','Nooteboom','','M','1987-07-02','2222-01-01'),
(10016,'1961-05-02','Kazuhito','Cappelletti','','M','1995-01-27','2222-01-01'),
(10017,'1958-07-06','Cristinel','Bouloucos','','F','1993-08-03','2222-01-01'),
(10018,'1954-06-19','Kazuhide','Peha','','F','1987-04-03','2222-01-01'),
(10019,'1953-01-23','Lillian','Haddadi','','M','1999-04-30','2222-01-01'),
(10020,'1952-12-24','Mayuko','Warwick','','M','1991-01-26','2222-01-01'),
(10021,'1960-02-20','Ramzi','Erde','','M','1988-02-10','2222-01-01'),
(10022,'1952-07-08','Shahaf','Famili','','M','1995-08-22','2222-01-01'),
(10023,'1953-09-29','Bojan','Montemayor','','F','1989-12-17','2222-01-01'),
(10024,'1958-09-05','Suzette','Pettey','','F','1997-05-19','2222-01-01'),
(10025,'1958-10-31','Prasadram','Heyers','','M','1987-08-17','2222-01-01'),
(10026,'1953-04-03','Yongqiao','Berztiss','','M','1995-03-20','2222-01-01'),
(10027,'1962-07-10','Divier','Reistad','','F','1989-07-07','2222-01-01'),
(10028,'1963-11-26','Domenick','Tempesti','','M','1991-10-22','2222-01-01'),
(10029,'1956-12-13','Otmar','Herbst','','M','1985-11-20','2222-01-01'),
(10030,'1958-07-14','Elvis','Demeyer','','M','1994-02-17','2222-01-01'),
(10031,'1959-01-27','Karsten','Joslin','','M','1991-09-01','2222-01-01'),
(10032,'1960-08-09','Jeong','Reistad','','F','1990-06-20','2222-01-01'),
(10033,'1956-11-14','Arif','Merlo','','M','1987-03-18','2222-01-01'),
(10034,'1962-12-29','Bader','Swan','','M','1988-09-21','2222-01-01'),
(10035,'1953-02-08','Alain','Chappelet','','M','1988-09-05','2222-01-01'),
(10036,'1959-08-10','Adamantios','Portugali','','M','1992-01-03','2222-01-01'),
(10037,'1963-07-22','Pradeep','Makrucki','','M','1990-12-05','2222-01-01'),
(10038,'1960-07-20','Huan','Lortz','','M','1989-09-20','2222-01-01'),
(10039,'1959-10-01','Alejandro','Brender','','M','1988-01-19','2222-01-01'),
(10040,'1959-09-13','Weiyi','Meriste','','F','1993-02-14','2222-01-01'),
(10041,'1959-08-27','Uri','Lenart','','F','1989-11-12','2222-01-01'),
(10042,'1956-02-26','Magy','Stamatiou','','F','1993-03-21','2222-01-01'),
(10043,'1960-09-19','Yishay','Tzvieli','','M','1990-10-20','2222-01-01'),
(10044,'1961-09-21','Mingsen','Casley','','F','1994-05-21','2222-01-01'),
(10045,'1957-08-14','Moss','Shanbhogue','','M','1989-09-02','2222-01-01'),
(10046,'1960-07-23','Lucien','Rosenbaum','','M','1992-06-20','2222-01-01'),
(10047,'1952-06-29','Zvonko','Nyanchama','','M','1989-03-31','2222-01-01'),
(10048,'1963-07-11','Florian','Syrotiuk','','M','1985-02-24','2222-01-01'),
(10049,'1961-04-24','Basil','Tramer','','F','1992-05-04','2222-01-01'),
(10050,'1958-05-21','Yinghua','Dredge','','M','1990-12-25','2222-01-01'),
(10051,'1953-07-28','Hidefumi','Caine','','M','1992-10-15','2222-01-01'),
(10052,'1961-02-26','Heping','Nitsch','','M','1988-05-21','2222-01-01'),
(10053,'1954-09-13','Sanjiv','Zschoche','','F','1986-02-04','2222-01-01'),
(10054,'1957-04-04','Mayumi','Schueller','','M','1995-03-13','2222-01-01'),
(10055,'1956-06-06','Georgy','Dredge','','M','1992-04-27','2222-01-01'),
(10056,'1961-09-01','Brendon','Bernini','','F','1990-02-01','2222-01-01'),
(10057,'1954-05-30','Ebbe','Callaway','','F','1992-01-15','2222-01-01'),
(10058,'1954-10-01','Berhard','McFarlin','','M','1987-04-13','2222-01-01'),
(10059,'1953-09-19','Alejandro','McAlpine','','F','1991-06-26','2222-01-01'),
(10060,'1961-10-15','Breannda','Billingsley','','M','1987-11-02','2222-01-01'),
(10061,'1962-10-19','Tse','Herber','','M','1985-09-17','2222-01-01'),
(10062,'1961-11-02','Anoosh','Peyn','','M','1991-08-30','2222-01-01'),
(10063,'1952-08-06','Gino','Leonhardt','','F','1989-04-08','2222-01-01'),
(10064,'1959-04-07','Udi','Jansch','','M','1985-11-20','2222-01-01'),
(10065,'1963-04-14','Satosi','Awdeh','','M','1988-05-18','2222-01-01'),
(10066,'1952-11-13','Kwee','Schusler','','M','1986-02-26','2222-01-01'),
(10067,'1953-01-07','Claudi','Stavenow','','M','1987-03-04','2222-01-01'),
(10068,'1962-11-26','Charlene','Brattka','','M','1987-08-07','2222-01-01'),
(10069,'1960-09-06','Margareta','Bierman','','F','1989-11-05','2222-01-01'),
(10070,'1955-08-20','Reuven','Garigliano','','M','1985-10-14','2222-01-01'),
(10071,'1958-01-21','Hisao','Lipner','','M','1987-10-01','2222-01-01'),
(10072,'1952-05-15','Hironoby','Sidou','','F','1988-07-21','2222-01-01'),
(10073,'1954-02-23','Shir','McClurg','','M','1991-12-01','2222-01-01'),
(10074,'1955-08-28','Mokhtar','Bernatsky','','F','1990-08-13','2222-01-01'),
(10075,'1960-03-09','Gao','Dolinsky','','F','1987-03-19','2222-01-01'),
(10076,'1952-06-13','Erez','Ritzmann','','F','1985-07-09','2222-01-01'),
(10077,'1964-04-18','Mona','Azuma','','M','1990-03-02','2222-01-01'),
(10078,'1959-12-25','Danel','Mondadori','','F','1987-05-26','2222-01-01'),
(10079,'1961-10-05','Kshitij','Gils','','F','1986-03-27','2222-01-01'),
(10080,'1957-12-03','Premal','Baek','','M','1985-11-19','2222-01-01'),
(10081,'1960-12-17','Zhongwei','Rosen','','M','1986-10-30','2222-01-01'),
(10082,'1963-09-09','Parviz','Lortz','','M','1990-01-03','2222-01-01'),
(10083,'1959-07-23','Vishv','Zockler','','M','1987-03-31','2222-01-01'),
(10084,'1960-05-25','Tuval','Kalloufi','','M','1995-12-15','2222-01-01'),
(10085,'1962-11-07','Kenroku','Malabarba','','M','1994-04-09','2222-01-01'),
(10086,'1962-11-19','Somnath','Foote','','M','1990-02-16','2222-01-01'),
(10087,'1959-07-23','Xinglin','Eugenio','','F','1986-09-08','2222-01-01'),
(10088,'1954-02-25','Jungsoon','Syrzycki','','F','1988-09-02','2222-01-01'),
(10089,'1963-03-21','Sudharsan','Flasterstein','','F','1986-08-12','2222-01-01'),
(10090,'1961-05-30','Kendra','Hofting','','M','1986-03-14','2222-01-01'),
(10091,'1955-10-04','Amabile','Gomatam','','M','1992-11-18','2222-01-01'),
(10092,'1964-10-18','Valdiodio','Niizuma','','F','1989-09-22','2222-01-01'),
(10093,'1964-06-11','Sailaja','Desikan','','M','1996-11-05','2222-01-01'),
(10094,'1957-05-25','Arumugam','Ossenbruggen','','F','1987-04-18','2222-01-01'),
(10095,'1965-01-03','Hilari','Morton','','M','1986-07-15','2222-01-01'),
(10096,'1954-09-16','Jayson','Mandell','','M','1990-01-14','2222-01-01'),
(10097,'1952-02-27','Remzi','Waschkowski','','M','1990-09-15','2222-01-01'),
(10098,'1961-09-23','Sreekrishna','Servieres','','F','1985-05-13','2222-01-01'),
(10099,'1956-05-25','Valter','Sullins','','F','1988-10-18','2222-01-01'),
(10100,'1953-04-21','Hironobu','Haraldson','','F','1987-09-21','2222-01-01'),
(10101,'1952-04-15','Perla','Heyers','','F','1992-12-28','2222-01-01'),
(10102,'1959-11-04','Paraskevi','Luby','','F','1994-01-26','2222-01-01'),
(10103,'1953-11-26','Akemi','Birch','','M','1986-12-02','2222-01-01'),
(10104,'1961-11-19','Xinyu','Warwick','','M','1987-04-16','2222-01-01'),
(10105,'1962-02-05','Hironoby','Piveteau','','M','1999-03-23','2222-01-01'),
(10106,'1952-08-29','Eben','Aingworth','','M','1990-12-19','2222-01-01'),
(10107,'1956-06-13','Dung','Baca','','F','1994-03-22','2222-01-01'),
(10108,'1952-04-07','Lunjin','Giveon','','M','1986-10-02','2222-01-01'),
(10109,'1958-11-25','Mariusz','Prampolini','','F','1993-06-16','2222-01-01'),
(10110,'1957-03-07','Xuejia','Ullian','','F','1986-08-22','2222-01-01'),
(10111,'1963-08-29','Hugo','Rosis','','F','1988-06-19','2222-01-01'),
(10112,'1963-08-13','Yuichiro','Swick','','F','1985-10-08','2222-01-01'),
(10113,'1963-11-13','Jaewon','Syrzycki','','M','1989-12-24','2222-01-01'),
(10114,'1957-02-16','Munir','Demeyer','','F','1992-07-17','2222-01-01'),
(10115,'1964-12-25','Chikara','Rissland','','M','1986-01-23','2222-01-01'),
(10116,'1955-08-26','Dayanand','Czap','','F','1985-05-28','2222-01-01'),
(10117,'1961-10-24','Kiyotoshi','Blokdijk','','F','1990-05-28','2222-01-01'),
(10118,'1957-03-29','Zhonghui','Zyda','','F','1990-09-13','2222-01-01'),
(10119,'1960-12-01','Domenick','Peltason','','M','1986-03-14','2222-01-01'),
(10120,'1960-03-26','Armond','Fairtlough','','F','1996-07-06','2222-01-01'),
(10121,'1962-07-14','Guoxiang','Ramsay','','M','1989-05-03','2222-01-01'),
(10122,'1965-01-19','Ohad','Esposito','','M','1992-12-23','2222-01-01'),
(10123,'1962-05-12','Hinrich','Randi','','M','1993-01-15','2222-01-01'),
(10124,'1962-05-23','Geraldo','Marwedel','','M','1991-09-05','2222-01-01'),
(10125,'1957-09-13','Syozo','Hiltgen','','F','1990-10-26','2222-01-01'),
(10126,'1954-08-07','Kayoko','Valtorta','','M','1985-09-08','2222-01-01'),
(10127,'1952-02-24','Subir','Baja','','F','1989-01-14','2222-01-01'),
(10128,'1958-02-15','Babette','Lamba','','F','1988-06-06','2222-01-01'),
(10129,'1955-12-02','Armond','Peir','','M','1985-12-10','2222-01-01'),
(10130,'1955-04-27','Nishit','Casperson','','M','1988-06-21','2222-01-01'),
(10131,'1952-02-19','Magdalena','Eldridge','','M','1994-11-17','2222-01-01'),
(10132,'1956-12-15','Ayakannu','Skrikant','','M','1994-10-30','2222-01-01'),
(10133,'1963-12-12','Giri','Isaak','','M','1985-12-15','2222-01-01'),
(10134,'1953-04-15','Diederik','Siprelle','','M','1987-12-12','2222-01-01'),
(10135,'1956-12-23','Nathan','Monkewich','','M','1988-02-19','2222-01-01'),
(10136,'1961-09-14','Zissis','Pintelas','','M','1986-02-11','2222-01-01'),
(10137,'1959-07-30','Maren','Hutton','','M','1985-02-18','2222-01-01'),
(10138,'1955-04-24','Perry','Shimshoni','','M','1986-09-18','2222-01-01'),
(10139,'1963-03-03','Ewing','Foong','','F','1998-03-15','2222-01-01'),
(10140,'1957-03-11','Yucel','Auria','','F','1991-03-14','2222-01-01'),
(10141,'1960-01-17','Shahaf','Ishibashi','','F','1993-05-06','2222-01-01'),
(10142,'1956-08-29','Tzvetan','Hettesheimer','','M','1993-10-28','2222-01-01'),
(10143,'1961-07-16','Sakthirel','Bakhtari','','M','1988-09-30','2222-01-01'),
(10144,'1959-06-17','Marla','Brendel','','M','1985-10-14','2222-01-01'),
(10145,'1956-03-30','Akemi','Esposito','','F','1987-08-01','2222-01-01'),
(10146,'1959-01-12','Chenyi','Syang','','M','1988-06-28','2222-01-01'),
(10147,'1964-10-13','Kazuhito','Encarnacion','','M','1986-08-21','2222-01-01'),
(10148,'1957-10-04','Douadi','Azumi','','M','1995-10-10','2222-01-01'),
(10149,'1953-05-20','Xiadong','Perry','','F','1986-11-05','2222-01-01'),
(10150,'1955-01-29','Zhenbing','Perng','','F','1986-11-16','2222-01-01');

select * from employee;



-- subqueries



create table customer (customer_id int primary key auto_increment, customer_name varchar(100), product_name varchar(100), price int);

select * from customer;
select avg(price) from customer;

select customer_name, product_name, price from customer where price >= (select avg(price) from customer);




-- partitioning

create table orders(
order_id int primary key auto_increment,
order_date date,
customer_name varchar(200),
customer_city varchar(200),
order_amount int
);

select * from orders;













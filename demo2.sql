create database university;
use university;

create table departments(dep_id int primary key not null auto_increment , dep_name varchar(50), dep_building varchar(100));

show columns from departments;

drop database university;
drop table departments;

alter table departments add column dep_rooms int;

insert into departments(dep_name,dep_building) values 
('Computing Department','A'),
('Neurology Department','B'),
('Aeuronautics Department','C');

select * from departments;
select * from departments where dep_building = 'B';
select * from departments where dep_id <= 2;
select dep_name as department_Name from departments;

alter table departments change dep_name  department_name varchar(10);




create table faculty(faculty_id int auto_increment primary key, faculty_name varchar(80), hourly_pay float, hire_date varchar(10));

 drop table faculty; 

insert into faculty(faculty_name, hourly_pay, hire_date) values 
	('Ather Kamal', 56.30, '2023-05-23'),
    ('Sameer Khan', 45.00, '2022-02-26'),
    ('Zahid Sabri', 23.45, '2021-02-20'),
    ('Hina Safdar', 87.90, '2020-06-18'),
    ('Lubna Asfer', 23.80, '2022-03-19'),
    ('Talib Uddin', 55.00, '2021-08-21'),
    ('Owais Imam', 70.90, '2023-03-27'),
    ('Basit Feroz', 23.50, '2022-09-25'),
    ('Momina Imtiaz', 120.00, '2023-04-12');

select * from faculty;


update faculty set hourly_pay = 190.95 where faculty_id = 8;
update faculty set hourly_pay = 190.95 where faculty_id = 9;
delete from faculty where faculty_id = 8;
delete from faculty where faculty_id = 6;

set autocommit = off;

commit;

rollback;



-- current date and time methods 

create table waqt(curr_date date, curr_time time, curr_dateTime datetime);

insert into waqt values (current_date(),current_time(),now());
insert into waqt values (current_date() + 4,current_time(),now());

select * from waqt;




create table faculty(
faculty_id int auto_increment primary key, 
faculty_name varchar(80), 
hourly_pay float, 
hire_date varchar(10),
constraint check_hourly_pay check (hourly_pay >= 10)
);

insert into faculty(faculty_name, hourly_pay, hire_date) values 
    ('Owais Imam', 70.90, '2023-03-27'),
    ('Basit Feroz', 23.50, '2022-09-25');

insert into faculty(faculty_name, hourly_pay, hire_date) values 
    ('Imam Waseem', 5.90, '2023-03-27');
select * from faculty;

-- alter table faculty drop constraint check_hourly_pay;

alter table faculty auto_increment = 5;

alter table faculty alter faculty_name set default 'Usama Riaz';
insert into faculty(hourly_pay, hire_date) values 
    (5.90, '2023-03-27');
    


create table trans(trans_id int primary key, trans_amount decimal(5), trans_date datetime default now());

drop table trans;

insert into trans(trans_id,trans_amount) values 
(4,5.6),
(5,6.6),
(6,2.6),
(7,3.6);


select * from trans;

select * from faculty;

drop table trans;


create table customer (customer_id int primary key auto_increment, customer_name varchar(60), product_name varchar(60));

insert into customer (customer_name, product_name) values 
		('Henry','Keyboard'),
		('Mark','LCD'),
		('Eren','Mouse'),
		('Hollow','Monitor');
        

select * from customer;




create table transac (trans_id int primary key, trans_amount decimal, customer_id int, foreign key(customer_id) references customer(customer_id));


alter table transac drop foreign key transac_ibfk_1;


alter table transac add constraint foreign key(customer_id) references customer(customer_id);


insert into transac(trans_id, trans_amount, customer_id) value 
		(1,4500,2),
		(2,2300,1),
		(3,5600,4);

        




select * from transac;


select * from transac inner join customer on transac.customer_id = customer.customer_id;
select * from transac right join customer on transac.customer_id = customer.customer_id;
select * from transac left join customer on transac.customer_id = customer.customer_id;



-- functions of mysql


select concat(customer_name, product_name) as 'customer with product' from customer;



-- Logical operators

select * from transac where trans_id = 2 and trans_amount >= 2000;
select * from transac where trans_id = 2 or customer_id = 2;
select * from transac where not trans_id = 2 and not customer_id = 2;
select * from transac where not trans_id in (1,3);
select * from transac where trans_id between 2 and 3;


 



-- union operator

select * from customer
union
select * from transac;
    
    
alter table customer add column product_id int;


select * from customer as c1 inner join customer as c2 on c1.customer_id = c2.product_id;



select c1.customer_name, c1.product_name,
	c2.customer_name as buyer_name, c2.product_name as buyer_product
from customer as c1 inner join customer as c2 on c1.customer_id = c2.product_id;


-- creating views

create view sales as
select customer_name, product_name from customer;


select * from sales;



-- subquries 

alter table customer add column product_price int;

select * from customer;

select avg(product_price) from customer;


select * from customer where product_price > (select avg(product_price) from customer);

select customer_name, product_name, (select avg(product_price) from customer) as avg_price from customer;



-- Math operations/methods
select cot(60);



-- group by

select * from customer;

-- select customer_name, product_name, max(product_purchased_date) from customer group by product_purchased_date;
-- select customer_name, product_name, sum(product_price) from customer group by product_price having product_name = 'LCD';
-- select customer_name, product_name, sum(product_price) from customer group by product_price with rollup;
select product_name, count(product_id) from customer group by product_name;
select product_name, count(product_id) from customer group by product_name having product_name = 'LCD';
select product_name, min(product_id) from customer group by product_name with rollup;

alter table customer add column product_purchased_date date;

select customer_name, product_name from customer group by product_id;



-- Partitioning

create table orders
(
order_id int,
order_date date,
customer_name varchar(100),
customer_city varchar(100),
order_amount int
)
partition by range (year (order_date))(
partition p0 values less than (2019),
partition p1 values less than (2020),
partition p2 values less than (2021),
partition p3 values less than (2022));

INSERT into Orders VALUES 
(101, '2021-12-19', 'Mark', 'Sydney', 15800),
(102, '2021-12-09', 'Steve', 'Brisbane', 50000),
(103, '2020-10-12', 'Stewart', 'Melbourne', 12344),
(104, '2020-08-04', 'Mathew', 'Brisbane', 22345), 
(105, '2019-11-12', 'Smith', 'Adelaide', 13455), 
(106, '2019-05-02', 'Adam', 'Canberra', 14233); 


select * from orders partition (p1);

-- SHOW PARTITIONS FROM orders; 
SELECT 
  PARTITION_NAME, SUBPARTITION_NAME, PARTITION_ORDINAL_POSITION, SUBPARTITION_ORDINAL_POSITION, PARTITION_METHOD, 
  SUBPARTITION_METHOD, PARTITION_EXPRESSION, SUBPARTITION_EXPRESSION, TABLE_ROWS
FROM 
  INFORMATION_SCHEMA.PARTITIONS
WHERE 
  TABLE_NAME = 'orders';
  
  
  
  
-- if statement
show profile;

explain select * from customer;

select customer_name, product_name, product_price, 
if(product_price >= 500, 'too high price','too low price') as priceValue
from customer;



-- INDEXES


create table students(stud_id int primary key auto_increment, stud_name varchar(30), 
stud_batch varchar(30), stud_contact int, stud_address varchar(150));

INSERT INTO students (stud_name, stud_batch, stud_contact, stud_address) VALUES
('John Doe 1', 'Batch A', 1234567890, '123 Main Street, City A'),
('Jane Smith 2', 'Batch B', 276543210, '456 Elm Street, City B'),
('Michael Johnson 3', 'Batch C', 1425555555, '789 Oak Street, City C'),
('Emily Brown 4', 'Batch A', 111111111, '567 Maple Ave, City D'),
('William Lee 5', 'Batch B', 222222222, '890 Pine Blvd, City E'),
('Olivia Wilson 6', 'Batch C', 333333333, '456 Oak Lane, City F'),
('James Davis 7', 'Batch A', 444444444, '789 Pine Street, City G'),
('Sophia Martin 8', 'Batch B', 555555555, '234 Elm Ave, City H'),
('Benjamin Anderson 9', 'Batch C', 666666666, '567 Maple Lane, City I'),
('Emma Rodriguez 10', 'Batch A', 777777777, '890 Oak Street, City J');

select * from students;

truncate students;


create index student_batch on students(stud_batch);

show index from students;

explain select * from students;







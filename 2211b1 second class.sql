use 2211b1;

create table first_table(id int auto_increment primary key, name varchar(200), email varchar(200));

insert into personInfo(name, email) values (
'Jafri','jafri@gmail.com');

select * from personInfo;

delete from personInfo where id >= 20 And id <=23 ; 
delete from personInfo where id = 20 or id = 24 ;

truncate table personInfo;


rename table first_table to personInfo;


select min(id),name,email from personInfo;
select max(id),name,email from personInfo;
select avg(id) from personInfo;
select count(id) from personInfo;


drop table personInfo;



select cos(60);
select cot(60);
select tan(60);
select sin(60);
select abs(45.23);
select sqrt(225);
select round(45.2);
select rand();
select pow(45,5);
select ceil(45.1);
select floor(45.9);




create table class(classId int auto_increment primary key, className varchar(200), classTime time, classStartDate date);

insert into class(className, classTime, classstartDAte) values 
('Matric', current_time(), current_date());


select * from class;




create table employees(emp_id int auto_increment primary key, emp_name varchar(200), emp_designation varchar(200));

insert into employees(emp_name, emp_designation) values ('Arif','IT Manager'),
('Zahid','Peon'),
('Asfar','CEO'),
('Abid','IT Manager'),
('Ayesha','Accounts Manager'),
('Shakir','CEO'),
('Zafar','Peon'),
('Hina','Peon'),
('Haris','Office Boy'),
('Hafsa','HR');


select distinct emp_designation from employees;

-- select * from employees where emp_designation = 'It manager';



select * from employees;


delete from employees where emp_id = 7;



insert into employees(emp_name, emp_designation) values ('Amjad','IT Manager');




create table teacher(teacher_id int auto_increment primary key, teacher_name varchar(200), subject varchar(200));


select * from teacher;


create table students(std_id int auto_increment primary key, std_name varchar(200), teacher_id int, foreign key(teacher_id) references teacher(teacher_id));

select * from students;


insert into students(std_name, teacher_id) values('Ayesha',5);


select * from students inner join teacher where students.teacher_id = teacher.teacher_id;
select * from students left join teacher on students.teacher_id = teacher.teacher_id;
select * from students right join teacher on students.teacher_id = teacher.teacher_id;
select std_name, teacher_name,subject from students right join teacher on students.teacher_id = teacher.teacher_id;


select * from students
union
select * from teacher;


create table BBA_Class(class_name varchar(200), class_room varchar(200));
create table BCom_Class(class_name varchar(200), class_room varchar(200));

select * from bba_class
union
select * from bcom_class;


insert into bba_class values ('Lab 2', '23'),('Lab 1', '54'),('Lab 8', '21');
insert into bcom_class values ('Lab 5', '95'),('Lab 4', '94'),('Lab 7', '28');




create table students1(std_id int auto_increment primary key, std_name varchar(200), std_class varchar(200), std_city varchar(200), std_marks int);


select * from students1;


alter table students1 add column std_lastname varchar(200);


-- concat function

select concat(std_name,' ', std_lastname) as fullName from students1;


-- like operator

select * from students1 where std_name like 'a%';
select * from students1 where std_name like '%a';
select * from students1 where std_name like '%b%';
select * from students1 where std_name like 'a_i%';
select * from students1 where std_name like 'a___d';
select * from students1 where std_name like 's%f';
select * from students1 where std_name like '_m__d';


-- group by

select * from students1 limit 3;

select std_city, count(std_name) as std_count from students1 group by std_city having std_city = 'Islamabad'; 




select * from students1;


delete from students1 where std_id = 5;

set autocommit = off;

commit;

rollback;


-- conditional operators 


select * from students1 where std_class = 9 and std_city = 'karachi';
select * from students1 where std_class = 10 and std_city != 'karachi';
select * from students1 where std_class = 9 or std_city = 'Faislabad';




select std_name, std_class, std_city, std_marks, if (std_marks > 700, 'Good Performance','Need Improvement') as Remarks from students1;













































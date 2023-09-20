create database g3_batch;
use g3_batch;
create table student_info(std_name varchar(50), std_id int, std_course varchar(100));

show columns from student_info;

insert into student_info(std_name,std_id, std_course)value ('bilal',23,' softer '),(' saqib ',25,' math ');


insert into student_info value ('aleena', 50,'computer'),('haris',60,'chemical');

select * from student_info;

 drop table student_info;
 
 alter table student_info add column marks int;
alter table student_info drop column std_course;


alter table student_info rename student_information;

select std_id,std_name as studentname from student_information;

select * from student_information where std_id <= 50;

select * from student_information where std_name in ('bilal','saqib');

select * from student_information where std_id between 23 and 25;

select * from student_information where std_name like 'a__';
select * from student_information where std_name like 'i%';
select * from student_information where std_name like '%l';
select * from student_information where std_name like 'a%';
select * from student_information where std_name like '%l%';

select * from student_information order by std_id desc;

select count(std_id) from student_information;
select min(std_id) from student_information;
select max(std_id) from student_information;
select sum(std_id) from student_information;
select avg(std_id) from student_information;

create table students(std_id  int primary key auto_increment, std_name varchar(50), std_contact int unique, std_nic varchar(15) unique);

drop table student_info;

insert into students(std_name, std_contact,std_nic) value
('Bilal',315257968,'42402-6783273-5'),
('yawar',348568982,'42403-6788223-3'),
('mehak',355555579,'42404-5555555-2');

truncate table students;

select * from students;




create table faculty(fac_id int primary key auto_increment, fac_name varchar(30), subject varchar(30));

select * from faculty;

drop table faculty;

insert into faculty(fac_name, subject) values
('Mr Tahir','seo'),
('Mr ali imran', 'data analyst'),
('Mr zahid', 'programming fundamental'),
('Mr Ashraf', 'sql analyat');

alter table faculty add column std_id int;

alter table faculty add constraint foreign key(std_id) references students(std_id);

update faculty set std_id = 10 where fac_id = 4;

select faculty.fac_name, faculty.subject, students.std_name from 
faculty inner join students on faculty.std_ = students.std_id;

select * from
.


 
faculty inner join  students on faculty.std_id =students.std_id;
  select* from faculty;





























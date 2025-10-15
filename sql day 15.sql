-- constraints -- constraints are rules and regulations which don,t allow invalid data entry in the table.
create database devdev123;
use devdev123;
create table test(id int);
insert into test values(10),(11),(10),(null);
select count(*),count(id) from test;

create table test2(id int not null);
insert into test2 values(10),(11),(12),(13);
insert into test2 value (null);  -- giving error becoz of null value
select count(*),count(id) from test;


create table test3(id int unique);
insert into test3 values (10),(11),(12),(13);


create table test4(id int,gender varchar(20));
insert into test4 values(10,'male');

create table test5(id int,gender varchar(20) default 'male'); -- default set 'male'
insert into test5(id)
 values(11);
select * from test5;


create table test6 (id int check(id>5),gender varchar(20));
insert into test6(id,gender)
values(11,'male');
insert into test6(id) values(4); -- giving error
select * from test6;

create table test7(id int primary key not null , gender varchar(20));
insert into test7(id,gender)
values(1,'male');
insert into test7(id,gender)
values (2,'male');

create table test8(id int primary key , gender varchar(20));
insert into test8(id,gender)
values(1,'male');
insert into test8(id,gender)
values (1,'male');
insert into test8(id,gender)
values(null,'male');

use devdev123;
create table employees6(emp_id int auto_increment,
emp_email varchar(20),
gender varchar(30),
constraint d_emp primary key (emp_id),
constraint unique_mail unique (emp_email),
constraint gender_check5 check (gender in ('male','female')
));
select * from employees6;
insert into employees6(emp_id,emp_email,gender)
values('dklsgnneo@gmail.com','male'),
('kskhbfwifif@gmail,com','female');

CREATE TABLE employees10 (
  emp_id INT  auto_increment PRIMARY KEY,
  emp_email VARCHAR(50),
  gender VARCHAR(30)
);

INSERT INTO employees10 (emp_email, gender)
VALUES ('alice@mail.com', 'biology'),
       ('bob@mail.com', 'physics');
insert into employees10(emp_email,gender)
values('sjfbhewifb@gmail.com','chemistry'),
('sjfbhewibiwb@gmail.com','hindi');

       
select * from employees10;
use devdev123;

create table employees9(emp_id int auto_increment,
emp_email varchar(20),
gender varchar(30),
constraint d_emp primary key (emp_id),
constraint unique_mail unique (emp_email),
constraint gender_check6 check (gender in ('male','female')
));

insert into employees9(emp_email,gender)
values('sjfb@gmail.com','male'),
('sjfbh@gmail.com','female');

select * from employees9;


-- create two table 
-- 1- employees where employee id will primary key
-- 2 
-- 3 employee email should be unique key ko constraint name bhi dena hai
-- 4 department id will foreign key
-- create also table department
-- department id - unique and
-- department_name - check constraint (department should be biology,physics')
-- in the department_ID COLUMN tABLE ALSO TRY TO INSERT NULL VALUE IN DEPARTMENT ID COLUMN

use sam123;
create table employee0(emp_id int,
emp_name char(20),
emp_email varchar(30) not null,
dept_id int,
 constraint e_id primary key(emp_id),
 constraint emp_mail unique(emp_email),
 constraint dept_id0 foreign key employee0(dept_id) references department(dept_id));
 
 insert into employee0(emp_id,emp_name,emp_email,dept_id)
 values(1,'dev','erhehhdh@gmail.com',1),
 (2,'sam','gegignefai@12gmail.com',1),
 (3,'alic','fjwbfufbufebf@gmail.com',2),
 (4,'bob','fjbwfiaewbg@gmail.com',2),
 (5,'alina','lkfhewfhwefe@gmail.com',1),
 (6,'shreya','wkjbfwisbf@gmail.com',2);
 
 select * from employee0;
-- learning assignment varchar vs char data types
-- float and double data type 
-- date-time and timestamp
-- 
use sam123;
create table department (dept_id int ,
dept_name varchar(20),
constraint dept_c unique (dept_id),
constraint dept_n check (dept_name in('biology','physics')));

insert into department(dept_id,dept_name)
values(1,'biology'),
(2,'physics');

select * from department as d;
select * from employee0 as e;

select e1.emp_name,e1.dept_id,e2.emp_name,e2.dept_id from employee0 as e1
join employee0 as e2 on e1.emp_id=e2.dept_id AND e1.emp_name=e2.emp_name;


select min(e.emp_name),d.dept_name from employee0 as e
join department as d on d.dept_id=e.dept_id group by d.dept_name;


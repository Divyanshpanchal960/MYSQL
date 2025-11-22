-- create table employee there are four attributes id,name,salary,date_of join 

use sakila;
create table employees30(id int,
name varchar(20),salary float,date_of_join date);

select * from employees30;
insert into employees30(id,name,salary,date_of_join) values
(1,'divyansh',40000,'2024-10-02'),
(2,'sparshi',30000,'2024-12-04'),
(3,'mayuri',35000,'2023-10-05'); 
UPDATE employees30
SET id = salary;
-- find 2nd highest salary;
select max(salary) from employees30 where salary<(select max(salary) from employees30);
-- find Employees whose salary is same as employees who joined before 2024
select * from employees30;
select name,salary,date_of_join from employees30 where year(salary)<2024;
select name,salary,date_of_join from employees30 where salary in(select salary from employees30 where year(date_of_join)<2024);
update employees30 set id=salary;
select * from employees30;
-- replace the column id with salary
update employees30 set id=salary;
update employees30 set salary=id;
update employees30 set id='1' where name='divyansh';

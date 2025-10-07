-- when in a join a table join itself called self join
drop database if exists regex123;

create database regex123;
use regex123;

CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    name VARCHAR(100),
    manager_id INT,
    FOREIGN KEY (manager_id) REFERENCES employees(employee_id)
);


INSERT INTO employees (employee_id, name, manager_id) VALUES
(1, 'Alice', NULL),       -- CEO
(2, 'Bob', 1),            -- VP of Sales
(3, 'Carol', 1),          -- VP of Engineering
(4, 'David', 2),          -- Sales Manager 1
(5, 'Eve', 2),            -- Sales Manager 2
(6, 'Frank', 3),          -- Engineering Manager 1
(7, 'Grace', 3),          -- Engineering Manager 2
(8, 'Heidi', 4),          -- Salesperson under David
(9, 'Ivan', 4),           -- Salesperson under David
(10, 'Judy', 5),          -- Salesperson under Eve
(11, 'Mallory', 6),       -- Engineer under Frank
(12, 'Niaj', 6),          -- Engineer under Frank
(13, 'Olivia', 7),        -- Engineer under Grace
(14, 'Peggy', 7),         -- Engineer under Grace
(15, 'Trent', 3);         -- Tech Lead under Carol (no direct reports)

 
select * from employees as emp;
select emp.employee_id,emp.name,emp.manager_id,manager.employee_id,manager.name as mgr_name from employees as emp
join employees as manager on emp.manager_id = manager.employee_id where manager.name='bob';

select emp.employee_id,emp.name,emp.manager_id,manager.name,manager.employee_id from employees as emp
join employees as manager where emp.manager_id=manager.employee_id;

select emp.employee_id,emp.name,emp.manager_id,manager.employee_id,manager.name as 
mgrname from employees as emp
join employees as manager
where emp.manager_id = manager.employee_id;

-- natural join
create database  regex1234;
use regex123;
create table product(pid  int,  pname  varchar(20), price int);
insert into product values(100,'iphone',4000), (101,'mi tv', 3000),
(102,'fridge',5000), (103,'cover',500);


create table orders( orderid int, city varchar(20), productid int);
insert into orders values(994,'jaipur', 100),(995,'goa',102), (996,'J&K', 100), (997,'japan',102),
(998,'bhutan', 110);

select * from product as prd;
select * from orders as ord;
select prd.pname,prd.price,prd.pid,ord.orderid,ord.city from product as prd
cross join orders as ord on prd.pid= ord.productid; 
alter table orders rename column pid to productid;

select * from orders as ord;
select * from product as prd;
-- cross join
select prd.pid,prd.price,ord.productid,ord.city from product as prd
cross join orders as ord;
select prd.pid,prd.price,prd.pname,ord.productid,ord.city from product as prd
inner join orders as ord on prd.pid=ord.productid;
select prd.pid,prd.price,prd.pname,ord.productid,ord.city from product as prd
inner 
join orders as ord;
select * from product as prd;
select * from orders as ord;
alter table orders rename column productid to pid; 
-- comman column so working as inner join
select prd.pid,prd.price,ord.pid,ord.city from product as prd 
natural join orders as ord;



-- natural join
-- it is a kind of join which in comman name of column


use sakila;
select * from actor as act;
select * from film_actor as fil;
select * from film as f;
select act.actor_id,act.first_name,fil.film_id from actor as act
inner join film_actor as fil on act.actor_id=fil.actor_id;

select act.actor_id,act.first_name,f.film_id,f.title,fil.actor_id 
from film as f
inner join film_actor as fil inner join actor as act 
on f.film_id = fil.film_id and act.actor_id=fil.actor_id;





select * from film as f;
select act.actor_id,act.first_name,fil.film_id from actor as act
inner join film_actor as fil on act.actor_id=fil.actor_id;

select f.film_id,f.title,fil.actor_id,act.first_name,act.actor_id from film as f
inner join film_actor as fil inner join actor as act on f.film_id=fil.film_id and act.actor_id= fil.actor_id
order by act.actor_id;

-- join in actor and film_actor basis of actor_id
-- join film_actor and film (film-id)

select act.actor_id,act.first_name,fil.film_id,f.title,fil.actor_id 
from actor as act 
join film_actor as fil join film as f 
on act.actor_id =fil.actor_id and fil.film_id= f.film_id
order by act.actor_id asc;





-- what is subquery and what is single row sub query

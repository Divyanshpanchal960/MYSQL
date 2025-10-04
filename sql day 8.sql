use regex123;
select * from product as prd;
select * from orders as ord;
update  orders set productid=101 where orderid=995;

select prd.pid,prd.pname,prd.price,orders.city from product as prd
join orders where prd.pid=orders.productid;

select prd.pid,prd.pname,prd.price,orders.city from product as prd
inner join orders where prd.pid=orders.productid;


select orders.city,orders.productid,product.pid,product.pname,product.price from orders
left join product on  orders.productid=product.pid;

select orders.city,orders.productid,product.pid,product.pname,product.price from orders
right join product on  orders.productid=product.pid;
select  * from product;
select * from orders;

select product.pid,product.pname,product.price,orders.city,orders.productid 
from product 
left join orders on product.pid=orders.productid;  

use sakila;
select * from actor as act;
select * from film_actor as fil;
select count(actor_id), count(distinct actor_id) from actor;

select act.actor_id,act.first_name,fil.film_id,fil.actor_id from actor as act
join film_actor as fil on act.actor_id = fil.actor_id;

drop database regex123;
create database regex123;

use regex123;
CREATE TABLE Student (
    StudentID INT PRIMARY KEY,
    StudentName VARCHAR(50)
);

CREATE TABLE Enrollment (
    EnrollmentID INT PRIMARY KEY,
    StudentID INT,
    CourseName VARCHAR(50),
    FOREIGN KEY (StudentID) REFERENCES Student(StudentID)
);


INSERT INTO Student (StudentID, StudentName) VALUES
(1, 'Alice'),
(2, 'Bob'),
(3, 'Charlie'),
(4, 'David'),
(5, 'Eva'),
(6, 'Frank'),
(7, 'Grace'),
(8, 'Helen'),
(9, 'Ian'),
(10, 'Jack');


INSERT INTO Enrollment (EnrollmentID, StudentID, CourseName) VALUES
(101, 1, 'Math'),
(102, 2, 'Physics'),
(103, 3, 'Chemistry'),
(104, 1, 'English'),
(105, 5, 'Biology'),
(106, 7, 'History'),
(107, 10, 'Math');

select * from student as s;
select * from enrollment as e;

select s.studentid,s.studentname,e.studentid,e.coursename,e.enrollmentid from student as s
left join enrollment as e on s.studentid=e.studentid where enrollmentid is null;

select s.studentid,s.studentname,e.studentid,e.coursename,e.enrollmentid from student as s
inner join enrollment as e on s.studentid=e.studentid;

select s.studentid,s.studentname,e.studentid,e.coursename,e.enrollmentid from student as s
right join enrollment as e on s.studentid=e.studentid;

select s.studentid,s.studentname,e.studentid,e.coursename,e.enrollmentid from student as s
left join enrollment as e on s.studentid=e.studentid;

select * from student as s;
select * from enrollment as e;
select s.studentid,s.studentname,count(e.enrollmentid),e.studentid,e.coursename from student as s
inner join enrollment as e on s.studentid = e.studentid group by enrollmentid order by s.studentid;
-- chapter 6 joins 
select s.studentname,e.coursename,e.enrollmentid from student as s 
inner join enrollment as e on s.studentid=e.studentid where e.coursename='math';

select s.studentname,e.coursename from student as s
inner join enrollment as e on s.studentid = e.studentid where e.coursename='math';

select s.studentname,e.coursename from student as s
inner join enrollment as e on s.studentid=e.studentid where e.coursename IN ('chemistry','physics');
select * from student;
select * from enrollment;
select s.studentname,count(e.enrollmentid) from student as s
inner join enrollment as e on s.studentid=e.studentid group by s.studentname;

select s.studentname,count(e.enrollmentid) from student as s
inner join enrollment as e on s.studentid=e.studentid group by s.studentname having count(e.enrollmentid)>=1;
 
 select s.studentname,e.coursename from student as s
 join enrollment as e on s.studentid=e.studentid order by s.studentname;
 select * from enrollment;
 select s.studentname,e.coursename,e.enrollmentid from student as s
 join enrollment as e on s.studentid = e.studentid order by e.coursename,studentname;
 
 select s.studentname,e.coursename,count(e.enrollmentid) as total_courses from student as s
  join enrollment as e on s.studentid=e.studentid where s.studentname like 'A%' group by e.enrollmentid;
  
  select s.studentname,e.coursename,e.enrollmentid from student as s
  join enrollment as e on s.studentid=e.studentid where e.coursename not like 'math'; 
  select * from student;
  select * from enrollment;
  
  select s.studentname,count(e.enrollmentid) from student as s
  join enrollment as e on s.studentid=e.studentid group by s.studentname having count(e.enrollmentid)>=1;
  
  select s.studentname,e.coursename from student as s
  join enrollment as e on s.studentid=e.studentid where e.coursename like 'c%';

select s.studentname,count(e.enrollmentid) from student as s
join enrollment as e on s.studentid=e.studentid where e.coursename like '%h%' group by s.studentname having count(e.enrollmentid); 


select s.studentname,e.coursename, count(e.enrollmentid) as total_courses_with_h
from student as s
join enrollment as e on s.studentid = e.studentid
where e.coursename like '%h%'
group by s.studentname,e.coursename;

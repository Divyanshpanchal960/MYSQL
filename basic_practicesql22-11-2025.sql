create database abcd;
use abcd;
CREATE TABLE student (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(50),
    age INT,
    class VARCHAR(10)
);
CREATE TABLE student_details (
    detail_id INT PRIMARY KEY,
    student_id INT,
    address VARCHAR(100),
    city VARCHAR(50),
    phone VARCHAR(15),
    FOREIGN KEY (student_id) REFERENCES student(student_id)
);

INSERT INTO student VALUES
(1, 'Divyansh', 20, 'BCA'),
(2, 'Sparshi', 19, 'BBA'),
(3, 'Mayuri', 21, 'BCA'),
(4, 'Aditya', 22, 'B.Tech');

INSERT INTO student_details VALUES
(101, 1, 'MG Road', 'Udaipur', '9876543210'),
(102, 2, 'Shastri Nagar', 'Jaipur', '9123456780'),
(103, 3, 'City Center', 'Banswara', '9988776655'),
(104, 4, 'Sector 14', 'Udaipur', '9090909090');
select * from student;
select * from student_details;
-- add a new column email to the student table.
select * from student;
alter table student add column email varchar(30);
alter table student modify column email varchar(30)  unique;
-- 2️⃣ Modify the datatype of phone in student_details to BIGINT.
alter table student_details modify column phone bigint; 
describe student_details;
-- 3️⃣ Rename column class in student table to course.
alter table student rename column class to course; 
-- 4️⃣ Delete the column city from student_details.
alter table student_details drop column city;
select * from student_details;
-- 5️⃣ Create a new table student_marks with columns: id, student_id, marks.
select * from student;
select * from student_details;
use abcd;
create table student_marks (id int ,
student_id int,
marks float ,
foreign key(student_id) references student(student_id));
select * from student_marks;

-- 6️⃣ Drop the table student_marks.
drop table  student_marks;
-- 7️⃣ Rename table student_details to student_info.
alter table student_details rename student_info;
-- 8️⃣ Add a NOT NULL constraint on student_name.
select * from student;
alter table student modify  student_name varchar(20) not null;
-- 9️⃣ Add a UNIQUE constraint on phone in student_details.
alter table student_info modify phone bigint unique;
-- 🔟 Truncate the student_details table.
truncate table student_info;
select * from student_info;

-- Insert a new student with your name and details.
select * from student;
insert into student(student_id,student_name,age,class) values
(5,'nikhil',26,'BSC'),
(6,'NILESH',26,'BSC'),
(7,'RAHUL',27,'BA');
-- 2️⃣ Update Mayuri’s address to “Sadar Bazar”.
SELECT * FROM STUDENT_DETAILS;
UPDATE STUDENT_DETAILS SET ADDRESS='SADAR BAZAR' WHERE STUDENT_ID=3;
-- 3️⃣ Delete the record of the student whose phone number ends with “9090”.
DELETE FROM STUDENT_DETAILS WHERE PHONE LIKE '%9090';
-- 4️⃣ Show all students who live in Udaipur.
SELECT * FROM STUDENT_DETAILS WHERE CITY='UDAIPUR';
-- 5️⃣ Display students whose age is greater than 20.
SELECT * FROM STUDENT WHERE AGE>20;
-- 6️⃣ Show student name, city, and phone using JOIN.
SELECT * FROM STUDENT;
SELECT * FROM STUDENT_DETAILS;
SELECT STUDENT_NAME,CITY,PHONE FROM STUDENT AS S JOIN STUDENT_DETAILS AS SD ON S.STUDENT_ID=SD.STUDENT_ID;
-- 7️⃣ Get students whose name starts with ‘A’.
SELECT * FROM STUDENT WHERE STUDENT_NAME LIKE 'A%';
-- 8️⃣ Count how many students are from Jaipur.
SELECT COUNT(STUDENT_ID),CITY FROM STUDENT_DETAILS WHERE CITY='JAIPUR' GROUP BY CITY;
-- 9️⃣ Insert 2 new rows into student_details referencing existing students.
SELECT * FROM STUDENT_DETAILS;
INSERT INTO STUDENT_DETAILS(DETAIL_ID,STUDENT_ID,ADDRESS,CITY,PHONE) VALUES
(104,4,'SHUBHASH NAGAR','BHILWARA',49486593485),
(105,5,'RAM NAGAR','BANSWARA',959850945349);
SELECT * FROM STUDENT_DETAILS;
SELECT COUNT(STUDENT_ID),CITY FROM STUDENT_DETAILS WHERE CITY='BANSWARA' GROUP BY CITY;
-- 🔟 Delete all students who don’t have an entry in student_details.
SELECT * FROM STUDENT_DETAILS ;
DELETE FROM STUDENT_DETAILS WHERE STUDENT_ID IS NULL; 
DELETE FROM STUDENT
WHERE student_id NOT IN (
    SELECT student_id FROM student_details
);

SELECT * FROM STUDENT;
SELECT * FROM STUDENT_DETAILS;
-- Grant SELECT and INSERT permission on the student table to user 'divyansh'.
CREATE USER 'DIVYANSH' IDENTIFIED BY 'DIVYANSH123';
GRANT  SELECT (STUDENT_ID,STUDENT_NAME,AGE) ON ABCD.STUDENT TO 'DIVYANSH';
GRANT ALL PRIVILEGES ON ABCD.STUDENT TO 'DIVYANSH';
REVOKE ALL PRIVILEGES ON ABCD.STUDENT FROM 'DIVYANSH';
-- 2. Revoke DELETE permission on the employees table from user 'john'.
GRANT DELETE ON ABCD.STUDENT TO 'DIVYANSH';
REVOKE DELETE ON ABCD.STUDENT FROM 'DIVYANSH';
-- 3. Give ALL privileges on the database 'tushar' to user 'admin'.
GRANT ALL PRIVILEGES ON TUSHAR.* TO 'DIVYANSH';
-- 4. Create a user and grant them SELECT permission only.
GRANT SELECT  ON ABCD.* TO 'DIVYANSH';
REVOKE SELECT ON ABCD.* FROM 'DIVYANSH';
-- 5. Show how to revoke UPDATE access from a role assigned to multiple users.;
-- 6. Grant EXECUTE permission on a stored procedure.
USE  STOREDPROCEDURES;
-- 7. Revoke all privileges from a user but do not delete the user.
REVOKE ALL PRIVILEGES ON ABCD.STUDENT FROM  'DIVYANSH';
-- 8. Grant permission to create tables to a specific user.
GRANT CREATE ON ABCD TO 'DIVYANSH';
-- 9. Restrict a user to only SELECT from a view but not underlying tables.

-- 10. Grant permission on a table to PUBLIC. Explain what PUBLIC means.

-- Update a student’s record and rollback the changes.
select * from student;
start transaction;
update student set student_name='naina' where student_id='4';
rollback;
-- 2. Insert two records together and commit them as a single transaction.
select * from student;
delete from student where student_id in(5,6);
start transaction;
insert into student (student_id,student_name,age,course,email) values
(5,'rohit',26,'BA','prajapatrahul23@gmail.com'),
(6,'devansh',25,'B.COM','devanshp@95@gmail.com');
commit;
-- 3. Delete a row and use ROLLBACK to undo the delete.
start transaction;
delete from student where student_id='5';
rollback;
-- 4. Perform multiple updates and use SAVEPOINT to manage them.
select * from student;
start transaction;
update student set student_name='david' where student_id=6;
savepoint update1; 
update student set student_name='madhuri' where student_id=3;
savepoint update2;
update student set student_name='adinath' where student_id=4;
savepoint update3;
rollback to savepoint update2;
-- 5. Demonstrate a failed transaction that triggers a rollback.
select * from student;
start transaction; 
insert into student(student_id,student_name,age,course,email) values
(1,'hello',30,'b.tech','panchal@gmail.com');
rollback;
-- 6. Show an example using COMMIT after an UPDATE.
start transaction;
update  student set student_name='kartik' where student_id=4;
commit;
-- 7. Create a SAVEPOINT and rollback only to that point.
-- 8. Explain how transactions help maintain data consistency.
-- 9. Perform a transfer of salary between two tables using transactions.
-- 10. Show how AUTOCOMMIT ON/OFF affects a transaction.


-- Retrieve all students whose name starts with ‘A’.
select * from student;
select * from student where student_name like 'D%'; 
-- 2. Show the highest salary from the employees table.
use tushar;
select * from employees;
select max(salary) from employees;
-- 3. Find the number of employees in each department.
select count(emp_name),dept_id from employees group by dept_id;
-- 4. Display all students ordered by admission_date.
select * from employees;
select emp_name,doj from employees order by doj desc ;
-- 5. Show students whose age is between 18 and 25.
use abcd;
select * from student where age between 18 and 25;
-- 6. Find employees who joined after 2022.
use tushar;
select * from employees;
update employees
set salary=salary+5000;
select * from employees;
update employees  set emp_id=doj;
select salary, salary-lead(salary) over(order by salary) from employees;
select salary,salary-lag(salary) over(order by salary) from employees;
select emp_name,doj from employees where year(doj)>2022; 
-- 7. Display distinct department names from the employees table.
select * from employees;
select distinct dept_id from employees;
-- 8. Show average marks of students grouped by class.
use abcd;
select * from student;
select * from student_details;
select class,avg(marks) from student group by class;
-- 9. Retrieve student details using a JOIN with student_details.
select * from student;
select * from student_details;
select * from student as s join student_details as sd on s.student_id=sd.student_id;
-- 10. Display employees whose salary is above the company average.
use sakila;
select * from employees;
select emp_name,emp_salary from employees as e where emp_salary>(select avg(emp_salary) from employees as e2  where e.department=e2.department);


use dev;
show tables;
select * from employees;
select * from projects;
explain select emp_name,salary from employees where emp_name='alice johnson';
create index my_index on employees(emp_name);
explain select * from employees where emp_name='alice johnson';

-- Find employees who have the lowest salary in the company.
select min(salary),emp_name from employees group by emp_name order by min(salary) limit 1 ;
-- 2. Find the department with the highest average salary.
select * from employees;
select avg(salary),department from employees group by department order by avg(salary) desc limit 1;
-- 3. Find the name of the manager of 'Alice Johnson'.
select * from employees;
select e.emp_id,e.emp_name,e.manager_id,m.emp_name as manager_name from employees as e join employees as m on 
e.manager_id=m.emp_id;
-- 4. Get the total number of projects completed per employee, sorted by the highest count.
select * from projects;
select e.emp_id,count(project_id) from projects as p join employees as e on p.emp_id=e.emp_id
 group by emp_id order by count(project_id) desc;
-- 5. Calculate the running total of salaries in the company based on joining date.
select * from employees;
select joining_date,salary,sum(salary) over(order by joining_date) from employees;
-- 6. Find the number of employees who joined after 2018.
select count(emp_id) as total_count from employees where year(joining_date)>2018;
-- 7. Find the total number of projects handled by each employee.
select * from projects;
select count(project_id),emp_id from projects group by emp_id;
-- 8. Find employees whose salary is above the average salary of their department. [Hint: subquery]
select emp_name,salary,department from employees as e where salary>(select avg(salary) from employees as e2 where e.department=e2.department); 
-- 9. Find the employee id, name, and department who don’t have any manager
select emp_id,emp_name,department,manager_id from employees where manager_id is null;


-- Find employees whose salary is greater than 40,000.
use tushar;
select * from employees;
select emp_name,salary from employees where salary>40000;
-- Show employees who joined on or after 2022-01-01.
select emp_name,doj from employees where doj>2022-01-01;
-- List employees whose salary is less than or equal to the company average salary.
select avg(salary) from employees;
select emp_name,salary from employees where salary<=(select avg(salary) from employees);
-- Show employees whose salary ≠ department average salary.
select avg(salary),dept_id from employees group by dept_id;
select emp_name,salary,dept_id from employees as e where salary!=(select avg(salary) from employees as e2 where e.dept_id=e2.dept_id);
-- Find employees whose salary is between 30,000 and 50,000.
select emp_name,salary from employees where salary between 30000 and 50000;
-- List employees who joined between 2021-01-01 and 2022-12-31.
select emp_name,doj from employees where doj between 2021-01-01 and 2022-12-30;

-- Display employees who work in departments (1, 3).
select emp_name,dept_id from employees where dept_id in (1,3);
-- Show employees whose salary matches any HR employee salary
select * from departments;
select * from employees;
select emp_name,salary from employees where salary =any(select salary from employees where dept_id=2);
show tables;
-- List employees who do not belong to the HR or IT department.
select emp_name from employees where dept_id not in (1,2);

-- Find employees whose names start with ‘M’.
select emp_name from employees where emp_name like 'M%';
-- Find employees whose names contain the letter ‘a’.
select emp_name from employees where emp_name like 'A%';
-- Find employees whose name ends with ‘h’.
select  emp_name from employees where emp_name like 'H%';

-- Show employees who don’t have a manager (manager_id IS NULL).
select * from employees;
select emp_name,manager_id from employees where manager_id is null;
-- Show employees who have a manager assigned (manager_id IS NOT NULL).
select e.emp_id,e.emp_name,e.manager_id,m.emp_name as manager_name from employees as e join employees as m on e.manager_id=m.emp_id
 where e.manager_id is not null;
 
-- Find employees whose salary > 40,000 AND belong to department 1.
select emp_name,salary,dept_id from employees where salary>40000 and dept_id=1;
-- Find employees whose salary < 35,000 OR joined after 2023.
select emp_name,salary,dept_id from employees where salary<35000 or year(doj)>2023;
-- Find employees not working in department 2.
select emp_name from employees where dept_id !=2;

-- Show employees whose salary is greater than any employee of dept_id 3.
select emp_name,salary from employees where salary>any(select salary from employees where dept_id=3);
-- Show employees whose salary is greater than all salaries in dept_id 1.
select emp_name,salary from employees where salary >all(select salary from employees where dept_id=1);

-- Find employees whose department has at least one other employee (use EXISTS).
select emp_name,dept_id from employees as e where exists(select dept_id from employees as e2 where e.dept_id=e2.dept_id limit 1);

-- Write a query to fetch second-highest salary.
show tables;
use tushar;
show tables;
select * from employees;
select max(salary) from employees where salary<(select max(salary) from employees);
select * from employees;
insert into employees(emp_id,emp_name,salary,dept_id,doj,manager_id) values(109,'yuvika',35000,null,'2020-02-14',1);
select emp_id,count(*) from employees group by emp_id;
-- 13. Find employees who joined after 2021.
select emp_name,doj from employees where year(doj)>2021;
-- 14. Show employees who do NOT belong to any department.
select emp_name,dept_id from employees where dept_id is null;
-- 15.Show highest salary per department.
select max(salary),dept_id from employees group by dept_id;
-- Show employees earning more than department average. 
select avg(salary),dept_id from employees group by dept_id;
select emp_name,salary,dept_id from employees as e where salary>(select avg(salary) from employees as e2  where e.dept_id=e2.dept_id); 

-- 18. Retrieve the 3rd highest salary.
with cte as (
select salary,rank() over( order by salary desc) as salary_rank from employees)
select * from cte where salary_rank=3;

-- 19. Show employees whose manager earns more than them.
select e.emp_name,e.salary,m.emp_name as manager_name,m.salary from employees as e join employees as m where e.manager_id=m.emp_id and m.salary>e.salary;
select emp_name,salary from employees as e where salary in(select salary from employees group by salary having count(*)>1);

-- 20 List departments with more than 3 employees.
select dept_id,count(emp_name) from employees group by dept_id having count(emp_name)>=3;

-- 21 Find employees earning more than company average.
select avg(salary) from employees;
select emp_name,salary from employees where salary>(select avg(salary) from employees);

-- 28. Show employees from departments having more than 1 employee.
select count(emp_id),dept_id from employees group by dept_id having count(emp_id)>1;

-- 29 Show top 2 employees per department. windows function
with cte as (
select  dept_id,emp_name,salary,dense_rank() over(partition by dept_id order by salary desc) as top_rank from employees)
select * from cte where top_rank>=2;

-- 32. Assign row numbers per department.
select dept_id,salary,row_number () over(partition by dept_id order by salary)  from employees;

-- Find salary gaps using LAG.
select salary,salary-lag(salary) over(order by salary) from employees;

start transaction;
update employees set salary=salary+5000;
commit;

select * from employees;
update employees set salary=46300 where emp_id=103;
use tushar;

use tushar;
select * from employees;

-- running_sum
select emp_name,salary,sum(salary)  over(order by salary) from employees;
select emp_name,doj,salary,sum(salary) over(order by salary) from employees where year(doj)<2022;
with cte as(
select emp_name,salary,rank() over(order by salary desc) as high_salary from employees)
select * from cte where high_salary=4;
select * from employees;

CREATE TABLE my_Employees (
    emp_id INT PRIMARY KEY,
    name VARCHAR(50),
    department VARCHAR(50),
    salary INT,
    manager_id INT,
    joining_date DATE
);
INSERT INTO my_Employees VALUES
(101, 'Amit', 'HR', 50000, NULL, '2020-01-12'),
(102, 'Neha', 'Finance', 62000, 101, '2019-11-03'),
(103, 'Karan', 'HR', 48000, 101, '2021-03-18'),
(104, 'Riya', 'IT', 75000, 108, '2018-07-22'),
(105, 'Manish', 'Finance', 58000, 102, '2020-12-15'),
(106, 'Pooja', 'IT', 77000, 108, '2017-09-01'),
(107, 'Arjun', 'IT', 69000, 104, '2021-02-10'),
(108, 'Suman', 'IT', 90000, NULL, '2016-05-30'),
(109, 'Tina', 'HR', 51000, 101, '2022-01-04'),
(110, 'Rahul', 'Finance', 64000, 102, '2018-10-15');

--  20 Tricky SQL Questions
-- Write a query to fetch employees whose salary is greater than the salary of their manager.
select * from my_employees;
select e.name,e.salary,me.name as manager_name,me.salary,me.manager_id from my_employees as e join my_employees as me on e.manager_id=me.emp_id
where e.salary>any(select me.salary from my_employees);
-- Find employees who have the highest salary in their department.
select * from my_employees;
select max(salary),department from my_employees group by department;
select name,department,salary from my_employees as e where salary in(select max(salary) from my_employees as me where e.department=me.department); 
-- Display employees who joined before their manager.
select * from my_employees;
select manager_id,joining_date from my_employees;
select e.name,e.joining_date as emp_join,me.name,me.joining_date as manager_join from my_employees as e 
join my_employees as me on e.manager_id=me.emp_id where  e.joining_date<me.joining_date;
-- Show employees who do not have any subordinates.
use tushar;
select * from my_employees;
select name,manager_id from my_employees where emp_id =any(select emp_id from my_employees where manager_id is null); 
-- List departments where the average salary is greater than 60,000.
select avg(salary),department from my_employees group by department;
SELECT department, AVG(salary) AS avg_sal
FROM my_employees
GROUP BY department
HAVING AVG(salary) > 60000;
select department,avg(salary) from my_employees as e group by department having avg(salary) >any(select salary from my_employees as me where me.salary>60000);
-- Retrieve the second highest salary in each department.
with cte as (
select department,salary,rank() over(partition by department order by salary desc) as highest_salary from my_employees)
 select * from cte where highest_salary=2 and department='Finance';
 
-- Find employees who share the same joining month and year.
select * from my_employees;
select name,joining_date from my_employees where year(joining_date) = month(joining_date);
-- Show employees whose names start and end with the same letter.
-- List employees whose salary is above the overall department average salary of their own department.
select avg(salary),department from my_employees group by department;
select name,department,salary from my_employees as e where salary>(select avg(salary) from my_employees as me where e.department=me.department);
-- Display the department with the maximum number of employees.
select count(emp_id),department from my_employees group by department  order by department desc limit 1;
-- Show the difference between salary of employee and their manager.
select e.name,e.salary,me.name as manager_name,me.salary,
e.salary,me.salary,e.salary-me.salary as salary_difference  from my_employees as e join my_employees as me on e.manager_id=me.emp_id;
-- Fetch employees who earn more than the average salary of the company.
select avg(salary) from my_employees;
select name,salary from my_employees where salary>(select avg(salary) from my_employees);
-- List names where the 2nd character of the employee name is a vowel.
select name from my_employees where name like '_a%' or name like '_e%' or name like  '_i%' or name like  '_o%' or name like  '_u%';
-- Retrieve employees who joined in the last 2 years based on the current date.
select name,joining_date from my_employees where joining_date >= date_sub(curdate(),interval 2 year);
SELECT name, joining_date FROM my_employees
WHERE joining_date >= DATE_SUB(CURDATE(), INTERVAL 2 YEAR);
use tushar;
select name,joining_date from my_employees where year(joining_date);
use tushar;
-- Find employees whose salary is in the top 3 salaries of the company.
select name,salary from my_employees order by salary desc limit 3;
with cte as (
select name,salary,dense_rank() over(order by salary desc) as top_rank_salary from my_employees)
select * from cte  order by top_rank_salary limit 3;
-- Show departments where the minimum salary is greater than 50,000.
select min(salary),department from my_employees group by department having min(salary)>(select salary from my_employees where salary=50000);
-- List employees who have the same salary as at least one other employee.
select name,salary from my_employees where salary in(select salary from my_employees group by salary having count(salary)>1);
-- Retrieve managers who manage more than two employees.
select * from my_employees;
select me.name as manager_name,e.manager_id,count(e.name) from my_employees as e join my_employees as  me on e.manager_id=me.emp_id
 group by manager_id having  count(e.name)>=2;
-- Find employees whose joining date is a weekend (Saturday or Sunday).
select * from my_employees;
select name, weekday(joining_date) from my_employees where weekday(joining_date) in(5,6);
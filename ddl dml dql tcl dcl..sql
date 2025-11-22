-- =========================================
-- ⿡  CREATE TABLES
-- =========================================
create database interview;
use interview;
show tables;
drop table employee;
CREATE TABLE Department (

    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50),
    location VARCHAR(50)
);

CREATE TABLE Manager (
    manager_id INT PRIMARY KEY,
    manager_name VARCHAR(50),
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES Department(dept_id)
);

CREATE TABLE Employee (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    email VARCHAR(50),
    salary INT,
    join_date DATE,
    dept_id INT,
    manager_id INT,
    FOREIGN KEY (dept_id) REFERENCES Department(dept_id),
    FOREIGN KEY (manager_id) REFERENCES Manager(manager_id)
);

CREATE TABLE SalaryHistory (
    record_id INT PRIMARY KEY,
    emp_id INT,
    old_salary INT,
    new_salary INT,
    updated_on DATE,
    FOREIGN KEY (emp_id) REFERENCES Employee(emp_id)
);

CREATE TABLE Attendance (
    attendance_id INT PRIMARY KEY,
    emp_id INT,
    present_date DATE,
    status VARCHAR(10),
    FOREIGN KEY (emp_id) REFERENCES Employee(emp_id)
);

-- =========================================
-- ⿢  INSERT DATA
-- =========================================

-- Insert Department Data
INSERT INTO Department (dept_id, dept_name, location) VALUES
(1, 'IT', 'Ahmedabad'),
(2, 'HR', 'Mumbai'),
(3, 'Finance', 'Delhi'),
(4, 'Marketing', 'Bangalore');

-- Insert Manager Data
INSERT INTO Manager (manager_id, manager_name, dept_id) VALUES
(101, 'Amit Sharma', 1),
(102, 'Riya Kapoor', 2),
(103, 'Sunil Mehta', 3),
(104, 'Pooja Singh', 4);

-- Insert Employee Data
INSERT INTO Employee (emp_id, emp_name, email, salary, join_date, dept_id, manager_id) VALUES
(1, 'Mehul Saini', 'mehul@example.com', 45000, '2023-10-15', 1, 101),
(2, 'Tushar Jain', 'tushar@example.com', 55000, '2022-05-20', 1, 101),
(3, 'Rohit Sharma', 'rohit@example.com', 30000, '2023-02-11', 2, 102),
(4, 'Neha Verma', 'neha@example.com', 65000, '2021-11-05', 3, 103),
(5, 'Aman Gupta', 'aman@example.com', 27000, '2024-01-10', 4, 104);

-- Insert Salary History Data
INSERT INTO SalaryHistory (record_id, emp_id, old_salary, new_salary, updated_on) VALUES
(1, 1, 40000, 45000, '2024-01-01'),
(2, 2, 50000, 55000, '2024-02-01'),
(3, 4, 60000, 65000, '2024-03-15');

-- Insert Attendance Data
INSERT INTO Attendance (attendance_id, emp_id, present_date, status) VALUES
(1, 1, '2024-11-01', 'Present'),
(2, 1, '2024-11-02', 'Absent'),
(3, 2, '2024-11-01', 'Present'),
(4, 3, '2024-11-01', 'Present'),
(5, 4, '2024-11-02','Absent');

-- ⭐ 1. DDL (Data Definition Language) – 10 Questions
-- Commands: CREATE, ALTER, DROP, TRUNCATE, RENAME
-- Create a table Student with columns (id, name, age, marks, city).
create table student(id int primary key,
name varchar(20),age int,marks float,city varchar(20));
select * from student;
-- Add a column phone to the Employee table.
alter table employee add column phone varchar(12);
-- Change the data type of salary in Employee table to BIGINT.
alter table employee modify salary bigint; -- change data types
alter table employee change column  salary  emp_salary bigint ;  -- change employee_name
-- Drop the Attendance table.
-- Rename table Employee to Employees.
alter table employee rename employees;  -- rename the table 
-- Rename column manager_name to head_name in Manager table.
SELECT * FROM MANAGER;
alter table manager rename column manager_name to head_name;
ALTER TABLE MANAGER RENAME COLUMN HEAD_NAME TO MANAGER_NAME;
-- Add a NOT NULL constraint to emp_name column.
alter table employees modify emp_name varchar(20) not null;
-- Add a CHECK constraint on Employee.salary > 0.
SELECT * FROM EMPLOYEES;
alter table employees MODIFY EMP_SALARY INT CHECK (EMP_salary>0);
-- Create a table Project with foreign key referencing Employee(emp_id).
CREATE TABLE PROJECTS(EMP_ID  INT,
EMP_NAME VARCHAR(20),
PROJECT_NAME VARCHAR(20),
PROJECT_ID INT,
FOREIGN KEY PROJECT (EMP_ID) REFERENCES EMPLOYEES(EMP_ID)); 
SELECT * FROM EMPLOYEES;
SELECT * FROM PROJECTS;
SELECT E.EMP_NAME,E.EMP_SALARY,P.PROJECT_NAME,P.PROJECT_ID FROM EMPLOYEES AS E
JOIN PROJECTS AS P ON E.EMP_ID=P.EMP_ID;
-- Create a backup table Employee_backup with same structure AND data.
-- ⭐ 2. DML (Data Manipulation Language) – 10 Questions
-- Commands: INSERT, UPDATE, DELETE
-- Insert 5 new employees into Employee table.
-- Update salary of emp_id = 2 to 60000.
-- Delete an employee who has not marked any attendance.
-- Insert multiple rows in a single insert statement.
-- Increase salary by 15% for all IT department employees.
SELECT* FROM DEPARTMENT;
SELECT * FROM EMPLOYEES;
SELECT E.EMP_NAME,E.EMP_SALARY,D.DEPT_NAME,D.LOCATION FROM EMPLOYEES AS E
LEFT JOIN DEPARTMENT AS D ON D.DEPT_ID=E.DEPT_ID; 
UPDATE EMPLOYEES SET EMP_SALARY=EMP_SALARY*1.15 WHERE  DEPT_ID=1;
-- Delete employees with salary less than 30000.
-- Update join_date to ‘2024-01-01’ using STR_TO_DATE for emp_id = 3.
-- Swap salaries of emp_id 1 and emp_id 2.
SELECT * FROM EMPLOYEES;

UPDATE EMPLOYEES SET EMP_SALARY=CASE 
WHEN EMP_ID=1 THEN (SELECT EMP_SALARY FROM EMPLOYEES WHERE EMP_ID=2)
WHEN EMP_ID=2 THEN (SELECT EMP_SALARY FROM EMPLOYEES WHERE EMP_ID=1)
END
WHERE EMP_ID IN(1,2);

UPDATE employees
SET emp_salary = CASE 
    WHEN emp_id = 1 THEN (SELECT emp_salary FROM employees WHERE emp_id = 2)
    WHEN emp_id = 2 THEN (SELECT emp_salary FROM employees WHERE emp_id = 1)
END
WHERE emp_id IN (1, 2);

-- Insert data into SalaryHistory using SELECT from Employee.

-- Delete duplicate rows from Employee table (using temp table or window function).
SELECT * FROM EMPLOYEES;
SELECT EMP_ID,COUNT(*) FROM EMPLOYEES GROUP BY EMP_ID;
-- ⭐ 3. DCL (Data Control Language) – 10 Questions
-- Commands: GRANT, REVOKE
-- Grant SELECT permission on Employee table to user rahul.
CREATE USER 'RAHUL' IDENTIFIED BY 'RAM';
SELECT * FROM MYSQL.USER; -- SHOW USERS
SHOW GRANTS FOR 'RAHUL';-- SHOWING PRIVILLAGES TO USER
SHOW TABLES;
-- GRANT STATEMENT
GRANT ALL PRIVILEGES ON INTERVIEW.EMPLOYEES TO 'RAHUL';
REVOKE ALL PRIVILEGES ON INTERVIEW.EMPLOYEES FROM 'RAHUL';
USE INTERVIEW;
SELECT * FROM EMPLOYEES;
GRANT SELECT (EMP_NAME,EMAIL) ON INTERVIEW.EMPLOYEES TO 'RAHUL';
REVOKE SELECT (EMP_NAME,EMAIL) ON INTERVIEW.EMPLOYEES FROM 'RAHUL';
GRANT ALL PRIVILEGES ON INTERVIEW.DEPARTMENT TO 'RAHUL';
REVOKE ALL PRIVILEGES ON INTERVIEW.DEPARTMENT FROM 'RAHUL';
REVOKE SELECT (EMP_NAME,EMAIL) ON INTERVIEW.EMPLOYEES FROM 'RAHUL';
-- Revoke DELETE permission from user mehul
GRANT DELETE ON INTERVIEW.EMPLOYEES TO 'RAHUL';
REVOKE DELETE ON INTERVIEW.EMPLOYEES FROM  'RAHUL';
GRANT INSERT ON INTERVIEW.EMPLOYEES TO 'RAHUL';
REVOKE INSERT ON INTERVIEW.EMPLOYEES FROM 'RAHUL';
REVOKE ALL PRIVILEGES ON INTERVIEW.EMPLOYEES FROM 'RAHUL';
-- Create a user test_user and grant them SELECT, INSERT.
-- Grant ALL PRIVILEGES on database to user admin_user.
-- Revoke all privileges from user developer_user.
-- Grant UPDATE only on salary column to user finance_user.
-- Grant permission to create tables to user intern_user.
-- Revoke CREATE permission from user intern_user.
-- Grant ALTER permission on Department table to hr_user.
-- Grant SELECT on only emp_name and salary columns to user viewer.
-- ⭐ 4. TCL (Transaction Control Language) – 10 Questions
-- Commands: COMMIT, ROLLBACK, SAVEPOINT
-- Update salary for emp_id = 6, then COMMIT the transaction.
SELECT * FROM EMPLOYEES;
START TRANSACTION ;
UPDATE EMPLOYEES SET EMP_SALARY=40000 WHERE EMP_ID=6;
COMMIT;
-- Delete a row from Employee, then ROLLBACK.
SELECT * FROM EMPLOYEES;
START TRANSACTION;
DELETE FROM EMPLOYEES WHERE EMP_ID=10;
ROLLBACK;
-- Insert a row into Department and then ROLLBACK.
SELECT * FROM DEPARTMENT;
START TRANSACTION;
INSERT INTO DEPARTMENT VALUES(5,'WAREHOUSE','PUNE');
ROLLBACK;
-- Create a SAVEPOINT before deleting multiple employees.
SELECT * FROM EMPLOYEES;
START TRANSACTION;
SAVEPOINT S1;
DELETE FROM EMPLOYEES WHERE EMP_ID IN(9,10);
ROLLBACK TO S1;
COMMIT;
-- Update multiple employee salaries and ROLLBACK to SAVEPOINT.
SELECT * FROM EMPLOYEES;
START TRANSACTION;
SAVEPOINT S1;
UPDATE EMPLOYEES SET EMP_SALARY='55000' WHERE EMP_ID=3;
UPDATE EMPLOYEES SET EMP_SALARY='45000' WHERE EMP_ID=5;
UPDATE EMPLOYEES SET EMP_SALARY='34000' WHERE EMP_ID=6;
ROLLBACK TO S1;
-- Demonstrate a banking transaction (transfer money between accounts).
START TRANSACTION;
CREATE TABLE BANKING (ACCOUNT_NUMBER INT PRIMARY KEY,
HOLDER_NAME VARCHAR(20),
BALANCE FLOAT);
SELECT * FROM BANKING;
INSERT INTO BANKING(ACCOUNT_NUMBER,HOLDER_NAME,BALANCE) VALUES('142353231124','DIVYANSH PANCHAL','9385735'),
('3985735893032','KAPIL PANCHAL','93857309');
ALTER TABLE BANKING MODIFY COLUMN ACCOUNT_NUMBER BIGINT;
DESC BANKING;
START TRANSACTION;
SAVEPOINT D1;
UPDATE BANKING SET BALANCE = BALANCE-5000 WHERE HOLDER_NAME='DIVYANSH PANCHAL';

START TRANSACTION;
SAVEPOINT D2;
UPDATE BANKING SET BALANCE =BALANCE +5000 WHERE HOLDER_NAME='KAPIL PANCHAL';
ROLLBACK TO D2;

-- Apply transaction: insert in Employee and SalaryHistory or rollback both.
START TRANSACTION;
SELECT * FROM EMPLOYEES;
SELECT * FROM SALARYHISTORY;
INSERT INTO EMPLOYEES VALUES(11,'MYNAME','MYNAME@GMAIL.COM','23000','2023-06-04',2,103,'987593487534');
INSERT INTO SALARYHISTORY VALUES(4,'6','30000','56000','2025-11-17');
ROLLBACK;
-- Update salary in Employee and then rollback only last update using SAVEPOINT.
SELECT * FROM EMPLOYEES;
START TRANSACTION;
SAVEPOINT S1; 
UPDATE EMPLOYEES SET EMP_SALARY=55000 WHERE EMP_ID=4;
ROLLBACK TO S1;
-- Use transaction to ensure data consistency while shifting employees to another department

-- Perform multiple deletes and commit only half using SAVEPOINT logic.
-- ⭐ 5. DQL (Data Query Language — SELECT) – 10 Questions
-- Commands: SELECT with WHERE, JOIN, GROUP BY, HAVING, ORDER BY, SUBQUERY
-- 🔰 Easy to Medium
-- Select all employees with their department names.
SELECT * FROM EMPLOYEES;
SELECT * FROM DEPARTMENT;
SELECT E.EMP_NAME,D.DEPT_NAME FROM EMPLOYEES AS E JOIN
DEPARTMENT AS D ON D.DEPT_ID=E.DEPT_ID;
-- Find employees with salary > 45000.
SELECT * FROM EMPLOYEES;
SELECT EMP_NAME,EMP_SALARY FROM EMPLOYEES WHERE EMP_SALARY>45000; 
-- Count how many employees are in each department.
SELECT COUNT(E.EMP_ID),D.DEPT_NAME FROM EMPLOYEES AS E
JOIN DEPARTMENT AS D ON D.DEPT_ID=E.DEPT_ID GROUP BY D.DEPT_NAME;
-- Find employees who joined after 2023.
SELECT * FROM EMPLOYEES;
SELECT * FROM EMPLOYEES WHERE YEAR(JOIN_DATE)>2023;
-- Show employee names with their manager names.
SELECT * FROM EMPLOYEES;
SELECT * FROM MANAGER;
SELECT E.EMP_NAME,M.MANAGER_NAME FROM EMPLOYEES AS E
JOIN MANAGER AS M ON M.MANAGER_ID=E.MANAGER_ID;

-- 🔥 Medium to Hard (Interview Level)
-- Find second highest salary using subquery.
SELECT MAX(EMP_SALARY) FROM EMPLOYEES;  -- HIGHEST SALARY
SELECT MAX(EMP_SALARY) FROM EMPLOYEES WHERE EMP_SALARY<(SELECT MAX(EMP_SALARY) FROM EMPLOYEES);
SELECT MIN(EMP_SALARY) FROM EMPLOYEES WHERE EMP_SALARY>(SELECT MIN(EMP_SALARY) FROM EMPLOYEES WHERE EMP_SALARY>(SELECT MIN(EMP_SALARY) FROM EMPLOYEES));
-- Find employees who never got salary updated (NOT IN SalaryHistory).
SELECT * FROM SALARYHISTORY;
SELECT * FROM EMPLOYEES;
SELECT EMP_NAME,EMP_SALARY FROM EMPLOYEES WHERE EMP_ID NOT IN (SELECT EMP_ID FROM SALARYHISTORY);
-- Show total attendance count for each employee.
SELECT * FROM ATTENDANCE;
SELECT * FROM EMPLOYEES;
select emp_name,count(attendance_id) from employees as e join attendance as a on e.emp_id=a.emp_id group by emp_name;
-- Find employees whose salary is above department average.
select * from employees;
select emp_name,emp_salary from employees where emp_salary >(select avg(emp_salary) from employees);
select emp_name,emp_salary from employees where emp_salary>any(select avg(emp_salary) from employees);
-- Rank employees by salary using window functions.
select * from employees;
select emp_name,emp_salary,emp_salary,rank() over(order by emp_salary desc) from employees;
select * from department;
select * from attendance;
select * from salaryHistory;

-- Write an SQL query to find the top 5 most rented films in the Sakila database.
use sakila;
select * from film;
select * from rental;
select * from inventory;
select * from category;
-- 2️⃣ Show actors who acted in “ACADEMY DINOSAUR.”
select * from actor;
select * from film;
select * from film_actor;
select concat_ws(' ',first_name,last_name),f.title from actor as a join film_actor as fa
on a.actor_id=fa.actor_id join film as f on f.film_id=fa.film_id where title='ACADEMY DINOSAUR';



-- 3 ️⃣ Display customer names with the store city they belong to.
SELECT * FROM CUSTOMER;
SELECT * FROM CITY;
SELECT * FROM STORE CITY;
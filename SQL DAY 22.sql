-- VIEW views are virtual table that is used to make the query simple.
-- VIEW IS STORE THE COMPLEX QUERIES WHICH  CAN USED ON DAILY BASIS.
-- VIEW IS PARMENTLY STORE IN OUR SCHEMAS
-- IT IS PROVIDE CONSISTENT VIEW OF OUR DATA.
-- VIEW IS MAINELY USED FOR SECURITY PURPOSE OF DATA WE CAN GIVING ACCESS OF OUR TABLE OF WHICH COLUMN OR WHICH DATA WE CAN DECIDED. 
-- VIEWS CAN HELPS IN SECURITY IT PROVIDING LIMITED ACCESS TO THE SPECIFIC COLUMNS.
-- VIEW CANNOT STORE DATA THEY ONLY STOR QUERIES OF OUR TABLE.

USE SAKILA;
SELECT * FROM ACTOR;
SELECT * FROM FILM_ACTOR;
create view v_dev as
SELECT A.FIRST_NAME,F.FILM_ID FROM ACTOR AS A JOIN FILM_ACTOR AS F WHERE A.ACTOR_ID=F.ACTOR_ID; --  VIEW FOR COMPLEX QUERY..
select * from v_dev;
SHOW TABLES;
CREATE VIEW V_ACTOR  AS 
SELECT  A.FIRST_NAME,F.FILM_ID FROM ACTOR AS A JOIN FILM_ACTOR AS F WHERE A.ACTOR_ID=F.ACTOR_ID;
SELECT * FROM ACTOR;
SELECT * FROM FILM_ACTOR;
 CREATE VIEW VIEW_DRATE AS 
 SELECT ACTOR_ID FROM FILM_ACTOR;  -- VIEW FOR A SPECIFIC COLUMN...
 SELECT * FROM VIEW_DRATE;
 
 -- VIEW FOR SPECIFIC COLUMN ACCESS (FOR SECURITY)
 CREATE VIEW MY_ACTOR_VIEW AS
 SELECT FIRST_NAME,LAST_NAME FROM ACTOR;
 SELECT * FROM MY_ACTOR_VIEW;
 UPDATE MY_ACTOR_VIEW SET FIRST_NAME='DIVYANSH' WHERE LAST_NAME='GUINESS'; 
 
 -- CTAS (CREATE TABLE AS SELECT) --  MOST USED IN DATA ENGINNERING..
 CREATE VIEW  VIEW_2 AS
 SELECT ACTOR_ID,COUNT(FIRST_NAME) FROM ACTOR group by ACTOR_ID;
 SELECT * FROM ACTOR;
 SELECT * FROM VIEW_2;
 -- CTAS(CREATE TABLE AS SELECT )
 CREATE TABLE YASH110 AS
 SELECT LAST_NAME,ACTOR_ID FROM ACTOR WHERE ACTOR_ID=2;
 SELECT * FROM YASH110; 
 
 CREATE VIEW  VIEW_10 AS
 SELECT * FROM YASH110;
 SELECT * FROM VIEW_10; 
 
 USE CORRDB;
 SELECT * FROM DEPARTMENT;
 SELECT * FROM EMPLOYEE;
 
 CREATE  TABLE SHAM_AS AS
 SELECT EMP_ID,EMP_NAME,DEPT_ID FROM EMPLOYEE;
 SELECT * FROM SHAM_AS;
 
 CREATE VIEW SHAM_ACCESS AS
 SELECT EMP_ID,EMP_NAME FROM SHAM_AS;
 SELECT * FROM SHAM_ACCESS;
 UPDATE SHAM_ACCESS SET EMP_NAME='SPARSHI' WHERE EMP_ID='104';
 SELECT MAX(EMP_ID) FROM SHAM_ACCESS;
 USE CORRDB;
 SELECT * FROM EMPLOYEE;
 CREATE VIEW DRUM_VIEW AS
 SELECT * FROM EMPLOYEE;
 UPDATE DRUM_VIEW  SET EMP_NAME='RAMAN' WHERE EMP_ID='103';
 
 START TRANSACTION;
 SELECT * FROM EMPLOYEE;
 UPDATE EMPLOYEE SET EMP_NAME='AMAR' WHERE EMP_ID='101';
 COMMIT;
 USE CORRDB;
 SELECT  * FROM EMPLOYEE;
 
 START TRANSACTION;
 SELECT * FROM EMPLOYEE;
 DELETE FROM EMPLOYEE WHERE EMP_ID=102;
 ROLLBACK;
 
 
 CREATE VIEW SHAM_ACCESS2 AS
 SELECT MAX(EMP_NAME) FROM SHAM_AS;
 SELECT * FROM SHAM_ACCESS2;
 UPDATE SHAM_ACCESS2 SET EMP_NAME='MY_NAME' WHERE EMP_NAME='SPARSHI'; -- VIEW CANNOT BE UPDATEABLE BECAUSE OF AGGREGATE FUNCTION  OR DISTINCT ,GROUP BY,
 -- HAVING,UNION OR UNION ALL,SUBQUERY IN SELECT LIST,JOINS, OR WINDOWS FUNCTIONS
 -- INTERVIEW QUESTION ==> MATERILIZED VIEW V/S NON-MATERILIZED VIEW
 
 -- INDEXES
 -- INDEX IS NOTHING BUT AN CONSTRAINT OR DATA STRUCTURE  WHICH IS USED TO  ACCESS YOUR DATA FASTER FROM  YOUR DATABASE;
 --  INDEXES PROVIDING US  FEATURES THAT CAN BE USED TO ACCESS DATA FASTER FROM DATABSE;
-- IT HAS 2 TYPES OF INDEXES
-- 1) CLUSTERED INDEX --> IN THE CLUSTERED INDEX OUR DATA WILL BE STORED IN A SORTED WAY. IT STORED THE DATA IN A FORM OF BINARY TREE FORMATE.
-- EXAMPLE OF CLUSTER INDEX -- >PRIMARY KEY
-- 2) NON-CLUSTERED INDEX -->
CREATE TABLE Student (
    StudentID INT ,   -- Primary Key = Clustered Index by default
    Name VARCHAR(50),
    Age INT,
    City VARCHAR(50)
);

INSERT INTO Student VALUES 
(101, 'Aliean', 20, 'Delhi'),
(103, 'aliya', 22, 'Mumbai'),
(102, 'alina', 21, 'Jaipur'),
(104,'pooja',23,'pune');
drop table student;
show tables;
drop table students;
drop table studentss;
select *  from student;
explain select * from student where name like 'al%';
create index studentindex on student(name(3));
select * from student where name like 'Am%';
create index index1234 on student(name (3));
select * from index1234 where name like 'Am%'; 
explain select * from index123 where name like 'Am%';
explain select * from student where studentid=101;
alter table student add unique key(studentid);
select * from student;
explain select * from student where name='pooja'; -- not use index
explain select * from student where studentid=101;-- use index

create index idx_student on student(studentid); -- index created (non-cluster index)
create index idx_student1 on student(name);
select * from student;
create index idx_student on student(studentid,name);
explain select * from student where studentid=104 and name='pooja';

SELECT * FROM STUDENT;
explain select * from student where name='amit';

-- difference between clustered index and non-clustered indexes;

select * from student;
explain select * from student where studentid=2;
explain select * from student where name='alice';
create index idx_student_c on student(studentid,name); -- composite_index created(non_cluster index)
explain select * from student where name='alice';
explain select * from student where studentid='101' and name='amit';
explain select * from student where name='amit';

-- sql_zoo-chapter 0 to7 completed 
-- hacker rank 5 star completed

-- VIEW 
USE SAKILA;

SELECT * FROM ACTOR;
SELECT * FROM FILM_ACTOR;

SELECT A.FIRST_NAME,F.FILM_ID FROM ACTOR AS A JOIN FILM_ACTOR AS F WHERE A.ACTOR_ID=F.ACTOR_ID;

CREATE VIEW V_ACTOR  AS 
SELECT  A.FIRST_NAME,F.FILM_ID FROM ACTOR AS A JOIN FILM_ACTOR AS F WHERE A.ACTOR_ID=F.ACTOR_ID;
 
 -- VIEW FOR SPECIFIC COLUMN ACCESS (FOR SECURITY)
 CREATE VIEW MY_ACTOR_VIEW AS
 SELECT FIRST_NAME,LAST_NAME FROM ACTOR;
 SELECT * FROM MY_ACTOR_VIEW;
 UPDATE MY_ACTOR_VIEW SET FIRST_NAME='DIVYANSH' WHERE LAST_NAME='GUINESS'; 
 -- CTAS (CREATE TABLE AS SELECT)
 CREATE VIEW  VIEW_2 AS
 SELECT ACTOR_ID,COUNT(FIRST_NAME) FROM ACTOR group by ACTOR_ID;
 SELECT * FROM ACTOR;
 SELECT * FROM VIEW_2;
 select * from student;
 -- INDEXES
 -- INDEX IS NOTHING BUT AN CONSTRAINT WHICH IS USED TO  ACCESS YOUR DATA FASTER IN YOUR DATABASE; 
-- IT HAS 2 TYPES OF INDEXES
-- 1) CLUSTERED INDEX -- IN THE CLUSTERED INDEX OUR DATA WILL BE STORED IN A SORTED WAY. IT STORED THE DATA IN A FORM OF BINARY TREE FORMATE.
-- EXAMPLE OF CLUSTER INDEX -- PRIMARY KEY
-- 2) NON-CLUSTERED INDEX 
CREATE TABLE Student (
    StudentID INT PRIMARY KEY,   -- Primary Key = Clustered Index by default
    Name VARCHAR(50),
    Age INT,
    City VARCHAR(50)
);

INSERT INTO Student VALUES 
(101, 'Amit', 20, 'Delhi'),
(102, 'Riya', 22, 'Mumbai'),
(103, 'Karan', 21, 'Jaipur'),
(104,'pooja',23,'pune');

select * from student;
explain select * from student where studentid=101;
alter table student add unique key(studentid);
select * from student;
explain select * from student where name='pooja'; -- not use index
explain select * from student where studentid=101;-- use index

create index idx_student on student(studentid); -- index created (non-cluster index)
create index idx_student1 on student(name);
select * from student;
explain select * from student where name='amit';

-- difference between clustered index and non-clustered indexes;

select * from student;
explain select * from student where studentid=2;
explain select * from student where name='alice';
create index idx_student_c on student(studentid,name); -- composite_index created(non_cluster index)
explain select * from student where name='alice';
explain select * from student where studentid='101' and name='amit';
explain select * from student where name='amit';

-- sql_zoo-chapter 0 to7 completed 
-- hacker rank 5 star completed
 -- VIEW 
USE SAKILA;

SELECT * FROM ACTOR;
SELECT * FROM FILM_ACTOR;

SELECT A.FIRST_NAME,F.FILM_ID FROM ACTOR AS A JOIN FILM_ACTOR AS F WHERE A.ACTOR_ID=F.ACTOR_ID;

CREATE VIEW V_ACTOR  AS 
SELECT  A.FIRST_NAME,F.FILM_ID FROM ACTOR AS A JOIN FILM_ACTOR AS F WHERE A.ACTOR_ID=F.ACTOR_ID;
 
 -- VIEW FOR SPECIFIC COLUMN ACCESS (FOR SECURITY)
 CREATE VIEW MY_ACTOR_VIEW AS
 SELECT FIRST_NAME,LAST_NAME FROM ACTOR;
 SELECT * FROM MY_ACTOR_VIEW;
 UPDATE MY_ACTOR_VIEW SET FIRST_NAME='DIVYANSH' WHERE LAST_NAME='GUINESS'; 
 -- CTAS (CREATE TABLE AS SELECT)
 CREATE VIEW  VIEW_2 AS
 SELECT ACTOR_ID,COUNT(FIRST_NAME) FROM ACTOR group by ACTOR_ID;
 SELECT * FROM ACTOR;
 SELECT * FROM VIEW_2;
 
 -- INDEXES
 -- INDEX IS NOTHING BUT AN CONSTRAINT WHICH IS USED TO  ACCESS YOUR DATA FASTER IN YOUR DATABASE; 
-- IT HAS 2 TYPES OF INDEXES
-- 1) CLUSTERED INDEX -- IN THE CLUSTERED INDEX OUR DATA WILL BE STORED IN A SORTED WAY. IT STORED THE DATA IN A FORM OF BINARY TREE FORMATE.
-- EXAMPLE OF CLUSTER INDEX -- PRIMARY KEY
-- 2) NON-CLUSTERED INDEX 
CREATE TABLE Student (
    StudentID INT PRIMARY KEY,   -- Primary Key = Clustered Index by default
    Name VARCHAR(50),
    Age INT,
    City VARCHAR(50)
);

INSERT INTO Student VALUES 
(101, 'Amit', 20, 'Delhi'),
(102, 'Riya', 22, 'Mumbai'),
(103, 'Karan', 21, 'Jaipur'),
(104,'pooja',23,'pune');

select * from student;
explain select * from student where name='riya';
create index  idnameidx on student(name);
explain select * from student where name='amit'
explain select * from student where studentid=101;
alter table student add unique key(studentid);
select * from student;
explain select * from student where name='pooja'; -- not use index
explain select * from student where studentid=101;-- use index
select * from student;
create index idx_student on student(studentid); -- index created (non-cluster index)
create index idx_student1 on student(name);
select * from student;
explain select * from student where name='amit';

-- difference between clustered index and non-clustered indexes;
drop table student;
select * from student;
create index index_12 on student(studentid);
explain select * from student where studentid=103;
explain select * from student where studentid=2;
explain select * from student where name='alice';
create index idx_student_c on student(studentid,name); -- composite_index created(non_cluster index)
explain select * from student where name='alice';
explain select * from student where studentid='101' and name='amit';
explain select * from student where name='amit';

-- sql_zoo-chapter 0 to7 completed 
-- hacker rank 5 star completed
 
 -- 1️⃣ Create Table
CREATE TABLE studentsS (
  student_id INT PRIMARY KEY AUTO_INCREMENT,
  student_name VARCHAR(50),
  department VARCHAR(50),
  marks INT,
  admission_date DATE
);

-- 2️⃣ Insert Data
INSERT INTO studentsS (student_name, department, marks, admission_date) VALUES
('Ravi', 'Science', 75, '2023-05-10'),
('Meena', 'Arts', 82, '2022-11-15'),
('Arjun', 'Commerce', 68, '2024-01-05'),
('Priya', 'Science', 91, '2023-09-25'),
('Kiran', 'Arts', 77, '2024-02-14');

SELECT * FROM studentsS;
-- Create unordered (hash-indexed) table
CREATE TABLE student_scores (
  student_id INT,
  student_name VARCHAR(50),
  marks INT,
  PRIMARY KEY (student_id)
) ENGINE = MEMORY;

-- Insert data
INSERT INTO student_scores VALUES
(101, 'Ravi', 85),
(102, 'Meena', 91),
(103, 'Arjun', 73),
(104, 'Priya', 88),
(105, 'Kiran', 79);

select * from student_scores;

 
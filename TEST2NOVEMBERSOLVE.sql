 use sakila;
 select * from payment;
 select max(amount) from payment;
 
 select max(amount) from payment where amount<(select max(amount) from payment);
 
 select * from payment where amount=(select max(amount) from payment where amount<
 (select max(amount) from payment where amount<
 (select max(amount) from payment)));
 
 create database test;
use test;
CREATE TABLE STUDENTS1 (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(50),
    city VARCHAR(50),
    enrollment_date DATE
);
INSERT INTO STUDENTS1(student_id, student_name, city, enrollment_date) VALUES
(1, 'Amit', 'Delhi', '2023-01-15'),
(2, 'Sneha', 'Mumbai', '2023-02-10'),
(3, 'Raj', 'Delhi', '2023-03-05'),
(4, 'Priya', 'Bangalore', '2023-01-25'),
(5, 'Vikram', 'Mumbai', '2023-04-12'),
(6, 'Anjali', 'Delhi', '2023-02-28'),
(7, 'Karan', 'Chennai', '2023-03-20');

CREATE TABLE Enrollments1 (
    enroll_id INT PRIMARY KEY,
    student_id INT,
    course_name VARCHAR(50),
    course_fee INT,
    grade CHAR(1),
    enroll_date DATE,
    FOREIGN KEY (student_id) REFERENCES Students(student_id)
);

INSERT INTO Enrollments1 (enroll_id, student_id, course_name, course_fee, grade, enroll_date) VALUES
(101, 1, 'SQL Basics', 5000, 'A', '2023-01-20'),
(102, 1, 'Python', 6000, 'B', '2023-02-05'),
(103, 2, 'SQL Basics', 5000, 'B', '2023-02-12'),
(104, 2, 'Data Science', 10000, 'A', '2023-03-01'),
(105, 3, 'SQL Basics', 5000, 'C', '2023-03-07'),
(106, 4, 'Python', 6000, 'A', '2023-01-28'),
(107, 5, 'SQL Basics', 5000, 'B', '2023-04-15'),
(108, 6, 'Data Science', 10000, 'A', '2023-03-05'),
(109, 6, 'SQL Basics', 5000, 'A', '2023-03-12'),
(110,7,'python','6000','B','2023-03-12');

-- 1. �� Find the number of students enrolled in each course.
SELECT * FROM STUDENTS1;
SELECT * FROM ENROLLMENTS1;
SELECT SUM(S.STUDENT_ID),E.COURSE_NAME FROM STUDENTS1 AS S
JOIN ENROLLMENTS AS E ON S.STUDENT_ID=E.STUDENT_ID GROUP BY E.COURSE_NAME;
-- 2. �� Find students who took at least one course with grade = 'A'.
SELECT * FROM STUDENTS1;
SELECT * FROM ENROLLMENTS1; 
SELECT S.STUDENT_NAME,E.COURSE_NAME FROM STUDENTS1 AS S
JOIN ENROLLMENTS AS E ON S.STUDENT_ID=E.STUDENT_ID WHERE GRADE='A';

-- 3. �� For each student, show their course and total number of courses taken using a window function.
SELECT * FROM STUDENTS1 AS S1;
SELECT * FROM ENROLLMENTS1 AS E;
SELECT S1.STUDENT_NAME,E.COURSE_NAME,COUNT(E.COURSE_NAME) OVER(PARTITION BY S1.STUDENT_NAME) AS TOTAL_COURSES FROM STUDENTS1 AS S1
JOIN ENROLLMENTS1 AS E ON S1.STUDENT_ID=E.STUDENT_ID;
-- 4. �� Find the student(s) who paid the highest course fee.
WITH TOP_RANK_FEE AS( 
SELECT S1.STUDENT_NAME,E.COURSE_FEE,MAX(E.COURSE_FEE) OVER(PARTITION BY S1.STUDENT_NAME),DENSE_RANK() OVER(ORDER BY E.COURSE_FEE DESC) AS TOP_RANK FROM STUDENTS1 AS S1
JOIN ENROLLMENTS1 AS E ON S1.STUDENT_ID=E.STUDENT_ID)
SELECT * FROM TOP_RANK_FEE WHERE TOP_RANK='1';

SELECT S1.STUDENT_NAME  FROM STUDENTS AS S1 JOIN ENROLLMENTS AS E ON S1.STUDENT_ID=E.STUDENT_ID WHERE E.COURSE_FEE=
(SELECT MAX(E.COURSE_FEE) FROM ENROLLMENTS AS E ) GROUP BY S1.STUDENT_NAME HAVING MAX(E.COURSE_FEE);
SELECT MAX(COURSE_FEE) FROM ENROLLMENTS;

-- 👉 Find students whose all enrolled courses have fees greater than or equal to
-- 6000.

SELECT * FROM STUDENTS1;
SELECT * FROM ENROLLMENTS1;
SELECT STUDENT_NAME FROM STUDENTS1;
SELECT S1.STUDENT_NAME FROM STUDENTS1 AS S1 JOIN ENROLLMENTS1 AS E  ON S1.STUDENT_ID=E.STUDENT_ID GROUP BY S1.STUDENT_NAME HAVING MIN(E.COURSE_FEE)>=6000;


-- 6. �� Find the student(s) who enrolled in the course with the lowest fee. 
-- student_name course_name 
-- Amit SQL Basics 
-- Sneha SQL Basics 
-- Raj SQL Basics 
-- Vikram SQL Basics 
-- Anjali SQL Basics 

SELECT * FROM  STUDENTS1;
SELECT * FROM ENROLLMENTS1;
SELECT MIN(COURSE_FEE),STUDENT_ID FROM ENROLLMENTS1 GROUP BY STUDENT_ID;
SELECT S.STUDENT_NAME,E.COURSE_NAME FROM STUDENTS1 AS S JOIN ENROLLMENTS1 AS E ON S.STUDENT_ID=E.STUDENT_ID WHERE COURSE_FEE <ANY
(SELECT MIN(COURSE_FEE) FROM ENROLLMENTS1 GROUP BY STUDENT_ID);

-- 7. �� Show cumulative course fees per student (running total).
SELECT * FROM STUDENTS1;
SELECT * FROM ENROLLMENTS1;
SELECT  S.CITY,S.STUDENT_NAME,E.COURSE_FEE,dense_rank() OVER(PARTITION BY S.CITY ORDER BY E.COURSE_FEE DESC) AS CITY_RANK  FROM STUDENTS1 AS S JOIN ENROLLMENTS1 AS E 
ON S.STUDENT_ID=E.STUDENT_ID; 


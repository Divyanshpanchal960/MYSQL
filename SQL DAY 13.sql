create database regex1;
use regex1;
CREATE TABLE Departments (
    DeptID INT PRIMARY KEY,
    DeptName VARCHAR(100)
);

INSERT INTO Departments (DeptID, DeptName) VALUES
(1, 'Engineering'),
(2, 'Marketing'),
(3, 'HR');
select * from departments;


CREATE TABLE Employees (
    EmpID INT PRIMARY KEY,
    EmpName VARCHAR(100),
    Salary DECIMAL(10, 2),
    DeptID INT,
    FOREIGN KEY (DeptID) REFERENCES Departments(DeptID)
);

INSERT INTO Employees (EmpID, EmpName, Salary, DeptID) VALUES
(1, 'Alice', 70000, 1),
(2, 'Bob', 60000, 1),
(3, 'Charlie', 50000, 1),
(4, 'Diana', 55000, 2),
(5, 'Eve', 65000, 2),
(6, 'Frank', 40000, 3);
-- corelated subquery are those query which is depends on outer query and executed for outer query .this query is runs for evry row of outer query.
select * from employees as e;
select * from departments as d;
select * from employees where salary>(select salary from employees where empname='bob');

select avg(salary),deptid from employees group by deptid;
select e_out.empid,e_out.empname,e_out.salary,e_out.deptid from employees as e_out
where e_out.salary>(select avg(salary) from employees as e_in where e_in.deptid=e_out.deptid);

select e_out.empid,e_out.empname,e_out.salary,e_out.deptid from employees as e_out
where  e_out.salary>
(select avg(salary) from employees as e_in where e_in.deptid=e_out.deptid);

use regex;
CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    StudentName VARCHAR(100),
    Department VARCHAR(50)
);

INSERT INTO Students (StudentID, StudentName, Department) VALUES
(1, 'Alice', 'Computer Science'),
(2, 'Bob', 'Computer Science'),
(3, 'Charlie', 'Mathematics'),
(4, 'Diana', 'Mathematics'),
(5, 'Eve', 'Physics');


CREATE TABLE Courses (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(100),
    Department VARCHAR(50)
);

INSERT INTO Courses (CourseID, CourseName, Department) VALUES
(101, 'Data Structures', 'Computer Science'),
(102, 'Algorithms', 'Computer Science'),
(201, 'Calculus', 'Mathematics'),
(202, 'Linear Algebra', 'Mathematics'),
(301, 'Quantum Mechanics', 'Physics');

select * from Students;
select *  from Courses;


--   last table

CREATE TABLE Enrollments (
    StudentID INT,
    CourseID INT,
    Grade DECIMAL(5, 2),
    PRIMARY KEY (StudentID, CourseID),
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);

INSERT INTO Enrollments (StudentID, CourseID, Grade) VALUES
(1, 101, 88.5),
(1, 102, 92.0),
(2, 101, 76.0),
(2, 102, 81.5),
(3, 201, 85.0),
(3, 202, 90.0),
(4, 201, 78.0),
(4, 202, 82.5),
(5, 301, 91.0);

select * from Students as s;
select *  from Courses as c;
select * from enrollments as e;


-- find the name of student who have got higher the higher grades then the avg(grades) of all the student in the same course;
select s.studentname,e.grade,e.courseid from students as s
join enrollments as e on s.studentid=e.studentid where e.grade>(select avg(grade) from enrollments as ein where ein.courseid=e.courseid);

select s.studentname,e.grade,e.courseid,c.coursename from students as s
join enrollments as e on s.studentid=e.studentid
join courses as c on c.courseid=e.courseid
 where e.grade>(select avg(grade) from enrollments as ein where ein.courseid=e.courseid);
-- or courseid='101';

select avg(grade) from enrollments;

select s.studentid,s.studentname,e.courseid,e.grade from students as s
join enrollments as e on s.studentid=e.studentid
where e.grade>(select avg(grade) from enrollments as ein where ein.courseid=e.courseid );

select e.courseid,avg(e.grade) from enrollments group by e.courseid;
use sakila;
select * from actor;
 select concat(first_name," ",last_name) from actor;
 
 
-- 1 ️⃣List pairs of students who belong to the same department.
-- (Show both students’ names and their department.)
-- 🧩 Hint: Compare Students.Department with itself.
select * from Students as s;
select *  from Courses as c;
select * from enrollments as e;
select s1.studentname,s1.department,s2.department,s2.studentname from students as s1
join students as s2 on s1.DEPARTMENT=s2.DEPARTMENT AND s1.studentname<s2.studentname;


-- 2️⃣Find all courses that are in the same department as another course.
-- (Show CourseName1, CourseName2, and Department.)
select * from Students as s;
select *  from Courses as c;
select * from enrollments as e;
select c.coursename as coursename1,dept.department,dept.coursename as coursename2  from courses as c
join courses as dept on c.courseid=dept.courseid;
-- 🧩 Hint: Self join on Courses.Department

-- 3️⃣Show pairs of students where one student’s name alphabetically comes before the other,
-- but both are in the same department.
-- 🧩 Hint: WHERE s1.StudentName < s2.StudentName.
select * from students;
select * from courses;
select * from enrollments;
select s1.studentid,s1.studentname,s1.department,s2.studentname from students as s1
join students as s2 on s1.studentname=s2.studentname;





-- 🧮 SUBQUERY Questions
-- 4️⃣Find students who scored above the average grade of all students.
-- 🧩 Hint: Compare each student’s average grade with (SELECT AVG(Grade) FROM Enrollments).
-- 5️⃣List all students whose average grade is higher than Bob’s.
-- 🧩 Hint: First find Bob’s average grade in a subquery.
-- ️⃣Find all students enrolled in more than one course.
-- 7️⃣Display all courses whose average grade is higher than the average grade across all courses.
-- 🧩 Hint: Subquery inside WHERE.
-- 🔄 CORRELATED SUBQUERY Questions
-- 8️⃣Find students whose grade in each course is higher than the average grade for that same course.
-- 🧩 Hint:9️⃣Find departments where all students have scored above 80 in all their enrolled courses.
-- 🧩 Hint: Correlated subquery inside NOT EXISTS.
-- 🔟For each student, show their name and the highest grade among all students in their department.
-- 🧩 Hint: Correlated subquery comparing departments.

create database tushar;
use tushar;
CREATE TABLE EmployeeSales (
    EmployeeID INT,
    EmployeeName VARCHAR(100),
    Department VARCHAR(50),
    SaleDate DATE,
    SaleAmount DECIMAL(10, 2)
);


INSERT INTO EmployeeSales (EmployeeID, EmployeeName, Department, SaleDate, SaleAmount) VALUES
(1, 'Alice', 'Sales', '2025-06-01', 1200.00),
(1, 'Alice', 'Sales', '2025-06-03', 1800.00),
(1, 'Alice', 'Sales', '2025-06-07', 1500.00),
(2, 'Bob', 'Sales', '2025-06-01', 2000.00),
(2, 'Bob', 'Sales', '2025-06-05', 2200.00),
(2, 'Bob', 'Sales', '2025-06-08', 2100.00),
(3, 'Carol', 'Marketing', '2025-06-02', 3000.00),
(3, 'Carol', 'Marketing', '2025-06-06', 2800.00),
(3, 'Carol', 'Marketing', '2025-06-10', 2700.00),
(4, 'Dave', 'Marketing', '2025-06-01', 1000.00),
(4, 'Dave', 'Marketing', '2025-06-03', 1100.00),
(4, 'Dave', 'Marketing', '2025-06-09', 1300.00),
(5, 'Eve', 'HR', '2025-06-04', 900.00),
(5, 'Eve', 'HR', '2025-06-07', 950.00),
(5, 'Eve', 'HR', '2025-06-10', 1000.00),
(6, 'Frank', 'Sales', '2025-06-02', 1700.00),
(6, 'Frank', 'Sales', '2025-06-05', 1900.00),
(6, 'Frank', 'Sales', '2025-06-09', 1600.00),
(7, 'Grace', 'Finance', '2025-06-01', 2500.00),
(7, 'Grace', 'Finance', '2025-06-06', 2400.00),
(7, 'Grace', 'Finance', '2025-06-10', 2600.00),
(8, 'Hank', 'Finance', '2025-06-03', 2300.00),
(8, 'Hank', 'Finance', '2025-06-04', 2200.00),
(8, 'Hank', 'Finance', '2025-06-08', 2100.00),
(9, 'Ivy', 'HR', '2025-06-02', 800.00),
(9, 'Ivy', 'HR', '2025-06-06', 850.00),
(9, 'Ivy', 'HR', '2025-06-09', 950.00),
(10, 'Jake', 'IT', '2025-06-05', 3000.00),
(10, 'Jake', 'IT', '2025-06-07', 3200.00),
(10, 'Jake', 'IT', '2025-06-10', 3100.00);
select * from employeesales;
select  sum(saleamount) from employeesales;
 -- what employeename,sum(saleamount) from employeesales group by employeename;
 select employeename,sum(saleamount) from employeesales group by employeename;
 -- running sum(over())
 select * ,  sum(saleamount) over(order by saleamount) from employeesales;
 select employeename,saleamount,department,sum(saleamount) over() ,max(saleamount) over(order by department) from employeesales;
 select employeename ,sum(saleamount) over(partition by saleamount order by employeename ),saleamount from employeesales;
 -- running sum (partition by )
 select * ,sum(saleamount) over (partition by department order by saleamount) from employeesales;
 
 create database window_test;

use window_test;

CREATE TABLE employee_sales (
    emp_id INT AUTO_INCREMENT PRIMARY KEY,
    emp_name VARCHAR(50),
    department VARCHAR(50),
    sale_amount DECIMAL(10,2),
    sale_date DATE
);

-- 2. Insert at least 20 sample records
INSERT INTO employee_sales (emp_name, department, sale_amount, sale_date) VALUES
('Alice', 'Electronics', 1200.00, '2025-01-10'),
('Bob', 'Electronics', 950.00, '2025-01-12'),
('Charlie', 'Furniture', 2100.00, '2025-01-15'),
('David', 'Furniture', 1800.00, '2025-01-18'),
('Ella', 'Clothing', 400.00, '2025-01-20'),
('Frank', 'Clothing', 750.00, '2025-01-22'),
('Grace', 'Clothing', 600.00, '2025-01-23'),
('Henry', 'Electronics', 1300.00, '2025-01-24'),
('Isabella', 'Furniture', 2500.00, '2025-01-25'),
('Jack', 'Clothing', 900.00, '2025-01-26'),
('Karen', 'Electronics', 1450.00, '2025-01-28'),
('Leo', 'Furniture', 1900.00, '2025-01-29'),
('Mona', 'Clothing', 500.00, '2025-01-30'),
('Nate', 'Electronics', 1600.00, '2025-02-01'),
('Olivia', 'Clothing', 800.00, '2025-02-02'),
('Peter', 'Furniture', 1700.00, '2025-02-03'),
('Quinn', 'Electronics', 1250.00, '2025-02-04'),
('Rose', 'Clothing', 1000.00, '2025-02-05'),
('Steve', 'Furniture', 2200.00, '2025-02-06'),
('Tina', 'Electronics', 1800.00, '2025-02-07');
-- select * from employee_sal  employee_sales;
select *,sum(sale_amount) over (partition by department order by sale_amount),
row_number() over(partition by department) from employee_sales;

update employee_sales set sale_amount=500 where emp_id=2;
select *,sum(sale_amount)  over (order by sale_amount),
row_number ()  over(partition by department) from employee_sales;

SELECT * FROM EMPLOYEE_SALES;
with emp_totalamt as(
SELECT emp_name,SUM(sale_amount) FROM EMPLOYEE_SALES group by emp_name)
 select * from employee_sales;
-- over() function 
 use tushar;
 select  *  from employeesales;
 select  *,sum(saleamount) over (),avg(saleamount) over() from employeesales;
select sum(saleamount)  from employeesales;
use window_test;
select * from employee_sales;
select sum(sale_amount) from employee_sales;
select *,sum(saleamount) over () , min(saleamount) over() from employeesales;
select *,sum(saleamount) over(),avg(saleamount) over(),min(saleamount) over(),max(saleamount) over() from employeesales;

select *,sum(saleamount) over (partition by employeename) from employeesales;
select *,sum(saleamount) over (partition by employeename) from employeesales;
select employeename,saleamount,max(saleamount) over () from employeesales;
select employeename,saleamount,min(saleamount) over() from employeesales;
select employeename,saleamount,max(saleamount) over(partition by employeename) from employeesales;
select department,max(saleamount) from employeesales group by department;
select employeename,saleamount,department,max(saleamount)   over (partition by department) from employeesales;
SELECT * FROM EMPLOYEESALES;
SELECT SALEAMOUNT,SUM(SALEAMOUNT) OVER(PARTITION BY SALEAMOUNT) FROM EMPLOYEESALES;
SELECT *,SUM(SALEAMOUNT) OVER (ORDER BY SALEAMOUNT ) FROM EMPLOYEESALES; 
SELECT *,MAX(SALEAMOUNT) OVER (PARTITION BY EMPLOYEENAME ORDER BY SALEAMOUNT) FROM EMPLOYEESALES;
-- 1️⃣ Show each employee’s sales amount and their total sales across all dates.
select * from employeesales;
select employeename,saleamount,sum(saleamount) over(partition by employeename),saledate from employeesales;

-- 2️⃣ Display each employee’s sales and their average sale amount per employee.
select employeename,saleamount,avg(saleamount) over(partition by employeename) from employeesales;

-- 3️⃣ Find each employee’s rank based on their sales within their department.
select * from employeesales;
select employeename,saleamount,department,rank() over (partition by department order by saleamount desc) from employeesales;
-- 4️⃣ Show the running total (cumulative sales) for each employee over time.
select employeename,saleamount,saledate,sum(saleamount) over(partition by employeename order by saledate) from employeesales;
-- 5️⃣ Show each employee’s sale and their previous sale amount.
-- 6️⃣ Show each employee’s sale and their next sale amount.

-- 🧩 Intermediate Level
SELECT *,SUM(SALEAMOUNT) OVER (PARTITION BY DEPARTMENT) FROM EMPLOYEESALES;
SELECT *,SUM(SALEAMOUNT) OVER (ORDER BY EMPLOYEENAME) FROM EMPLOYEESALES;  -- ORDER BY ME UNIQUE COLUMN HI RKHNA HAI 
-- 7️⃣ For each department, show the highest sale amount and compare each employee’s sale with it.
select department,saleamount,max(saleamount) over(partition by department) from employeesales
union 
select employeename,saleamount,sum(saleamount) over(partition by employeename) from employeesales;
-- 8️⃣ Find each employee’s percentage contribution to their department’s total sales.
select employeename,
-- 9️⃣ Find the top 2 highest sales in each department.
-- 🔟 Show the difference between each employee’s sale and their average sale.

-- 🧩 Advanced Level

-- 1️⃣1️⃣ Find each department’s total sales on each date and calculate a running total across dates.
-- 1️⃣2️⃣ Find employees whose total sales are above their department’s average total sales.


-- over (order by) - runnning sum(cumulative sum) -- it is called runnig sum or cummulative sum
-- running sum/cummulative sum-- basically running sum or cummulative sum is a sum of values BASED ON the data which is comman

select *, sum(saleamount) over(order by saleamount) from employeesales;
select *,avg(saleamount) over(order by saleamount) from employeesales;
select *,max(saleamount) over(order by saleamount) from employeesales;
select *,min(saleamount) over(order by saleamount) from employeesales;
select * from employeesales;
select employeename,saleamount,department,sum(saleamount) over(partition by department order by saleamount desc)from employeesales;
select *,sum(saleamount) over(order by saleamount) from employeesales;
select *,avg(saleamount) over(partition by saledate) from employeesales;
select *,max(saleamount) over(partition by saledate) from employeesales;
select employeename,saleamount,department,sum(saleamount) over(order by department desc) from employeesales;
select * from employeesales;
select *,max(saleamount) over(partition by employeename order by saleamount) from employeesales;

select *,sum(saleamount) over(partition by saledate order by department desc)  from employeesales;
select * from employeesales;
select *,max(saleamount) over(partition by employeename), max(saleamount)over(partition by department) from employeesales;
SELECT *,SUM(SALEAMOUNT) OVER (PARTITION BY DEPARTMENT ORDER BY SALEAMOUNT) FROM EMPLOYEESALES;
-- SIMPLE ORDER BY AGAR QUERY ME LGEGA TO RUNNING SUM OR SATH ME PARTITION BY LAGEGA AGAR KISI KE BASIS PR TO USKE BASIS PR RESULT AAYEGA 
-- what is CTE and how to create CTE
-- windows function -
-- ROW_NUMBER FUNCTION(ASSIGN UNIQUE VALUE TO EVERY ROW OF OUR DATA)
USE TUSHAR;
SELECT *,SUM(SALEAMOUNT) OVER(PARTITION BY DEPARTMENT order by saleamount), row_number() OVER (PARTITION BY EMPLOYEEID) FROM EMPLOYEESALES;
use window_test;
select * from employee_sales;
select *,sum(sale_amount) over (partition by emp_name order by sale_amount), row_number() over(partition by emp_name) from employee_sales;
-- RANK FUNCTION (ASSIGN RANKING TO EVERY ROW OF OUR DATA)
SELECT *,ROW_NUMBER() OVER(),
RANK() OVER(PARTITION BY DEPARTMENT ORDER BY SALE_DATE) FROM EMPLOYEE_SALES;

SELECT *,ROW_NUMBER() OVER(partition by DEPARTMENT),
dense_rank() OVER(PARTITION BY DEPARTMENT ORDER BY SALE_DATE) FROM EMPLOYEE_SALES;

-- WINDOWS FUNCTION
-- 1) OVER()
-- 2) PARTITION BY
-- 3) ORDER BY 
-- 4) RANK
-- 5) DENS_RANK
-- 6) LAG
-- 7) LEAD
-- 8) NTILE  


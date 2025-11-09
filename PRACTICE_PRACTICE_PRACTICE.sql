CREATE TABLE sales (
  sale_id INT PRIMARY KEY,
  emp_id INT,
  department VARCHAR(50),
  product VARCHAR(50),
  sale_amount DECIMAL(10,2),
  sale_date DATE
);

CREATE TABLE employees1 (
  emp_id INT PRIMARY KEY,
  emp_name VARCHAR(50),
  hire_date DATE,
  city VARCHAR(50)
);

INSERT INTO employees1 VALUES
(101, 'Ravi', '2021-01-05', 'Delhi'),
(102, 'Meena', '2020-03-15', 'Mumbai'),
(103, 'Arjun', '2019-06-25', 'Bangalore'),
(104, 'Priya', '2022-02-10', 'Delhi');

INSERT INTO sales VALUES
(1, 101, 'Electronics', 'TV', 55000, '2024-01-12'),
(2, 102, 'Electronics', 'Laptop', 70000, '2024-01-15'),
(3, 101, 'Furniture', 'Chair', 4000, '2024-02-01'),
(4, 103, 'Furniture', 'Table', 9000, '2024-02-10'),
(5, 102, 'Electronics', 'Phone', 25000, '2024-02-20'),
(6, 104, 'Clothing', 'Jacket', 6000, '2024-03-05'),
(7, 101, 'Electronics', 'TV', 60000, '2024-03-12'),
(8, 103, 'Furniture', 'Sofa', 15000, '2024-03-25');

 
SELECT * FROM EMPLOYEES1;
SELECT * FROM SALES;
-- Find total sale amount per department.
SELECT * FROM EMPLOYEES1;
SELECT * FROM SALES;
SELECT SUM(SALE_AMOUNT),DEPARTMENT FROM SALES GROUP BY DEPARTMENT;
-- 👉 Show only those departments whose total sale is greater than 50,000.
SELECT DEPARTMENT,SUM(SALE_AMOUNT) FROM SALES GROUP BY DEPARTMENT HAVING SUM(SALE_AMOUNT)>50000;

-- 👉 List each employee’s name along with their total sales amount.
SELECT * FROM EMPLOYEES;
SELECT * FROM SALES;
SELECT EMP_NAME,SUM(SALE_AMOUNT) FROM EMPLOYEES AS E JOIN SALES AS S
ON E.EMP_ID=S.EMP_ID GROUP BY EMP_NAME;

-- 👉 Find total sale per employee per department. 
SELECT SUM(SALE_AMOUNT),EMP_NAME,DEPARTMENT FROM EMPLOYEES AS E
JOIN SALES AS S ON E.EMP_ID=S.EMP_ID GROUP BY EMP_NAME,DEPARTMENT;

-- 👉 Find employees whose total sale is higher than the average sale of all employees.
SELECT* FROM EMPLOYEES;
SELECT * FROM SALES;
SELECT SUM(SALE_AMOUNT),EMP_ID FROM SALES GROUP BY EMP_ID;
SELECT AVG(SALE_AMOUNT),EMP_ID FROM SALES GROUP BY EMP_ID;


SELECT SUM(SALE_AMOUNT),E.EMP_NAME FROM SALES AS S JOIN EMPLOYEES AS E ON S.EMP_ID=E.EMP_ID
 GROUP BY E.EMP_NAME HAVING SUM(SALE_AMOUNT)>(SELECT AVG(SALE_AMOUNT) FROM SALES);
 
 -- 👉 Display each sale record along with a flag 'High'
-- if it’s greater than that employee’s average sale amount.
select * from employees1;
select * from sales;
select emp_id,avg(sale_amount) from sales group by emp_id having avg(sale_amount);
SELECT EMP_ID,SALE_AMOUNT FROM SALES AS S_OUT WHERE SALE_AMOUNT>
(SELECT AVG(SALE_AMOUNT) AS EMP_AVG_SALE FROM SALES AS S_IN,(SALE_AMOUNT>AVG(SALE_AMOUNT),'high','low') 
AS FLAG WHERE S_OUT.EMP_ID=S_IN.EMP_ID GROUP BY S_IN.EMP_ID);

SELECT AVG(SALE_AMOUNT),EMP_ID FROM SALES GROUP BY EMP_ID;
-- Rank employees within each department based on their total sales.
select * from sales;
select * from employees;
select department,emp_name,sum(sale_amount) over(partition by department),
rank() over(partition by department order by sale_amount) as ranking from employees as e join sales as s where e.emp_id=s.emp_id;

-- 👉 For each department, show a running total of sales ordered by sale_date.
select department,sale_date,sale_amount,sum(sale_amount) over(partition by department order by sale_date) from employees as e
join sales as s on e.emp_id=s.emp_id;

-- 👉 Show each employee’s percentage contribution to their department’s total sales.
select * from employees;
select * from sales;
with cte as (
select emp_name,sum(sale_amount) over(partition by e.emp_id) as emptotalsale,
department,sum(sale_amount) over(partition by department) as depttotalsale from employees as e join sales as s on e.emp_id=s.emp_id)
select emp_name,department,emptotalsale,depttotalsale,emptotalsale/depttotalsale*100 from cte;

-- Show each employee’s total sales, department total sales,
-- and rank them by performance within their department.
select emp_name,sum(sale_amount) over(partition by emp_name) as emp_ttotal_sale,
dense_rank()over(partition by e.emp_id order by sale_amount desc),
department,sum(sale_amount) over(partition by department) as dept_total_sale,
dense_rank() over(partition by s.department order by sale_amount desc) 
from employees as e join sales as s
on e.emp_id=s.emp_id; 

 

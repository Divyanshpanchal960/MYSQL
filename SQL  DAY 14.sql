create database corrdb;
use corrdb;

-- Create products table
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10, 2)
);

-- Create sales table
CREATE TABLE sales (
    sale_id INT PRIMARY KEY,
    product_id INT,
    quantity INT,
    sale_date DATE,
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- Insert data into products
INSERT INTO products (product_id, product_name, category, price) VALUES
(1, 'Laptop', 'Electronics', 1200.00),
(2, 'Phone', 'Electronics', 800.00),
(3, 'Chair', 'Furniture', 150.00),
(4, 'Desk', 'Furniture', 300.00),
(5, 'Monitor', 'Electronics', 250.00);

-- Insert data into sales
INSERT INTO sales (sale_id, product_id, quantity, sale_date) VALUES
(1, 1, 3, '2025-09-10'),
(2, 2, 5, '2025-09-11'),
(3, 1, 2, '2025-09-15'),
(4, 3, 7, '2025-09-1');


select * from products;
select * from sales;
select category,avg(price) from products group by category;
select product_name,category,price from products as p_out
where price>(select avg(price) from products where category=p_out.category);

-- interview questions
-- BENIFITS OF EXIST IN SUBQUERY;
-- exist operator vs in operator;

-- get all the product that have been sold three time in single transaction;
select * from products as p;
select * from sales as s;
select p.product_id,p.product_name,s.quantity from products as p
join sales as s where p.product_id=s.product_id and s.quantity>3;

select product_id,product_name from products as p_out
where p_out.product_id IN(select product_id from sales as s_in where s_in.product_id=p_out.product_id and quantity>3);


select min(price) from products;
select * from products where price=(select min(price) from products where price>(select min(price) from products));


-- get all the info. from the product table where the price in greter then the price of product id =3
select * from products where product_id=3;
select * from products where price>(select price from products where product_id=3);
-- get all the info.. form the product table where the category is same  as product id=2;
select * from products;
select * from products where category=(select category from products where product_id=2);
-- get all the info.. from the prodcut table where the category same as on prodcut id 2 and 3
select * from products where category IN (select category from products where product_id=2 OR product_id=3);
-- get all the info.. from the product table where the price of the product is greter then among all the prices of the product in furnitute category;
SELECT PRICE FROM PRODUCTS  WHERE CATEGORY='FURNITURE'; 
select * FROM PRODUCTS WHERE PRICE >ANY(SELECT PRICE FROM PRODUCTS  WHERE CATEGORY='FURNITURE');
-- get the product_id ,product_name and the total quantity sold for each product name;
SELECT SUM(QUANTITY) FROM SALES;
SELECT P.PRODUCT_ID,PRODUCT_NAME,SUM(QUANTITY) FROM PRODUCTS AS P
JOIN SALES AS S ON P.PRODUCT_ID=S.PRODUCT_ID GROUP BY P.PRODUCT_ID,P.PRODUCT_NAME;


-- CONSTRANTS IN SQL
-- BASIC SYNTAX OF HOW TO CREATE TABLE AND HOW TO INSERT DATA IN TABLE;
CREATE DATABASE DEVDIVYANSH123;
USE DEVDIVYANSH123;
CREATE TABLE BRAVE(
STUDENT_ID  INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
STUDENT_NAME VARCHAR(20),
STUDENT_MAIL VARCHAR(30) NOT NULL,
STUDENT_ADDRESS VARCHAR(50),
STUDENT_AADHAR_NUMBER VARCHAR(60));

INSERT  INTO BRAVE(STUDENT_ID,STUDENT_NAME,STUDENT_MAIL,STUDENT_ADDRESS,STUDENT_AADHAR_NUMBER)VALUES
(2,'DIVYANSH PANCHAL','DIVYANSH@68943GMAIL.COM',"MYADDRESS,JAIPUR",938573298329),
(3,'MEHUL SAINI','MEHUL@GMAIL.COM','SHDIQWIWIWGMAIL',8957329583295),
(4,'HARDIK JHALANI','NDSFKJEWF@GMAIL.COM','FKSJFEWJFKDJBF',9862920929287),
(5,'SPARSHI PANCHAL','EWFEWKJFEKJ@GMAIL.COM','KEWJFNEWKLJF',3298572398329),
(6,'PRINCY PANCHAL','KKFNDKFJWKJ@GMAIL.COM','DKFBKFJEJFKJ',87598750987),
('SOURABH','EWFHEWJFN@GMAIL.COM','KFJEWHFKJFJ',9287298898328);



SELECT * FROM BRAVE;
 

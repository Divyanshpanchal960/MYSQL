CREATE TABLE orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_name VARCHAR(100),
    customer_email VARCHAR(100),
    product_name VARCHAR(100),
    order_date DATE,
    order_amount DECIMAL(10,2),
    city VARCHAR(50)
);

INSERT INTO orders (customer_name, customer_email, product_name, order_date, order_amount, city) VALUES
('Amit Sharma', 'amit@example.com', 'Laptop', '2024-01-10', 55000, 'Delhi'),
('Riya Patel', 'riya@example.com', 'Headphones', '2024-02-15', 2000, 'Mumbai'),
('Amit Sharma', 'amit@example.com', 'Keyboard', '2024-02-20', 1500, 'Delhi'),
('Karan Singh', 'karan@example.com', 'Laptop', '2024-02-25', 56000, 'Delhi'),
('Rohit Mehta', 'rohit@example.com', 'Mouse', '2024-03-01', 900, 'Jaipur'),
('Riya Patel', 'riya@example.com', 'Smartphone', '2024-03-18', 25000, 'Mumbai'),
('Manoj Gupta', 'manoj@example.com', 'Laptop', '2024-01-20', 54000, 'Pune'),
('Suman Rao', 'suman@example.com', 'Tablet', '2024-02-22', 30000, 'Chennai');
SELECT * FROM ORDERS;
-- ✅ 3) Create a Simple (Non-Clustered) Index
EXPLAIN SELECT * FROM ORDERS WHERE CUSTOMER_NAME='AMIT SHARMA' AND ORDER_ID=1;
CREATE INDEX MY_INDEX ON ORDERS(CUSTOMER_NAME);
CREATE INDEX MY_INDEX2 ON ORDERS(ORDER_ID,CUSTOMER_NAME);

-- ✅ 4) Create a Unique Index
CREATE UNIQUE INDEX MY_UNIQUE_INDEX ON ORDERS(ORDER_ID,CUSTOMER_EMAIL);
EXPLAIN SELECT * FROM ORDERS WHERE CUSTOMER_EMAIL='amit@example.com' AND CUSTOMER_NAME='AMIT SHAMRA';


GRANT ALL PRIVILEGES ON SAKILA.ORDERS TO 'RAHUL';
REVOKE ALL PRIVILEGES ON SAKILA.ORDERS FROM 'RAHUL';
SELECT * FROM ORDERS;
GRANT SELECT (CUSTOMER_NAME,PRODUCT_NAME)  ON SAKILA.ORDERS TO 'RAHUL';
REVOKE SELECT(CUSTOMER_NAME,PRODUCT_NAME) ON SAKILA.ORDERS FROM 'RAHUL';

CREATE USER DIVYASHTAN IDENTIFIED BY 'TANU';

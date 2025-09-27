-- aggregate functions
use sakila;
select * from payment;
select sum(amount) from payment where round(amount);
select count(amount) from payment where round(amount);
select sum(amount) from payment where amount>5;
select count(payment_id) from payment where payment_id<555;
select count(address_id),count(address2),count(*) from address; 
select  max(amount), min(amount),sum(amount),count(amount),avg(amount) from payment; 
select distinct amount from payment; -- find unique values from data;;
select distinct amount,payment_id from payment;
select count(distinct amount),count(amount) from payment;
select count(distinct payment_id),count(payment_id) from payment;
select * from payment;


-- get the payment id and amount for year 2005;
select * from payment;
select payment_id,payment_date from payment where year(payment_date)=2005;

-- select payment_id,year(2005) from payment;



-- get the unique customers who have done the payment in the month of june;
select * from payment;
select count(distinct customer_id) from payment where month(payment_date)=6;


-- get the maximum amount the avg amount and the difference between maximum and avg amount where the amount of the payment is 
-- greter then 2 dollar for year 2006;
select max(amount),avg(amount) ,max(amount)-avg(amount) 
from payment where amount>2 and year(payment_date)=2006;
-- group by( to grouping similar values)
-- what is difference between distinct and group by		
select * from payment where customer_id=2;
select count(distinct payment_id) from payment where customer_id=2;
select * from payment;
select customer_id,count(customer_id),sum(amount),avg(amount),max(amount),min(amount) from payment group by (customer_id);
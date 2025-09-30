-- group by
-- sum,count,max,min
use sakila;
select * from payment;
select count(customer_id) from payment where customer_id=3;
select customer_id,sum(amount),count(customer_id) from payment group by customer_id;
select payment_id,count(*) from payment group by payment_id;
select customer_id, count(customer_id) from payment where customer_id>3 group by customer_id;
select customer_id,count(customer_id) from payment  group by customer_id having count(customer_id>30);

select  amount,count(*) from payment group by amount;
select amount,count(*) ,sum(amount) from payment where amount>2 group by amount having count(*) > 3000;
select amount,count(*),sum(amount) from payment where amount>2 group by amount;
select amount,count(*) as total_count, sum(amount) from payment where amount>2 group by amount having total_count >3000;
select * from payment;
select staff_id,count(staff_id),count(customer_id) from payment group by staff_id;
-- get the staff_id and total number of customer serve by each staff
select staff_id,count(customer_id),count(staff_id) from payment group by staff_id;

 
select * from payment;
select count(amount),sum(amount),month(payment_date) from payment group by month (payment_date);
select count(amount),sum(amount) from payment  where month (payment_date)=2;
select sum(payment_id), sum(amount) from payment  group by payment_id;
-- get the total amount and number of payments done for each month
select month(payment_date),sum(amount),count(amount) from payment group by month(payment_date); 
select * from payment;
-- get the amount and total_number of unique customer who have done the payment for each amount;
select amount,count(distinct customer_id),sum(customer_id)  from payment group by amount;


-- get the number of transactioon achive for each amount for the year 2005 where the number  of transaction should be greter then 15; 
select * from payment;
select amount,count(*),sum(amount) from payment where year(payment_date)=2005 group by amount having count(*)>15;

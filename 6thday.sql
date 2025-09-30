use sakila;
select * from payment;
select customer_id,amount ,count(amount) from payment group by customer_id ,amount; 

-- how much amount spent each year
select  extract(year from payment_date),sum(amount),staff_id from payment group by staff_id,extract(year from  payment_date);
select extract(year from payment_daye),sum(amount),staff_id from payment where extract(year from ;
-- order by (sort)
-- select * from payment order by rental_id desc, customer_id desc,payment_date desc; 

-- conditional function 
select customer_id ,amount, if(amount>3,'high','low') from payment;
select customer_id,amount,if(amount=2.99,'high',if (amount=5.99,'avg','low')) from payment;

select customer_id,amount,
case 
  when amount=2.99 then 'high'
  when amount=5.99 then 'avg'
else 'low'
end
from payment;



-- select two column customer_id and status if the customer id >1  print 'hello' if the customer id >4 print 'user' otherwise print 'regex';
select * from payment;

select customer_id,
case 
when customer_id>4 then 'user'
when customer_id>1 then 'hello'
else 'regex'
end as status
from payment;
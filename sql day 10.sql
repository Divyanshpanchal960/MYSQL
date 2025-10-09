use sakila;
select * from actor;
-- sub query
select * from actor where first_name=(select first_name from actor where actor_id=5);
select * from payment;
select * from payment where payment_id=(select payment_id from payment where payment_id=3);
select payment_id,amount from payment where amount=5.99;
select * from payment where payment_id=(select payment_id from payment where payment_id=10);
select * from payment where amount=5.99;

-- question-->
-- get the payment_id,amount, and payment date where the amount of rental-id equal 1476);
select * from payment where rental_id=1476;
select payment_id,amount,payment_date 
	from payment 
		where amount=(select amount 
						from payment 
						where rental_id=1476); 

select amount from payment where rental_id=1476;

-- get the payment_id,amount and payment_date where the month of the table=the month of payment_id=4

select amount,extract(month from payment_date) as payment_month from payment where payment_id=4;
select payment_id,amount,extract(month from payment_date) as month from payment 
where extract(month from payment_date)=(select extract(month from payment_date) 
												from payment where payment_id=4);

-- get the payment_id,amount from the table where the amount is equal to the max(amount) from the table

select max(amount) as maxamt from payment;
select payment_id,amount as maxamt from payment where amount=(select max(amount) from payment);

-- get the payment_id,amount, and payment date where the amount of rental-id equal 1476);
select * from payment where rental_id=1476;
select payment_id,amount,payment_date from payment 
						where amount=(select amount from 
										payment where rental_id=1476);
									
																		
-- get the payment_id,amount and payment_date where the month of the table=the month of payment_id=4
select extract(month from payment_date),payment_date 
					from payment where payment_id=4;

select payment_id,amount,extract(month from payment_date) from payment 
where extract(month from payment_date)=
				(select extract(month from payment_date) 
									from payment where payment_id=4);
								
select payment_id,sum(amount),extract(month from payment_date) from payment 
where extract(month from payment_date)=
				(select extract(month from payment_date) 
									from payment where payment_id=4)group by payment_id having sum(amount)>6;
                                    
select payment_id,sum(amount),extract(month from payment_date) from payment 
where extract(month from payment_date)=
				(select extract(month from payment_date) 
									from payment where payment_id=4)group by payment_id having sum(amount)<6;
                                    
select max(amount) from payment;

select payment_id,amount from payment where amount=(select max(amount) from payment);  
select payment_id,amount from payment where amount=(select min(amount) from payment);
                                  
-- get the payment id ,rental id ,payment_date,amount where amount is equal to rental_id=1476
select payment_id,payment_date from payment where rental_id=1476;

select payment_id,count(payment_id),amount from payment where amount=(select amount from payment where rental_id=1476)
group by payment_id; 

-- get the payment_id,amount and the payment_date where the month of the table is equal to the month of payment id=4;
select month(payment_date) from payment where payment_id=4;

select payment_id,amount,month(payment_date)as month from payment 
where month(payment_date)=(select month(payment_date) from payment where payment_id=4);

-- get the payment_id ,and amount from the table where the amount is equal to the max(amount) from the table
select max(amount) from payment;
select payment_id,amount from payment 
			where amount=(select max(amount) from payment) order by payment_id;
 
 
 





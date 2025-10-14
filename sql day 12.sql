use sakila;
select * from actor;
-- any operator
select * from payment;
select * from payment
				where amount>=any(select amount from payment where payment_id=2 or payment_id=3);
select * from address;
select * from address where address_id=5;
select address
 from address where address=(select address from address where address_id=5); 

select * from payment where amount<=any(select amount from payment where payment_id=2 or payment_id=3)
order by amount desc;
-- all operator -- sabse me se bada aur sabse se chota 
select * from payment where amount>=all(select amount from payment where payment_id=5 or payment_id=7);
select * from payment where amount<=all(select amount from payment where payment_id=2 or payment_id=3)
order by amount;

-- <any kisi se bhi chota
-- >any kisi se bhi bada 
-- <all sabse me se chota usse bhi chota
-- >all sabse me se bada usse bhi bada
select * from payment where amount in -- means ya to ye ya to ye
			(select amount from payment where payment_id=2 or payment_id=3); -- find amount ya to 0.99 ya 5.99
SELECT PAYMENT_ID,
MAX(AMOUNT),MIN(AMOUNT) FROM PAYMENT
GROUP BY PAYMENT_ID;
SELECT * FROM PAYMENT WHERE AMOUNT 
IN(SELECT AMOUNT FROM PAYMENT WHERE PAYMENT_ID=2 OR PAYMENT_ID=5);

select payment_id,amount from payment where amount IN 
							(SELECT AMOUNT FROM PAYMENT WHERE PAYMENT_ID=2 OR PAYMENT_ID=3);
                            
SELECT PAYMENT_ID,AMOUNT FROM PAYMENT WHERE AMOUNT>(SELECT AMOUNT FROM PAYMENT WHERE PAYMENT_ID=3);

SELECT PAYMENT_ID,AMOUNT FROM PAYMENT WHERE AMOUNT<
							(SELECT AMOUNT FROM PAYMENT WHERE PAYMENT_ID=3);
                            
SELECT PAYMENT_ID,AMOUNT FROM PAYMENT WHERE AMOUNT>=
							(SELECT AMOUNT FROM PAYMENT WHERE PAYMENT_ID=3);
                            
SELECT PAYMENT_ID,AMOUNT FROM PAYMENT WHERE AMOUNT<=
							(SELECT AMOUNT FROM PAYMENT WHERE PAYMENT_ID=3);

SELECT PAYMENT_ID,AMOUNT FROM PAYMENT WHERE AMOUNT!=
							(SELECT AMOUNT FROM PAYMENT WHERE PAYMENT_ID=3);

SELECT PAYMENT_ID,AMOUNT FROM PAYMENT WHERE AMOUNT>ANY
												(SELECT AMOUNT FROM PAYMENT WHERE PAYMENT_ID=2 OR PAYMENT_ID=3) ORDER BY AMOUNT ASC ;
                                                
SELECT PAYMENT_ID,AMOUNT FROM PAYMENT WHERE AMOUNT<ANY
												(SELECT AMOUNT FROM PAYMENT WHERE PAYMENT_ID=2 OR PAYMENT_ID=3) ORDER BY AMOUNT ASC;

SELECT PAYMENT_ID,AMOUNT FROM PAYMENT WHERE AMOUNT>ALL
												(SELECT AMOUNT FROM PAYMENT WHERE PAYMENT_ID=2 OR PAYMENT_ID=3)ORDER BY AMOUNT ASC;

SELECT PAYMENT_ID,AMOUNT FROM PAYMENT WHERE AMOUNT<ALL
												(SELECT AMOUNT FROM PAYMENT WHERE PAYMENT_ID=2 OR PAYMENT_ID=3) ORDER BY AMOUNT;
                                                
                                                
SELECT PAYMENT_ID,AMOUNT FROM PAYMENT WHERE AMOUNT>ALL
												(SELECT AMOUNT FROM PAYMENT WHERE PAYMENT_ID=2 OR PAYMENT_ID=3);



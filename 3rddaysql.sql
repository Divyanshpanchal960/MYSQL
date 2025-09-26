use sakila;
select * from actor;
select first_name,concat("A",first_name),char_length(first_name)FROM ACTOR;
SELECT first_name,char_length(FIRST_NAME) FROM ACTOR;
select first_name,substr(first_name,2) from actor;
select first_name,locate("E",first_name) from actor;
SELECT FIRST_NAME,REPLACE(FIRST_NAME,"R","&") FROM ACTOR;
SELECT FIRST_NAME,LPAD(FIRST_NAME,5,"#") FROM ACTOR;
SELECT FIRST_NAME,RPAD(FIRST_NAME,5,"#") FROM ACTOR;
-- trim funcntion
select char_length(trim("   hey    "));
select char_length(rtrim("  hey    "));

select trim("   hey    ");
select char_length(trim("   hey    "));
select char_length(rtrim("   hey   ")); -- remove extra spaces from the right side
select char_length(ltrim("   hey    ")); -- remove extra spaces from the left side
select first_name,replace (first_name,"E","#") from actor;
select first_name,replace(first_name,"F","@") from actor;
select first_name ,lpad(first_name,5,"@")from actor;
select first_name,rpad(first_name,5,"@")from actor;

-- numeric function
-- round
select round (11.2);   -- only the decimal part
SELECT ROUND(11.5);
SELECT ROUND(11.56,1); -- WHEN WE PERFOMING ROUND OF AT DECIMAL NUMBER AFTER DOT MUST  BE PRESENT ATLEAST 1 VALUE FROM WHICH WE WANT TO ROUND OF THE VALUE 
SELECT ROUND(12.56,1); -- AGAR JIS BHI VALUE KO ROUNDOFF KRNA HAI TO USKE JUST AFTER VALUE MUST BE LARGER THEN 5;
SELECT ROUND(124.565,2);
select round(11.6,   1); -- only the decimal part
SELECT ROUND(11.69,1);
SELECT ROUND(11.697,2);
select round(11.68,1);   -- jis position ko round  of krna ho uah 5 se badi honi chahaiye like 8 5 se badi hai to 

select round(11.687,2);

select round(11.64,2); -- only the decimal part is round

select round(11.687,1);
select round(7.627,-1); -- 5 se bada to 10 me convert ones position
select round(2.627,-1);  -- 5 se chota hai to 0 me convert 
select round(32.627,-1);
select round(36.5989,-1); -- 5 se bada 
-- ROUND OF THE NUMBER NEAREST 10
SELECT ROUND(7.687,2);  
SELECT ROUND(7.627,1);
SELECT ROUND(3.456,2);
SELECT ROUND(342.457,1);
SELECT ROUND(123.687,2);
SELECT ROUND(12.34,2);
SELECT ROUND(12.36,1);
-- 2<5 +> 0
SELECT ROUND(7.123,-1); -- -1 MEANS TO ROUND OF 1ST INTEGER VALUE LIKE 7, AGAR INTIGER VALUE 5 SE BADA HAI TO CHANGE 10TH PLACE
-- AGAR 5 SE CHOTA NUMBER HAI TO 0 ME CONVERT HOGA
SELECT ROUND(3.123,-1);  -- 5 SE CHOTA HAI
SELECT ROUND(35.342,-1); -- 5 YA 5 SE BADA HAI ISLIYE CONVERT HOGA
SELECT ROUND(36.421,-1);
SELECT ROUND(76.4124,-2); 
SELECT ROUND(266.35432,-2);
SELECT ROUND(246.325325,-2);
SELECT ROUND(250.55325,-2);
SELECT ROUND(546.3524,-3);  -- NEAREST THOUSAND ME CONVERT 
SELECT ROUND(1230.23452,-3);
 
SELECT ROUND(321.857,-2); 
select round(76.627,-2);
select round(72.965,-1);
select round(546.9832,-1);
select round(546.9832,-2);
select round(546.9832,-3);
select round(6546.9832,-3);
select round(6546.9832,-2);

  -- truncate -- extracting the values
  SELECT TRUNCATE(456.34942,2);   -- TRUNCATE IS NOT PERFORM ROUNDOF IT JUST EXTRACT THE VALUE. 
  select round(6546.8475,2),truncate(6546.8475,2);
  select round(1000000.996,2),TRUNCATE(1000000.996,2);
  
  -- other functions
  select mod(10,2),  floor(6.9999999), ceil(4.000002);
  SELECT MOD(1000,2);
  SELECT ROUND(MOD(732,2));
  SELECT MOD(732,2);
  -- date function (most important)
  -- to work on date
select current_date(),current_time(),current_timestamp(),now(); -- timestamp() and now() is similar function
select current_date(),current_time(),current_timestamp(),first_name from actor;
-- adddate()
select add_date(),first_name from actor;
select now(),  adddate(now(),2);  -- adding days in current date
select now(), adddate(now(),interval 2 month);  -- adding month

select now(),adddate(now(),interval 1 year);  -- adding years
select now(),adddate(now(),interval -2 day); -- substracting days
select now(),adddate(now(),interval -2 month); -- substracting month
select now(),adddate(now(),interval -2 year);  -- substracting year

select now(),addtime(now(),'02.00.00');

select now(),year(now()), last_day(now());  -- year and month

-- extract
select now(),extract(year from now());
select now(),extract(quarter from now());
select now(),extract(month from now());

select now(),date_format(now(),'year is%y,my month is%m');
select now(),date_format(now(),'hour is %h','minuet is %m','my month is %m');
-- important for memorise -- adddate,now,curtime,extract,year,month,date_format


select * from payment;

select payment_date from payment;

select payment_date,year(payment_date) from payment;
select payment_date,month(payment_date) from payment;
select payment_date,timestamp(payment_date) from payment;
select payment_date,date_format(payment_date,"hour of shopping is %h"),
payment_date,datediff(payment_date,now()) from payment; -- showing difference of date 


 


-- tommarrow--
-- order by
-- alias
-- aggregate function
-- for practice chapter 2 in zoo 



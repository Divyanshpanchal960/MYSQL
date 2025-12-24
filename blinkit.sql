create database blinkit;
use blinkit;
select * from blinkit_grocery;
select * from blinkit_grocery where rating=4;
select * from blinkit_grocery where rating=5;
alter table blinkit_grocery rename blinkit_grocery;

update blinkit_grocery set item_fat_content='Low Fat' where item_fat_content='low fat';
select * from blinkit_grocery;
 
 -- Find the total sales for each outlet.
 select * from blinkit_grocery;
 SELECT OUTLET_IDENTIFIER,ROUND(SUM(TOTAL_SALES),2) 
											FROM BLINKIT_GROCERY 
												GROUP BY OUTLET_IDENTIFIER 
														ORDER BY SUM(TOTAL_SALES) DESC;

-- Find the average rating for each item type.
SELECT AVG(RATING),ITEM_TYPE FROM blinkit_GROCERY 
									GROUP BY ITEM_TYPE 
											ORDER BY AVG(RATING) DESC;


-- Count how many items belong to each fat content category.
SELECT COUNT(ITEM_FAT_CONTENT),ITEM_TYPE FROM BLINKIT_GROCERY 
												GROUP BY ITEM_TYPE 
													ORDER BY COUNT(ITEM_FAT_CONTENT)DESC;

-- List all distinct outlet types.
SELECT DISTINCT  OUTLET_TYPE FROM BLINKIT_GROCERY; 
-- Find the maximum and minimum sales value in the dataset.
SELECT * FROM BLINKIT_GROCERY;
SELECT MAX(TOTAL_SALES) AS MAXIMUM_SALES_VALUE,
									MIN(TOTAL_SALES) AS MINIUM_SALES_VALUE 
															FROM BLINKIT_GROCERY;
-- Show total sales by outlet size.
SELECT * FROM BLINKIT_GROCERY;
SELECT OUTLET_SIZE,ROUND(SUM(TOTAL_SALES),2) 
							FROM BLINKIT_GROCERY 
									GROUP BY OUTLET_SIZE;

-- Count the number of items sold per outlet location type.
SELECT * FROM BLINKIT_GROCERY;
SELECT COUNT(ITEM_TYPE),OUTLET_LOCATION_TYPE 
						FROM BLINKIT_GROCERY 
									GROUP BY OUTLET_LOCATION_TYPE 
												ORDER BY COUNT(ITEM_TYPE) DESC;

-- Display item types whose average sales are greater than 3000.
SELECT * FROM BLINKIT_GROCERY;
SELECT ROUND(AVG(TOTAL_SALES)),ITEM_TYPE FROM BLINKIT_GROCERY GROUP BY ITEM_TYPE HAVING AVG(TOTAL_SALES)>3000;
WITH CTE1 AS (
SELECT ITEM_TYPE,SUM(TOTAL_SALES) AS TOTALSALES FROM BLINKIT_GROCERY)
SELECT ITEM_TYPE,AVG(TOTAL_SALES) 
						FROM BLINKIT_GROCERY 
									GROUP BY ITEM_TYPE 
											HAVING AVG(TOTAL_SALES)>
													(SELECT TOTAL_SALES FROM BLINKIT_GROCERY WHERE TOTAL_SALES=3000);
-- Show top 5 item types based on total sales.
SELECT * FROM BLINKIT_GROCERY;
SELECT ITEM_TYPE,ROUND(SUM(TOTAL_SALES),2) 
				FROM BLINKIT_GROCERY 
							GROUP BY ITEM_TYPE 
									ORDER BY SUM(TOTAL_SALES) DESC LIMIT 5;

-- Find the earliest and latest outlet establishment year.
SELECT * FROM BLINKIT_GROCERY;
SELECT MIN(OUTLET_ESTABLISHMENT_YEAR) 
				AS EARLIEST_OUTLET_YEAR,MAX(OUTLET_ESTABLISHMENT_YEAR) AS LATEST_OUTLET_YEAR 
																				FROM BLINKIT_GROCERY;
                                                                                
					
-- Find total sales per outlet and display only outlets with sales greater than 1,00,000.
SELECT * FROM BLINKIT_GROCERY;
WITH CTE AS (
SELECT OUTLET_IDENTIFIER,ROUND(SUM(TOTAL_SALES),2) AS SALES_PER_OUTLET 
										FROM BLINKIT_GROCERY GROUP BY OUTLET_IDENTIFIER)
SELECT * FROM CTE WHERE SALES_PER_OUTLET>100000
							ORDER BY SALES_PER_OUTLET DESC;

-- Show outlet types having more than 100 items.
SELECT * FROM BLINKIT_GROCERY;
SELECT OUTLET_TYPE,COUNT(ITEM_TYPE) 
					FROM BLINKIT_GROCERY 
								GROUP BY OUTLET_TYPE 
										HAVING COUNT(ITEM_TYPE)>100;
-- Find the average sales per item type for each outlet location.
SELECT distinct ITEM_TYPE,OUTLET_LOCATION_TYPE,ROUND(AVG(TOTAL_SALES) 
					OVER(PARTITION BY OUTLET_LOCATION_TYPE),2) 
												FROM BLINKIT_GROCERY;
-- List item types where total sales are higher than overall average sales.
SELECT AVG(TOTAL_SALES) FROM BLINKIT_GROCERY;
SELECT ROUND(AVG(TOTAL_SALES),2) FROM BLINKIT_GROCERY;
SELECT ITEM_TYPE,ROUND(SUM(TOTAL_SALES),2) 
					FROM BLINKIT_GROCERY 
								GROUP BY ITEM_TYPE 
											HAVING SUM(TOTAL_SALES)>
														(SELECT AVG(TOTAL_SALES) FROM BLINKIT_GROCERY);
-- Display the top 3 outlets based on total sales.
SELECT * FROM BLINKIT_GROCERY;
SELECT OUTLET_IDENTIFIER,ROUND(SUM(TOTAL_SALES),3) 
							FROM BLINKIT_GROCERY GROUP BY OUTLET_IDENTIFIER 
												ORDER BY SUM(TOTAL_SALES) DESC LIMIT 3;
-- Find outlet-wise total sales and sort them in descending order.
SELECT OUTLET_IDENTIFIER,ROUND(SUM(TOTAL_SALES),3) 
						FROM BLINKIT_GROCERY 
									GROUP BY OUTLET_IDENTIFIER 
												ORDER BY SUM(TOTAL_SALES) DESC;
-- Show item types sold in more than one outlet.
use blinkit;
SELECT * FROM BLINKIT_GROCERY;
SELECT ITEM_TYPE,COUNT(OUTLET_IDENTIFIER) 
						FROM BLINKIT_GROCERY 
									GROUP BY ITEM_TYPE 
											HAVING COUNT(OUTLET_IDENTIFIER)>=1;
-- Find outlet locations where average rating is greater than 4.
SELECT * FROM BLINKIT_GROCERY;
SELECT OUTLET_LOCATION_TYPE 
			FROM BLINKIT_GROCERY GROUP BY OUTLET_LOCATION_TYPE 
													HAVING AVG(RATING)>ANY
														(SELECT RATING FROM BLINKIT_GROCERY WHERE RATING='4');
-- Count items for each outlet type and outlet size combination.
SELECT * FROM BLINKIT_GROCERY;
WITH CTE AS (
SELECT DISTINCT OUTLET_TYPE,OUTLET_SIZE,COUNT(ITEM_TYPE) 
								OVER(PARTITION BY OUTLET_TYPE,OUTLET_SIZE) AS TOTAL_ITEMS 
																FROM BLINKIT_GROCERY)
                                                                
SELECT * FROM CTE ORDER BY TOTAL_ITEMS DESC;
SELECT OUTLET_TYPE,OUTLET_SIZE,COUNT(ITEM_TYPE) 
					FROM BLINKIT_GROCERY 
							GROUP BY OUTLET_TYPE,OUTLET_SIZE;
-- Display item types ordered by total sales using LIMIT.  
SELECT * FROM BLINKIT_GROCERY;
SELECT   ITEM_TYPE,TOTAL_SALES,ROUND(SUM(TOTAL_SALES) OVER(ORDER BY TOTAL_SALES DESC),2) FROM BLINKIT_GROCERY;


-- Find item types whose total sales are greater than the average sales of all item types.
SELECT * FROM BLINKIT_GROCERY;
SELECT AVG(TOTAL_SALES) FROM BLINKIT_GROCERY;
SELECT ITEM_TYPE,TOTAL_SALES FROM BLINKIT_GROCERY 
					WHERE TOTAL_SALES>
								(SELECT AVG(TOTAL_SALES) FROM BLINKIT_GROCERY);
-- Display outlets whose total sales are higher than the average sales of their location type.
SELECT * FROM BLINKIT_GROCERY;
SELECT AVG(TOTAL_SALES),OUTLET_LOCATION_TYPE 
								FROM BLINKIT_GROCERY 
												GROUP BY OUTLET_LOCATION_TYPE;
SELECT OUTLET_IDENTIFIER,TOTAL_SALES FROM BLINKIT_GROCERY 
											WHERE TOTAL_SALES> ANY
											(SELECT AVG(TOTAL_SALES) FROM BLINKIT_GROCERY GROUP BY OUTLET_LOCATION_TYPE);
-- Find item types that are sold in every outlet location type.
use blinkit_grocery;
SELECT ITEM_TYPE,OUTLET_LOCATION_TYPE FROM BLINKIT_GROCERY;
SELECT * FROM BLINKIT_GROCERY;
SELECT ITEM_TYPE FROM BLINKIT_GROCERY 
					WHERE OUTLET_LOCATION_TYPE=ALL
								(SELECT DISTINCT (OUTLET_LOCATION_TYPE) AS OUTLET_LOCATION_TYPE FROM BLINKIT_GROCERY);
SELECT ITEM_TYPE,OUTLET_LOCATION_TYPE FROM 
								BLINKIT_GROCERY AS BG1 WHERE ITEM_TYPE=ALL
											(SELECT ITEM_TYPE
													FROM BLINKIT_GROCERY AS BG2 
															WHERE BG1.OUTLET_LOCATION_TYPE=BG2.OUTLET_LOCATION_TYPE);
select item_type ,count(outlet_location_type) as co 
					from BLINKIT_GROCERY where co = 
								(SELECT COUNT(distinct(outlet_location_type))  as co 
														from BLINKIT_GROCERY group by outlet_location_type );
-- Display outlets where the maximum item sales is greater than 10,000.
SELECT * FROM BLINKIT_GROCERY;
SELECT OUTLET_IDENTIFIER,ITEM_TYPE,ROUND(SUM(TOTAL_SALES),2) AS MAX_SALE FROM BLINKIT_GROCERY 
GROUP BY OUTLET_IDENTIFIER,ITEM_TYPE HAVING MAX_SALE>10000;
-- Find outlets whose average item rating is higher than the overall average rating.
SELECT * FROM BLINKIT_GROCERY;
SELECT AVG(RATING) FROM BLINKIT_GROCERY;
SELECT AVG(RATING),OUTLET_IDENTIFIER,ITEM_TYPE 
								FROM BLINKIT_GROCERY
												GROUP BY OUTLET_IDENTIFIER,ITEM_TYPE HAVING AVG(RATING)>
												(select avg(rating) from blinkit_grocery);
-- Identify item types that have never received a rating below 3.
SELECT DISTINCT ITEM_TYPE,RATING 
					FROM BLINKIT_GROCERY AS BI WHERE RATING NOT IN 
											(SELECT RATING FROM BLINKIT_GROCERY AS BI2 
																WHERE RATING<3 AND BI.RATING=BI2.RATING);
-- Find item types with sales higher than the sales of item type 'Dairy'.
USE BLINKIT;
SELECT * FROM BLINKIT_GROCERY;
SELECT ITEM_TYPE,SUM(TOTAL_SALES) FROM BLINKIT_GROCERY WHERE ITEM_TYPE='DAIRY' GROUP BY ITEM_TYPE;
SELECT ITEM_TYPE,ROUND(SUM(TOTAL_SALES),2) FROM BLINKIT_GROCERY AS BG1
						GROUP BY ITEM_TYPE HAVING SUM(TOTAL_SALES)>
													(SELECT ROUND(SUM(TOTAL_SALES),2) FROM BLINKIT_GROCERY AS BG2 
																								WHERE ITEM_TYPE='DAIRY');


WITH CTE1 AS 
(SELECT  ITEM_TYPE,SUM(TOTAL_SALES) OVER(PARTITION BY ITEM_TYPE) 
AS DAIRY_SALES FROM BLINKIT_GROCERY WHERE ITEM_TYPE='DAIRY'),
CTE2 AS  (
SELECT DISTINCT ITEM_TYPE,ROUND(SUM(TOTAL_SALES) OVER(PARTITION BY ITEM_TYPE),2) AS OVERALL_ITEM_SALES FROM BLINKIT_GROCERY)

SELECT DISTINCT CTE2.ITEM_TYPE,CTE2.OVERALL_ITEM_SALES FROM CTE1 , 
CTE2 WHERE CTE2.OVERALL_ITEM_SALES>CTE1.DAIRY_SALES; 


-- Display outlet types that contribute more than 30% of total sales.
SELECT * FROM BLINKIT_GROCERY;
SELECT SUM(TOTAL_SALES) AS TOTAL_SALES FROM BLINKIT_GROCERY;
SELECT OUTLET_IDENTIFIER , SUM(TOTAL_SALES) AS OUTLET_IDE_SALES FROM BLINKIT_GROCERY GROUP BY OUTLET_IDENTIFIER;
WITH CTE1 AS (
SELECT DISTINCT  OUTLET_IDENTIFIER,ROUND(SUM(TOTAL_SALES) 
OVER(PARTITION BY OUTLET_IDENTIFIER),2) AS OUTLATE_SALES FROM BLINKIT_GROCERY),
CTE2 AS(
SELECT SUM(TOTAL_SALES) AS OVERALL_SALES FROM BLINKIT_GROCERY),
CTE3 AS (
SELECT CTE1.OUTLET_IDENTIFIER,CTE1.OUTLATE_SALES,CTE2.OVERALL_SALES,
CONCAT(ROUND(CTE1.OUTLATE_SALES/CTE2.OVERALL_SALES*100,2),'%') AS CONTRI
 FROM CTE1,CTE2)
 
SELECT OUTLET_IDENTIFIER,SUM(TOTAL_SALES)  AS TTT FROM BLINKIT_GROCERY GROUP BY OUTLET_IDENTIFIER
HAVING TTT > 
(SELECT (SUM(TOTAL_SALES)*0.3) as ttt FROM BLINKIT_GROCERY );
 
 SELECT   FROM CTE;


-- Find outlets that have more than 5 distinct item types.
use blinkit;
select * from blinkit_grocery;
select outlet_identifier  from blinkit_grocery where item_type 
										in(select item_type  from blinkit_grocery 
												group by item_type having count(item_type)>=5);
select outlet_identifier,count(item_type) from blinkit_grocery group by outlet_identifier;


select  count(distinct item_type),outlet_identifier 
										from blinkit_grocery 
												group by outlet_identifier 
															having count(item_type)>=5;						

select count(distinct outlet_identifier) from blinkit_grocery;


-- List item types with sales greater than all items sold in a specific outlet.
use blinkit;
select * from blinkit_grocery;
select item_type,round(sum(total_sales),2) 
from blinkit_grocery 
group by item_type 
having round(sum(total_sales),2)>(select sum(total_sales) from blinkit_grocery where outlet_identifier='out049');

alter table blinkit_grocery change column item_type new_item_type varchar(35);
alter table blinkit_grocery rename column new_item_type to item_type;

update blinkit_grocery set item_identifier=item_fat_content;

drop table blinkit_grocery;
drop database blinkit;
create database blinkit;
use blinkit;

show databases;


                                                                              
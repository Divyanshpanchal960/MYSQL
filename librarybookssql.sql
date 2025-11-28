CREATE TABLE authors (
    author_id INT PRIMARY KEY,
    author_name VARCHAR(50),
    country VARCHAR(50)
);

CREATE TABLE books (
    book_id INT PRIMARY KEY,
    book_title VARCHAR(100),
    author_id INT,
    genre VARCHAR(30),
    pages INT,
    price DECIMAL(8,2),
    published_year INT,
    FOREIGN KEY (author_id) REFERENCES authors(author_id)
);

CREATE TABLE borrowers (
    borrower_id INT PRIMARY KEY,
    borrower_name VARCHAR(50),
    city VARCHAR(50)
);

CREATE TABLE issued_books (
    issue_id INT PRIMARY KEY,
    book_id INT,
    borrower_id INT,
    issue_date DATE,
    return_date DATE,
    FOREIGN KEY (book_id) REFERENCES books(book_id),
    FOREIGN KEY (borrower_id) REFERENCES borrowers(borrower_id)
);
INSERT INTO authors VALUES
(1,'J.K Rowling','UK'),
(2,'George Orwell','UK'),
(3,'Dan Brown','USA'),
(4,'Chetan Bhagat','India'),
(5,'Agatha Christie','UK');

INSERT INTO books VALUES
(101,'Harry Potter',1,'Fantasy',450,399,1997),
(102,'1984',2,'Dystopian',328,299,1949),
(103,'Angels and Demons',3,'Thriller',500,499,2000),
(104,'The Silent Patient',5,'Mystery',336,350,2019),
(105,'The 3 Mistakes of My Life',4,'Fiction',280,250,2008),
(106,'Inferno',3,'Thriller',620,599,2013);

INSERT INTO borrowers VALUES
(1,'Rahul','Delhi'),
(2,'Sneha','Mumbai'),
(3,'Vikram','Bangalore'),
(4,'Anjali','Pune');

INSERT INTO issued_books VALUES
(1,101,1,'2024-01-05','2024-01-20'),
(2,103,2,'2024-01-10',NULL),
(3,105,3,'2024-01-12','2024-01-19'),
(4,102,4,'2024-01-14',NULL),
(5,104,1,'2024-02-01',NULL);

select * from authors;
select * from books;
select * from borrowers;
select * from issued_books;
-- 🟦 WINDOW FUNCTION QUESTIONS
-- 1️⃣ Rank books based on price within their genre.
select * from books;
select genre,price,book_title,dense_rank()over(order by price desc) from books;
-- 2️⃣ Find the top 2 longest books in each genre using DENSE_RANK.
select * from books;
with cte as(
select book_title,genre,pages,dense_rank() over(partition by genre order by pages desc) as longest_books from books)
select * from cte where longest_books<=2;
-- 3️⃣ Show books along with the previous book’s price (use LAG).
select * from books;
select book_title,price,lag(price) over(order by price desc) from books;

-- 4️⃣ Show books along with the next book’s published year (USE LEAD).
select * from books;
select book_title,published_year,
						lead(published_year) 
								over(order by published_year) from books;
-- 5️⃣ Assign row numbers to issued books ordered by issue_date.
select * from books;
select * from issued_books;
select i.issue_id,issue_date,b.book_title,
							row_number() over(order by issue_date) from books as b join 
																			issued_books as i on b.book_id=i.book_id ;  
-- 6️⃣ Find authors whose books have the highest page count (window filter).
select * from authors;
select * from books;
with cte as(
select author_name,book_title,pages,dense_rank() over(order by pages desc) as highest_author 
											from books as b join authors as a on a.author_id=b.author_id)
																						select * from cte where highest_author=1;
                                                                                        
-- 7️⃣ Show total pages written by each author (SUM OVER PARTITION).
select * from books;
select * from authors;
select author_name,book_title,pages,sum(b.pages) over(partition by a.author_id order by b.pages desc), 
										row_number() over(order by b.pages desc ) from books as b join authors as a on b.author_id=a.author_id;
-- 8️⃣ Show percentage contribution of each book to total library price.
select * from authors;
select * from books;
select count(book_id) from books;
select book_title,price from books;
with cte as ( 
select price,book_title,price/sum(price) over()*100 as total_library_price from books)
select book_title,price,total_library_price from cte;

-- List all books with their author names.
select * from books;
select * from authors;
select book_title,author_name from books as b join authors as a on b.author_id=a.author_id;
-- 🔟 Show borrower name, book name, and issue date.
select * from borrowers;
select * from books;
select * from issued_books;
select br.borrower_name,b.book_title,i.issue_date from borrowers as br 
											join issued_books as i on br.borrower_id=i.borrower_id
																			join books as b on b.book_id=i.book_id;
                                                                            
-- 1️⃣1️⃣ Find books issued to “Rahul”.
select * from books;
select * from borrowers;
select * from issued_books;
select b.book_title,i.issue_date from books as b join issued_books as i on b.book_id=i.book_id join 
																					borrowers as br on br.borrower_id=i.borrower_id
where borrower_name='Rahul';
-- 1️⃣2️⃣ List authors whose books have never been issued.
select * from books;
select * from issued_books;
select * from authors;
show tables;
select a.author_name,b.book_title,i.issue_date from 
									books as b join issued_books as i 
														on b.book_id=i.book_id join authors as a on a.author_id=b.author_id
																									where a.author_name and i.issue_id is null;

-- 1️⃣3️⃣ Show the number of books written by authors from the UK.
select * from books;
select * from issued_books;
select * from authors;
select count(book_id),country from 
					books as b join authors as a 
									on a.author_id=b.author_id 
												where country='UK' group by country;
-- 1️⃣4️⃣ Show books along with the borrower city.
select * from books;
select * from issued_books;
select * from borrowers;
select b.book_id,b.book_title,br.city 
					from books as b join issued_books as i on b.book_id=i.book_id 
													join borrowers as br on br.borrower_id=i.borrower_id;
-- 1️⃣5️⃣ Show all books even if not borrowed (LEFT JOIN).
select * from books;
select * from borrowers;
select * from issued_books;
select b.book_title,br.borrower_name from books as b 
								left join issued_books as i on b.book_id=i.book_id 
												left join borrowers as br on br.borrower_id=i.borrower_id;


-- Find authors who wrote books priced above the average book price.
show tables;
select * from authors;
select * from books;
select avg(price) from books;
select author_name,book_title,price from books as b 
						join authors as a on b.author_id=a.author_id 
										where price>(select avg(price) from books); 
-- 1️⃣7️⃣ Find books with price equal to any UK author's book price.
select book_title,price from books as b 
				join authors as a on b.author_id=a.author_id  
											where price IN
												(select price from books as b2 where country='UK'); 


-- 1️⃣8️⃣ Get borrowers who borrowed books longer than 500 pages.
select * from borrowers;
select * from books;
select * from issued_books;
select br.borrower_name,b.pages,b.book_title from books as b 
						join issued_books as i on b.book_id=i.book_id 
														join borrowers as br 
																where br.borrower_id=i.borrower_id and b.pages>500;

select * from issued_books;
select borrower_name,pages,book_title from borrowers as br 
							join issued_books as i on br.borrower_id=i.borrower_id 
												join books as b on b.book_id=i.book_id where pages>500;
select br.borrower_name,b.pages,b.book_title from books as b 
									join issued_books as i on b.book_id=i.book_id 
													join borrowers as br on br.borrower_id=i.borrower_id 
																where  b.pages >any(select b2.pages from books as b2  
																							where b.book_id=b2.book_id and pages>500);

-- 1️⃣9️⃣ Show books published before the oldest book.
select  * from books;
select min(published_year),book_title from books 
						group by book_title order by book_title limit 1;
                        
select book_title,published_year from books where published_year<
																(select min(published_year) from books);
                                                                
select book_title,min(published_year) from books where book_title;
-- 2️⃣0️⃣ Find the second most expensive book.
select * from books;
with cte as (
select book_title,price,rank() over(order by price desc) as 
												expensive_books_rank from books)
																select * from cte where expensive_books_rank=2;

-- Find books whose price is greater than the average price of their own genre.
select avg(price),genre from books group by genre;
select price,book_title from books as b where price > 
									(select avg(price) from books as b2 where b.genre=b2.genre);
-- 2️⃣2️⃣ Find authors whose every book has more than 300 pages.
select * from authors;
select * from books;
select book_title,author_name,pages from books as b 
									join authors as a on a.author_id=b.author_id 
														where pages in(select pages from books where pages>=300);
-- 2️⃣3️⃣ Show borrowers who returned books earlier than the average return time of others.
select min(return_date) from issued_books;
select * from issued_books;
select * from borrowers;
select return_date,borrower_name from issued_books as i 
									join borrowers as b on i.borrower_id=b.borrower_id 
																where return_date<(select avg(return_date) from issued_books);
-- 2️⃣4️⃣ Find books that are the longest in their author's collection.
select * from books;
select * from authors;
with cte as (
select book_title,author_name,pages,dense_rank() 
						over(partition by author_name order by pages desc) as longest_books 
																from books as b join authors as a on b.author_id=a.author_id)
																					select * from cte where longest_books=1; -- filtereation using cte
-- -- 2️⃣5️⃣ List books that are cheaper than all books issued in 2024.
select * from books;
select * from issued_books where year(issue_date);
select price,book_title from books  where price
							<all(select price from books as b  join issued_books as i on b.book_id=i.book_id 
																										where year(issue_date)=2024);
                                                                                                        
-- -- 2️⃣6️⃣ Add a NOT NULL constraint on genre column.
use amazon;
show tables;
select * from books;
alter table books modify column genre varchar(20) not null;

-- -- 2️⃣7️⃣ Drop the column pages from books table.
alter table books drop column pages;
select * from books;
alter table books add column pages int not null;
alter table books modify column pages int;
update books set pages=450 where book_id=101;
update books set pages=328 where book_id=102;
update books set pages=400 where book_id=103;
update books set pages =450 where book_id=104;
update books set pages=500 where book_id=105;
update books set pages=620 where book_id=106;
-- -- 2️⃣8️⃣ Rename table borrowers to customers.
alter table borrowers rename to customers;
select * from customers;
-- -- 2️⃣9️⃣ Modify price datatype from DECIMAL to INT.
select * from books;
alter table books modify column price int;
-- -- 3️⃣0️⃣ Add a new column “rating INT” to books
alter table books add column rating int;
update books set rating=9 where book_id=101;
update books set rating=7 where book_id=102;
update books set rating=7 where book_id=103;
update books set rating=8 where book_id=104;
update books set rating=6 where book_id=105;
update books set rating =8 where book_id=106;
update books set rating =7 where book_id=107;
-- -- 🟧 DML QUESTIONS
-- -- 3️⃣1️⃣ Insert a new book “Digital Fortress” by Dan Brown.
insert into books (book_id,book_title,author_id,genre,price,published_year,pages,rating) values(107,'Digital fortress',1,'fantasy',470,2003,650,8);
select * from books;
-- -- 3️⃣2️⃣ Update price of all Thriller genre books by +50.
update books set price =price+50 where genre='Thriller';
-- -- 3️⃣3️⃣ Delete books published before 1950.
delete from books where published_year< '1950'; 
delete from books where published_year< 1950;
-- -- 3️⃣4️⃣ Increase page count by 10% for all books.
update books set pages=pages+0.1;
select * from books;
-- -- 3️⃣5️⃣ Delete all records where return_date is NULL.
show tables;
delete from issued_books where return_date is null;
-- -- 🟦 TCL QUESTIONS
-- -- 3️⃣6️⃣ Start a transaction, update book price, then ROLLBACK.
start transaction;
select * from books;
update books set price=800 where book_id in(101,102,103);
rollback;
select * from books;

-- -- 3️⃣7️⃣ Use SAVEPOINT for multiple updates on borrowers.
start transaction;
update books set price=500  where book_id in (101,102);
savepoint b1; 
update books set price=600 where book_id in (103,104);
savepoint b2;
rollback  to savepoint b1;
rollback to savepoint b2;
-- -- 3️⃣8️⃣ COMMIT all price changes in Thriller genre.
select * from books;
start transaction;
update books set price=400 where book_id=102;
commit;
-- -- 🟧 DCL QUESTIONS
-- -- 3️⃣9️⃣ Grant SELECT on books to a user.
grant select on amazon.books to 'DIVYANSH';
-- -- 4️⃣0️⃣ Grant INSERT, UPDATE, DELETE on issued_books to a user.
grant insert,update,delete on amazon.issued_books to 'DIVYANSH';
-- -- 4️⃣1️⃣ Revoke UPDATE privilege on borrowers from a user.
GRANT UPDATE ON AMAZON.customers TO 'DIVYANSH';
REVOKE UPDATE ON AMAZON.CUSTOMERS FROM 'DIVYANSH';
-- -- 4️⃣2️⃣ Create a user and give CREATE TABLE privileges.
CREATE USER 'SIERA' identified BY 'MYCODE123';
GRANT CREATE ON AMAZON TO 'SIERA';
-- -- 🟫 TRICKY SQL QUESTIONS
-- -- 4️⃣3️⃣ Find duplicate book titles (if any).
use amazon;
SELECT BOOK_TITLE FROM BOOKS;
-- -- 4️⃣4️⃣ Show borrowers who issued more than 1 books.
select * from customers;
show tables;
select * from issued_books;
select borrower_name,issue_id from customers as c join issued_books as i on c.borrower_id=i.borrower_id where issue_id>=1;
-- -- 4️⃣5️⃣ List books that never got returned.
select * from books;
select * from issued_books;
select book_title,return_date from books as b join issued_books as i on b.book_id=i.book_id where return_date is null;
-- -- 4️⃣6️⃣ Show author who generated the highest total revenue from books.
select * from authors;
select * from books;
with cte as (
select author_name,sum(price) as highest_total_revenue from  authors as a join books as b on a.author_id=b.author_id group by author_name)
select author_name,highest_total_revenue from cte order by highest_total_revenue desc limit 1;
-- -- 4️⃣7️⃣ Show books whose title contains exactly 3 words.
select book_title,book_id from books where book_title like '% % %';
-- -- 4️⃣8️⃣ List authors whose name starts and ends with the same letter.
use amazon;
select * from authors;
select author_name from authors where author_name like '_%_';
-- -- 4️⃣9️⃣ Find books whose price is within top 3 of entire library.
select * from books;
select book_title,price from books order by price desc limit 3;
with cte as (
select book_title,price,rank() over(order by price desc) as top_ranker from books)
select * from cte where top_ranker<=3; 
-- -- 5️⃣0️⃣ Show pairs of books written by the same author.
select * from books;
select * from authors;
select  b1.book_title,a.author_name from books as b1 join books as b2 
										on b2.author_id=b1.author_id 
													join authors as a on b2.author_id=a.author_id AND b1.book_id>b2.book_id;


select book_title from books as b where book_title =exists(select book_title from books as b2 join authors as a on b2.author_id=a.author_id); 
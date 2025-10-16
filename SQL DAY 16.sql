-- DATA TYPES IN SQL
--  NUMERIC DATA TYPES--> TINYINT,SMALLINT,MEDIUMINT,INT ,BIGINT
USE SAKILA;
CREATE TABLE TUSHAR1(ID TINYINT);
INSERT INTO TUSHAR1 values(10),(-9);
select * from tushar1;

CREATE TABLE TUSHAR2(ID SMALLINT);
INSERT INTO TUSHAR2 VALUES (10),(-9);
SELECT * FROM TUSHAR2;

CREATE TABLE TUSHAR3(ID MEDIUMINT);
INSERT INTO TUSHAR3 VALUES(10),(-9);
SELECT * FROM TUSHAR3;

CREATE TABLE TUSHAR4(ID INT);
INSERT INTO TUSHAR4 VALUES(10),(-9);
SELECT * FROM TUSHAR4;

CREATE TABLE TUSHAR5(ID BIGINT);
INSERT INTO TUSHAR5 VALUES(10),(-9);
SELECT * FROM TUSHAR5;

create table tushar7(ID int NOT NULL ,
joining_date  DATE,
joining_time TIME ,
joining_timestamp TIMESTAMP);
insert into tushar7(ID,joining_date,joining_time,joining_timestamp) 
values(1,'2025-04-02','02:32:23','2025-04-02 02:32:23');

SELECT * FROM TUSHAR7;

create table tushar8(ID int NOT NULL ,
joining_date  DATE,
joining_time TIME ,
joining_timestamp TIMESTAMP default current_timestamp);
insert into tushar8(ID,joining_date,joining_time) 
values(1,'2025-04-02','02:32:23');
select * from tushar8;


create table tushar9(ID int NOT NULL ,
joining_date  DATE,
joining_time TIME,
joining_timestamp TIMESTAMP default current_timestamp);
insert into tushar9(ID,joining_date,joining_time) 
values(1,curdate(),curtime());
select * from tushar9;


create table hardik1 (id tinyint ); # id tiny .int  uniqned 
insert into hardik1 values(10), (-0);
insert into hardik1 values (127 ) ; # 128 to 128 (1byte) 2**8
insert into hardik1 values(128 );  # error out of range
select * from hardik1;


-- smallint , 2 byte 089
create table divyansh2(id float , id2 double) ; # id tiny. int unsigned 
insert into divyansh2 values (10.1234567875875858 , 10.12345678);
select * from divyansh2;

create table divyansh4 (id2 double(5,2) );  # id tiny. int unsigned 
insert into divyansh4 values (10.123456789);
insert into divyansh4 values (178.123456789);
insert into divyansh4 values (1876.123456789); # out of range error
 select * from divyansh4 ;
 
 create table hardik4 (grnder char(5) ); # id tiny. id unsigned
 insert into hardik2 values('abc'); 
 insert into hardik2 values('abcde'); 
 insert into hardik2 values('abcvduhdg'); -- error data  too long
 insert into hardik2 values('abc'); -- 
 
 select * from hardik2 ;
 
 select gender , char_length(grnder) from hardik4 ;
 
 
 create table hardik3 (gender varchar(5) ); # id tiny. id unsigned
 insert into hardik2 values('abc'); 
insert into hardik2 values('abc'); 
select gender , char_length(gender) from hardik3 ;



  
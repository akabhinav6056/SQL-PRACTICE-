create database dress_data ;
use dress_data;
create table if not exists dress(
`Dress_ID` varchar(30),	
`Style`	varchar(30),	
`Price`	varchar(30),	
`Rating`	varchar(30),	
`Size`	varchar(30),	
`Season`	varchar(30),	
`NeckLine`	varchar(30),	
`SleeveLength` varchar(30),		
`waiseline`	varchar(30),	
`Material`	varchar(30),	
`FabricType`	varchar(30),	
`Decoration`	varchar(30),	
`Pattern Type` varchar(30),		
`Recommendation` varchar(30))	

select * from dress 

LOAD DATA INFILE 'E:/FSDA COURSE/Mysql/AttributeDataSet.csv'
into table dress 
FIELDS TERMINATED by ','
ENCLOSED by '"'
lines terminated by '\n'
IGNORE 1 ROWS ; 

create table if not exists test(
test_id int auto_increment , 
test_name varchar(30),
test_mailid varchar(30),
test_adress varchar(30),
primary key(test_id ))

select* from test

insert into test (test_name, test_mailid , test_adress) values ('sudhanshu','sudhanshu@ineuron.ai','benglaore' ),
('krish','krish@gmail.com', 'bengalore' ),
('hitesh' ,'hitesh@ineuron.ai','bengalore' ),
('shubahm' , 'shudham@gmail.com', 'jaipur')

create table if not exists test1(
test_id int  , 
test_name varchar(30),
test_mailid varchar(30),
test_adress varchar(30),
test_salary int check (test_salary >10000))

insert into test1 values (1,'sudhanshu','sudhanshu@ineuron.ai','benglaore' , 50000),
(2,'krish','krish@gmail.com', 'bengalore' , 30000),
(3,'hitesh' ,'hitesh@ineuron.ai','bengalore' , 111000),
(4,'shubahm' , 'shudham@gmail.com', 'jaipur',20000000)

select * from test1 

create table if not exists test2(
test_id int  , 
test_name varchar(30),
test_mailid varchar(30),
test_adress varchar(30) check (test_adress='bengalore') NOT NULL,
test_salary int check (test_salary >10000))

create table if not exists test8( 
test_id int NOT NULL auto_increment  ,
test_name varchar(30)  NOT NULL default 'unknown' , 
test_mailid varchar(30) unique NOT NULL,
teast_adress varchar(30) check (teast_adress= 'bengalore') NOT NULL,
test_salary int check(test_salary > 10000) NOT NULL,
primary key (test_id))

insert into test8 (  test_name , test_mailid , teast_adress,test_salary) values (  'sudhanshu','sudhanshu11@ineuron.ai','bengalore' , 50000)

select *  from test8

select * from dress

DELIMITER &&
create procedure dressrec()
begin 
select* from dress ;
end &&

call dressrec()
















 

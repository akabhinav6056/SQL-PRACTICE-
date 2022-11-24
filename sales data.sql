create database sales 
use sales
CREATE TABLE sales1 (
	order_id VARCHAR(15) NOT NULL, 
	order_date VARCHAR(15) NOT NULL, 
	ship_date VARCHAR(15) NOT NULL, 
	ship_mode VARCHAR(14) NOT NULL, 
	customer_name VARCHAR(22) NOT NULL, 
	segment VARCHAR(11) NOT NULL, 
	state VARCHAR(36) NOT NULL, 
	country VARCHAR(32) NOT NULL, 
	market VARCHAR(6) NOT NULL, 
	region VARCHAR(14) NOT NULL, 
	product_id VARCHAR(16) NOT NULL, 
	category VARCHAR(15) NOT NULL, 
	sub_category VARCHAR(11) NOT NULL, 
	product_name VARCHAR(127) NOT NULL, 
	sales DECIMAL(38, 0) NOT NULL, 
	quantity DECIMAL(38, 0) NOT NULL, 
	discount DECIMAL(38, 3) NOT NULL, 
	profit DECIMAL(38, 8) NOT NULL, 
	shipping_cost DECIMAL(38, 2) NOT NULL, 
	order_priority VARCHAR(8) NOT NULL, 
	`year` DECIMAL(38, 0) NOT NULL
);

select * from sales1


set session sql_mode = ''

LOAD DATA INFILE "E:/FSDA COURSE/Mysql/sales_data_final.csv"
into table sales1
FIELDS TERMINATED by ','
ENCLOSED by '"'
lines terminated by '\n'
IGNORE 1 ROWS ; 

select str_to_date(order_date, '%m/%d/%y') from sales1

alter table sales1 
add column order_date_new date after order_date 

SET SQL_SAFE_UPDATES = 0;

update sales1 
set order_date_new = str_to_date(order_date, '%m/%d/%Y') 

alter table sales1 
add column ship_date_new date after ship_date


update sales1 
set ship_date_new = str_to_date(ship_date, '%m/%d/%Y') 

SELECT * from sales1 where ship_date_new = '2011-01-05'

SELECT * from sales1 where ship_date_new <'2011-01-05'
SELECT * from sales1 where ship_date_new > '2011-01-05'

SELECT * from sales1 where ship_date_new  between '2011-01-03' and '2011-08-30'

select now()
select curdate()
select curtime()

select * from sales1 where ship_date_new <date_sub(now() , interval 1 week ) limit 100


 select date_sub(now() , interval 1 week )
 
 select date_sub(now(), interval 2 month)
  select date_sub('2011-08-30' , interval 1 week )
  select dayname('2011-08-23')
  
  alter table sales1
  add column flag date  after order_id 
  
  update sales1 
  set flag = now()
  
  alter table sales1 
  modify column year datetime ;
  
  alter table sales1
  add column year_new date after year
  
  alter table sales1
  add column month_new date after year
  
  alter table sales1
  add column day_new date after year 
  
alter table sales1 
modify column year_new int 

alter table sales1 
modify column month_new int 

alter table sales1 
modify column day_new int 

update sales1 
set year_new = year(order_date_new);

update sales1 
set month_new = month(order_date_new);

update sales1 
set day_new = day(order_date_new);

select avg(sales), year_new from sales1 group by year_new 

select sum(sales), year_new from sales1 group by year_new 
select max(sales), year_new from sales1 group by year_new 

select avg(sales), year_new , sum(quantity) from sales1 group by year_new 

select sum(sales*discount+shipping_cost) as ctc from sales1 group by year_new 

select sales * discount , sales , discount from sales1 

select order_id , discount, if(discount >0 , 'yes' ,'no') as discount_flag from sales1 
alter table sales1
add column dicount_flag varchar(30)

alter table sales1 
modify column dicount_flag varchar(30) after discount ;

update sales1 
set dicount_flag = if(discount >0 , 'yes' ,'no');

select count(*),dicount_flag  from sales1 group by dicount_flag

use sales 

DELIMITER $$
create function add_to_col (a int ) 
returns int 
deterministic 
begin 
declare b int ;
set b= a+10 ;
return b;
end $$

select add_to_col(quantity) , quantity ,sales from  sales1 

DELIMITER &&
create function final_profits(profit int , discount int )
returns int 
deterministic 
begin
declare final_profit int ;
set final_profit = profit - discount ; 
return final_profit ;
end &&

DELIMITER &&
create function final_profits1(profit int , discount decimal(20,6)   , sales int )
returns int 
deterministic 
begin
declare final_profit int ;
set final_profit = profit - discount*sales  ; 
return final_profit ;
end &&
select final_profits1(profit , discount,sales ) , discount , profit ,sales from sales1 

DELIMITER &&
create function sting_convert(i int  )
returns varchar(30)
deterministic 
begin
declare str varchar(30) ;
set str=i ; 
return str ;
end &&

select quantity ,sting_convert(quantity) from sales1 

DELIMITER &&
create function mark_sales(sales int) 
returns varchar(30)
deterministic 
begin 
declare flag_sales varchar(30);
if sales <100 then set flag_sales ='super affordable';
elseif sales >100 and sales <300 then 
set flag_sales =' affordable';
elseif sales >300 and sales <600 then 
set flag_sales ='moderate  affordable';
else set flag_sales = 'expesive ';
end if ;
return flag_sales ;
end &&

select sales , mark_sales(sales) from sales1 

create table loop_table(val int)




Delimiter $$
create procedure insert_data()
Begin
set @var  = 10 ;
generate_data : loop
insert into loop_table values (@var);
set @var = @var + 1  ;
if @var  = 100 then 
	leave generate_data;
end if ;
end loop generate_data;
End $$

call insert_data()

select * from loop_table 

create table numsquare( numb int , nunbsq int)


DELIMITER &&
create procedure  NUMSQU()
begin
set @var1 =1;
set @var2=1;
gen_squ : loop
insert into numsquare values(@var1,@var2);
set @var1= @var1+1;
set @var2 = @var1 * @var1 ;
if @var1  = 100 then 
	leave gen_squ;
end if ;
end loop gen_squ;
End &&

call NUMSQU()
select * from numsquare

use sales

select * from sales1
select profit from sales1 order by profit desc limit 4,1;






















  
  
  
  
  
 
 
 
 
 
















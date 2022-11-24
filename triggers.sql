create database triger 
use triger 

create table course (
course_id int,
course_desc varchar(50),
course_mentor varchar(50),
course_price int ,
course_discount int)

alter table course add create_date date ;

select * from course
   

create table course_update(
course_metor_update varchar(50),
course_price_update int ,
course_discount_update int )

delimiter && 
create trigger course_before_insert 
before insert 
on course for each row 
begin 
set new.create_date = sysdate();
end ; && 

insert into course(course_id , course_desc, course_mentor, course_price, course_discount) value(101,'fsda','abhinav',4000,10)

select * from course 

create table course1 (
course_id int,
course_desc varchar(50),
course_mentor varchar(50),
course_price int ,
course_discount int, 
course_date date , 
user_info varchar(50))

delimiter && 
create trigger course_before_insert1
before insert 
on course1 for each row 
begin 
declare user_val varchar(50);
set new.course_date = sysdate();
select user() into user_val;
set new.user_info = user_val ;
end ; && 

insert into course1(course_id , course_desc, course_mentor, course_price, course_discount,user_info) value(101,'fsda','abhinav',4000,10, 'abhi')


select * from course1

create table ref_course (
record_insert_date date,
record_insert_user varchar(50)
)


delimiter && 
create trigger course_before_insert2
before insert 
on course1 for each row 
begin 
declare user_val varchar(50);
set new.course_date = sysdate();
select user() into user_val;
set new.user_info = user_val ;
insert into ref_course values (sysdate(), user_val) ;
end ; && 


insert into course1(course_id , course_desc, course_mentor, course_price, course_discount,user_info) value(101,'fsda','abhinav',4000,10, 'abhi')

select * from ref_course


create table test1(
c1 varchar(50),
c2 date,
c3 int)


create table test2(
c1 varchar(50),
c2 date,
c3 int )


create table test3(
c1 varchar(50),
c2 date,
c3 int )




delimiter && 
create trigger update_others 
before insert on test1 for each row 
begin 
insert into test2 values ('xyx' , sysdate(), 2345);
insert into test3 values ('ddd' , sysdate(), 7777);

end ;&& 


insert into test1 values ('abhinav', sysdate(), 3433)

select * from test1

select * from test3

delimiter && 
create trigger update_others1
after insert on test1 for each row 
begin 
update test2 set c1= 'abc' where c1='xyx';
delete from  test3 where c1='ddd';

end ;&& 

set session sql_mode = ''
insert into test1 values ('abhinav khajura ', sysdate(), 3433)


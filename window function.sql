create database win_fun 


create table ineuron_students(
student_id int ,
student_batch varchar(30),
student_name varchar(30),
student_stream varchar(30),
student_marks int ,
student_mail_id varchar(50))

insert into ineuron_students values (101, 'fsda', 'Abhinav', 'cs', 80, 'abhinav@gamil.com ' )

insert into ineuron_students values(100 ,'fsda' , 'saurabh','cs',80,'saurabh@gmail.com'),
(102 ,'fsda' , 'sanket','cs',81,'sanket@gmail.com'),
(103 ,'fsda' , 'shyam','cs',80,'shyam@gmail.com'),
(104 ,'fsda' , 'sanket','cs',82,'sanket@gmail.com'),
(105 ,'fsda' , 'shyam','ME',67,'shyam@gmail.com'),
(106 ,'fsds' , 'ajay','ME',45,'ajay@gmail.com'),
(106 ,'fsds' , 'ajay','ME',78,'ajay@gmail.com'),
(108 ,'fsds' , 'snehal','CI',89,'snehal@gmail.com'),
(109 ,'fsds' , 'manisha','CI',34,'manisha@gmail.com'),
(110 ,'fsds' , 'rakesh','CI',45,'rakesh@gmail.com'),
(111 ,'fsde' , 'anuj','CI',43,'anuj@gmail.com'),
(112 ,'fsde' , 'mohit','EE',67,'mohit@gmail.com'),
(113 ,'fsde' , 'vivek','EE',23,'vivek@gmail.com'),
(114 ,'fsde' , 'gaurav','EE',45,'gaurav@gmail.com'),
(115 ,'fsde' , 'prateek','EE',89,'prateek@gmail.com'),
(116 ,'fsde' , 'mithun','ECE',23,'mithun@gmail.com'),
(117 ,'fsbc' , 'chaitra','ECE',23,'chaitra@gmail.com'),
(118 ,'fsbc' , 'pranay','ECE',45,'pranay@gmail.com'),
(119 ,'fsbc' , 'sandeep1','ECE',65,'sandeep@gmail.com')

alter table ineuron_students rename to student;

select * from student order by student_id 

select * from student group by student_batch 

select * , sum(student_marks) from student group by student_batch 

select student_batch , min(student_marks) from student group by student_batch 

select student_batch , avg(student_marks) from student group by student_batch 

select student_batch , max(student_marks) from student group by student_batch 

select count(*) from student

select count(*), student_batch  from student group by student_batch

select * from student group by student_marks having student_marks = 80

select * from student group by  student_batch having student_batch = 'fsda' order by student_marks desc

select * from student where student_batch = 'fsda' order by student_marks desc  limit 1,4

select * , row_number() over (order by student_marks )as 'row_number' from student 

select * , row_number() over (partition by student_batch order by student_marks desc )as 'row_number' from student 

select * from (select *, row_number() over (partition by student_batch order by student_marks desc )as 'row_num' from student ) as test  where row_num =1 
 insert into student values (119 ,'fsbc' , 'sandeep1','ECE',65,'sandeep@gmail.com')
 
 select * , rank() over (order by student_marks desc )as 'row_rank',row_number() over (order by student_marks desc )as 'row_number' from student
 
select * from (select * , rank() over (partition by student_batch order by student_marks desc )as 'row_rank',row_number() over (partition by student_batch order by student_marks desc )as 'row_number' from student) as test where row_rank=1
select * from (select * , dense_rank() over (order by student_marks desc )as 'row_rank',row_number() over (order by student_marks desc )as 'row_number' from student  ) as test1 where row_rank=2


select* from(select * ,dense_rank() over (partition by student_batch order by student_marks desc )as 'dense_rank1',
 rank() over (partition by student_batch order by student_marks desc )as 'row_rank',
row_number() over (partition by student_batch order by student_marks desc )as 'row_number' from student) as test2 where dense_rank1 in (1,2,3)

select * from student 
select * from (select * , dense_rank() over( partition by student_stream and student_batch  order by student_marks desc ) as 'dens_ranking' from student ) as test33 where dens_ranking =1

select * from (select * , dense_rank() over(  order by student_marks desc ) as 'dens_ranking' from student ) 
as test33 where dens_ranking in (1,2,3)




















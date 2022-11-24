1 . Create a loopp for a table to insert a record into a tale for two columns in first coumn you have to inset a data ranging from 1 to 100 
	and in second column you hvae to inset a square of the first column
   

create database procedfunc ;
use procedfunc 


create table numsquare2( numb int , nunbsq int)
DELIMITER &&
create procedure  NUMSQU2()
begin
set @var1 =1;
set @var2=1;
gen_squ : loop
insert into numsquare2 values(@var1,@var2);
set @var1= @var1+1;
set @var2 = @var1 * @var1 ;
if @var1  = 100 then 
	leave gen_squ;
end if ;
end loop gen_squ;
End &&

call NUMSQU2()
select * from numsquare2

create a UDF to find out a log base 10 of any given number


delimiter &&
create function lognum(num int )
returns decimal(20,5)
deterministic 
begin
declare logresult  decimal(20,5);
set logresult =log10(num);
return logresult;
end && 
 select numb , lognum(numb) from numsquare2
 
 
 
 
 
 
 
 


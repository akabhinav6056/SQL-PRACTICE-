use parti
select * from courses

select * ,
case 
when course_name = 'fsda' then 'this is my batch '
when course_name ='fsds' then 'this is also my batch ' 
else 'this is not my batch ' 
end as statement 
from courses 

select * , 
case 
when length(course_name) > 4 then ' this is lenghty course '
when length(course_name) <4 then ' this is nor ok'
when length(course_name) = 4 then ' its ok' 
else 'ookkkkk' 
end as statement1
from courses


update courses set course_name = case 
when course_name = 'RL' then 'reinforcement learing'
when course_name = 'dl' then 'deep learning'
end 
 
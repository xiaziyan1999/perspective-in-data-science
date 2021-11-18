Use employees;
select sum(case when gender='F' and salary>100000 then 1 else 0 end)/sum(case gender when 'F' then 1 else 0 end) as female_proportion,
       sum(case when gender='M' and salary>100000 then 1 else 0 end)/sum(case gender when 'M' then 1 else 0 end) as male_proportion
from (select s.salary,t.title,t.end_date,t.emp_no,t.gender
from salaries s
join tmp1 t
on t.emp_no=s.emp_no and t.end_date=s.to_date) h
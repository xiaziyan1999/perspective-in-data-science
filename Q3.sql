Use employees;
create temporary table tmp1
select t.title,t.emp_no,t.end_date,e.gender
from (
   select j.end_date,t.title,t.emp_no
   from
   (SELECT MAX(to_date) as end_date,
          emp_no
   FROM titles
   group by emp_no) j
   join titles t on t.emp_no=j.emp_no and t.to_date=j.end_date
where end_date = '9999-01-01') t
join employees e
on t.emp_no=e.emp_no;


select avg(salary) as average_salary,title,gender
from (select s.salary,t.title,t.end_date,t.emp_no,t.gender
from salaries s
join tmp1 t
on t.emp_no=s.emp_no and t.end_date=s.to_date) h
group by title,gender
order by title;
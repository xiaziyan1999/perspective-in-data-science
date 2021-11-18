Use employees;
select AVG(salary) as average_salary,gender
from (select s.salary,e.gender
from salaries s
join employees e
on s.emp_no = e.emp_no) b
group by gender;
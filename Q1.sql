Use employees;
SELECT e.first_name,e.last_name,
       a.start_date,
       a.title as start_title,
       b.end_date,
       b.title as end_title
FROM employees e
JOIN
  ((select h.start_date,t.title,t.emp_no
   from
   (SELECT MIN(from_date) as start_date,
          emp_no
   FROM titles
   group by emp_no) h
   join titles t on t.emp_no=h.emp_no and t.from_date=h.start_date) ) a ON e.emp_no=a.emp_no
JOIN ((select j.end_date,t.title,t.emp_no
   from
   (SELECT MAX(to_date) as end_date,
          emp_no
   FROM titles
   group by emp_no) j
   join titles t on t.emp_no=j.emp_no and t.to_date=j.end_date) ) b ON e.emp_no=b.emp_no
   order by last_name,first_name
   limit 20;
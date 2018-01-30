--연습 1--
select last_name, job_id, salary as sal
from employees;

select *
from job_grades;

select first_name, job_id, hire_date , employee_id 
from employee;

describe employees

--연습2--

select last_name, salary
from employees
where salary>12000;

select last_name, employee_id, department_id
from employees
where employee_id = 176;

select last_name, salary
from employees
--where Salary >=5000 and salary <=12000
where not (salary >=5000 and salary <=12000)
;

select last_name, job_id, to_char(hire_date, 'dd-mm-YY')
from employees
order by hire_date;


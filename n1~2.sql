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

select last_name, department_id
from employees
where department_id = 20 or department_id = 50
order by last_name;

select last_name, department_id, salary as "Monthly Salary"
from employees
where (department_id = 20 or department_id = 50)
and (salary >= 5000 and salary <=12000)
order by last_name;

select last_name, to_char(hire_date, 'dd-mm-yy')
from employees
where hire_date like '94%';

select last_name, job_id
from employees
where manager_id is null;

select last_name, salary, commission_pct
from employees
where commission_pct >=0;

select last_name, salary
from employees
where salary >= &salary


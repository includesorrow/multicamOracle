-------------------
-----7Àå-----------
-------------------

select last_name, salary
from employees
where salary >
(select salary
from employees
where last_name = 'Abel');



select last_name, job_id, salary
from employees
where job_id =
(select job_id
from employees
where last_name = 'Taylor')

and salary >
(select salary
from employees
where last_name = 'Taylor')

select last_name, job_id, salary
from employees
where salary = (select min(salary) from employees);

select department_id, min(salary)
from employees
group by department_id
HAVING MIN(SALARY) > 
(SELECT MIN(SALARY)
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 50);
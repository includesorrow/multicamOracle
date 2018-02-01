-------------------
-- conn n1/n1
-------------------

select *
from   departments;

select department_id, location_id
from   departments;

select location_id, department_id
from   departments;

SELECT location_id
             ,department_id 
FROM    departments
/

select last_name
         ,salary
         ,salary * 12
from   employees;

select last_name
         ,salary
         ,salary *12 + salary*12*nvl(commission_pct,0)
from   employees;


--SELECT
--FROM
--WHERE
--GROUP BY
--HAVING
--ORDER BY


select last_name
from   employees
where commission_pct is null;

select last_name as "Name", commission_pct comm
from   employees;

select last_name || ' ����� �޿��� ' || salary || '�Դϴ�' as sal
from employees;

-- concatination �������� ��� ��
select 'select * from ' || tname || ';' from tab;

--��ü �ο� ��ȣ �������� ��뿹
--�ּ�.....
SELECT department_name || q'< Department's Manager Id: >'
            || manager_id
AS "Department and Manager"
FROM departments;

--distinct : �ߺ�����
select distinct department_id
from   employees;
select unique department_id
from   employees;

-- ���̺��� ���� Ȯ��
describe employees;
desc employees;

select sysdate from dual;

desc dual;
select sysdate + 1 from dual;
select sysdate - to_date('2018-01-01','YYYY-MM-DD') from dual;

SELECT employee_id, last_name, job_id, department_id
FROM employees
WHERE department_id = 90 ;

SELECT last_name, job_id, department_id
FROM employees
WHERE last_name = 'Whalen' ;

-- ��ҹ��ڸ� �����ؾ��Ѵ�...
SELECT last_name, job_id, department_id
FROM employees
WHERE last_name = 'whalen' ;

SELECT last_name
FROM employees
WHERE hire_date = '96/02/17';

select last_name, salary
from  employees
where  salary <= 3000;

SELECT last_name, salary
FROM employees
WHERE salary BETWEEN 2500 AND 3500 ;

SELECT last_name, salary
FROM employees
WHERE 2500 <= salary AND salary <=3500 ;

-- 100, 101, 201 ������� �����Ĺ������� ���
SELECT employee_id, last_name, salary, manager_id
FROM employees
WHERE manager_id IN (100, 101, 201);

SELECT employee_id, last_name, salary, manager_id
FROM employees
WHERE manager_id = 100
     OR   manager_id = 101
     OR   manager_id = 201;
     
SELECT first_name
FROM employees
WHERE first_name LIKE '%a';

-- employees ���̺��� 
-- last_name�� �ι�° ���ĺ��� �ҹ��� a�� ��� ��� ���
select last_name
from   employees
where last_name like '_a%';

-- employees ���̺��� 
-- last_name�� ����° ���ĺ��� �ҹ��� r�� ��� ��� ���
select last_name
from   employees
where last_name like '__r%';

-- �޿��� 10000�޷� �̻��̸鼭 MAN�� �� ������ ���� ���
SELECT employee_id, last_name, job_id, salary
FROM employees
WHERE salary >= 10000
AND job_id LIKE '%MAN%';

SELECT last_name, job_id
FROM employees
WHERE job_id IN ('IT_PROG', 'ST_CLERK', 'SA_REP') ;

SELECT last_name, job_id
FROM employees
WHERE job_id = 'IT_PROG'
       OR job_id = 'ST_CLERK'
       OR job_id = 'SA_REP';
       
SELECT 'AAA',last_name, job_id
FROM employees
WHERE job_id NOT IN ('IT_PROG', 'ST_CLERK', 'SA_REP') ;

SELECT last_name, job_id
FROM employees
WHERE   job_id <> 'IT_PROG'
       AND job_id <> 'ST_CLERK'
       AND job_id <> 'SA_REP';
       
SELECT last_name, job_id, salary
FROM employees
WHERE ( job_id = 'SA_REP'
OR job_id = 'AD_PRES' )
AND salary > 15000;

SELECT last_name, job_id, department_id, hire_date
FROM employees
ORDER BY hire_date desc;

SELECT employee_id, last_name, salary*12 as annsal
FROM employees
ORDER BY annsal;

SELECT last_name, job_id, department_id, hire_date
FROM employees
ORDER BY 3;

SELECT last_name, department_id, salary
FROM employees
ORDER BY department_id, salary DESC;

SELECT employee_id, last_name, salary, department_id
FROM employees
WHERE employee_id = &employee_num ;
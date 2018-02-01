SELECT department_name || q'$ Department's Manager Id: $'
|| manager_id
AS "Department and Manager"
FROM departments;

SELECT employee_id, last_name, job_id
FROM employees WHERE job_id LIKE '%SA\_%' ESCAPE '\';

select last_name
from  employees
where last_name like '_\_%' escape '\';

SELECT last_name, manager_id
FROM employees
WHERE manager_id is NULL;

-- 치환변수
SELECT employee_id, last_name, salary, department_id
FROM employees
WHERE employee_id = &employee_num ;

SELECT last_name, department_id, salary*12
FROM employees
WHERE job_id = '&job_title' ;

SELECT employee_id, last_name, job_id,&column_name
FROM employees
WHERE &condition
ORDER BY &order_column ;

SELECT employee_id, last_name, job_id, &&column_name
FROM employees
ORDER BY &column_name ;

SELECT employee_id, last_name, job_id, department_id
FROM employees;

DEFINE employee_num = 200;  -- 값을 define



SELECT employee_id, last_name, salary, department_id
FROM employees
WHERE employee_id = &employee_num ;
UNDEFINE employee_num;      -- 치환 값을 해제

SET VERIFY ON
SELECT employee_id, last_name, salary
FROM employees
WHERE employee_id = &employee_num;

---------------
-- chapter 3 --
---------------

select lower('Hello world') from dual;
select upper('Hello world') from dual;
select initcap('Hello world') from dual;


select last_name, salary, department_id
from  employees
where lower(last_name)='king';

select substr('hello world',6,2) from dual;

select instr('hewllo world','w') from dual;

select LPAD(salary,10,'@*') from employees;

select RPAD(salary,10,'@*') from employees;

select TRIM('H' FROM 'HelloHWorldH') from dual;

select round(3.64) from dual;
select round(3.65, 1) from dual;
select round(3.656, 2) from dual;
select round(26.64, -1) from dual;

select to_char(sysdate, 'YYYY/MM/DD') from dual;
select to_char(sysdate, 'YYYY/MM/DD HH:MI:SS') from dual;
select to_char(sysdate, 'YYYY/MM/DD HH24:MI:SS') from dual;
select sysdate-1 from dual;

select to_char(sysdate + 4/24 + 25/24/60, 'YYYY/MM/DD HH24:MI:SS') from dual;

SELECT last_name, (SYSDATE-hire_date)/7 AS WEEKS
FROM employees
WHERE department_id = 90;

select sysdate - to_date('1990/01/01')
from   dual;

select NEXT_DAY (sysdate,'일요일') from dual;
select Last_day('2018/02/01') from dual;
select months_between(sysdate,'2001/01/01') from dual;
select (sysdate - to_date('2001/01/01'))/30 from dual;

SELECT last_name,
       TO_CHAR(hire_date, 'YYYY/MM/DD') AS HIREDATE
FROM   employees;

SELECT salary SALARY
FROM employees
WHERE last_name = 'Ernst';

SELECT TO_CHAR(salary, '$99,999.00') SALARY
FROM employees
WHERE last_name = 'Ernst';


SELECT last_name, TO_CHAR(hire_date, 'YYYY/MM/DD')
FROM employees
WHERE hire_date < TO_DATE('90/01/01','RR/MM/DD');

SELECT TO_CHAR(ROUND((salary/7), 2),'99G999D99',
'NLS_NUMERIC_CHARACTERS = '',.'' ')
"Formatted Salary"
FROM employees;

SELECT last_name, salary, NVL(commission_pct, 0),
(salary*12) + (salary*12*NVL(commission_pct, 0)) AN_SAL
FROM employees;

SELECT last_name, salary, commission_pct,
NVL2(commission_pct,
salary + commission_pct, salary) income
FROM employees WHERE department_id IN (50, 80);

SELECT last_name, job_id, salary,
       DECODE(job_id, 'IT_PROG' , 1.10*salary,
                      'ST_CLERK', 1.15*salary,
                      'SA_REP'  , 1.20*salary,
                                       salary) AS REVISED_SALARY
FROM employees;

select employee_id, last_name,
       decode(mod(employee_id,2), 0, '청군',
                                  1, '백군') as 팀
from employees;

select employee_id, last_name,
       case mod(employee_id,2) when 0 then '청군'
                               when 1 then '백군'
                               end  as "팀"
from employees;


----------------------
-- conn scott/tiger --
----------------------
select ename, sal, ceil(sal/1000), sal/1000, decode(ceil(sal/1000), 1, 'Low',
                                          2, 'Mid',
                                              'High') as grade
from emp;

select ename, sal, ceil(sal/1000), sal/1000, decode(trunc(sal-1, -3), 0, 'Low',
                                          1000, 'Mid',
                                              'High') as grade
from emp;

--decode
select ename, sal, decode(ceil(sal), 1, 'Low',
                                     2, 'Mid',
                                        'High') as grade
from emp;

--searched case
select ename, sal, case ceil(sal/1000) when 1 then 'Low'
                                  when 2 then 'Mid'
                                         else 'High' end
                                         as grade
from emp;

--simpled case
select ename, sal, case when sal <= 1000 then 'Low'
                        when sal <= 2000 then 'Mid'
                                         else 'High' end
                                         as grade
from emp;


update emp set sal=1000 where ename='SMITH';
commit;

----------------
-- conn n1/n1 --
----------------
update employees set salary = 10000 where employee_id=202;
commit;

----------------
-- chapter 5 ---
----------------
select count(*)
from   employees
where  department_id = 50;

SELECT COUNT(commission_pct)
FROM employees
WHERE department_id = 80;


desc employees;

select rowid, rownum, last_name from employees;

select department_id, sum(salary) 
from employees
group  by department_id;

SELECT department_id, job_id, sum(salary)
FROM employees
GROUP BY department_id, job_id
ORDER BY job_id;

SELECT department_id, job_id, SUM(salary)
FROM employees
WHERE department_id > 40
GROUP BY department_id, job_id
ORDER BY department_id;


SELECT department_id, AVG(salary)
FROM employees
GROUP BY department_id
having AVG(salary) > 8000
;

SELECT department_id, MAX(salary)
FROM employees
GROUP BY department_id
HAVING MAX(salary)>10000 ;

SELECT job_id, SUM(salary) PAYROLL
FROM employees
GROUP BY job_id
HAVING SUM(salary) > 13000 and job_id NOT LIKE '%REP%'
ORDER BY SUM(salary);

SELECT max(AVG(salary))
FROM employees
GROUP BY department_id;


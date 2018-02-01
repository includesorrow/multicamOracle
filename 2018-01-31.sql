SELECT employee_id, last_name,
location_id, department_id
FROM employees left JOIN departments
USING(department_id);

SELECT e.last_name, d.department_name, e.salary, m.last_name
FROM  employees e
JOIN  departments d
ON    (e.department_id = d.department_id)
JOIN  employees m
ON    (e.manager_id = m.employee_id);

SELECT e.last_name, e.salary, j.grade_level
FROM employees e JOIN job_grades j
--ON e.salary BETWEEN j.lowest_sal AND j.highest_sal;
ON   j.lowest_sal <= e.salary  AND e.salary <= j.highest_sal;

select job_id
     , sum(decode(department_id,10,1,0)) as d10
     , sum(decode(department_id,20,1,0)) as d20
     , sum(decode(department_id,50,1,0)) as d50
     , sum(decode(department_id,60,1,0)) as d60
     , sum(decode(department_id,80,1,0)) as d80
     , sum(decode(department_id,90,1,0)) as d90
     , sum(decode(department_id,110,1,0)) as d110
     , sum(decode(nvl(department_id,999),999,1,0)) as None
     , sum(1) as гу╟Х
from   employees
group  by job_id;

create table set_a (
a number(2)
);

create table set_b (
b number(2)
);

insert into set_a values(1);
insert into set_a values(2);
insert into set_a values(3);
insert into set_a values(4);
insert into set_a values(5);
insert into set_a values(6);

insert into set_b values(4);
insert into set_b values(5);
insert into set_b values(6);
insert into set_b values(7);
insert into set_b values(8);
insert into set_b values(9);

select * from set_a;
select * from set_b;

drop table set_a purge;
drop table set_b purge;
commit;

select a from set_a
union all
select b from set_b;

select a from set_a
intersect
select b from set_b;

select a from set_a
minus
select b from set_b;

select first_name, last_name from employees where department_id = 20
union all
select null,last_name from employees where department_id = 50;


INSERT INTO departments(department_id,
department_name, manager_id, location_id)
VALUES (70, 'Public Relations', 100, 1700);

INSERT INTO departments
VALUES (71, 'Test', 100, 1700);

INSERT INTO departments(department_name,
department_id,
 manager_id, location_id)
VALUES ('Test2', 72, 100, 1700);

select * from departments;
desc departments;

INSERT INTO departments (department_id,
department_name)
VALUES (30, 'Purchasing');

INSERT INTO departments
VALUES (100, 'Finance', NULL, NULL);


INSERT INTO employees (employee_id,
first_name, last_name,
email, phone_number,
hire_date, job_id, salary,
commission_pct, manager_id,
department_id)
VALUES (113,
'Louis', 'Popp',
'LPOPP', '515.124.4567',
SYSDATE, 'AC_ACCOUNT', 6900,
NULL, 205, 110);

INSERT INTO employees
VALUES (114,
'Den', 'Raphealy',
'DRAPHEAL', '515.127.4561',
TO_DATE('1999/02/03', 'YYYY/MM/DD'),
'SA_REP', 11000, 0.2, 100, 60);

INSERT INTO departments
(department_id, department_name, location_id)
VALUES (&department_id, '&department_name',&location);

rollback;

--CTAS : Create Table As Select
create table emp
as
select * from employees;

select * from emp;

drop table emp purge;

create table emp
as
select last_name, salary, department_id
from   employees;

select * from emp;

drop table emp purge;

create table emp
as
select last_name as name, salary, department_id
from   employees;

select * from emp;

drop table emp purge;


create table emp
as
select last_name as name, salary, department_id
from   employees
where  1 <> 1;

select * from emp;
drop table emp purge;

create table sales_reps
AS
SELECT employee_id as id, last_name as name, salary, commission_pct
FROM employees
WHERE 1<>1;

select * from sales_reps;

INSERT INTO sales_reps(id, name, salary, commission_pct)
SELECT employee_id, last_name, salary, commission_pct
FROM employees
WHERE job_id LIKE '%REP%';

select * from sales_reps;

rollback;

-- Tx start~!!!
update employees set salary = salary * 1.1 where last_name = 'Vargas';
savepoint a;
update employees set salary = salary * 1.5 where last_name = 'Vargas';
savepoint b;
update employees set salary = salary * 0.5 where last_name = 'Vargas';
savepoint c;
rollback to b;
rollback;

show user;


grant select on emp to n1;

select * from scott.emp;

CREATE TABLE hire_dates
(id NUMBER(8),
hire_date DATE DEFAULT SYSDATE);

select * from hire_dates;

insert into hire_dates(id)
values(1);

select id, to_char(hire_date,'YYYY/MM/DD HH24:MI:SS') from hire_dates;

CREATE TABLE dept
(deptno NUMBER(2),
dname VARCHAR2(14),
loc VARCHAR2(13),
create_date DATE DEFAULT SYSDATE);

describe dept;
desc dept;

select * from tab;
select * from user_tables;
select * from user_constraints;
select * from user_indexes;




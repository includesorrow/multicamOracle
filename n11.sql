SELECT
    employees.last_name,
    employees.manager_id,
    departments.department_name,
    countries.country_name,
    locations.city,
    employees.salary
FROM
    departments,
    employees,
    job_grades,
    jobs,
    countries,
    regions,
    locations
WHERE
    employees.employee_id = departments.manager_id
    AND   departments.department_id = employees.department_id
    AND   jobs.job_id = employees.job_id
    AND   regions.region_id = countries.region_id
    AND   locations.location_id = departments.location_id
    AND   countries.country_id = locations.country_id;
    
    
    
    
    select job_id
    ,sum(decode(department_id,10,1,0)) as d10
    ,sum(decode(department_id,20,1,0))  as d20
    ,sum(decode(department_id,50,1,0))  as d50
    ,sum(decode(department_id,60,1,0))  as d60
    ,sum(decode(department_id,80,1,0))  as d80
    ,sum(decode(department_id,90,1,0))  as d90
    ,sum(decode(department_id,110,1,0))  as d110
    ,sum(decode(nvl(department_id,999),999,1,0))  as None
    ,sum(1)as �հ�
    
    from employees
    group by job_id;
    
    
    -----------------------------
    -----chapter8----------------
    ------------------------
    
    create table set_a (a number(2));
    create table set_b (b number(2));
    
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
    
    drop table set_a purge; --a���̺������
    commit;
    
    
    
    
    
    select a from set_a
    union
    select b from set_b;
    
    
    select a from set_a
    union all
    select b from set_b;
    --�ߺ����� �ȵ�, �׳� ��¸� �ϸ� �Ǵϱ� ������ ����.
    
    
    
    
    select a from set_a
    intersect
    select b from set_b;
    --�ߺ��� �����͸� ���
    
    
    select a from set_a
    minus
    select b from set_b;
    --������
    
    select first_name, last_name from employees where department_id = 20
    union
    select null, last_name from employees where department_id = 50;
    
    
    
    
    
    ----------9��-----------
    
    insert into departments(department_id, department_name, manager_id, location_id)
    values (70, 'Public Relations', 100, 1700);   
    select * from departments;
    
    
    ---
    insert into departemnts(department_name, department_id, manager_id, location_id)
    values ('test2', 72, 100, 1700);
--������ ������� values���� �Է��ؾ��Ѵ�

--
insert into departments(department_id, department_name)
values (30, 'purchasing');

select * from departments;
desc departments;



insert into departments
values (100, 'Finance', null, null);

rollback;
--CTAS : Create table as select
create table emp
as
select * from employees;

select * from emp;

drop table emp purge;



create table emp
as
select last_name, salary, department_id
from employees;
---�׽�Ʈ �Ұ�� ������ ���� ����°�

select * from emp;

drop table emp purge;



create table emp
as
select last_name as name, salary, department_id
from employees;


select * from emp;

drop table emp purge;


create table emp
as
select last_name as name, salary, department_id
from employees
where 1 <> 1;

select * from emp;





create table sales_reps 
  as
    select employee_id as id , last_name as anme , salary, commission_pct
    from employees
    where 1 <>1;
    --����������̺����
    

select * from sales_reps;

 sales_reps 
  as
    select employee_id as id , last_name as anme , salary, commission_pct
    from employees
    where 1 <>1;
    --����������̺����
    
INSERT INTO sales_reps(id, name, salary, commission_pct)
SELECT employee_id, last_name, salary, commission_pct
FROM employees
WHERE job_id LIKE '%REP%';



drop table sales_reps purge;


UPDATE table
SET column = value [, column = value, ...]
[WHERE condition];
--����� ��Ÿ��

UPDATE employees SET
       department_id = 50
where employee_id = 113;




select * from employees;





create table copy_emp
as
select * from employees;

select * from copy_emp;     


update copy_emp
set department_id = 110;
--WHERE ���� ��Ʈ���� ��������Ǵ� �����ؾ��Ѵ�


UPDATE copy_emp
SET department_id = (SELECT department_id
FROM employees
WHERE employee_id = 100)
WHERE job_id = (SELECT job_id
FROM employees
WHERE employee_id = 200);
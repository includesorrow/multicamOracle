----------------------
-- conn scott/tiger --
----------------------

-- cross join (cartesian product)
select ename, dname
from emp, dept
order  by ename;

-- equi join
----------------------
-- conn scott/tiger --
----------------------
select e.ename, d.dname
from emp e, dept d
where  e.deptno = d.deptno
order  by ename;

----------------------
-- conn n1/n1 --
----------------------
-- employees(���)���̺�� departments(�μ�)���̺��� �����ؼ� 
-- employees.last_name(�����)�� departments.department_name(�μ���)�� ���
select e.last_name, d.department_name
from   employees e, departments d
where  e.department_id = d.department_id;

-- outer join
----------------------
-- conn scott/tiger --
----------------------
update emp set deptno=null where ename='JONES';
commit;

-- left outer join
select e.ename, d.dname
from emp e, dept d
where  e.deptno = d.deptno(+)
order  by ename;

-- right outer join
select e.ename, d.dname
from emp e, dept d
where  e.deptno(+) = d.deptno
order  by ename;

-- full outer join
select e.ename, d.dname
from emp e, dept d
where  e.deptno(+) = d.deptno(+)
order  by ename;

----------------------
-- conn n1/n1 --
----------------------
-- employees(���)���̺�� departments(�μ�)���̺��� �����ؼ� 
-- employees.last_name(�����)�� departments.department_name(�μ���)�� ���
-- (1) �μ��� ���� ����� ��� (left join)
select e.last_name, d.department_name
from   employees e, departments d
where  e.department_id = d.department_id(+);
-- (2) ����� ���� �μ��� ��� (right join)
select e.last_name, d.department_name
from   employees e, departments d
where  e.department_id(+) = d.department_id;
-- (3) full outer join�� oracle join������ �������� ����.

-- non equi join
----------------------
-- conn scott/tiger --
----------------------
select e.ename, e.sal, s.grade
from   emp e, salgrade s
--where  s.losal <= e.sal and e.sal <= s.hisal;
where  e.sal between s.losal and s.hisal;

----------------------
-- conn n1/n1 --
----------------------
-- employees(���)���̺�� job_grades(�������)���̺��� �����ؼ� 
-- employees.last_name(�����)�� 
-- employees.salary(�޿�),
-- job_grades.grade_level(���)�� ���

SELECT E.last_name AS �����
     , E.salary AS �޿�
     , j.grade_level AS ���
FROM   employees E, job_grades j
WHERE  E.salary BETWEEN j.lowest_sal AND j.highest_sal;


-- self join
----------------------
-- conn scott/tiger --
----------------------
select e.ename AS Mentee, m.ename AS Mento
from   emp e, emp m
where  e.mgr=m.empno(+);


----------------------
-- conn n1/n1 --
----------------------
-- employees ���̺��� �̿��ؼ�
-- ���(Mentee), ���(Mento)�� �̸�(last_name)�� ����ϼ���.
select e.last_name AS mentee, m.last_name AS mento
from   employees e, employees m
where  e.manager_id = m.employee_id(+);

---------------
-- ANSI JOIN --
---------------
----------------------
-- conn scott/tiger --
----------------------
-- equi join

select e.ename, d.dname
from   emp e INNER JOIN dept d
ON     e.deptno = d.deptno
order  by ename;

----------------------
-- conn n1/n1 --
----------------------
-- employees(���)���̺�� departments(�μ�)���̺��� �����ؼ� 
-- employees.last_name(�����)�� departments.department_name(�μ���)�� ���
select e.last_name, d.department_name
from   employees e INNER JOIN departments d
ON     e.department_id = d.department_id;

-- outer join
----------------------
-- conn scott/tiger --
----------------------
update emp set deptno=null where ename='JONES';
commit;

-- left outer join
select e.ename, d.dname
from   emp e LEFT JOIN dept d
ON     e.deptno = d.deptno
order  by ename;

-- right outer join
select e.ename, d.dname
from   emp e RIGHT JOIN dept d
ON     e.deptno = d.deptno
order  by ename;

-- full outer join
select e.ename, d.dname
from   emp e FULL JOIN dept d
ON     e.deptno = d.deptno
order  by ename;

----------------------
-- conn n1/n1 --
----------------------
-- employees(���)���̺�� departments(�μ�)���̺��� �����ؼ� 
-- employees.last_name(�����)�� departments.department_name(�μ���)�� ���
-- (1) �μ��� ���� ����� ��� (left join)
select e.last_name, d.department_name
from   employees e LEFT JOIN departments d
ON     e.department_id = d.department_id;
-- (2) ����� ���� �μ��� ��� (right join)
select e.last_name, d.department_name
from   employees e RIGHT JOIN departments d
ON     e.department_id = d.department_id;
-- (3) full outer join�� oracle join������ �������� ����.
select e.last_name, d.department_name
from   employees e FULL JOIN departments d
ON     e.department_id = d.department_id;

-- non equi join
----------------------
-- conn scott/tiger --
----------------------
select e.ename, e.sal, s.grade
from   emp e JOIN salgrade s
--where  s.losal <= e.sal and e.sal <= s.hisal;
ON     e.sal between s.losal and s.hisal;

----------------------
-- conn n1/n1 --
----------------------
-- employees(���)���̺�� job_grades(�������)���̺��� �����ؼ� 
-- employees.last_name(�����)�� 
-- employees.salary(�޿�),
-- job_grades.grade_level(���)�� ���

SELECT E.last_name AS �����
     , E.salary AS �޿�
     , j.grade_level AS ���
FROM   employees E INNER JOIN job_grades j
ON     E.salary BETWEEN j.lowest_sal AND j.highest_sal;


-- self join
----------------------
-- conn scott/tiger --
----------------------
select e.ename AS Mentee, m.ename AS Mento
from   emp e LEFT JOIN emp m
ON     e.mgr=m.empno;


----------------------
-- conn n1/n1 --
----------------------
-- employees ���̺��� �̿��ؼ�
-- ���(Mentee), ���(Mento)�� �̸�(last_name)�� ����ϼ���.
select e.last_name AS mentee, m.last_name AS mento
from   employees e LEFT JOIN employees m
ON     e.manager_id = m.employee_id;


-- Natural JOIN
select ename, dname
from   emp natural join dept;

select last_name, department_name
from   employees natural join departments;

-- JOIN USING
select ename, dname
from   emp left join dept
using  (deptno);

select last_name AS �����, department_name AS �μ���
from   employees left join departments
using  (department_id);

-- CROSS JOIN
----------------------
-- conn scott/tiger --
----------------------
select ename, dname
from   emp cross join dept;

-- Threeways JOIN (Oracle)
----------------------
-- conn scott/tiger --
----------------------
select e.ename, d.dname, e.sal, s.grade
from   emp e, dept d, salgrade s
where  e.deptno = d.deptno(+)
and    e.sal between s.losal and s.hisal;

-- Threeways JOIN (ANSI)
select e.ename, d.dname, e.sal, s.grade
from   emp e left join dept d
on     e.deptno = d.deptno
join   salgrade s
on     e.sal between s.losal and s.hisal;

----------------------
-- conn n1/n1 --
----------------------
-- employees.last_name as �����
-- departments.department_name as �μ���
-- job_grades.grade_level as ���

select e.last_name AS �����
      ,m.last_name AS ���
      ,j2.job_title AS ������
      ,d.department_name AS �μ���
      ,l.city AS ���ø�
      ,c.country_name AS �����
      ,r.region_name AS ������
      ,e.salary AS �޿�
      ,j.grade_level AS ���
from   employees e left join departments d
on     e.department_id = d.department_id
left join   locations l
on     d.location_id = l.location_id
left join   countries c
on     l.country_id = c.country_id
left join   regions r
on     c.region_id = r.region_id
join   job_grades j
on     j.lowest_sal <= e.salary and e.salary <= j.highest_sal
left join   employees m
on     e.manager_id = m.employee_id
join   jobs j2
on     e.job_id = j2.job_id;

--�����, ���, ������, �μ���, ���ø�, �����, ������, �޿�, ���

select 
       decode(rnum,1,department_id,2,department_id) as �μ�
     , decode(rnum,1,job_id) as ����
     , sum(sum_sal) as �հ�
from (select nvl(department_id,999) as department_id, job_id, sum(salary) as sum_sal
from   employees
group  by department_id, job_id
order  by 1,2) A cross join
(select rownum as rnum from employees where rownum <= 3)
group by decode(rnum,1,department_id,2,department_id)
     , decode(rnum,1,job_id)
order by 1,2;

create view myview
as
select last_name, salary from employees;

select * from myview;


---------------
-- Chapter 7 --
---------------

select last_name, salary
from   employees
where  salary > (select salary from employees
                 where  last_name = 'Abel');

SELECT last_name, salary, department_id
FROM employees
WHERE salary IN (SELECT MIN(salary)
                 FROM employees
                 GROUP BY department_id);

SELECT employee_id, last_name, job_id, salary
FROM employees
WHERE salary < ALL
                  (SELECT salary
                   FROM employees
                   WHERE job_id = 'IT_PROG')
                   AND job_id <> 'IT_PROG';

SELECT * FROM departments
WHERE not EXISTS
                 (SELECT * FROM employees
                  WHERE employees.department_id=departments.department_id);

SELECT emp.last_name
FROM employees emp
WHERE emp.employee_id not IN
                            (SELECT mgr.manager_id
                            FROM employees mgr
                            WHERE mgr.manager_id is not null);











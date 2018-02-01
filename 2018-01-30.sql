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
-- employees(사원)테이블과 departments(부서)테이블을 조인해서 
-- employees.last_name(사원명)과 departments.department_name(부서명)을 출력
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
-- employees(사원)테이블과 departments(부서)테이블을 조인해서 
-- employees.last_name(사원명)과 departments.department_name(부서명)을 출력
-- (1) 부서가 없는 사원도 출력 (left join)
select e.last_name, d.department_name
from   employees e, departments d
where  e.department_id = d.department_id(+);
-- (2) 사원이 없는 부서도 출력 (right join)
select e.last_name, d.department_name
from   employees e, departments d
where  e.department_id(+) = d.department_id;
-- (3) full outer join은 oracle join에서는 지원하지 않음.

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
-- employees(사원)테이블과 job_grades(업무등급)테이블을 조인해서 
-- employees.last_name(사원명)과 
-- employees.salary(급여),
-- job_grades.grade_level(등급)을 출력

SELECT E.last_name AS 사원명
     , E.salary AS 급여
     , j.grade_level AS 등급
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
-- employees 테이블을 이용해서
-- 사원(Mentee), 사수(Mento)의 이름(last_name)을 출력하세요.
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
-- employees(사원)테이블과 departments(부서)테이블을 조인해서 
-- employees.last_name(사원명)과 departments.department_name(부서명)을 출력
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
-- employees(사원)테이블과 departments(부서)테이블을 조인해서 
-- employees.last_name(사원명)과 departments.department_name(부서명)을 출력
-- (1) 부서가 없는 사원도 출력 (left join)
select e.last_name, d.department_name
from   employees e LEFT JOIN departments d
ON     e.department_id = d.department_id;
-- (2) 사원이 없는 부서도 출력 (right join)
select e.last_name, d.department_name
from   employees e RIGHT JOIN departments d
ON     e.department_id = d.department_id;
-- (3) full outer join은 oracle join에서는 지원하지 않음.
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
-- employees(사원)테이블과 job_grades(업무등급)테이블을 조인해서 
-- employees.last_name(사원명)과 
-- employees.salary(급여),
-- job_grades.grade_level(등급)을 출력

SELECT E.last_name AS 사원명
     , E.salary AS 급여
     , j.grade_level AS 등급
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
-- employees 테이블을 이용해서
-- 사원(Mentee), 사수(Mento)의 이름(last_name)을 출력하세요.
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

select last_name AS 사원명, department_name AS 부서명
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
-- employees.last_name as 사원명
-- departments.department_name as 부서명
-- job_grades.grade_level as 등급

select e.last_name AS 사원명
      ,m.last_name AS 사수
      ,j2.job_title AS 업무명
      ,d.department_name AS 부서명
      ,l.city AS 도시명
      ,c.country_name AS 나라명
      ,r.region_name AS 지역명
      ,e.salary AS 급여
      ,j.grade_level AS 등급
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

--사원명, 사수, 업무명, 부서명, 도시명, 나라명, 지역명, 급여, 등급

select 
       decode(rnum,1,department_id,2,department_id) as 부서
     , decode(rnum,1,job_id) as 업무
     , sum(sum_sal) as 합계
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











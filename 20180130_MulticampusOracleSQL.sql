
from employees e, departments d
where e.last_name(+) = d.department_name
order by last_name;


--right outer join--

select last_name, department_name
from employees e, departments d
where e.last_name = d.department_name(+)
order by last_name;

--------------------------
--conn scott/tiger--------
---------------------------

---non equi join---
select e.ename, e.sal, s.grade
from emp e, salgrade s
--where e.sal >= s.losal and  e.sal <= s.hisal;
where s.losal <= e.sal and e.sal <= s.hisal;


------------------------
----------n1/n1---------
------------------------

-- employees (사원 테이블)과 departments(부서) 테이블을 조인해서 
-- employees.last_name(사원명)과
-- employees.salary(급여),
-- job_grades.grade_level(등급)을 출력

select e.last_name, e.salary, j.grade_level
from employees e, departments d, job_grades j;



select E.last_name as 사원명
        , E.salary as 급여
        , j.grade_level as 
from employees E, job_grades j
WHERE E.salary between lowest_Sal and highest_sal;



-------------------
--- conn scott/tiger---
------------------
--self join--
--self join은 별칭 (ex. employee => e)무조건 붙여야 함
select e.ename as Mentee, m.ename as mento
from emp e, emp m
where e.mgr = m.empno(+); --king은 멘토가 없으니 멘티에서 전체출력해야함. 그래서 오른쪽에 (+)붙임


------------------------
------conn n1/n1---------
------------------------
---employees 테이블을 이용해서
--사원(Mentee), 사수(Mento)를 출력하세요
--이름(last_name)
select e.last_name as 멘티 ,m.last_name as 멘토
from employees e, employees m
where e.manager_id = m.employee_id(+);


-----------------
-------------------
-----------------------
-------------------
---------------------

--, 대신 (INNER) join, where 대신 ON으로 바꾸는 것--
--INNER JOIN을 권장함



--cross join (cartesian product)
select ename, dname
from emp e INNER join dept d
on e.deptno = d.deptno
order by ename;


--equi join
select e.ename, e.deptno, d.deptno, d.dname
from emp e join dept d
on e.deptno = d.deptno
order by ename;

--조인 조건에 =싸인이 들어간 것

-------------------
--conn n1/n1 --
-----------------
-- employees (사원 테이블)과 departments(부서) 테이블을 조인해서 
-- employees.last_name(사원명)과 departments.department_name(부서명)을 출력

select last_name, department_name
from employees, departments
order by last_name;

select e.last_name, d.department_name --departments_id 이건 employees랑 departments에 존재함. 그래서 그냥 departemnts_id만 쓰면 에러남
--별칭을 붙임
-- 원래는 from employees, departments
from employees e JOIN departments d
ON e.departments_id = d.department_id; -- employees에 있는 departments_id 이렇게연결됨


------------------
-- conn scott/tiger--
-------------------
--outer join--
update emp set deptno = null where ename = 'JONES';
commit;


-- left outer join
select e.ename, d.dname
from emp e LEFT OUTER JOIN dept d
ON e.deptno = d.deptno 
order by ename;
--(+) 대신에 LEFT OUTER JOIN으로 바꿈
--나중버전에는 LEFT JOIN으로 바뀜. OUTER는 빼는걸 권장함


-- right outer join
select e.ename, d.dname
from emp e right JOIN dept d
ON e.deptno = d.deptno 
order by ename;


--full outer join

select e.ename, d.dname
from emp e full JOIN dept d
ON e.deptno = d.deptno 
order by ename;

-- full outer join은 존재하지 않는다--

--------------------
----- n1/n1-----
--------------------

--(1)부서가 없는 사원도 출력 (Left join)--
--(2) 사원이 없는 부서도 출력 (Right join)--

-- employees (사원 테이블)과 departments(부서) 테이블을 조인해서 
-- employees.last_name(사원명)과 departments.department_name(부서명)을 출력
--Left outer join--
select last_name, department_name
from employees e, departments d
where e.last_name(+) = d.department_name
order by last_name;


--right outer join--

select last_name, department_name
from employees e, departments d
where e.last_name = d.department_name(+)
order by last_name;

--------------------------
--conn scott/tiger--------
---------------------------

---non equi join---
select e.ename, e.sal, s.grade
from emp e, salgrade s
--where e.sal >= s.losal and  e.sal <= s.hisal;
where s.losal <= e.sal and e.sal <= s.hisal;


------------------------
----------n1/n1---------
------------------------

-- employees (사원 테이블)과 departments(부서) 테이블을 조인해서 
-- employees.last_name(사원명)과
-- employees.salary(급여),
-- job_grades.grade_level(등급)을 출력

select e.last_name, e.salary, j.grade_level
from employees e, departments d, job_grades j;



select E.last_name as 사원명
        , E.salary as 급여
        , j.grade_level as 
from employees E, job_grades j
WHERE E.salary between lowest_Sal and highest_sal;



-------------------
--- conn scott/tiger---
------------------
--self join--
--self join은 별칭 (ex. employee => e)무조건 붙여야 함
select e.ename as Mentee, m.ename as mento
from emp e, emp m
where e.mgr = m.empno(+); --king은 멘토가 없으니 멘티에서 전체출력해야함. 그래서 오른쪽에 (+)붙임


------------------------
------conn n1/n1---------
------------------------
---employees 테이블을 이용해서
--사원(Mentee), 사수(Mento)를 출력하세요
--이름(last_name)
select e.last_name as 멘티 ,m.last_name as 멘토
from employees e, employees m
where e.manager_id = m.employee_id(+);




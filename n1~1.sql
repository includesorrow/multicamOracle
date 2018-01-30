select  e.last_name as 사원이름
        ,e.salary as 급여
        ,j.grade_level as 사원등급
        ,d.department_name as 부서이름
        ,l.city as 도시
        ,c.country_name as 나라
        ,r.region_name as 지역
        ,ee.last_name as 멘토



from employees e 
    ,job_grades j
    ,departments d
    ,locations l
    ,countries c
    ,regions r
    ,employees ee

---중복되는값이 사원등급임
---JOB GRADES에서 애들이 다 넘어옴
---사원등급 제거해야함
--- 오른쪽에 between 

    where e.salary between j.LOWEST_SAL and j.HIGHEST_SAL

---부서이름이 제각기 나옴
---이건 departments를 추가한 결과임

and d.department_id(+)= e.department_id

--도시가 제각기 나옴
--이건 locations를 추가해서 나온 결과임
and l.location_id(+) = d.location_id

--나라가 제각기 나옴
--이건 country를 추가해서 나온 결과임
and c.country_id(+) = l.country_id

--지역이 제각기 나옴
--이건 regions를 추가해서 나온 결과임
and r.region_id(+) = c.region_id

 --멘토 추가  
    and e.manager_id = ee.employee_id(+)



    order by e.last_name;
    
    
    --2.	1번 문제를 ANSI JOIN 으로 출력하세요.
    
    
select  e.last_name as 사원이름
        ,e.salary as 급여
        ,j.grade_level as 사원등급
        ,d.department_name as 부서이름
        ,l.city as 도시
        ,c.country_name as 나라
        ,r.region_name as 지역
        ,ee.last_name as 멘토
        
    from employees e left join job_grades j
        on e.salary between j.LOWEST_SAL and j.HIGHEST_SAL
        left join departments d
        on d.department_id = e.department_id
        left join locations l
        on d.location_id = l.location_id
        left join countries c
        on c.country_id = l.country_id
        left join regions r
        on r.region_id = c.region_id
        left join EMPLOYEES ee
        on e.manager_id = ee.employee_id;

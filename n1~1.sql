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
        
        
        
        ------10장------
        show user;
        
        select * from scott.emp;
    


grant select on emp to n1;
--n1/n1--

select * from scott.emp;
--grant로 n1에 scott로 들어갈 수 있는 권한을 주고 이제부터 조회가 가능하다.
create table hire_dates
(id number(8),
hire_date date default sysdate);

select * from hire_dates;

insert into hire_dates(id)
values(1);

select * from hire_dates;
---자동으로 2018.1.31일이 들어감.
--=>디폴트값을 sysdate로 줬으므로.

CREATE TABLE dept
(deptno NUMBER(2),
dname VARCHAR2(14),
loc VARCHAR2(13),
create_date DATE DEFAULT SYSDATE);

describe dept;
RAW and LONG RAW 원시 이진 데이터
BLOB 바이너리 데이터(최대 4GB)
BFILE 외부 파일에 저장된 바이너리 데이터(최대 4GB)
DATE 날짜 및 시간 값
LONG 가변 길이 문자 데이터(최대 2GB)
CLOB 문자 데이터(최대 4GB)
ROWID 테이블에 있는 행의 고유한 주소를 나타내는 base-64 숫자 체계
CHAR(size) 고정 길이 문자 데이터
NUMBER(p,s) 가변 길이 숫자 데이터
VARCHAR2(size) 가변 길이 문자 데이터

--char(10) : 무조건 10차지함. (2개만 적더라도)
--varchar2(10) : 10까지 차지가능한데 2개만적으면 2개만 차지함
--전화번호의 경우 문자열로 취급하는게 좋음 (왜냐면 연산이 이루어지 않음. 숫자에 저장해버리면 앞에 코드값이 0이 와버리면 삭제가 됨.
--지역번호 02로 시작하는 경우 2만 튀어나옴.
--varchar2가 무조건 빠르다. 거의 대부분 이것만 씀
--보통 CROP씀 LONG잘안씀.
--Binary large object

select * from tab;
select * from user_tables;
select * from user_constraints;
select * from user_indexes;
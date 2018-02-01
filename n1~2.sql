--연습 1--
select last_name, job_id, salary as sal     
from employees;

select *
from job_grades;

select first_name, job_id, hire_date , employee_id 
from employee;

describe employees

--연습2--

select last_name, salary
from employees
where salary>12000;

select last_name, employee_id, department_id
from employees
where employee_id = 176;

select last_name, salary
from employees
--where Salary >=5000 and salary <=12000
where not (salary >=5000 and salary <=12000)
;

select last_name, job_id, to_char(hire_date, 'dd-mm-YY')
from employees
order by hire_date;

select last_name, department_id
from employees
where department_id = 20 or department_id = 50
order by last_name;

select last_name, department_id, salary as "Monthly Salary"
from employees
where (department_id = 20 or department_id = 50)
and (salary >= 5000 and salary <=12000)
order by last_name;

select last_name, to_char(hire_date, 'dd-mm-yy')
from employees
where hire_date like '94%';

select last_name, job_id
from employees
where manager_id is null;

select last_name, salary, commission_pct
from employees
where commission_pct >=0;

select last_name, salary
from employees
where salary >= &salary
;
rollback;
---tx start---

update employees set salary = salary * 1.1 where last_name = 'Vargas';
savepoint a;
update employees set salary = salary * 1.5 where last_name = 'Vargas';
savepoint b;
update employees set salary = salary * 0.5 where last_name = 'Vargas';
savepoint c;

--여기서 commit; 하면 실제로 활성화가 됨
--rollback,commit은; 치는순간에 savepoint 이전건 다 사라짐

rollback to b;

rollback;
--다른 사람이 사용할 수 있게 하는 작업 commit;


-----------------------

--2018.2.1
--전체 부서에서 사원이 없는 부서를 출력
select d.department_id
       e.department_id
       from employees e
join departments d
on d.department_id = e.department_id;
-------

SELECT d.department_id
FROM departments d
INTERSECT
SELECT e.department_id
FROM employees e;
---------------------
--전체 부서에서 사원이 없는 부서를 출력(답)
select department_id from departments

minus
select distinct department_id from employees
where department_id is not null;




---------------
---다른방법----
select department_id, department_name
from departments
where department_id in
                        (select department_id from departments
                        minus
                        select department_id from employees);
                        
                        
---
---



create table member (
user_id     varchar2(20) primary key, --primarykey 는 제약조건
user_name   varchar2(20) not null, --not null은 제약조건
age         number(3)
);

insert into member values ('taiji','서태지와아이들','42');
--UTF-8기준이므로 20
insert into member(user_id, user_name, age) values ('crom','신해철',45);
insert into member(user_id, user_name, age) values ('jaeha','유재하',48);
commit;
--앞에 columm을 (user_id,user_name,age) 나열하는게 좋음

select * from member;

select * from user_constraints
where table_name = 'MEMBER';

drop table member purge;



create table member (
user_id     varchar2(20),
user_name   varchar2(20),
age         number(3),
constraint mem_usr_id_pk primary key(user_id),
constraint mem_usr_name_nn check(user_name is not null)
);

--not null은 column만 줘야 함. 테이블에 제약조건 줄려면 위에있는대로 해야함

drop table member purge;

create table member (
user_id     varchar2(20), constraint mem_usr_id_pk primary key,
user_name   varchar2(20), constraint mem_usr_name_nn not null
age         number(3),
constraint mem_usr_id_pk primary key(user_id),
constraint mem_usr_name_nn check(user_name is not null)
);

--중간에못적음

---------------

create table member (
user_id     varchar2(20),
user_name   varchar2(20),
age         number(3),
email       varchar2(50),
constraint mem_usr_id_pk primary key(user_id),
constraint mem_usr_name_nn check(user_name is not null),
constraint mem_email_uk unique(email)
);


insert into member values ('taiji','서태지아이들',42,'taiji@boys.com');
--20은 UTF-8기준이므로 
insert into member(user_id, user_name, age) values ('crom','신해철',45);
insert into member(user_id, user_name, age) values ('jaeha','유재하',48);
insert into member values('yg','양현석',43,'taiji2@boys.com');
commit;

select * from member;





create table board (
no   number,
title varchar2(100),
content varchar2(4000),
user_id varchar2(20),
    constraint brd_no_pk primary key(no),
    constraint brd_title_nn check(title is not null),
    constraint brd_usr_id_fk foreign key(user_id)
                             references member(user_id)
p);
    --nn = not null

----------------------------
CREATE SEQUENCE dept_deptid_seq
INCREMENT BY 10
START WITH 120
MAXVALUE 9999
NOCACHE
NOCYCLE;

select dept_deptid_seq.nextval from dual;
---increment -> 10씩증가
select dept_deptid_seq.currval from dual;
---current->현재값 

create sequence brd_no_seq nocache;

insert into board(no, user_id, title, content)
values(brd_no_seq.nextval, 'taiji', '난알아요','이밤이흐르고흐르면');

select * from board;
--NO :1  TITLE : 난알아요 CONTENT : 이밤이흐르고흐르면 USER_ID : taiji


insert into board(no, user_id, title, content)
values(brd_no_seq.nextval, 'crom', '그대에게','숨가쁘게 살아가는 시간 속에서도');

select * from board;


create sequence board1 nocache;
----글번호 / 제목 / 이름(아이디)순으로
select b.NO as 글번호
        ,b.title as 제목
        ,m.user_name || '('||b.user_id||')' as "이름(아이디)"
from board b
join member m
on   b.user_id = m.user_id
order by b.no desc;



insert into board(no, user_id, title, content)
values(brd_no_seq.nextval, 'jaeha', '우울한편지','일부러 그랬는지');



-----

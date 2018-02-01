--���� 1--
select last_name, job_id, salary as sal     
from employees;

select *
from job_grades;

select first_name, job_id, hire_date , employee_id 
from employee;

describe employees

--����2--

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

--���⼭ commit; �ϸ� ������ Ȱ��ȭ�� ��
--rollback,commit��; ġ�¼����� savepoint ������ �� �����

rollback to b;

rollback;
--�ٸ� ����� ����� �� �ְ� �ϴ� �۾� commit;


-----------------------

--2018.2.1
--��ü �μ����� ����� ���� �μ��� ���
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
--��ü �μ����� ����� ���� �μ��� ���(��)
select department_id from departments

minus
select distinct department_id from employees
where department_id is not null;




---------------
---�ٸ����----
select department_id, department_name
from departments
where department_id in
                        (select department_id from departments
                        minus
                        select department_id from employees);
                        
                        
---
---



create table member (
user_id     varchar2(20) primary key, --primarykey �� ��������
user_name   varchar2(20) not null, --not null�� ��������
age         number(3)
);

insert into member values ('taiji','�������;��̵�','42');
--UTF-8�����̹Ƿ� 20
insert into member(user_id, user_name, age) values ('crom','����ö',45);
insert into member(user_id, user_name, age) values ('jaeha','������',48);
commit;
--�տ� columm�� (user_id,user_name,age) �����ϴ°� ����

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

--not null�� column�� ��� ��. ���̺� �������� �ٷ��� �����ִ´�� �ؾ���

drop table member purge;

create table member (
user_id     varchar2(20), constraint mem_usr_id_pk primary key,
user_name   varchar2(20), constraint mem_usr_name_nn not null
age         number(3),
constraint mem_usr_id_pk primary key(user_id),
constraint mem_usr_name_nn check(user_name is not null)
);

--�߰���������

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


insert into member values ('taiji','���������̵�',42,'taiji@boys.com');
--20�� UTF-8�����̹Ƿ� 
insert into member(user_id, user_name, age) values ('crom','����ö',45);
insert into member(user_id, user_name, age) values ('jaeha','������',48);
insert into member values('yg','������',43,'taiji2@boys.com');
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
---increment -> 10������
select dept_deptid_seq.currval from dual;
---current->���簪 

create sequence brd_no_seq nocache;

insert into board(no, user_id, title, content)
values(brd_no_seq.nextval, 'taiji', '���˾ƿ�','�̹����帣���帣��');

select * from board;
--NO :1  TITLE : ���˾ƿ� CONTENT : �̹����帣���帣�� USER_ID : taiji


insert into board(no, user_id, title, content)
values(brd_no_seq.nextval, 'crom', '�״뿡��','�����ڰ� ��ư��� �ð� �ӿ�����');

select * from board;


create sequence board1 nocache;
----�۹�ȣ / ���� / �̸�(���̵�)������
select b.NO as �۹�ȣ
        ,b.title as ����
        ,m.user_name || '('||b.user_id||')' as "�̸�(���̵�)"
from board b
join member m
on   b.user_id = m.user_id
order by b.no desc;



insert into board(no, user_id, title, content)
values(brd_no_seq.nextval, 'jaeha', '���������','�Ϻη� �׷�����');



-----

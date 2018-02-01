
create table dept (
deptno     number(3) primary key, --primarykey �� ��������
dname      varchar2(30) not null, --not null�� ��������
loc        varchar2(10)
);


select *
from dept;


create table emp (
empno       number(4) ,
ename       varchar2(30),
hp          varchar2(11),
sal         number,--check
deptno      number(3),

constraint empno_pk primary key(empno),
constraint ename_nn check(ename is not null),
constraint hp_uk unique(hp),
constraint sal_ck check (sal>1200000),
constraint deptno_fk foreign key(deptno)
                    references dept(deptno)

);




--check�������� : constraints imsi_age_ck check (age>0);
--constraint mem_usr_id_pk primary key(user_id),
--constraint mem_usr_name_nn check(user_name is not null),
--constraint mem_email_uk unique(email)
--


CREATE SEQUENCE emp_empno_seq
INCREMENT BY 1
START WITH 1
MAXVALUE 9999
NOCACHE
NOCYCLE;




CREATE SEQUENCE dept_deptno_seq
INCREMENT BY 10
START WITH 10
MAXVALUE 9999
NOCACHE
NOCYCLE;

drop sequence emp_empno_seq ;



insert into dept(deptno, dname, loc)
values(dept_deptno_seq.nextval, '������', '�λ�');


insert into dept(deptno, dname, loc)
values(dept_deptno_seq.nextval, '���ߺ�', '����');

select *
from dept;





insert into emp(empno, ename, hp, sal, deptno)
values(emp_empno_seq.nextval, '����ö', '01011112222', '5000000', 10);


insert into emp(empno, ename, hp, sal, deptno)
values(emp_empno_seq.nextval, '������', '01011112223', '6000000', 20);

insert into emp(empno, ename, hp, sal, deptno)
values(emp_empno_seq.nextval, '������', '01011112224', '4000000', 30);

insert into emp(empno, ename, hp, sal, deptno)
values(emp_empno_seq.nextval, '����', '01011112225', '3000000', 10);


select * from emp;

delete from emp where empno = '5';







select e.empno as ���
    ,e.ename as �����
    ,e.hp as ��ȭ
    ,e.sal as �޿�
    ,d.dname as �μ�
    ,d.loc as ����
from emp e
join dept d
on e.deptno = d.deptno;


--purge : �ٷλ���



create view emp_test
as 
select last_name, job_id, department_id from employees;
grant select on emp_test to scott;

--scott����--
select * from n1.emp_test;
---�����ֱ�. n1�������� view�����ְ� scott���� ���� ���ִ� ��

select * from n1.emp_test;
desc n1.emp_test;


---n1---

create or replace view emp_test
as
select employee_id, last_name, job_id, department_id from employees;

drop view emp_test;
--purge�Ⱥٿ��� �Ǵµ� ������ �����Ͱ� ���ʿ� ���⶧��

create or replace view emp_test
as
select employee_id as id
        , last_name as name
        , job_id as job
        , department_id as deptno
from employees;

desc emp_test;
--

grant select, update, insert on emp_test to scott;  

--scott--

select * from n1.emp_test;

update n1.emp_test set
        deptno = 80
where id = 144;
commit;
-------------
--conn n1/n1--
----------
select * from employees;








create index emp_last_name_idx
on employees(last_name);




CREATE SYNONYM ���
FOR employees;

select * from ���;
--전체 부서에서 사원이 없는 부서를 출력
select department_id, department_name
from   departments
where  department_id in
                        (select department_id from departments
                         minus
                         select department_id from employees);

--데이터딕셔너리에서 제약조건 확인
select * from user_constraints;


create table member (
user_id     varchar2(20) primary key,
user_name   varchar2(20) not null,
age         number(3)
);

insert into member values('taiji','서태지아이들',42);
insert into member(user_id,user_name,age) values('crom','신해철',45);
insert into member(user_id,user_name,age) values('jaeha','유재하',48);
commit;

select * from member;

select * from user_constraints
where  table_name = 'MEMBER';

drop table member purge;

create table member (
user_id     varchar2(20) constraint mem_usr_id_pk primary key,
user_name   varchar2(20) constraint mem_usr_name_nn not null,
email       varchar2(50) constraint mem_email_uk unique,
age         number(3)
);

select * from user_constraints
where  table_name = 'MEMBER';

drop table member purge;

create table member (
user_id     varchar2(20),
user_name   varchar2(20),
age         number(3),
email       varchar2(50),
 constraint mem_usr_id_pk primary key(user_id),
 constraint mem_usr_name_nn check(user_name is not null),
 constraint mem_email_uk unique(email)
);

insert into member values('taiji','서태지아이들',42,'taiji@boys.com');
insert into member(user_id,user_name,age) values('crom','신해철',45);
insert into member(user_id,user_name,age) values('jaeha','유재하',48);
insert into member values('yg','양현석',43,'taiji2@boys.com');
commit;

select * from member;

create table board (
no  number,
title varchar2(100),
content varchar2(4000),
user_id varchar2(20),
    constraint brd_no_pk primary key(no),
    constraint brd_title_nn check(title is not null),
    constraint brd_usr_id_fk foreign key(user_id)
                             references member(user_id)
);
                             
CREATE SEQUENCE dept_deptid_seq
INCREMENT BY 10
START WITH 120
MAXVALUE 200
CACHE 5
NOCYCLE;
--120, 130, 140, 150, 160
select dept_deptid_seq.nextval from dual;


create sequence brd_no_seq nocache;

insert into board(no, user_id, title, content)
values(brd_no_seq.nextval, 'taiji','난 알아요','이 밤이 흐르고흐르면');

insert into board(no, user_id, title, content)
values(brd_no_seq.nextval, 'crom','그대에게','숨가쁘게 살아가는 시간 속에도');

insert into board(no, user_id, title, content)
values(brd_no_seq.nextval, 'jaeha','우울한편지','일부러 그랬는지');


select * from board;


select  b.no as 글번호
       ,b.title as 제목
       ,m.user_name || '(' || b.user_id || ')' as "이름(아이디)"
from    board  b
join    member m
on      b.user_id = m.user_id
order   by b.no desc;

create table imsi (
age         number(3),
 constraints imsi_age_ck check(age > 0)
);

select  e.last_name as ����̸�
        ,e.salary as �޿�
        ,j.grade_level as ������
        ,d.department_name as �μ��̸�
        ,l.city as ����
        ,c.country_name as ����
        ,r.region_name as ����
        ,ee.last_name as ����



from employees e 
    ,job_grades j
    ,departments d
    ,locations l
    ,countries c
    ,regions r
    ,employees ee

---�ߺ��Ǵ°��� ��������
---JOB GRADES���� �ֵ��� �� �Ѿ��
---������ �����ؾ���
--- �����ʿ� between 

    where e.salary between j.LOWEST_SAL and j.HIGHEST_SAL

---�μ��̸��� ������ ����
---�̰� departments�� �߰��� �����

and d.department_id(+)= e.department_id

--���ð� ������ ����
--�̰� locations�� �߰��ؼ� ���� �����
and l.location_id(+) = d.location_id

--���� ������ ����
--�̰� country�� �߰��ؼ� ���� �����
and c.country_id(+) = l.country_id

--������ ������ ����
--�̰� regions�� �߰��ؼ� ���� �����
and r.region_id(+) = c.region_id

 --���� �߰�  
    and e.manager_id = ee.employee_id(+)



    order by e.last_name;
    
    
    --2.	1�� ������ ANSI JOIN ���� ����ϼ���.
    
    
select  e.last_name as ����̸�
        ,e.salary as �޿�
        ,j.grade_level as ������
        ,d.department_name as �μ��̸�
        ,l.city as ����
        ,c.country_name as ����
        ,r.region_name as ����
        ,ee.last_name as ����
        
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
        
        
        
        ------10��------
        show user;
        
        select * from scott.emp;
    


grant select on emp to n1;
--n1/n1--

select * from scott.emp;
--grant�� n1�� scott�� �� �� �ִ� ������ �ְ� �������� ��ȸ�� �����ϴ�.
create table hire_dates
(id number(8),
hire_date date default sysdate);

select * from hire_dates;

insert into hire_dates(id)
values(1);

select * from hire_dates;
---�ڵ����� 2018.1.31���� ��.
--=>����Ʈ���� sysdate�� �����Ƿ�.

CREATE TABLE dept
(deptno NUMBER(2),
dname VARCHAR2(14),
loc VARCHAR2(13),
create_date DATE DEFAULT SYSDATE);

describe dept;
RAW and LONG RAW ���� ���� ������
BLOB ���̳ʸ� ������(�ִ� 4GB)
BFILE �ܺ� ���Ͽ� ����� ���̳ʸ� ������(�ִ� 4GB)
DATE ��¥ �� �ð� ��
LONG ���� ���� ���� ������(�ִ� 2GB)
CLOB ���� ������(�ִ� 4GB)
ROWID ���̺� �ִ� ���� ������ �ּҸ� ��Ÿ���� base-64 ���� ü��
CHAR(size) ���� ���� ���� ������
NUMBER(p,s) ���� ���� ���� ������
VARCHAR2(size) ���� ���� ���� ������

--char(10) : ������ 10������. (2���� ������)
--varchar2(10) : 10���� ���������ѵ� 2���������� 2���� ������
--��ȭ��ȣ�� ��� ���ڿ��� ����ϴ°� ���� (�ֳĸ� ������ �̷���� ����. ���ڿ� �����ع����� �տ� �ڵ尪�� 0�� �͹����� ������ ��.
--������ȣ 02�� �����ϴ� ��� 2�� Ƣ���.
--varchar2�� ������ ������. ���� ��κ� �̰͸� ��
--���� CROP�� LONG�߾Ⱦ�.
--Binary large object

select * from tab;
select * from user_tables;
select * from user_constraints;
select * from user_indexes;
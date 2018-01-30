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

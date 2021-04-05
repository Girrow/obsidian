-- 
SELECT
    employee_id,
    last_name,
    salary,
    email
FROM
    employees;

SELECT
    *
FROM
    departments;

CREATE TABLE job_grades (
    grade_level  VARCHAR2(2) PRIMARY KEY,
    lowest_sal   NUMBER(10),
    highst_sal   NUMBER(10)
);

INSERT INTO job_grades VALUES (
    'A',
    1000,
    2999
);

INSERT INTO job_grades VALUES (
    'B',
    3000,
    5999
);

INSERT INTO job_grades VALUES (
    'C',
    6000,
    9999
);

INSERT INTO job_grades VALUES (
    'D',
    10000,
    10999
);

INSERT INTO job_grades VALUES (
    'E',
    15000,
    12999
);

COMMIT;

SELECT
    *
FROM
    job_grades;

SELECT
    sysdate
FROM
    dual;

SELECT
    *
FROM
    employees
WHERE
    hire_date >= '2008-01-01'; --08/01/01

SELECT
    last_name,
    salary
FROM
    employees
WHERE
    salary <= 3000
    OR salary > 10000;

SELECT
    last_name,
    salary,
    manager_id
FROM
    employees
WHERE
    manager_id IN ( 100, 101, 201 );

SELECT
    last_name,
    salary
FROM
    employees
WHERE
    last_name LIKE '_b_%';

SELECT
    last_name,
    salary
FROM
    employees
WHERE
    last_name LIKE '%b___';

CREATE TABLE test01 (
    j_code VARCHAR2(30)
);

INSERT INTO test01 VALUES ( 'ADPRES' );

INSERT INTO test01 VALUES ( 'AD_PRES' );

INSERT INTO test01 VALUES ( 'AD_%PRES' );

COMMIT;

SELECT *
  FROM TEST01
 WHERE J_CODE LIKE 'AD\_\%%' escape '\';
 
drop table test01;

purge RECYCLEBIN; -- 휴지통 비우기

select * from recyclebin;

SELECT
    LAST_NAME
  FROM EMPLOYEES
 WHERE manager_id is NULL;

SELECT LAST_NAME, SALARY, MANAGER_ID
  from employees
 where MANAGER_ID is null and SALARY >10000;

select LAST_NAME,SALARY
  from employees
 where MANAGER_ID is not null;
 
-- ORDER BY

select employee_id,last_name,salary
  from employees
 where department_id = 60
 order by salary desc;
 
 
 SELECT LAST_NAME,SALARY,employee_id
   from employees
   where department_id = 60
   order by salary desc,employee_id asc;
   
select employee_id,last_NAME, salary, (12*salary) 연봉
  from employees
 where department_id = 60
 order by 연봉 desc;
 
 select employee_id, department_id
   from employees
  order by 2 asc nulls first; -- nulls last

select last_name , UPPER(last_name) upper_name ,salary
  from employees
 where department_id = 90;
 
 select UPPER('abcd efg high')  upper
       ,LOWER('abcd efg high') lower
       ,INITCAP('abcd efg high') initalcap
    from dual;

select concat('ab',' cd')
  from dual;

select substr('20080815',1,4)
      ,substr('20080815',5,2)
      ,substr('20080815',7)
      ,substr('20080815',-2)
  from dual;

select LENGTH('CANDIDE')
  from dual;

select LENGTHB('홍길동')
  from dual;

select REPLACE('JACK and JUE','J','BL')
  from dual;
  
select trim(both 'S' from 'SSMISTHSS') RESULT1,
       trim('S' FROM 'SSMISTHSS') RESULT2,
       trim (LEADING 'S' from 'SSMISTHSS') RESULT3,
       trim (trailing 'S' from 'SSMISTHSS') RESULT4
  from dual;

select Ltrim('SSMISTHSS','S') RESULT1,
       Rtrim('SSMISTHSS','S') RESULT2
  from dual;
  
-- LPAD RPAD 자리 채우기
-- INSTR 언제인지

--TRUNC 소수점 이하 유효자리수
SELECT TRUNC(1745.9260,4) result1,TRUNC(1745.9260,0) result2
  FROM DUAL;
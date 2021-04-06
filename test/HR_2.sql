-- MONTHS_BETWEEN (날짜 사이 달 수 계싼)

-- NEXT_DAY 다음에 오는 요일의 날짜 반환

-- ADD_MONTHS 숫자를 날짜의 달 수에 더한 날짜를 반환

-- LAST_DAY 달의 마지막 날짜 반환 > 날짜가 오류면 안됨

-- ALTER SESSION SET NLS_DATE_FORMAT='YYYY/MM/DD';


SELECT ROUND(SYSDATE,'MONTH')
  FROM DUAL;
  
-- 자동 데이터 유형 변환
-- VARCHAR 2 OR CHAR -> NUMBER
-- VARCHAR 2 OR CHAR -> DATE 자동변환
-- NUMBER -> VARCHAR2 숫자는 문자로 자동변환
-- DATE -> VARCHAR2 날짜는 세션에서 표시하는 형식 그대로 변환

SELECT to_char(to_date('94/01/11','RR/MM/DD'),'yyyy/mm/dd')
  from dual;
 
--  90년대와 2000년대 달 수 차이를 구하기

SELECT MONTHS_BETWEEN
       (TO_DATE('2002-02-02'),TO_DATE('1995-01-03')) MONTHS
  FROM dual;
  
-- 표현식

SELECT SYSDATE,TO_CHAR(SYSDATE,'YYYY/MON/DD HH24:MI:SS AM DY') from dual;

SELECT SYSDATE,TO_CHAR(SYSDATE,'YYYY "년" MM"월" DD"일" HH24"시" MI"분" SS"초" AM DY') from dual;

SELECT SYSDATE,TO_CHAR(SYSDATE,'YYYY "년" mON"월" DD"일" HH24"시" MI"분" SS"초" AM DaY','NLS_DATE_LANGUAGE=AMERICAN') from dual;

-- fm을 활용해서 처리
SELECT SYSDATE,TO_CHAR(SYSDATE,'fmYYYY-MM-DD fmHH24:fmMI:fmSS AM DaY') from dual;

-- sp 숫자 영문표시 th 숫자를 영어의 서수형태로 표시
SELECT SYSDATE,TO_CHAR(SYSDATE,'yYyySP-MMspth-DDspth HH24:MI:SS AM DaY') from dual;

SELECT TO_CHAR(SALARY,'L9,999,999.99')
  FROM employees
 where employee_id=100;
 
-- MI 음수일때 - 표시, PR 음수를 <>로 감쌈 -> 동시사용 불가
SELECT TO_CHAR(0-SALARY,'99,999.99MI'), TO_CHAR(0-SALARY,'99,999.99PR')
  FROM employees
 where employee_id=100;

SELECT SALARY, TO_CHAR(SALARY,'9,999.99')
  FROM employees
 where employee_id=100;
 
-- 현재 날짜에서 추출
SELECT SYSDATE, TO_CHAR(SYSDATE,'YYYY') year
  FROM employees
 where employee_id=100;
 
select TO_NUMBER('12,000', '999,999') * 0.1
  from dual;
  
SELECT LAST_NAME,UPPER(CONCAT(SUBSTR(LAST_NAME,1,8),'_US'))
  FROM EMPLOYEES 
 WHERE DEPARTMENT_ID=10;
 
-- general function NVL DECODE CASE NVL2 NULLIF COALESCE ...

select NVL(commission_pct,'0') commission_pct
  from employees
 where employee_id=100;
 
select last_name
      ,job_id
      ,salary 
      ,decode(job_id,'IT_PROG',1.10*SALARY,'ST_CLERK',1.15*SALARY,'SA_REP',1.20*SALARY) revised_salary
  from employees
 where revised_salary is null;
 
select LAST_NAME, JOB_ID,SALARY,
    (CASE JOB_ID WHEN 'IT_PROG' THEN 1.10*SALARY
                 WHEN 'ST_CLERK' then 1.15*SALARY
                 ELSE SALARY END) revised_salary
  from employees;
-- where revised_salary is not null;

--NVL2(컬럼,대체1,대체2)

SELECT LAST_NAME,commission_pct, NVL2(commission_pct,'OK','NO') GET_O_X
  FROM EMPLOYEES
 WHERE DEPARTMENT_ID in (20,80);
 
-- NULLIF(컬럼1,컬럼2) 같이 다르면 컬럼1, 같으면 NULL

select NULLIF(TO_NUMBER('12,000', '999,999') * 0.1,5)
  from dual;
  
--다중행 SUM AVG MAX MIN COUNT

SELECT DEPARTMENT_ID, AVG(SALARY) SALARY
  FROM EMPLOYEES
 GROUP BY DEPARTMENT_ID
HAVING DEPARTMENT_ID IN (10,20)
 ORDER BY DEPARTMENT_ID;
 
select department_id, job_id, avg(Salary) avg_sal ,count(*) persons
  from employees
 where department_id = 30
 group by department_id,job_id;
 
select department_id, sum(salary) sals
  from employees
 group by department_id
 having sum(salary) > 7000;
 
SELECT department_id , sum(salary), ROUND(avg(salary)), count(*)
  from EMPLOYEES
 where JOB_ID LIKE '%REP%'
 group by DEPARTMENT_id
 having ROUND(avg(salary))>7000;
 
select max(sum(salary)) as results
  from employees
 group by department_id;
 
SELECT e.employee_id, e.last_name,e.department_id,d.department_name
  from EMPLOYEES e
 inner join departments d
    on e.department_id = d.department_id
 order by 3;
 
 
select employee_id,last_name,e.department_id
  from employees e
  inner join departments d
    on (e.department_id = d.department_id);
    
SELECT *
  FROM EMPLOYEES E, DEPARTMENTS D
 where e.department_id = d.department_id;
 
SELECT e.last_name, d.department_name, l.city
  FROM EMPLOYEES e,DEPARTMENTS d ,LOCATIONS l
 WHERE e.department_id = d.department_id and
       d.location_id = l.location_id and
       e.employee_id in (100,150,200) ;
       
SELECT e.last_name, d.department_name, l.city
  from employees e join departments d
    on (e.department_id = d.department_id)
    join locations l
    on (d.location_id = l.location_id)
    where e.employee_id in (100,150,200);
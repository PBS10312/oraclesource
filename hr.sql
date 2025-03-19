-- employees (scott 의 emp 동일개념)
-- first name , las namem job id 조회

SELECT e.FIRST_NAME , e.LAST_NAME, e.JOB_ID
FROM EMPLOYEES e;

--job id 중복제외후 조회
 
SELECT DISTINCT e.JOB_ID FROM EMPLOYEES e;

--사번이 176인 사원의 last name 과 부서번호를 조회
SELECT e.DEPARTMENT_ID,e.LAST_NAME
FROM EMPLOYEES e
WHERE e.EMPLOYEE_ID = 176;





--연봉이 12000이상되는 사원의 라스트네임과 연봉을 조회
SELECT e.LAST_NAME
FROM EMPLOYEES e 
WHERE e.SALARY >= 12000;
-- 급여가 5000~ 12000이 범위가 아닌 사원의 라스트 네이과 급여를 조회
SELECT e.LAST_NAME
FROM EMPLOYEES e 
WHERE NOT (e.SALARY >= 5000 AND e.SALARY  <= 12000);

SELECT e.LAST_NAME
FROM EMPLOYEES e 
WHERE e.SALARY < 5000 or e.SALARY > 12000;


SELECT e.LAST_NAME
FROM EMPLOYEES e 
WHERE e.SALARY NOT BETWEEN 5000 AND 12000;

-- in 사용
-- 20,50 부서에 근무하는 사원을 조회(last name, 부서번호) , last name 오름
SELECT e.LAST_NAME , e.DEPARTMENT_ID
FROM EMPLOYEES e 
WHERE e.DEPARTMENT_ID IN (20,50) ORDER BY e.LAST_NAME ASC;
-- SALARY가 2500,3500,7000 이 아니며 직무가 SA_REP, SA_CLERK가 아닌 사원 조회

SELECT *
FROM EMPLOYEES e 
WHERE e.SALARY NOT IN (2500,3500,7000) AND e.JOB_ID NOT IN ('SA_REP' , 'SA_CLERK');

-- 날짜 데이터에도 '' 사용
-- 고용일이 2014년인 사원 조회 (2014-01-01 ~ 2014-12-31)
SELECT *
FROM EMPLOYEES e 
WHERE e.HIRE_DATE >= '2014-01-01' AND e.HIRE_DATE <= '2014-12-31';

SELECT *
FROM EMPLOYEES e 
WHERE e.HIRE_DATE BETWEEN '2014-01-01' AND '2014-12-31';

-- LIKE
-- lasr name에 소문자 u 포함되는 사원들의 사번 last name 조회
SELECT e.LAST_NAME , e.DEPARTMENT_ID
FROM EMPLOYEES e 
WHERE e.LAST_NAME LIKE ('%u%');


--last name 에 4번째 글자가 a인 사원들의 사번 라스트네임 조회
SELECT e.LAST_NAME , e.DEPARTMENT_ID
FROM EMPLOYEES e 
WHERE e.LAST_NAME LIKE ('___a%');

-- last name 에 a 혹은 e 글자가 있는 사람들의 사번 라스트 네임 조회 내림차순
SELECT e.LAST_NAME , e.DEPARTMENT_ID
FROM EMPLOYEES e 
WHERE e.LAST_NAME LIKE '%a%' OR e.LAST_NAME LIKE '%e%' ORDER BY e.LAST_NAME DESC;

-- last name 에 a 와 e 글자가 있는 사람들의 사번 라스트 네임 조회 내림차순
SELECT e.LAST_NAME , e.DEPARTMENT_ID
FROM EMPLOYEES e 
WHERE e.LAST_NAME LIKE '%a%e%' OR  e.LAST_NAME LIKE '%e%a%' ORDER BY e.LAST_NAME DESC;


--Is NULL
--매니저가 없는 사원들의 last name job id 조회
SELECT e.MANAGER_ID , e.LAST_NAME , e.JOB_ID
FROM EMPLOYEES e 
WHERE e.MANAGER_ID IS NULL

-- st_clerk 인 직업을 가진 사원이 없는 부서 번호 조회 ( 단 부서번호가 널 값이 부서 제외)
SELECT DISTINCT e.DEPARTMENT_ID , e.JOB_ID
FROM EMPLOYEES e 
WHERE e.JOB_ID != 'ST_CLERK' AND e.DEPARTMENT_ID IS NOT NULL;

-- commision pct 가 널이 아닌 사원들 중에서 커미션=샐러리 * 커미션 pct 를 구한다
-- 계산 결과 와 함꼐 사번, 러스트 네임 , job id 출력

SELECT e.EMPLOYEE_ID , e.FIRST_NAME , e.JOB_ID, e.SALARY * e.COMMISSION_PCT AS COMMISION
FROM EMPLOYEES e 
WHERE e.COMMISSION_PCT IS NOT NULL;


-- FIRST NAME 이 'CURTIS' 인 사람의 first name 과 last name , email , phone number,job id 조회
-- 단 job id 는 소문자로 출력한다
SELECT e.FIRST_NAME , e.LAST_NAME, e.EMAIL,e.PHONE_NUMBER,lower(e.JOB_ID) AS job_id
FROM EMPLOYEES e 
WHERE e.FIRST_NAME LIKE ('Curtis');



-- 부서번호가 60 70 80 90 인 사원들의 사번 , first name , last name ,hire date, jon id 조회
--단 job id 가 IT PROG 인 사원의 경우 '프로그래머' 로 변경하여 출력한다.
SELECT e.DEPARTMENT_ID,e.FIRST_NAME,e.LAST_NAME,e.HIRE_DATE,REPlACE(e.JOB_ID,'IT_PROG','프로그래머') AS job_id
FROM EMPLOYEES e 
WHERE e.DEPARTMENT_ID IN(60,70,80,90);




-- job id 가 AD PRES , PU CLERK 인 사원들의 사번 퍼스트네임 라스트네임 부서번호 잡아이디 조회
-- 단 사원명은 퍼스트네임 라스트네임 을 연결하여 출력한다
SELECT e.EMPLOYEE_ID ,e.JOB_ID,e.DEPARTMENT_ID,CONCAT(e.FIRST_NAME,e.LAST_NAME) 이름
FROM EMPLOYEES e 
WHERE e.JOB_ID IN ('AD_PRES','PU_CLERK');

--입사 10주년이 되는 날짜출력
SELECT e.EMPLOYEE_ID,e.FIRST_NAME,e.HIRE_DATE,ADD_MONTHS(e.HIRE_DATE,120) 
FROM EMPLOYEES e 













































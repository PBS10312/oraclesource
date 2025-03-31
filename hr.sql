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

-- 회사내의 최대 연봉과 최소 연봉의 차이 조회

SELECT max(e.SALARY) AS 최대연봉, min(e.SALARY) AS 최소연봉, max(e.SALARY)-min(e.SALARY) AS 차이
FROM EMPLOYEES e 



-- 매니저로 근무하는 사원들의 숫자를 조회

SELECT COUNT(DISTINCT e.MANAGER_ID)
FROM EMPLOYEES e 

--부서별 직원 수(부서번호 오름차)
-- 부서번호 ,직원수
SELECT e.DEPARTMENT_ID , COUNT(e.DEPARTMENT_ID)
FROM EMPLOYEES e
GROUP BY e.DEPARTMENT_ID 
ORDER BY e.DEPARTMENT_ID

-- 부서별 평균연봉 조회 (부서번호 오름차)
-- 부서번호 , 평균연봉 (0의 자리에서 반올림)
SELECT e.DEPARTMENT_ID , ROUND(AVG(e.SALARY),0)
FROM EMPLOYEES e 
GROUP BY e.DEPARTMENT_ID
ORDER BY e.DEPARTMENT_ID ;
-- 동일한 직무를 가진 사원의 수 조회 
-- job_id 인원수

SELECT e.JOB_ID, COUNT(e.EMPLOYEE_ID)
FROM EMPLOYEES e 
GROUP BY e.JOB_ID
ORDER BY e.JOB_ID ;

-- 직업 id가 SA_MAN 인 사원들의 최대 연봉보다 높게 받는 사원들의
-- last_name , job_id , salary 조회
--내꺼 (출력완) -맞음
SELECT
	e.LAST_NAME ,
	e.JOB_ID,
	e.SALARY
FROM
	EMPLOYEES e
WHERE
	e.SALARY >
(
	SELECT
		max(e.SALARY)
	FROM
		EMPLOYEES e
	WHERE
		e.JOB_ID = 'SA_MAN');
---------------------------------------------------------------------------

-- 커미션을 받는 사원들의 부서와 연봉이 동일한 사원들의 last_name ,
-- deptno,salary 조회

-- 내꺼 -------
SELECT
	e.LAST_NAME,
	e.DEPARTMENT_ID,
	e.SALARY
FROM
	EMPLOYEES e
WHERE
	(e.COMMISSION_PCT ,
	e.SALARY) IN
(
	SELECT
		e.COMMISSION_PCT ,
		e.SALARY
	FROM
		EMPLOYEES e
	ORDER BY
		e.COMMISSION_PCT);
-----------------------------------------------------------------------------
SELECT
	e.LAST_NAME,
	e.DEPARTMENT_ID,
	e.SALARY
FROM
	EMPLOYEES e
WHERE
	(e.DEPARTMENT_ID  ,
	e.SALARY) IN
(
	SELECT
		e.DEPARTMENT_ID  ,
		e.SALARY
	FROM
		EMPLOYEES e
	WHERE e.COMMISSION_PCT > 0);


-- 회사 전체 평균 연봉보다 더 버는 사원들 중 last_name 에 u가 있는
-- 사원들이 근무하는 부서와 같은 부서에 근무하는 사원들의
-- 사번,last_name,salary 조회

-- 내꺼 --------------------------
SELECT
	e.EMPLOYEE_ID,
	e.LAST_NAME,
	e.SALARY
FROM
	EMPLOYEES e
WHERE
	e.SALARY >
(
	SELECT
		MAX(AVG(e.SALARY))
	FROM
		EMPLOYEES e
	WHERE
		e.LAST_NAME = 'u')
GROUP BY ;

-------------------------------------------------------------------------
SELECT e.EMPLOYEE_ID ,e.LAST_NAME,e.SALARY -- (강사님것)
FROM EMPLOYEES e 
WHERE e.DEPARTMENT_ID
IN (SELECT DISTINCT e.DEPARTMENT_ID
FROM EMPLOYEES e 
WHERE e.SALARY
> (SELECT
		round(AVG(e.SALARY))
	FROM
		EMPLOYEES e) AND e.LAST_NAME LIKE '%u%');

--join 사용 ---------------
SELECT
	e.EMPLOYEE_ID ,
	e.LAST_NAME,
	e.SALARY
FROM
	EMPLOYEES e
JOIN (
	SELECT
		DISTINCT e.DEPARTMENT_ID
	FROM
		EMPLOYEES e
	WHERE
		e.SALARY
> (
		SELECT
			round(AVG(e.SALARY))
		FROM
			EMPLOYEES e)
		AND e.LAST_NAME LIKE '%u%') d
ON
	e.DEPARTMENT_ID = d.DEPARTMENT_ID;



-- 각 부서별 평균 연봉보다 더 받는 동일부서 사원들의 last_name,salary
--dptpno 해당 부서의 평균연봉 조회(부서별 평균연봉을 기준으로 오름차순)
-- 내꺼 (출력완)
SELECT
	e.LAST_NAME,
	e.SALARY ,
	e.DEPARTMENT_ID
FROM
	EMPLOYEES e
WHERE
	(e.DEPARTMENT_ID ,
	e.SALARY) IN (
	SELECT
		e.DEPARTMENT_ID ,
		MAX(e.salary)
	FROM
		EMPLOYEES
	GROUP BY
		e.DEPARTMENT_ID);
-------------------------------------------------------
SELECT
	e.LAST_NAME,
	e.SALARY ,
	e.DEPARTMENT_ID
FROM
	EMPLOYEES e
WHERE
	(e.DEPARTMENT_ID ,
	e.SALARY) IN (
	SELECT
		e.DEPARTMENT_ID ,
		round(avg(e.salary))
	FROM
		EMPLOYEES
	GROUP BY
		e.DEPARTMENT_ID);
--------------------------------
--join 사용
SELECT
	e.LAST_NAME,
	e.SALARY ,
	e.DEPARTMENT_ID
FROM
	EMPLOYEES e ,
	(
	SELECT
		e.DEPARTMENT_ID ,
		round(avg(e.salary)) AS dept_sal_avg
	FROM
		EMPLOYEES e
	WHERE
		e.DEPARTMENT_ID IS NOT NULL
	GROUP BY
		e.DEPARTMENT_ID) p
WHERE
	e.DEPARTMENT_ID = p.DEPARTMENT_ID
	AND p.DEPT_SAL_AVG < e.SALARY
ORDER BY
	e.DEPARTMENT_ID;


--last_name 이 'DAVIES' 인 사람보다 나중에 고용된 사원들의 last_name , hiredate 조회
-- 내꺼 -- (맞음)
SELECT
	e.LAST_NAME,
	e.HIRE_DATE
FROM
	EMPLOYEES e
WHERE
	e.HIRE_DATE >
(
	SELECT
		e.HIRE_DATE
	FROM
		EMPLOYEES e
	WHERE
		e.LAST_NAME = 'Davies');
-------------------------------------------------------------



--last_name 이 'King' 인 사원을 매니저로 두고 있는 모든 사원들의  last_name , salary 조회
-- 내꺼 --
SELECT
	e.LAST_NAME,
	e.SALARY
FROM
	EMPLOYEES e
WHERE
	e.MANAGER_ID IN 
(
	SELECT
		e.MANAGER_ID
	FROM
		EMPLOYEES e
	WHERE
		e.LAST_NAME = 'King');
--------------------------------------------------------------
SELECT
	e.LAST_NAME,
	e.SALARY
FROM
	EMPLOYEES e
WHERE
	e.MANAGER_ID IN 
(
	SELECT
		e.EMPLOYEE_ID 
	FROM
		EMPLOYEES e
	WHERE
		e.LAST_NAME = 'King');


--last_name 이 'Hall' 인 사원과 동일한 연봉 및 커미션을 받는 사원들의 last_name,부서번호,연봉 조회
--단 , Hall 제외
-- 내꺼 --
SELECT
	e.LAST_NAME ,
	e.DEPARTMENT_ID,
	e.SALARY
FROM
	EMPLOYEES e
WHERE
	e.LAST_NAME IN 
(
	SELECT
		e.LAST_NAME
	FROM
		EMPLOYEES e
	WHERE
		e.LAST_NAME = 'Hall');
------------------------------------------------------------------------
SELECT
	e.LAST_NAME ,
	e.DEPARTMENT_ID,
	e.SALARY
FROM
	EMPLOYEES e
WHERE
	(e.SALARY,NVL(e.COMMISSION_PCT,0)) IN 
(
	SELECT
		e.SALARY,NVL(e.COMMISSION_PCT,0)
	FROM
		EMPLOYEES e
	WHERE
		e.LAST_NAME = 'Hall') AND e.LAST_NAME != 'Hall';


--last_name 이 "Zlotkey" 인 사원과 동일한 부서에서 근무하는 모든 사원들의 사번,고용날짜 조회
--단 'Zlotkey' 제외
-- 내꺼 (출력완)
SELECT
	e.EMPLOYEE_ID ,
	e.HIRE_DATE
FROM
	EMPLOYEES e
WHERE
	e.DEPARTMENT_ID IN 
(
	SELECT
		DEPARTMENT_ID
	FROM
		EMPLOYEES e
	WHERE
		e.LAST_NAME = 'Zlotkey')AND e.LAST_NAME != 'Zlotkey';


--부서가 위치한 지역 국가 Id및 국가명을 조회한다
-- Location ,departments, countries 테이블사용
SELECT
	*
FROM
	DEPARTMENTS d
JOIN LOCATIONS l ON
	d.LOCATION_ID = l.LOCATION_ID
JOIN COUNTRIES c ON
	l.COUNTRY_ID = c.COUNTRY_ID; 

SELECT c.COUNTRY_ID,c.COUNTRY_NAME
FROM COUNTRIES c 
WHERE c.COUNTRY_ID IN (
SELECT
	DISTINCT l.COUNTRY_ID
FROM
	DEPARTMENTS d
JOIN LOCATIONS l ON
	d.LOCATION_ID = l.LOCATION_ID);


--위치 ID가 1700인 사원들의 연봉과 커미션을 추출한뒤 , 추출된 사원들의 연봉과 커미션이 동일한 사원정보 출력
--출력 : 사번,이름(first_name + last name), 부서번호 ,급여



SELECT e.EMPLOYEE_ID,e.FIRST_NAME || ' ' ||e.LAST_NAME,e.DEPARTMENT_ID,e.SALARY
FROM EMPLOYEES e 
WHERE (e.SALARY,NVL(e.COMMISSION_PCT,0))
IN (SELECT DISTINCT e.SALARY,NVL(e.COMMISSION_PCT,0)
FROM EMPLOYEES e JOIN DEPARTMENTS d ON e.DEPARTMENT_ID = d.DEPARTMENT_ID 
WHERE d.LOCATION_ID = 1700);































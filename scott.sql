--RDBMS
-- 기본단위는 테이블



-- EMP (사원정보테이블)
-- empno (사번) , ename(사원명) , job(직책) , mgr(직속상관사번)
-- hiredate(입사일), sal(급여), comm(추가수당), deptno(부서번호)
-- NUMBER(4,0) : 전체 자릿수는 4자리(소수점 자릿수0) 
-- VARCHAR2(10) : 문자열 표현 (10Byte임) 
--  ㄴ 앞에 VAR이 붙으면 가변 만약 7byte만 문자열 저장했다면 7byte만 공간만 사용
--  ㄴ 영어 10문자, 한글 2byte, utf-8 3byte 할당
--DATE : 날짜 



--DEPT(부서테이블)
--deptno(부서번호), dname(부서명), loc(부서위치)



--SALGREADE(급여테이블)
--grade(급여등급), losal(최저급여), hisal(최대급여)


-- 개발자는 CR(Read)UD 를 잘해야한다
-- SQL(Structured Query Languege : 구조질의언어) : RDBMS 이라는 언어공부가 필요
--


-- 1. 조회 (SELECT) - Read
-- 사원정보조회 (전체조회)
-- * 은(모든 열) 라는 뜻 
SELECT * FROM EMP e; -- << 무조건 외우기

--특정 열 조회
SELECT e.EMPNO,e.ENAME,e.JOB FROM EMP e;

-- 사원번호 , 부서번호만 조회
SELECT e.EMPNO, e.DEPTNO FROM EMP e;

-- 중복 데이터는 제외하고 조회
SELECT DISTINCT deptno FROM emp;

SELECT DISTINCT job, deptno FROM emp;

-- 별칭 : as 나 " " 씀 , 칼럼명 뒤에 띄고 써야함
-- ㄴ 만약 공백이 있으면 "" 필수 , ex) "연 봉" o  연 봉 x
SELECT ename , sal ,sal*12+comm 계산, comm
FROM EMP;

SELECT ename , sal ,sal*12+comm AS 계산, comm
FROM EMP;

SELECT ename , sal ,sal*12+comm "계산", comm
FROM EMP;

SELECT ename 사원명, sal 급여,sal*12+comm 연봉, comm 수당
FROM EMP;

-- 원하는 순서대로 출력 데이터를 정렬(오름,내림)
-- 오름차순은 asc 생략 가능 , 왜 why? 기본(default)이라
-- emp 테이블의 모든열을 급여 기준으로 오름차순 조회 (asc)
SELECT * FROM EMP e ORDER BY e.SAL ASC;

-- emp 테이블의 모든열을 급여 기준으로 내림차순 조회 (desc)
SELECT * FROM EMP e ORDER BY e.SAL DESC;

--사번 이름 직무를 급여 기준으로 내림차순 조회
SELECT e.ENAME , e.EMPNO , e.JOB  FROM EMP e ORDER BY e.sal desc;

--부서 번호의 오름차순 , 급여의 내림차순
SELECT * FROM EMP e ORDER BY e.DEPTNO ASC, e.SAL DESC;

SELECT
	e.EMPNO "EMPLOYEE_NO",
	e.ENAME "EMPLOYEE_NAME",
	e.MGR "MANAGER",
	e.SAL "SALARY",
	e.COMM "COMMISSION",
	e.DEPTNO "DEPARTMENT_NO"
FROM
	EMP e;

SELECT * FROM EMP e ORDER BY e.DEPTNO DESC, e.ename ASC;


-- where : 조건을 부여함
-- 부서번호가 30번인 사원 조회
SELECT *
FROM EMP e
WHERE e.deptno = 30;

--사원번호가 7782인 사람

SELECT *
FROM EMP e
WHERE e.EMPNO  = 7782;

-- 부서번호가 30 이고 직책이 세일즈맨인 사람 조회
-- 오라클에서 문자는 '' 을 씀, 문자는 대소문자 구분
SELECT *
FROM EMP e
WHERE e.deptno = 30 AND e.JOB = 'SALESMAN';

--사원 번호가 7499 이고 부서번호가 30 사원

SELECT *
FROM EMP e
WHERE e.deptno = 30 AND e.EMPNO  = 7499;

-- 사번이 7499 이거나 부서번호가 30

SELECT *
FROM EMP e
WHERE e.deptno = 30 or e.EMPNO  = 7499;

-- -연산자- 
-- 산술연산자 : + - * /
-- 비교연산자 : > < >= <= =
-- 등가비교연산자 : = ,같지않음(!= , <> , ^= )
-- 논리부정연산자 : NOT 
--               IN
-- 범위연산자 : BETWEEN A AND B
-- 검색연산자 : LIKE 연산자와 와일드카드( _ , % )를 쓴다
-- IS NULL : 널과 같다

-- 연봉이(SAL * 12) 36000 인 사원을 조회
SELECT *
FROM EMP e
WHERE e.sal * 12 = 36000;

-- 급여가 3000 이상인 사원 조회
SELECT  *
FROM EMP e
WHERE e. sal >= 3000;

--급여가 2500 이상이고 직업이 ANALYST 인사람
SELECT  *
FROM EMP e
WHERE e. sal >= 2500 AND e.JOB = 'ANALYST';

-- 문자도 대소 비교 가능 
SELECT  *
FROM EMP e
WHERE e.ename >= 'F';
-- ㄴ 사원명이 첫 문자가 F와 같거나 F보다 뒤에 있는거 조회


-- 급여가 3000이 아닌 사원 조회
SELECT  *
FROM EMP e
WHERE e. sal != 3000;

-- 급여가 3000이 아닌 사원 조회
SELECT  *
FROM EMP e
WHERE e. sal <> 3000;

-- 급여가 3000이 아닌 사원 조회
SELECT  *
FROM EMP e
WHERE e. sal ^= 3000;

-- not 사용
SELECT  *
FROM EMP e
WHERE NOT e. sal = 3000;


-- job이 manager 이거나 salseman 이거나 clerk 사원 조회

SELECT  *
FROM EMP e
WHERE e.JOB='MANAGER' OR e.JOB='SALESMAN' OR e.JOB='CLERK';
-- in 사용
SELECT  *
FROM EMP e
WHERE e.JOB IN ('MANAGER','SALESMAN','CLERK');

-- not + in 사용

SELECT  *
FROM EMP e
WHERE e.JOB NOT IN ('MANAGER','SALESMAN','CLERK');

--BETWEEN A AND B
--급여가 2000이상 3000이하 

SELECT  *
FROM EMP e
WHERE e.SAL >= 2000 AND e.sal <= 3000;

SELECT  *
FROM EMP e
WHERE e.SAL BETWEEN 2000 AND 3000;

-- 급여가 2000이상 3000이하가 아닌 사원 조회
SELECT  *
FROM EMP e
WHERE e.SAL NOT BETWEEN 2000 AND 3000;

-- LIKE : 검색 
-- _ : 어떤 값이든 상관없이 한 개의 문자열 데이터를 의미
-- % : 길이와 상관없이(문자 없는 경우도 포함) 모든 문자열 데이터를 의미

--사원명이 S 로 시작하는 사원 조회 
SELECT *
FROM EMP e 
WHERE e.ENAME LIKE 'S%';

--사원이름의 두번째 글자가 L 인 사원 조회;
SELECT *
FROM EMP e 
WHERE e.ENAME LIKE '_L%';

--사원명에 AM이 포함된 사원 조회
SELECT *
FROM EMP e 
WHERE e.ENAME LIKE '%AM%';

--사원명에 AM이 포함되지 않은 사원 조회
SELECT *
FROM EMP e 
WHERE e.ENAME NOT LIKE '%AM%';

-- IS NULL
-- COMM 이 NULL 인 사람
SELECT *
FROM EMP e 
WHERE e.COMM IS NULL;

-- MGR이 NULL인 사람 (= 직속상관이 없는)
SELECT *
FROM EMP e 
WHERE e.MGR IS NULL;

--직속상관이 있는 사람 

SELECT *
FROM EMP e 
WHERE e.MGR IS NOT NULL;






--RDBMS
-- 기본단위는 테이블

--SQL 구문 실행 순서
SELECT --3
FROM  -- 1
WHERE -- 2
ORDER BY --4


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
-- 집합연산자 : UNION(합집합) , MINUS(차집합), INTERSECT(교집합) 

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


--집합연산자
--UNION
--부서번호 10, 20 사원조회
SELECT *
FROM EMP e 
WHERE e.DEPTNO  = 10 OR e.DEPTNO = 20;

SELECT *
FROM EMP e 
WHERE e.DEPTNO IN (10,20);

SELECT * FROM EMP e WHERE e.DEPTNO = 10
UNION -- <<< 교집합
SELECT * FROM EMP e WHERE e.DEPTNO = 20;

SELECT e.EMPNO ,e.ENAME ,e.SAL ,e.DEPTNO FROM EMP e WHERE e.DEPTNO = 10
UNION -- <<< 합집합
SELECT e.EMPNO ,e.ENAME ,e.SAL FROM EMP e WHERE e.DEPTNO = 20;
-- 위 처럼 셀렉트에 테이블? 칼럼?이 맞지않으면 출력 안해줌 ㅇㅇ

SELECT e.EMPNO ,e.ENAME ,e.SAL ,e.DEPTNO FROM EMP e WHERE e.DEPTNO = 10
UNION -- <<< 합집합
SELECT e.SAL,e.JOB,e.DEPTNO,e.EMPNO FROM EMP e WHERE e.DEPTNO = 20;
-- 위 처럼 타입 일치만 맞는다면 출력해줌 ㅇㅇ

--UNION(중복 제외하고 출력) 과 UNION ALL (중복 데이터도 출력)
SELECT e.EMPNO ,e.ENAME ,e.SAL ,e.DEPTNO FROM EMP e WHERE e.DEPTNO = 10
UNION 
SELECT e.EMPNO ,e.ENAME ,e.SAL ,e.DEPTNO FROM EMP e WHERE e.DEPTNO = 10;

SELECT e.EMPNO ,e.ENAME ,e.SAL ,e.DEPTNO FROM EMP e WHERE e.DEPTNO = 10
UNION ALL
SELECT e.EMPNO ,e.ENAME ,e.SAL ,e.DEPTNO FROM EMP e WHERE e.DEPTNO = 10;

--MINUS (차집합)
SELECT e.EMPNO ,e.ENAME ,e.SAL ,e.DEPTNO FROM EMP e
MINUS -- 차집합
SELECT e.EMPNO ,e.ENAME ,e.SAL ,e.DEPTNO FROM EMP e WHERE e.deptno = 10;


-- INTERSECT (교집합)
SELECT e.EMPNO ,e.ENAME ,e.SAL ,e.DEPTNO FROM EMP e
INTERSECT -- 교집합
SELECT e.EMPNO ,e.ENAME ,e.SAL ,e.DEPTNO FROM EMP e WHERE e.deptno = 10;

-- 오라클 함수
-- 내장함수
-- 1) 문자함수
-- ㄴ 대소문자를 바꿔주는 함수 : upper() , lower(), initcap()
-- ㄴ 문자의 길이를 구하는 함수 : LENGTH() , lengthb()
-- ㄴ 문자열 일부 추출 : SUBSTR(문자열데이터,시작위치,추출길이)
-- ㄴ 문자열 데이터 안에서 특정 문자 위치 찾기 : INSTR()
-- ㄴ 특정문자를 다른 문자로 변경 : REPLACE(원본문자열,찾을문자열,변경문자열)
-- ㄴ 두 문자열 데이터를 합치기 : CONCAT(문자열1,문자열2) ||
-- ㄴ 특정 문자 제거 : TRIM(), LTRIM(), RTRIM()








--사원이름을 대문자,소문자,첫문자만 대문자로 변경

SELECT e.ENAME , upper(e.ENAME), lower(e.ENAME ),initcap(e.ENAME)
FROM EMP e 

-- 제목 oracle 검색 할때
-- LIKE '%oracle%' OR LIKE '%oracle%' OR LIKE '%Oracle%'

SELECT *
FROM board
WHERE upper(title) = upper('oracle')

--사원명 길이 구하기
SELECT e.ENAME, length(e.ENAME)
FROM EMP e 

--사원명이 5글자 이상인 사원 조회
SELECT *
FROM EMP e
WHERE length(e.ENAME) >= 5;


--LENGTH() <<얘는 문자의길이, LENGTHB() <<< 얘는 문자의 바이트용량을 출력
--XE 버전 : 한글에 3byte 사용
-- DUAL : sys 소유 테이블(임시연산이나 함수의 결과값 확인 용도로 사용)
SELECT LENGTH('한글') , LENGTHB('한글')
FROM DUAL

-- 시작위치 지정 시 양수(왼쪽)1, 음수(오른쪽부터) : 맨 끝부터 -1 
SELECT e.JOB,SUBSTR(e.JOB,1,2),SUBSTR(e.JOB,5)
FROM EMP e 

SELECT
	e.JOB,
	SUBSTR(e.JOB, -LENGTH(e.JOB)),
	SUBSTR(e.JOB, -LENGTH(e.JOB),2),
	SUBSTR(e.JOB, -3)
FROM
	EMP e
	
	
--INSTR(대상문자열, 위치를 찾으려는문자,시작위치,시작위치에서 찾으려는 문자가 몇 번쨰인지)
SELECT
	INSTR('HELLO, ORACLE!', 'L') AS INSTR_1,
	INSTR('HELLO, ORACLE!', 'L', 5) AS INSTR_2,
	INSTR('HELLO, ORACLE!', 'L',2,2) AS INSTR_3
FROM
	DUAl;

--사원 이름에 S가 있는 사원 조회
SELECT *
FROM EMP e WHERE e.ENAME LIKE '%S%';

SELECT *
FROM EMP e WHERE INSTR(e.ename,'S') > 0;

--REPLACE(원본 문자열 , 찾을 문자열 , 변경문자열)
SELECT
	'010-1234-5678' AS REPLACE_BEFORE,
	REPLACE('010-1234-5678', '-', ' ') AS REPLACE1,
	REPLACE('010-1234-5678', '-') AS REPLACE2
FROM
	DUAL;

--사번 : 사원명
SELECT concat(e.EMPNO,CONCAT(' : ',e.ENAME))
FROM EMP e;

SELECT e.EMPNO || ' : ' || e.ENAME
FROM EMP e;


--TRIM(삭제옵션(선택) , 삭제할문자(선택) , FROM 원본문자열(필수))
SELECT
	'[' || TRIM(' __Oracle__ ') || ']' AS trim,
	'[' || TRIM(LEADING FROM' __Oracle__ ') || ']' AS trim_leading,
	'[' || TRIM(TRAILING FROM' __Oracle__ ') || ']' AS trim_trailing,
	'[' || TRIM(BOTH FROM' __Oracle__ ') || ']' AS trim_both
FROM
	DUAL;

--LTRIM() , RTRIM()
SELECT
	'[' || TRIM(' __Oracle__ ') || ']' AS trim,
	'[' || LTRIM(' __Oracle__ ') || ']' AS LTRIM,
	'[' || RTRIM(' __Oracle__ ') || ']' AS Rtrim,
	'[' || RTRIM('< __Oracle__>','>_') || ']' AS Rtrim2
FROM
	DUAL;

-- 숫자함수
-- 반올림 : Round()
-- 버림 : TRUNC()
-- 가장 큰 정수 : CEIL()
-- 가장 작은 정수 : FLOOR()
-- 나머지 : MOD()

--      -2 -1   1  2
-- 1  2  3  4 . 5  6  7  8
SELECT
	ROUND(1234.5678) AS ROUND,
	ROUND(1234.5678,0) AS ROUND1, 
	ROUND(1234.5678,1) AS ROUND2, -- 6 반올림
	ROUND(1234.5678,2) AS ROUND3, -- 7 반올림
	ROUND(1234.5678,-1) AS ROUND4, -- 4 반올림
	ROUND(1234.5678,-2) AS ROUND5 -- 3 반올림
FROM
	DUAL;

-- 버림 TRUNC
SELECT
	TRUNC(1234.5678) AS TRUNC,
	TRUNC(1234.5678,0) AS TRUNC1, 
	TRUNC(1234.5678,1) AS TRUNC2, -- 6 자리 버림
	TRUNC(1234.5678,2) AS TRUNC3, -- 7 자리 버림
	TRUNC(1234.5678,-1) AS TRUNC4, -- 4 자리 버림
	TRUNC(1234.5678,-2) AS TRUNC5 -- 3 자리 버림
FROM
	DUAL;


-- 가장 큰 정수 CEIL , 가장 작은 정수 FLOOR
SELECT CEIL(3.14), FLOOR(3.14),CEIL(-3.14),FLOOR(-3.14)
FROM DUAL;

-- 나머지 MOD
SELECT MOD(15,6),MOD(10,2),MOD(11,2)
FROM DUAL;

-- 날짜 함수
-- 오늘 날짜 / 시간 : SYSDATE
-- 몇개월 이후 날짜 구하기 : ADD_MONTH()
-- 두 날짜 간의 개월 수 차이 구하기 : MONTHS_BETWEEN()
-- 돌아오는 요일, 달의 마지막 날짜 구하기 : NEXT_DAY() / LAST_DAY()
SELECT
	SYSDATE AS NOW,
	SYSDATE-1 YESTERDAY,
	SYSDATE + 1 TOMORROW,
	CURRENT_DATE AS CURRENT_DATE,
	CURRENT_TIMESTAMP AS CURRENT_TIMESTAMP
FROM
	DUAL;

-- 오늘을 기준으로 3개월 이후 날짜 구하기
SELECT SYSDATE, ADD_MONTHS(SYSDATE,3)
FROM DUAL;

--입사한지 40년 넘은 사원 조회
SELECT *
FROM EMP e 
WHERE ADD_MONTHS(e.HIREDATE , 480) < SYSDATE; 

--날짜차이
--오늘 날짜와 입사일자의 차이 구하기
SELECT
	e.EMPNO,
	e.ENAME,
	e.HIREDATE,
	SYSDATE,
	MONTHS_BETWEEN(e.HIREDATE, SYSDATE) AS MONTH1,
	MONTHS_BETWEEN(SYSDATE, e.HIREDATE) AS MONTH2,
	TRUNC(MONTHS_BETWEEN(e.HIREDATE, SYSDATE)) AS MONTH3
FROM
	EMP e ;

SELECT SYSDATE,NEXT_DAY(SYSDATE,'월요일'),LAST_DAY(SYSDATE)
FROM DUAL;

-- 자료형을 변환하는 형변환 함수
-- TO_CHAR() 숫자 또는 날짜 데이터를 문자열 데이터로 반환
-- TO_NUMBER() 문자열 데이터를 숫자 데이터로 반환
-- TO_DATE() 문자열 데이터를 날짜 데이터로 반환


-- NUMBER + '문자숫자' : 덧셈 가능 (자동형변환해줌)
SELECT e.EMPNO,e.ENAME,e.EMPNO + '500'
FROM EMP e 
WHERE e.ENAME = 'SMITH';

--SELECT e.EMPNO,e.ENAME,e.EMPNO + 'abcd'
--FROM EMP e 
--WHERE e.ENAME = 'SMITH';

SELECT SYSDATE,TO_CHAR(SYSDATE,'YYYY/MM/DD')
FROM DUAL;

SELECT
	SYSDATE,
	TO_CHAR(SYSDATE, 'MM'),
	TO_CHAR(SYSDATE, 'MON'),
	TO_CHAR(SYSDATE, 'MONTH'),
	TO_CHAR(SYSDATE, 'DD'),
	TO_CHAR(SYSDATE, 'DY'),
	TO_CHAR(SYSDATE, 'DAY'),
	TO_CHAR(SYSDATE,'HH24:MI:SS'),
	TO_CHAR(SYSDATE,'HH12:MI:SS AM'),
	TO_CHAR(SYSDATE,'HH:MI:SS PM')
FROM
	DUAL;










































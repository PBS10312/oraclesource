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


-- 개발자는 CR(ead)UD 를 잘해야함?
-- SQL(Structured Query Languege : 구조질의언어) : RDBMS 이라는 언어공부가 필요
--


-- 1. 조회 (SELECT) - Read
-- 사원정보조회 (전체조회)
SELECT * FROM EMP e; -- << 무조건 외우기


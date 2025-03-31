-- 오라클 관리자는 2명
-- system , sys (최고권한)

-- 사용자 이름 : sys as sysdba
--비밀번호 : 엔터(빈칸)

--오라클 12c 버전부터 사용자계정 생성시 접두어(c##)를 요구함
--c##hr
--c## 사용하지 않을때


ALTER SESSION SET "_ORACLE_SCRIPT"=TRUE;

--비밀번호만 대소문자를 구분함 
-- 비밀번호 변경 하는법
--ALTER USER hr IDENTIFIED BY hr;

--구문 실행 컨트롤 + 엔터
ALTER USER scott IDENTIFIED BY tiger;

-- 로그인 실패 잠금 푸는법
-- ALTER USER 해제할 유저명 account unlock;

-- 데이터사전 DBA_USERS 를 사용하여 사용자 정보 조회
SELECT * FROM dba_users WHERE username='SCOTT';

--scott view 생성 권한 부여
GRANT CREATE VIEW TO scott;

--사용자 관리 
-- 오라클은 테이블, 인덱스,뷰등 사용자별로 여러 객체를 생성하므로 업부별 사용자를 생성한 후에 각 사용자
-- 업무에 맞는 데이터 구조를 만들어 관리하는 방식 사용

-- 데이터베이스 스키마
-- 스키마 : 데이터베이스에서 데이터 간 관계, 데이터 구조 , 제약 조건 등 데이터를 저장하고 관리하고자 정의한
--          데이터베이스 구조 범위 

-- 오라클 데이터베이스에서는 스키마 == 사용자 

-- 사용자 생성 구문
--CREATE USER 사용자이름 IDENTIFIED BY 비밀번호;  

--CREATE USER 사용자이름 IDENTIFIED BY 비밀번호
--DEFAULT  TABLESPACE 테이블 스페이스명
-- TEMPORARY TABLESPACE 테이블 스페이스 그룹명
-- QUOTA 테이블스페이스 크기 ON 테이블스페이스명;

-- 1. 사용자 생성
CREATE USER c##java IDENTIFIED BY 12345
DEFAULT  TABLESPACE  USERS 
TEMPORARY TABLESPACE TEMP
QUOTA 10M ON USERS;


-- 2. 권한 부여(GRANT)

-- BOARD 테이블의 select,insert,delete 권한 부여
-- GRANT SELECT,INSERT,DELETE ON BOARD TO c##test1; <= 하나하나주면 끝도없음
-- 롤 : 여러 개의 권한이 묶여서 정의되어 있음
GRANT CONNECT , RESOURCE TO c##java;

-- 공통 사용자 또는 롤 이름이 부적합합니다.
ALTER SESSION SET "_ORACLE_SCRIPT"=TRUE;
CREATE USER test2 IDENTIFIED BY 12345;

--사용자 정보 조회
SELECT * FROM ALL_USERS
WHERE USERNAME = 'C##test1';

-- 비밀번호 변경 
ALTER USER C##TEST1 IDENTIFIED BY 54321;

-- 사용자 제거
DROP USER c##test1;

-- 'C##TEST1'(을)를 삭제하려면 CASCADE를 지정하여야 합니다 
-- 사용자 스키마에 객체가 존재한다면 CASCADE 옵션 사용해서 제거
DROP USER c##test1 CASCADE;













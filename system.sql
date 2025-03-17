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

--단축키 

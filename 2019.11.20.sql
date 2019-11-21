--1. DESC  테이블 명
--2. SELECT user_tab_columns;

--prod 테이블의 컬럼조회

DESC prod;

VARCHAR2, CHAR --> ,문자열(Character)
NUMBER --> 숫자
CLOB --> Character Large OBject, 문자열 타입의 길이 제한을 피하는 타입
    -- VARCHAR2(4000),CLOB : 4GB
DATE --> 날짜(일시 = 년, 월, 일 + 시간, 분, 초)

--date 타입에 대한 연산의 결과는?
'2019/11/20 09:16:20' + 1 =?

--prod

SELECT * FROM users;

SELECT userid, usernm, reg_dt FROM users;
--연산을 통해 새로운 컬럼을 생성 (reg_dt에 숫자 연산을 한 새로운 가공 컬럼)
--별칭 : 기존 컬럼명이나 연산을 통해 생성된 가상 컬럼에 임의의 컬럼이름을 부여
-- col | express [AS] 별칭명
SELECT userid, usernm, reg_dt reg_date, reg_dt+5 AS paekone FROM users;

SELECT userid, usernm, reg_dt FROM users;

DESC users;

--숫자 상수, 문자열 상수
--table에 없는 값을 임의로 컬럼으로 생성
--숫자에 대한 연산
--문자에 대한 연산
SELECT (10-2)*2,'DB SQL 수업', userid || '_modified', usernm, reg_dt 
    /*userid+ '_modified', 문자열 연산은 더하기 연산이 없다 */
    usernm || '_modified', reg_dt
FROM users
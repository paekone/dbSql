row_1 : emp 테이블에서 정렬없이 조회하고, ROWNUM이 1~10인 행만 조회
SELECT ROWNUM, empno, ename FROM emp WHERE ROWNUM BETWEEN 1 AND 10; 

row_2 : emp 테이블에서 정렬없이 조회하고, ROWNUM이 11~14인 행만 조회
SELECT ROWNUM,  A.* FROM (SELECT ROWNUM rn, empno, ename FROM emp) A WHERE rn BETWEEN 11 AND 14; 

--row_3 : emp 테이블에서 ename컬럼 기준으로 오름차순 정렬 했을때 11~14번째 행의 데이터만 조회하는 sql을 작성하세요.
SELECT ROWNUM, a.* FROM (SELECT empno, ename FROM emp ORDER BY ename) a;

--DUAL 테이블 : sys 계정에 있는 누구나 사용가능한 테이블이며 한행만 존재하며 컬럼도 하나 존재

SELECT * FROM dual;
--SINGLE ROW FUNCTION : 행당 한번의 FUNCTION이 실행
--1개의 행 INPUT -> 1개의 행으로 OUTPUT(COLUNM)
--dual 테이블에는 데이터가 하나의 행만 존재한다. 결과도 하나의 행으로 나온다.
SELECT LOWER('Hello, World') low, UPPER('Hello, World') upper, INITCAP('Hello, World')
FROM dual;

--emp테이블에는 총 14건의 데이터(직원)가 존재(14개의 행)
--아래쿼리는 결과도 14개의 행
SELECT emp.*, LOWER('Hello, World') low, UPPER('Hello, World') upper, INITCAP('Hello, World')
FROM emp;

SELECT empno, LOWER(ename) low_enm
FROM emp WHERE ename = UPPER('SMITH'); --직원 이름이 smith인 사람을 조회 하려면 대문자/소문자? 

--테이블 컬럼을 가공해도 동일한 결과를 얻을 수 있지만
--테이블 컬럼 보다는 상수쪽을 가공하는 것이 속도면에서 유리
--해당 컬럼에 인덱스가 존재하더라도 함수를 적용하게되면 값이 달라지게 되어 
--인덱스를 활용 할 수 없게된다.
SELECT empno, LOWER(ename) low_enm
FROM emp WHERE lower(ename) = 'smith'; --직원 이름이 smith인 사람을 조회 하려면 대문자/소문자? 

--HELLO
--,
--WORLD
--HELLO, WORLD(위 세가지 문자열 상수를 이용, CONCAT 함수를 사용하여 문자열 결합)

SELECT CONCAT('HELLO', CONCAT(',', 'WORLD')) c1,
    'HELLO' || ',' || 'WORLD' c2,
    --시작인덱스는 1부터, 종료인덱스 문자열까지 포함한다.
    SUBSTR('HELLO, WORLD', 1, 5) s1,--SUBSTR
    --INSTR : 문자열에 특정 문자열이 존재하는지, 존재할 경우 문자의 인덱스를 리턴
    INSTR('HELLO, WORLD', 'O') i1,
    --'HELLO, WORLD' 문자열의 6번째 인덱스 이후에 등장하는 'O'문자열의 인덱스 리턴
    INSTR('HELLO, WORLD', 'O', 6) i2, --문자열의 특정 인덱스 이후부터 검색하도록 옵션
    INSTR('HELLO, WORLD', 'O', INSTR('HELLO, WORLD', 'O')+1) i3,
    LPAD('HELLO, WORLD', 15, '*') L1,
    LPAD('HELLO, WORLD', 15) L2, --DEFAULT는 공백
    RPAD('HELLO, WORLD', 15, '*') R1,
    
    --REPLACE(대상문자열, 검색문자열, 변경할 문자열)
    --대상문자열에서 검색 문자열을 변경할 문자열로 치환
    REPLACE('HELLO, WORLD', 'HELLO', 'hello') rep1,
    
    -- 문자열, 앞, 뒤의 공백을 제거
    '   HELLO, WORLD  ' before_trim,
    TRIM('  HELLO, WORLD   ') after_trim,
    TRIM('H' FROM 'HELLO, WORLD') after_trim2
    FROM dual;
    
    --L/RPAD 특정 문자열의 왼쪽/오른쪽에 설정한 문자열 길이보다 부족한 만큼 문자열을 채워 넣는다

    --숫자 조작함수
    --ROUND : 반올림 - ROUND(숫자, 반올림자리)
    --TRUNC : 절삭 - TRUNC(숫자, 절삭 자리)
    --MOD : 나머지 연산 MOD(피제수, 제수) // MOD(5, 2) : 1
    
    SELECT ROUND(105.54, 1) r1, -- 반올림결과가 소수점 한자리까지 나오도로(소수점 둘째자리에서 반올림)
            ROUND(105.55, 1) r2,
            ROUND(105.55, 0) r3,
            ROUND(105.55, -1) r4
    FROM dual;
    
    SELECT TRUNC(105.54, 1) t1, -- 반올림결과가 소수점 한자리까지 나오도록(소수점 둘째자리에서 절삭)
            TRUNC(105.55, 2) t2, 
            TRUNC(105.55, 0) t3, --
            TRUNC(105.55, -1) t4
    FROM dual;-
     --MOD(피제수, 제수) 피제수를 제수로 나눈 나머지 값
     --MOD(M, 2)의 결과 종류 : 0, 1(0~제수-1)
    SELECT MOD(5, 2)M1 --5/2 : 몫 2, [나머지가 1]
    FROM dual;
    
    --emp 테이블의 sal컬럼을 1000으로 나눴을때 사원별 나머지 값을 조회하는 sql 작성
    --DATE : 년원일, 시간, 분, 초
    SELECT ename, sal, MOD(sal, 1000), TRUNC(sal/1000, 0) FROM emp;
    SELECT ename,hiredate, TO_CHAR(hiredate, 'YYYY/MM/DD hh24-mi-ss') FROM emp;
    --SYSDATE : 서버의 현재 DATE를 리턴하는 내장함수, 특별한 인지가 없다
    --DATE 연산 DATE + 정수N = DATE에 N일자 만큼 더한다.
    --DATE 연산에 있어서 정수는 일자
    --하루는 24시간
    --DATE 타임에 시간을 더 할수도있다. 1시간 = 1/24
    SELECT TO_CHAR(SYSDATE+5, 'YYYY-MM-DD hh24:mi:ss') AFTER5_DAYS,
           TO_CHAR(SYSDATE+5/24, 'YYYY-MM-DD hh24:mi:ss') AFTER5_HOURS,
           TO_CHAR(SYSDATE + 5/24/60, 'YYYY-MM-DD hh24:mi:ss') AFTER5_MIN
    FROM dual;
    
    --2019년 12월 31일을 date형으로 표현
    SELECT TO_DATE('2019-12-31', 'YYYY-MM-DD') LAST_DAY,
           TO_DATE('2019-12-31', 'YYYYMMDD') -5 LAST_DAY_BEFORE5,
    FROM dual;
    SELECT TO_CHAR(SYSDATE, 'YYYY-MM-DD hh24:mi:ss') FROM dual;
     TO_CHAR(SYSDATE-3, 'YYYY-MM-DD hh24:mi:ss') 
    ----YYYY, MM, DD, D(요일을 숫자로 : 일요일1, 월요일2, 화요일 3....토요일 : 7)
    ----IW(주차1~53), HH, MI, SS
  
  SELECT TO_CHAR(SYSDATE, 'YYYY') YYYY,
           TO_CHAR(SYSDATE, 'MM') MM,
           TO_CHAR(SYSDATE, 'DD') DD,
           TO_CHAR(SYSDATE, 'D') D,
           TO_CHAR(SYSDATE, 'IW') IW
FROM dual;

--오늘 날짜를 다음과 같은 포맷으로 조회하는 쿼리를 작성하시오
SELECT TO_CHAR(SYSDATE, 'YYYY-MM-DD') DT_DASH,
       TO_CHAR(SYSDATE, 'YYYY-MM-DD hh24:mi:ss') DT_DASH_WITH_TIME,
       TO_CHAR(SYSDATE, 'DD-MM-YYYY') DT_DD_MM_YYYY
FROM dual;

--DATE 타입의 ROUND, TRUNC 적용
SELECT TO_CHAR(SYSDATE, 'YYYY-MM-DD hh24:mi:ss') now,
       TO_CHAR(TRUNC(SYSDATE, 'YYYY'), 'YYYY-MM-DD hh24:mi:ss') now_YYYY,
       TO_CHAR(TRUNC(SYSDATE, 'MM'), 'YYYY-MM-DD hh24:mi:ss') now_MM,
       TO_CHAR(TRUNC(SYSDATE, 'DD'), 'YYYY-MM-DD hh24:mi:ss') now_DD
FROM dual;
           
--날짜 조작 함수
--MONTH_BETWEEN(date1, date2) : date2와 date1 사이의 개월 수
--ADD_MONTH(date, 가감할 개월수) : date에서 특정 개월수를 더하거나 뺀 날짜
--NEXT_DAY(date, weekday(1~7)) : date이후 첫 번째 weekday 날짜 
--LAST_DAY(date) : date가 속한 월의 마지막 날짜

SELECT MONTH_BETWEEN(TO_DATE('2019-11-25', 'YYYY-MM-DD'),
                     TO_DATE('2019-03-25', 'YYYY-MM-DD')) FROM dual;
                
--ADD_MONTH(date, number(+,-))
SELECT ADD_MONTHS(TO_DATE('20191125', 'YYYYMMDD'), 5) NOW_AFTER5M,
       ADD_MONTHS(TO_DATE('20191125', 'YYYYMMDD'), -5) NOW_BEFORE5M,
       SYSDATE + 100
FROM dual;

SELECT NEXT_DAY(SYSDATE, 1) FROM dual --오늘 날짜(2019/11/25)일 이후에 등장하는 첫번째 토요일

--COALESCE(expr1, expr2, expr3.....)
--인자중에 첫번째로 등장하는 NULL이 아닌 exprN을 리턴
SELECT empno, ename, MGR, NVL(MGR, 9999) MGR_N,
       NVL2(MGR, MGR, 9999) MGR_1,
       COALESCE(MGR, NVL(MGR, 9999)) MGR_N_2 FROM emp;

SELECT userid, usernm,reg_dt, NVL(reg_dt, SYSDATE) N_REG_DT FROM users WHERE userid != 'brown';

--condition
--case
--emp.job 컬럼을 기준으로
--'SALESMAN'이면 sal * 1.05를 적용한 값 리턴
--'SALSENAM'이면 sal * 1.10를 적용한 값 리턴
--'PRESIDENT'이면 sal * 1.20를 적용한 값 리턴
--empno, ename, job, sal 요율 적용한 급여
--위 세가지 직군이 아닐경우 sal리턴
SELECT empno, ename, job, sal, 
    CASE 
        WHEN job = 'SALESMAN' THEN sal * 1.05
        WHEN job = 'MANAGER' THEN sal * 1.10
        WHEN job = 'PRESIDENT' THEN sal * 1.20
        ELSE sal
    END bonus,
    comm,
    CASE 
        WHEN comm IS NULL THEN -10
        ELSE comm
    END case_null
    FROM emp;
    
--DECODE
SELECT empno, ename, sal, job,
       DECODE(job, 'SALESMAN', sal*1.05, 'MANAGER', sal*1.10, 'PRESIDENT', sal*1.20, sal) bonus
FROM emp;
       

--날짜관련 함수
--ROUND, TRUNC
--(MONTHS_BETWEEN) ADD_MONTH, NEXT_DAY
--LAST_DAY : 해당 날짜가 속한 월의 마지막 일자(DATE)

SELECT SYSDATE, LAST_DAY(SYSDATE)FROM dual;

--파라미터로 YYYYMM형식의 문자열을 사용하여 해당 연월에 해당하는 일자 수를 구해보세요.
--YYYYMM=201912 -> 31
SELECT TO_CHAR(LAST_DAY(TO_DATE(201912, 'YYYYMM')), 'DD'),
       TO_CHAR(LAST_DAY(TO_DATE(201911, 'YYYYMM')), 'DD'),
       TO_CHAR(LAST_DAY(TO_DATE(201602, 'YYYYMM')), 'DD')
FROM dual;

SELECT TO_DATE(TO_CHAR(SYSDATE, 'YYYY/MM/DD'), 'YYYY/MM/DD') FROM dual;

SELECT TO_DATE(TO_CHAR(SYSDATE, 'YYYY-MM-DD HH24:MI:ss'), 'YYYY-MM-DD HH24:MI:ss') FROM dual;

실행계획보기
EXPLAIN PLAN FOR
SELECT * FROM emp WHERE TO_CHAR(empno) = 7369;


SELECT * FROM TABLE(dbms_xplan.display);

Plan hash value: 3956160932
 
--------------------------------------------------------------------------
| Id  | Operation         | Name | Rows  | Bytes | Cost (%CPU)| Time     |
--------------------------------------------------------------------------
|   0 | SELECT STATEMENT  |      |     1 |    38 |     3   (0)| 00:00:01 |
|*  1 |  TABLE ACCESS FULL| EMP  |     1 |    38 |     3   (0)| 00:00:01 |
--------------------------------------------------------------------------
 
Predicate Information (identified by operation id):
---------------------------------------------------
 
   1 - filter("EMPNO"=7369)
   
   
SELECT * emp FROM emp WHERE hiredate>= TO_DATE('1981/0601', 'YYYY/MM/DD');

SELECT * FROM emp WHERE hiredate>= '1981/06/01';

SELECT TO_DATE('50/05/05', 'RR/MM/DD'),
       TO_DATE('49/05/05', 'RR/MM/DD'),
       TO_DATE('50/05/05', 'YY/MM/DD'),
       TO_DATE('49/05/05', 'YY/MM/DD')
FROM dual;

--날짜 포맷 : YYYY, MM, DD, H24, MI, SS
--숫자 포맷 : 숫자표현 : 9, 자리맞춤을 위한 0표시, 화폐단위 : L 
--           1000자리 구분 : , 소수점 : .

SELECT empno, ename, sal, TO_CHAR(sal, '009,999') fm_sal FROM emp;
SELECT TO_CHAR(1000000000000, '99,999,999,999,999,999') FROM dual;

-- NULL 처리 함수 : NVL, NVL2, NULLIF, COALESCE
-- NVL(expr1, expr2) : 함수 인자 두개
--expr1이 NULL이면 expr2를 반환
--expr1이 NULL이 아니면 expr1을 반환
SELECT empno, ename, comm, NVL(comm, -1) nvl_comm FROM emp;
--NVL2(expr1, expr2, expr3)
--expr이 is NOT NULL expr3리턴
--expr is NULL expr3리턴]

SELECT empno, ename, comm, NVL2(comm, 1000, -500) nvl_comm FROM emp;
--NULLIF(expr1, expr2)
--expr1 = expr2 NULL을 리턴
--expr1 != expr1 expr1을 리턴

SELECT empno, ename, comm, NULLIF(comm, comm+500) null_if FROM emp;

--COALESCE(expr1, expr2, expr3.....)
--인자중에 첫번째로 등장하는 NULL이 아닌 exprN을 리턴
--expr1 IS NOT NULL expr1을 리턴하고
--expr1 IS NOT 
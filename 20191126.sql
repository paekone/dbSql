--��¥���� �Լ�
--ROUND, TRUNC
--(MONTHS_BETWEEN) ADD_MONTH, NEXT_DAY
--LAST_DAY : �ش� ��¥�� ���� ���� ������ ����(DATE)

SELECT SYSDATE, LAST_DAY(SYSDATE)FROM dual;

--�Ķ���ͷ� YYYYMM������ ���ڿ��� ����Ͽ� �ش� ������ �ش��ϴ� ���� ���� ���غ�����.
--YYYYMM=201912 -> 31
SELECT TO_CHAR(LAST_DAY(TO_DATE(201912, 'YYYYMM')), 'DD'),
       TO_CHAR(LAST_DAY(TO_DATE(201911, 'YYYYMM')), 'DD'),
       TO_CHAR(LAST_DAY(TO_DATE(201602, 'YYYYMM')), 'DD')
FROM dual;

SELECT TO_DATE(TO_CHAR(SYSDATE, 'YYYY/MM/DD'), 'YYYY/MM/DD') FROM dual;

SELECT TO_DATE(TO_CHAR(SYSDATE, 'YYYY-MM-DD HH24:MI:ss'), 'YYYY-MM-DD HH24:MI:ss') FROM dual;

�����ȹ����
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

--��¥ ���� : YYYY, MM, DD, H24, MI, SS
--���� ���� : ����ǥ�� : 9, �ڸ������� ���� 0ǥ��, ȭ����� : L 
--           1000�ڸ� ���� : , �Ҽ��� : .

SELECT empno, ename, sal, TO_CHAR(sal, '009,999') fm_sal FROM emp;
SELECT TO_CHAR(1000000000000, '99,999,999,999,999,999') FROM dual;

-- NULL ó�� �Լ� : NVL, NVL2, NULLIF, COALESCE
-- NVL(expr1, expr2) : �Լ� ���� �ΰ�
--expr1�� NULL�̸� expr2�� ��ȯ
--expr1�� NULL�� �ƴϸ� expr1�� ��ȯ
SELECT empno, ename, comm, NVL(comm, -1) nvl_comm FROM emp;
--NVL2(expr1, expr2, expr3)
--expr�� is NOT NULL expr3����
--expr is NULL expr3����]

SELECT empno, ename, comm, NVL2(comm, 1000, -500) nvl_comm FROM emp;
--NULLIF(expr1, expr2)
--expr1 = expr2 NULL�� ����
--expr1 != expr1 expr1�� ����

SELECT empno, ename, comm, NULLIF(comm, comm+500) null_if FROM emp;

--COALESCE(expr1, expr2, expr3.....)
--�����߿� ù��°�� �����ϴ� NULL�� �ƴ� exprN�� ����
--expr1 IS NOT NULL expr1�� �����ϰ�
--expr1 IS NOT 
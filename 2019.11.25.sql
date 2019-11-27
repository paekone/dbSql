row_1 : emp ���̺��� ���ľ��� ��ȸ�ϰ�, ROWNUM�� 1~10�� �ุ ��ȸ
SELECT ROWNUM, empno, ename FROM emp WHERE ROWNUM BETWEEN 1 AND 10; 

row_2 : emp ���̺��� ���ľ��� ��ȸ�ϰ�, ROWNUM�� 11~14�� �ุ ��ȸ
SELECT ROWNUM,  A.* FROM (SELECT ROWNUM rn, empno, ename FROM emp) A WHERE rn BETWEEN 11 AND 14; 

--row_3 : emp ���̺��� ename�÷� �������� �������� ���� ������ 11~14��° ���� �����͸� ��ȸ�ϴ� sql�� �ۼ��ϼ���.
SELECT ROWNUM, a.* FROM (SELECT empno, ename FROM emp ORDER BY ename) a;

--DUAL ���̺� : sys ������ �ִ� ������ ��밡���� ���̺��̸� ���ุ �����ϸ� �÷��� �ϳ� ����

SELECT * FROM dual;
--SINGLE ROW FUNCTION : ��� �ѹ��� FUNCTION�� ����
--1���� �� INPUT -> 1���� ������ OUTPUT(COLUNM)
--dual ���̺��� �����Ͱ� �ϳ��� �ุ �����Ѵ�. ����� �ϳ��� ������ ���´�.
SELECT LOWER('Hello, World') low, UPPER('Hello, World') upper, INITCAP('Hello, World')
FROM dual;

--emp���̺��� �� 14���� ������(����)�� ����(14���� ��)
--�Ʒ������� ����� 14���� ��
SELECT emp.*, LOWER('Hello, World') low, UPPER('Hello, World') upper, INITCAP('Hello, World')
FROM emp;

SELECT empno, LOWER(ename) low_enm
FROM emp WHERE ename = UPPER('SMITH'); --���� �̸��� smith�� ����� ��ȸ �Ϸ��� �빮��/�ҹ���? 

--���̺� �÷��� �����ص� ������ ����� ���� �� ������
--���̺� �÷� ���ٴ� ������� �����ϴ� ���� �ӵ��鿡�� ����
--�ش� �÷��� �ε����� �����ϴ��� �Լ��� �����ϰԵǸ� ���� �޶����� �Ǿ� 
--�ε����� Ȱ�� �� �� ���Եȴ�.
SELECT empno, LOWER(ename) low_enm
FROM emp WHERE lower(ename) = 'smith'; --���� �̸��� smith�� ����� ��ȸ �Ϸ��� �빮��/�ҹ���? 

--HELLO
--,
--WORLD
--HELLO, WORLD(�� ������ ���ڿ� ����� �̿�, CONCAT �Լ��� ����Ͽ� ���ڿ� ����)

SELECT CONCAT('HELLO', CONCAT(',', 'WORLD')) c1,
    'HELLO' || ',' || 'WORLD' c2,
    --�����ε����� 1����, �����ε��� ���ڿ����� �����Ѵ�.
    SUBSTR('HELLO, WORLD', 1, 5) s1,--SUBSTR
    --INSTR : ���ڿ��� Ư�� ���ڿ��� �����ϴ���, ������ ��� ������ �ε����� ����
    INSTR('HELLO, WORLD', 'O') i1,
    --'HELLO, WORLD' ���ڿ��� 6��° �ε��� ���Ŀ� �����ϴ� 'O'���ڿ��� �ε��� ����
    INSTR('HELLO, WORLD', 'O', 6) i2, --���ڿ��� Ư�� �ε��� ���ĺ��� �˻��ϵ��� �ɼ�
    INSTR('HELLO, WORLD', 'O', INSTR('HELLO, WORLD', 'O')+1) i3,
    LPAD('HELLO, WORLD', 15, '*') L1,
    LPAD('HELLO, WORLD', 15) L2, --DEFAULT�� ����
    RPAD('HELLO, WORLD', 15, '*') R1,
    
    --REPLACE(����ڿ�, �˻����ڿ�, ������ ���ڿ�)
    --����ڿ����� �˻� ���ڿ��� ������ ���ڿ��� ġȯ
    REPLACE('HELLO, WORLD', 'HELLO', 'hello') rep1,
    
    -- ���ڿ�, ��, ���� ������ ����
    '   HELLO, WORLD  ' before_trim,
    TRIM('  HELLO, WORLD   ') after_trim,
    TRIM('H' FROM 'HELLO, WORLD') after_trim2
    FROM dual;
    
    --L/RPAD Ư�� ���ڿ��� ����/�����ʿ� ������ ���ڿ� ���̺��� ������ ��ŭ ���ڿ��� ä�� �ִ´�

    --���� �����Լ�
    --ROUND : �ݿø� - ROUND(����, �ݿø��ڸ�)
    --TRUNC : ���� - TRUNC(����, ���� �ڸ�)
    --MOD : ������ ���� MOD(������, ����) // MOD(5, 2) : 1
    
    SELECT ROUND(105.54, 1) r1, -- �ݿø������ �Ҽ��� ���ڸ����� ��������(�Ҽ��� ��°�ڸ����� �ݿø�)
            ROUND(105.55, 1) r2,
            ROUND(105.55, 0) r3,
            ROUND(105.55, -1) r4
    FROM dual;
    
    SELECT TRUNC(105.54, 1) t1, -- �ݿø������ �Ҽ��� ���ڸ����� ��������(�Ҽ��� ��°�ڸ����� ����)
            TRUNC(105.55, 2) t2, 
            TRUNC(105.55, 0) t3, --
            TRUNC(105.55, -1) t4
    FROM dual;-
     --MOD(������, ����) �������� ������ ���� ������ ��
     --MOD(M, 2)�� ��� ���� : 0, 1(0~����-1)
    SELECT MOD(5, 2)M1 --5/2 : �� 2, [�������� 1]
    FROM dual;
    
    --emp ���̺��� sal�÷��� 1000���� �������� ����� ������ ���� ��ȸ�ϴ� sql �ۼ�
    --DATE : �����, �ð�, ��, ��
    SELECT ename, sal, MOD(sal, 1000), TRUNC(sal/1000, 0) FROM emp;
    SELECT ename,hiredate, TO_CHAR(hiredate, 'YYYY/MM/DD hh24-mi-ss') FROM emp;
    --SYSDATE : ������ ���� DATE�� �����ϴ� �����Լ�, Ư���� ������ ����
    --DATE ���� DATE + ����N = DATE�� N���� ��ŭ ���Ѵ�.
    --DATE ���꿡 �־ ������ ����
    --�Ϸ�� 24�ð�
    --DATE Ÿ�ӿ� �ð��� �� �Ҽ����ִ�. 1�ð� = 1/24
    SELECT TO_CHAR(SYSDATE+5, 'YYYY-MM-DD hh24:mi:ss') AFTER5_DAYS,
           TO_CHAR(SYSDATE+5/24, 'YYYY-MM-DD hh24:mi:ss') AFTER5_HOURS,
           TO_CHAR(SYSDATE + 5/24/60, 'YYYY-MM-DD hh24:mi:ss') AFTER5_MIN
    FROM dual;
    
    --2019�� 12�� 31���� date������ ǥ��
    SELECT TO_DATE('2019-12-31', 'YYYY-MM-DD') LAST_DAY,
           TO_DATE('2019-12-31', 'YYYYMMDD') -5 LAST_DAY_BEFORE5,
    FROM dual;
    SELECT TO_CHAR(SYSDATE, 'YYYY-MM-DD hh24:mi:ss') FROM dual;
     TO_CHAR(SYSDATE-3, 'YYYY-MM-DD hh24:mi:ss') 
    ----YYYY, MM, DD, D(������ ���ڷ� : �Ͽ���1, ������2, ȭ���� 3....����� : 7)
    ----IW(����1~53), HH, MI, SS
  
  SELECT TO_CHAR(SYSDATE, 'YYYY') YYYY,
           TO_CHAR(SYSDATE, 'MM') MM,
           TO_CHAR(SYSDATE, 'DD') DD,
           TO_CHAR(SYSDATE, 'D') D,
           TO_CHAR(SYSDATE, 'IW') IW
FROM dual;

--���� ��¥�� ������ ���� �������� ��ȸ�ϴ� ������ �ۼ��Ͻÿ�
SELECT TO_CHAR(SYSDATE, 'YYYY-MM-DD') DT_DASH,
       TO_CHAR(SYSDATE, 'YYYY-MM-DD hh24:mi:ss') DT_DASH_WITH_TIME,
       TO_CHAR(SYSDATE, 'DD-MM-YYYY') DT_DD_MM_YYYY
FROM dual;

--DATE Ÿ���� ROUND, TRUNC ����
SELECT TO_CHAR(SYSDATE, 'YYYY-MM-DD hh24:mi:ss') now,
       TO_CHAR(TRUNC(SYSDATE, 'YYYY'), 'YYYY-MM-DD hh24:mi:ss') now_YYYY,
       TO_CHAR(TRUNC(SYSDATE, 'MM'), 'YYYY-MM-DD hh24:mi:ss') now_MM,
       TO_CHAR(TRUNC(SYSDATE, 'DD'), 'YYYY-MM-DD hh24:mi:ss') now_DD
FROM dual;
           
--��¥ ���� �Լ�
--MONTH_BETWEEN(date1, date2) : date2�� date1 ������ ���� ��
--ADD_MONTH(date, ������ ������) : date���� Ư�� �������� ���ϰų� �� ��¥
--NEXT_DAY(date, weekday(1~7)) : date���� ù ��° weekday ��¥ 
--LAST_DAY(date) : date�� ���� ���� ������ ��¥

SELECT MONTH_BETWEEN(TO_DATE('2019-11-25', 'YYYY-MM-DD'),
                     TO_DATE('2019-03-25', 'YYYY-MM-DD')) FROM dual;
                
--ADD_MONTH(date, number(+,-))
SELECT ADD_MONTHS(TO_DATE('20191125', 'YYYYMMDD'), 5) NOW_AFTER5M,
       ADD_MONTHS(TO_DATE('20191125', 'YYYYMMDD'), -5) NOW_BEFORE5M,
       SYSDATE + 100
FROM dual;

SELECT NEXT_DAY(SYSDATE, 1) FROM dual --���� ��¥(2019/11/25)�� ���Ŀ� �����ϴ� ù��° �����

--COALESCE(expr1, expr2, expr3.....)
--�����߿� ù��°�� �����ϴ� NULL�� �ƴ� exprN�� ����
SELECT empno, ename, MGR, NVL(MGR, 9999) MGR_N,
       NVL2(MGR, MGR, 9999) MGR_1,
       COALESCE(MGR, NVL(MGR, 9999)) MGR_N_2 FROM emp;

SELECT userid, usernm,reg_dt, NVL(reg_dt, SYSDATE) N_REG_DT FROM users WHERE userid != 'brown';

--condition
--case
--emp.job �÷��� ��������
--'SALESMAN'�̸� sal * 1.05�� ������ �� ����
--'SALSENAM'�̸� sal * 1.10�� ������ �� ����
--'PRESIDENT'�̸� sal * 1.20�� ������ �� ����
--empno, ename, job, sal ���� ������ �޿�
--�� ������ ������ �ƴҰ�� sal����
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
       

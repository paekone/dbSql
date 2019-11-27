SELECT empno, ename, hiredate,
      CASE 
        WHEN MOD(TO_CHAR(hiredate,'YYYY'), 2) = MOD(TO_CHAR(TO_DATE(2020, 'YYYY'),'YYYY'), 2)
        THEN '�ǰ����� �����'
        ELSE '�ǰ����� ������'
     END contact_to_doctor
FROM emp;

SELECT userid, usernm, reg_dt,
    CASE 
        WHEN MOD(TO_CHAR(reg_dt, 'YYYY'), 2) = MOD(TO_CHAR(SYSDATE, 'YYYY'), 2)
        THEN '�ǰ����� �����'
        ELSE '�ǰ����� ������'
    END contact_to_doctor
FROM users;

--GROUP FUNTION
--Ư�� �÷��̳�, ǥ���� �������� �������� ���� ������ ����� ����
--COUNT-�Ǽ�, SUM-�հ�, AVG-���, MAX-�ִ밪, MIN -�ּҰ�
--��ü ������ ������� 
--���� ���� �޿�

--�μ���ȣ�� �׷��Լ� ����
SELECT  
    MAX(sal) m_sal, --���� ���� �޿� 
    MIN(sal) min_sal,--���� ���� �޿�
    AVG(sal) avg_sal,
    SUM(sal) sum_sal,
    COUNT(sal) count_sal,
    COUNT(mgr) count_mgr,
    COUNT(*) count_row
FROM emp;

--�μ���ȣ�� �׷��Լ� ����
SELECT  
    MAX(sal) m_sal, --���� ���� �޿� 
    MIN(sal) min_sal,--���� ���� �޿�
    AVG(sal) avg_sal,
    SUM(sal) sum_sal,
    COUNT(sal) count_sal,
    COUNT(mgr) count_mgr,
    COUNT(*) count_row
FROM emp
GROUP BY deptno;

SELECT ename,
    MAX(sal) m_sal, --���� ���� �޿� 
    MIN(sal) min_sal,--���� ���� �޿�
    AVG(sal) avg_sal,
    SUM(sal) sum_sal,
    COUNT(sal) count_sal,
    COUNT(mgr) count_mgr,
    COUNT(*) count_row
FROM emp
GROUP BY deptno, ename;

--�׷��Լ������� NULL �÷��� ��꿡�� ���ܵȴ�.
--EMP���̺��� comm�÷��� null�� �ƴ� �����ʹ� 4���� ����, 9���� NULL)
SELECT COUNT(comm), --NULL�� �ƴ� ���� ����
       SUM(comm),
       SUM(sal+NVL(comm, 0)) tot_sal_sum
FROM emp;

--WHERE ������ GROUP �Լ��� ǥ�� �� �� ����.
--�μ��� �ִ� �޿� ���ϱ�

SELECT deptno, MAX(sal) Max_sal
FROM emp 
GROUP BY deptno
HAVING MAX(sal)>=3000;

SELECT 
    MAX(sal) max_sal,
    MIN(sal) min_sal,
    AVG(sal) avg_sal,
    SUM(sal) sum_sal,
    COUNT(sal) count_sal,
    COUNT(mgr) count_mgr,
    COUNT(ROWNUM) count_all
FROM emp;

SELECT * FROM emp;

SELECT deptno,
     MAX(sal) max_sal,
     MIN(sal) min_sal,
     AVG(sal) avg_sal,
     SUM(sal) sum_sal,
     COUNT(sal) count_sal,
     COUNT(mgr) count_mgr,
     COUNT(ROWNUM) count_all
FROM emp GROUP BY deptno;

SELECT 
     MAX(sal) max_sal,
     MIN(sal) min_sal,
     AVG(sal) avg_sal,
     SUM(sal) sum_sal,
     COUNT(sal) count_sal,
     COUNT(mgr) count_mgr,
     COUNT(ROWNUM) count_all FROM emp;

SELECT TO_CHAR(hiredate, 'YYYYMM') hire_yyyymm,
       COUNT(*) cnt 
FROM emp GROUP BY TO_CHAR(hiredate, 'YYYYMM');

SELECT TO_CHAR(hiredate, 'YYYY') hire_yyyy,
       COUNT(*) cnt 
FROM emp GROUP BY TO_CHAR(hiredate, 'YYYY');

SELECT * FROM dept;

SELECT COUNT(*) FROM emp;

DESC dept;
SELECT COUNT(*), COUNT(deptno), COUNT(loc)
FROM dept;

SELECT
COUNT(COUNT(deptno)) cnt 
 FROM emp 
 GROUP BY deptno;
 
SELECT * FROM emp;

SELECT COUNT(DISTINCT deptno) FROM emp;

--JOIN
--1.���̺� ��������(�÷� �߰�)
--2.�߰��� �÷��� ���� update
--dname �÷��� emp ���̺� �߰�

DESC emp;
DESC dept;


--�÷��߰� (dname, VARCHAR2)

ALTER TABLE emp ADD (dname VARCHAR2(14));
DESC emp;

UPDATE emp SET dname = CASE 
                            WHEN deptno = 10 THEN 'ACCOUNTING'
                            WHEN deptno = 20 THEN 'RESEARCH'
                            WHEN deptno = 30 THEN 'SALES'
                        END;
--SALES --> MARKET SALES
--�� 6���� ������ ������ �ʿ��ϴ�
--���� �ߺ��� �ִ� ����(�� ������)
UPDATE emp SET dname = 'MARKET SALES' WHERE dname = 'SALES';

--emp ���̺�, dept ���̺� ����
SELECT ename, emp.deptno, dept.dname FROM emp, dept WHERE emp.deptno = dept.deptno;


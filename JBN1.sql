SELECT * FROM emp WHERE DEPTNO <> 10 AND HIREDATE > TO_DATE(19810601, 'yyyymmdd'); -- <>, !=
SELECT * FROM emp WHERE DEPTNO NOT IN(10) AND HIREDATE > TO_DATE(19810601, 'yyyymmdd');
SELECT * FROM emp WHERE DEPTNO IN(20, 30) AND HIREDATE > TO_DATE(19810601, 'yyyymmdd');
SELECT * FROM emp WHERE job = 'SALESMAN' OR HIREDATE > TO_DATE(19810601, 'yyyymmdd');
SELECT * FROM emp WHERE job = 'SALESMAN' OR EMPNO LIKE '78%';
SELECT * FROM emp WHERE job = 'SALESMAN' OR (EMPNO >= 7800 AND EMPNO <7900);

--������ �켱���� (AND > OR)

SELECT * 
FROM emp
WHERE ename = 'SMITH'
OR ename = 'ALLEN'
AND job = 'SALESMAN';

SELECT *
FROM emp
WHERE (ename = 'SMITH' OR ename  = 'ALLEN') AND job = 'SALESMAN';

SELECT * FROM emp WHERE (job = 'SALESMAN' OR empno LIKE '78%' )AND hiredate > TO_DATE(19810601 , 'yyyymmdd');

/*
SELECT col1, col2, ..........
FROM ���̺� ��
WHERE coll = '��'
ODER BY ���ı����÷�1 [ASC / DESC], ���ı����÷�2...[ASC / DESC]
*/

--���(emp) ���̺��� ������ ������ �����̸����� �������� ����
SELECT * FROM emp ORDER BY ename ASC;
--���(emp) ���̺��� ������ ������ �����̸����� �������� ����
SELECT * FROM emp ORDER BY ename DESC;
--���(emp) ���̺��� ������ ������ �μ���ȣ�� ��������(ASC) �����ϰ�
--�μ���ȣ�� ���� ���� sal �������� ����
SELECT * FROM emp ORDER BY deptno, sal DESC, ename;
--���� �÷��� ALIAS�� ǥ��
SELECT deptno, sal, ename nm FROM emp ORDER BY nm;

--dept ���̺��� ��� ������ �μ��̸����� �������� ���ķ� ��ȸ�ǵ��� ������ �ۼ��ϼ���.
SELECT * FROM dept ORDER BY dname;

--dept ���̺��� ��� ������ �μ���ġ�� �������� ���ķ� ��ȸ�ǵ��� ������ �ۼ��ϼ���.
SELECT * FROM dept ORDER BY loc DESC;

SELECT * FROM emp WHERE comm IS NOT NULL AND comm <> 0 ORDER BY comm desc, empno;

SELECT * FROM emp WHERE MGR IS NOT NULL ORDER BY job, empno desc;

SELECT * FROM emp WHERE deptno IN(10, 30) AND sal > 1500 ORDER BY ename desc; 

SELECT ROWNUM, empno, ename FROM emp;

SELECT ROWNUM, empno, ename FROM emp WHERE ROWNUM = 2; --ROWNUM = equl �񱳴� 1������

SELECT ROWNUM, empno, ename FROM emp WHERE ROWNUM <= 2; --<= (<) ROWNUM�� 1���� ���������� ��ȸ�ϴ� ���� ����

SELECT ROWNUM, empno, ename FROM emp WHERE ROWNUM BETWEEN 1 AND 20; -- 1���� �����ϴ� ��� ����

--SELECT ���� ORDER BY ������ �������
--SELECT -> ROWNUM -> ORDER BY
SELECT ROWNUM, empno, ename FROM emp ORDER BY ename;
--IN LINE VIEW�� ���� ���� ���� �����ϰ�, �ش� ����� ROWNUM�� ����
--SELECT���� * ǥ���ϰ�, �ٸ� �÷� | ǥ������ ���� ��� *�տ� ���̺���̳�, ���̺� ��Ī�� ����
SELECT empno, ename FROM emp ORDER BY ename;

SELECT ROWNUM, a.* FROM (SELECT empno, ename FROM emp ORDER BY ename) a;

SELECT e.* FROM emp e;

SELECT ROWNUM RN, empno, ename FROM emp WHERE ROWNUM BETWEEN 1 AND 10 ;

--row2

SELECT ROWNUM, empno, ename FROM (SELECT * FROM emp WHERE ROWNUM BETWEEN 1 AND 20) ORDER BY ROWNUM desc;

--row_3
--emp���̺��� ename���� ������ ����� 11��°��� 14��°�ุ ��ȸ�ϴ� ������
--�ۼ��غ�����.

SELECT * FROM (SELECT ROWNUM rn, empno, ename FROM (SELECT * FROM emp ORDER BY ename)) WHERE rn BETWEEN 11 AND 20 ORDER BY ename;


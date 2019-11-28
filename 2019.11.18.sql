EXPLAIN PLAN FOR

SELECT ename, emp.deptno, dept.dname FROM emp, dept WHERE emp.deptno = dept.deptno;

SELECT ename, deptno FROM emp;

SELECT deptno, dname FROM dept;

--natural join : ���� ���̺� ���� Ÿ��, �����̸��� �÷����� ���� ���� ���� ��� ����;
DESC emp;
DESC dept;

SELECT * FROM emp;

ALTER TABLE emp DROP COLUMN dname;

SELECT * FROM emp NATURAL JOIN dept;

SELECT * FROM emp JOIN dept USING(deptno);

--ORACLE SQL
SELECT * 
FROM emp, dept
WHERE emp.deptno = dept.deptno;

--ANSI JOIN with ON
--���� �ϰ��� �ϴ� ���̺��� �÷� �̸��� �ٸ���
--�����ڰ� ���� ������ ���� ������ ��

SELECT * FROM emp JOIN dept ON(emp.deptno = dept.deptno);

--oracle
SELECT * FROM emp, dept WHERE emp.deptno = dept.deptno;

--SELF JOIN : ���� ���̺� ����
--emp ���̺� ���� �Ҹ��� ���� : ������ ������ ���� ��ȸ
--������ ������ ������ ��ȸ
--�����̸�, �������̸�

--ANSI
SELECT e.ename, m.ename FROM emp e JOIN emp m ON(e.mgr = m.empno);

--ORACLE
SELECT e.ename, m.ename, t.ename, v.ename
FROM emp e, emp m, emp t, emp v
WHERE e.mgr = m.empno AND m.mgr = t.empno AND t.mgr = v.empno;

--ANSI
--���� �̸�, ������ ����� �̸�, ������ ������� ����� �̸�

SELECT e.ename, m.ename, t.ename, k.ename FROM emp e JOIN emp m ON(e.mgr = m.empno)
    JOIN emp t ON (m.mgr = t.empno)
       JOIN emp k ON (t.mgr = k.empno);

--������ �̸���, �ش� ������ ������ �̸��� ��ȸ�Ѵ�
--�� ������ ����� 7369~7698�� ������ ������� ��ȸ
SELECT e.ename, m.ename 
FROM emp e JOIN emp m ON(e.mgr = m.empno) 
WHERE e.empno > 7369 AND e.empno < 7698;

SELECT * FROM salgrade;

SELECT empno, ename, sal, m.grade  
FROM emp a 
JOIN salgrade m ON(a.sal BETWEEN m.LOSAL AND m.HISAL); 

SELECT empno, ename, deptno, dname 
FROM emp 
NATURAL JOIN dept WHERE deptno != 20 ORDER BY deptno;

SELECT e.empno, e.ename, d.deptno, d.dname 
FROM emp e
JOIN dept d ON(e.deptno=d.deptno) WHERE e.deptno !=20;

SELECT empno, ename, deptno, dname 
FROM emp 
NATURAL JOIN dept WHERE deptno != 20;

SELECT empno, ename, sal, deptno, dname
FROM emp 
NATURAL JOIN dept WHERE sal > 2500 ORDER BY deptno;

SELECT empno, ename, sal, deptno, dname
FROM emp 
NATURAL JOIN dept WHERE sal > 2500 AND empno > 7600 ORDER BY deptno;

SELECT empno, ename, sal, deptno, dname
FROM emp
NATURAL JOIN dept 
WHERE sal > 2500 
AND empno > 7600 
AND dname = 'RESEARCH' 
ORDER BY deptno;


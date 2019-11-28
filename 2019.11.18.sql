EXPLAIN PLAN FOR

SELECT ename, emp.deptno, dept.dname FROM emp, dept WHERE emp.deptno = dept.deptno;

SELECT ename, deptno FROM emp;

SELECT deptno, dname FROM dept;

--natural join : 조인 테이블간 같은 타입, 같은이름의 컬럼으로 같은 값을 갖을 경우 조인;
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
--조인 하고자 하는 테이블의 컬럼 이름이 다를때
--개발자가 조인 조건을 직접 제어할 때

SELECT * FROM emp JOIN dept ON(emp.deptno = dept.deptno);

--oracle
SELECT * FROM emp, dept WHERE emp.deptno = dept.deptno;

--SELF JOIN : 같은 테이블간 조인
--emp 테이블간 조인 할만한 사항 : 직원의 관리자 정보 조회
--직원의 관리자 정보를 조회
--직원이름, 관리자이름

--ANSI
SELECT e.ename, m.ename FROM emp e JOIN emp m ON(e.mgr = m.empno);

--ORACLE
SELECT e.ename, m.ename, t.ename, v.ename
FROM emp e, emp m, emp t, emp v
WHERE e.mgr = m.empno AND m.mgr = t.empno AND t.mgr = v.empno;

--ANSI
--직원 이름, 직원의 상급자 이름, 직원의 상급자의 상급자 이름

SELECT e.ename, m.ename, t.ename, k.ename FROM emp e JOIN emp m ON(e.mgr = m.empno)
    JOIN emp t ON (m.mgr = t.empno)
       JOIN emp k ON (t.mgr = k.empno);

--직원의 이름과, 해당 직원의 관리자 이름을 조회한다
--단 직원의 사번이 7369~7698인 직원을 대상으로 조회
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


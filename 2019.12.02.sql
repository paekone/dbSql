--OUTER join : 조인 연결에 실패 하더라도 기준이 되는 테이블의 데이터는 나오도록하는 join
--LEFT OUTER JOIN : 테이블1 LEFT OUTER JOIN 테이블2
--테이블 1과 테이블 2를 조인할 때 조인에 실패하더라도 테이블 1쪽의 데이터는 조회가 되도록한다.
--조인에 실패한 행에서 테이블2의 컬럼값은 존재하지 않으므로 NULL로 표시된다.
SELECT e.empno, e.ename, m.empno, m.ename  
FROM emp e LEFT OUTER JOIN emp m
        ON(e.mgr = m.empno);
        
SELECT e.empno, e.ename, m.empno, m.ename  
FROM emp e LEFT OUTER JOIN emp m
        ON(e.mgr = m.empno)
WHERE m.deptno = 10;
                
--ORACLE outer join syntax
--일반조인과 차이점은 컬럼명에 (+)표시
--(+)표시 : 데이터가 존재하지 않는데 나와야 하는 테이블의 컬럼

--ansi sql의 on절에 기술한 경우와 동일
SELECT e.empno, e.ename, m.empno, m.ename  
FROM emp e, emp m
WHERE e.mgr = m.empno(+)
AND m.deptno(+) = 10;

--emp 테이블에는 14명의 직원이 있고, 14명은 10, 20, 30부서중에 한 부서에 속한다
--하지만 dept 테이블에는 10, 20, 30, 40번 부서가 존재
--부서번호, 부서명, 해당부서에 속한 직원수가 나오도록 쿼리를 작성


SELECT d.deptno, d.dname, count(e.deptno)
FROM dept d LEFT OUTER JOIN emp e
ON(d.deptno = e.deptno) GROUP BY d.deptno, d.dname;

--dept : deptno, dname
--inline : deptno, cnt(직원의 수)
SELECT * FROM dept,
(SELECT deptno, COUNT(*) cnt FROM emp GROUP BY deptno) emp_cnt
WHERE dept.deptno = emp_cnt.deptno;

SELECT * FROM emp;

SELECT e.empno, e.ename, m.empno, m.ename  
FROM emp e RIGHT OUTER JOIN emp m
        ON(e.mgr = m.empno);

SELECT e.empno, e.ename, m.empno, m.ename  
FROM emp e FULL OUTER JOIN emp m
        ON(e.mgr = m.empno);
        
SELECT a.buy_date, a.buy_prod, p.prod_id, p.prod_name, a.buy_qty  FROM (SELECT * FROM buyprod b 
WHERE buy_date = TO_DATE(20050125, 'YYYY/MM/DD')) a
RIGHT OUTER JOIN prod p ON(a.buy_prod=p.prod_id);

SELECT NVL(a.buy_date, TO_DATE(20050125,'YYMMDD')), a.buy_prod, p.prod_id, p.prod_name, a.buy_qty  FROM (SELECT * FROM buyprod b 
WHERE buy_date = TO_DATE(20050125, 'YYYY/MM/DD')) a
RIGHT OUTER JOIN prod p ON(a.buy_prod=p.prod_id);

SELECT NVL(a.buy_date, TO_DATE(20050125,'YYMMDD')), a.buy_prod, p.prod_id, p.prod_name, NVL(a.buy_qty, 0)  FROM (SELECT * FROM buyprod b 
WHERE buy_date = TO_DATE(20050125, 'YYYY/MM/DD')) a
RIGHT OUTER JOIN prod p ON(a.buy_prod=p.prod_id);

SELECT * FROM cycle;
SELECT * FROM product;

SELECT c.pid, p.pnm, DECODE(c.cid,2, 1, 1, 1, 3, 1), c.day, c.cnt  
FROM cycle c 
JOIN product p ON c.pid = p.pid
WHERE c.cid=1
;



SELECT * FROM prod;
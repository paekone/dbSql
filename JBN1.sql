SELECT * FROM emp WHERE DEPTNO <> 10 AND HIREDATE > TO_DATE(19810601, 'yyyymmdd'); -- <>, !=
SELECT * FROM emp WHERE DEPTNO NOT IN(10) AND HIREDATE > TO_DATE(19810601, 'yyyymmdd');
SELECT * FROM emp WHERE DEPTNO IN(20, 30) AND HIREDATE > TO_DATE(19810601, 'yyyymmdd');
SELECT * FROM emp WHERE job = 'SALESMAN' OR HIREDATE > TO_DATE(19810601, 'yyyymmdd');
SELECT * FROM emp WHERE job = 'SALESMAN' OR EMPNO LIKE '78%';
SELECT * FROM emp WHERE job = 'SALESMAN' OR (EMPNO >= 7800 AND EMPNO <7900);

--연산자 우선순위 (AND > OR)

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
FROM 테이블 명
WHERE coll = '값'
ODER BY 정렬기준컬럼1 [ASC / DESC], 정렬기준컬럼2...[ASC / DESC]
*/

--사원(emp) 테이블에서 직원의 정보를 직원이름으로 오름차순 정렬
SELECT * FROM emp ORDER BY ename ASC;
--사원(emp) 테이블에서 직원의 정보를 직원이름으로 내림차순 정렬
SELECT * FROM emp ORDER BY ename DESC;
--사원(emp) 테이블에서 직원의 정보를 부서번호로 오름차순(ASC) 정렬하고
--부서번호가 같을 때는 sal 내림차순 정렬
SELECT * FROM emp ORDER BY deptno, sal DESC, ename;
--정렬 컬럼을 ALIAS로 표현
SELECT deptno, sal, ename nm FROM emp ORDER BY nm;

--dept 테이블의 모든 정보를 부서이름으로 오름차순 정렬로 조회되도록 쿼리를 작성하세요.
SELECT * FROM dept ORDER BY dname;

--dept 테이블의 모든 정보를 부서위치로 내림차순 정렬로 조회되도록 쿼리를 작성하세요.
SELECT * FROM dept ORDER BY loc DESC;

SELECT * FROM emp WHERE comm IS NOT NULL AND comm <> 0 ORDER BY comm desc, empno;

SELECT * FROM emp WHERE MGR IS NOT NULL ORDER BY job, empno desc;

SELECT * FROM emp WHERE deptno IN(10, 30) AND sal > 1500 ORDER BY ename desc; 

SELECT ROWNUM, empno, ename FROM emp;

SELECT ROWNUM, empno, ename FROM emp WHERE ROWNUM = 2; --ROWNUM = equl 비교는 1만가능

SELECT ROWNUM, empno, ename FROM emp WHERE ROWNUM <= 2; --<= (<) ROWNUM을 1부터 순차적으로 조회하는 경우는 가능

SELECT ROWNUM, empno, ename FROM emp WHERE ROWNUM BETWEEN 1 AND 20; -- 1부터 시작하는 경우 가능

--SELECT 절과 ORDER BY 구문의 실행순서
--SELECT -> ROWNUM -> ORDER BY
SELECT ROWNUM, empno, ename FROM emp ORDER BY ename;
--IN LINE VIEW를 통해 정렬 먼저 실행하고, 해당 결과에 ROWNUM을 적용
--SELECT절에 * 표현하고, 다른 컬럼 | 표현식을 썼을 경우 *앞에 테이블명이나, 테이블 별칭을 적용
SELECT empno, ename FROM emp ORDER BY ename;

SELECT ROWNUM, a.* FROM (SELECT empno, ename FROM emp ORDER BY ename) a;

SELECT e.* FROM emp e;

SELECT ROWNUM RN, empno, ename FROM emp WHERE ROWNUM BETWEEN 1 AND 10 ;

--row2

SELECT ROWNUM, empno, ename FROM (SELECT * FROM emp WHERE ROWNUM BETWEEN 1 AND 20) ORDER BY ROWNUM desc;

--row_3
--emp테이블에서 ename으로 정렬한 결과에 11번째행과 14번째행만 조회하는 쿼리를
--작성해보세요.

SELECT * FROM (SELECT ROWNUM rn, empno, ename FROM (SELECT * FROM emp ORDER BY ename)) WHERE rn BETWEEN 11 AND 20 ORDER BY ename;


SELECT empno, ename, hiredate,
      CASE 
        WHEN MOD(TO_CHAR(hiredate,'YYYY'), 2) = MOD(TO_CHAR(TO_DATE(2020, 'YYYY'),'YYYY'), 2)
        THEN '건강검진 대상자'
        ELSE '건강검진 비대상자'
     END contact_to_doctor
FROM emp;

SELECT userid, usernm, reg_dt,
    CASE 
        WHEN MOD(TO_CHAR(reg_dt, 'YYYY'), 2) = MOD(TO_CHAR(SYSDATE, 'YYYY'), 2)
        THEN '건강검진 대상자'
        ELSE '건강검진 비대상자'
    END contact_to_doctor
FROM users;

--GROUP FUNTION
--특정 컬럼이나, 표현을 기준으로 여러행의 값을 한행의 결과로 생성
--COUNT-건수, SUM-합계, AVG-평균, MAX-최대값, MIN -최소값
--전체 직원을 대상으로 
--가장 높은 급여

--부서번호별 그룹함수 적용
SELECT  
    MAX(sal) m_sal, --가장 높은 급여 
    MIN(sal) min_sal,--가장 낮은 급여
    AVG(sal) avg_sal,
    SUM(sal) sum_sal,
    COUNT(sal) count_sal,
    COUNT(mgr) count_mgr,
    COUNT(*) count_row
FROM emp;

--부서번호별 그룹함수 적용
SELECT  
    MAX(sal) m_sal, --가장 높은 급여 
    MIN(sal) min_sal,--가장 낮은 급여
    AVG(sal) avg_sal,
    SUM(sal) sum_sal,
    COUNT(sal) count_sal,
    COUNT(mgr) count_mgr,
    COUNT(*) count_row
FROM emp
GROUP BY deptno;

SELECT ename,
    MAX(sal) m_sal, --가장 높은 급여 
    MIN(sal) min_sal,--가장 낮은 급여
    AVG(sal) avg_sal,
    SUM(sal) sum_sal,
    COUNT(sal) count_sal,
    COUNT(mgr) count_mgr,
    COUNT(*) count_row
FROM emp
GROUP BY deptno, ename;

--그룹함수에서는 NULL 컬럼은 계산에서 제외된다.
--EMP테이블에서 comm컬럼이 null이 아닌 데이터는 4건이 존재, 9건은 NULL)
SELECT COUNT(comm), --NULL이 아닌 값의 개수
       SUM(comm),
       SUM(sal+NVL(comm, 0)) tot_sal_sum
FROM emp;

--WHERE 절에는 GROUP 함수를 표현 할 수 없다.
--부서별 최대 급여 구하기

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
--1.테이블 구조변경(컬럼 추가)
--2.추가된 컬럼에 값을 update
--dname 컬럼을 emp 테이블에 추가

DESC emp;
DESC dept;


--컬럼추가 (dname, VARCHAR2)

ALTER TABLE emp ADD (dname VARCHAR2(14));
DESC emp;

UPDATE emp SET dname = CASE 
                            WHEN deptno = 10 THEN 'ACCOUNTING'
                            WHEN deptno = 20 THEN 'RESEARCH'
                            WHEN deptno = 30 THEN 'SALES'
                        END;
--SALES --> MARKET SALES
--총 6건의 데이터 변경이 필요하다
--값의 중복이 있는 형태(반 정규형)
UPDATE emp SET dname = 'MARKET SALES' WHERE dname = 'SALES';

--emp 테이블, dept 테이블 조인
SELECT ename, emp.deptno, dept.dname FROM emp, dept WHERE emp.deptno = dept.deptno;


SELECT * FROM member WHERE mem_name LIKE '½Å%';
SELECT * FROM member WHERE mem_name LIKE 'ÀÌ%';
SELECT * FROM emp WHERE mgr = '';
SELECT * FROM emp WHERE comm IS NOT NULL;
SELECT * FROM emp WHERE hiredate > TO_DATE(19810601,'YYYYMMDD') AND deptno!=10;

SELECT * FROM emp WHERE hiredate > TO_DATE(19810601,'YYYYMMDD') AND deptno NOT IN(10);
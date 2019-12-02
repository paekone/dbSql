--OUTER join : ���� ���ῡ ���� �ϴ��� ������ �Ǵ� ���̺��� �����ʹ� ���������ϴ� join
--LEFT OUTER JOIN : ���̺�1 LEFT OUTER JOIN ���̺�2
--���̺� 1�� ���̺� 2�� ������ �� ���ο� �����ϴ��� ���̺� 1���� �����ʹ� ��ȸ�� �ǵ����Ѵ�.
--���ο� ������ �࿡�� ���̺�2�� �÷����� �������� �����Ƿ� NULL�� ǥ�õȴ�.
SELECT e.empno, e.ename, m.empno, m.ename  
FROM emp e LEFT OUTER JOIN emp m
        ON(e.mgr = m.empno);
        
SELECT e.empno, e.ename, m.empno, m.ename  
FROM emp e LEFT OUTER JOIN emp m
        ON(e.mgr = m.empno)
WHERE m.deptno = 10;
                
--ORACLE outer join syntax
--�Ϲ����ΰ� �������� �÷��� (+)ǥ��
--(+)ǥ�� : �����Ͱ� �������� �ʴµ� ���;� �ϴ� ���̺��� �÷�

--ansi sql�� on���� ����� ���� ����
SELECT e.empno, e.ename, m.empno, m.ename  
FROM emp e, emp m
WHERE e.mgr = m.empno(+)
AND m.deptno(+) = 10;

--emp ���̺��� 14���� ������ �ְ�, 14���� 10, 20, 30�μ��߿� �� �μ��� ���Ѵ�
--������ dept ���̺��� 10, 20, 30, 40�� �μ��� ����
--�μ���ȣ, �μ���, �ش�μ��� ���� �������� �������� ������ �ۼ�


SELECT d.deptno, d.dname, count(e.deptno)
FROM dept d LEFT OUTER JOIN emp e
ON(d.deptno = e.deptno) GROUP BY d.deptno, d.dname;

--dept : deptno, dname
--inline : deptno, cnt(������ ��)
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
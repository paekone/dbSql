--1. DESC  ���̺� ��
--2. SELECT user_tab_columns;

--prod ���̺��� �÷���ȸ

DESC prod;

VARCHAR2, CHAR --> ,���ڿ�(Character)
NUMBER --> ����
CLOB --> Character Large OBject, ���ڿ� Ÿ���� ���� ������ ���ϴ� Ÿ��
    -- VARCHAR2(4000),CLOB : 4GB
DATE --> ��¥(�Ͻ� = ��, ��, �� + �ð�, ��, ��)

--date Ÿ�Կ� ���� ������ �����?
'2019/11/20 09:16:20' + 1 =?

--prod

SELECT * FROM users;

SELECT userid, usernm, reg_dt FROM users;
--������ ���� ���ο� �÷��� ���� (reg_dt�� ���� ������ �� ���ο� ���� �÷�)
--��Ī : ���� �÷����̳� ������ ���� ������ ���� �÷��� ������ �÷��̸��� �ο�
-- col | express [AS] ��Ī��
SELECT userid, usernm, reg_dt reg_date, reg_dt+5 AS paekone FROM users;

SELECT userid, usernm, reg_dt FROM users;

DESC users;

--���� ���, ���ڿ� ���
--table�� ���� ���� ���Ƿ� �÷����� ����
--���ڿ� ���� ����
--���ڿ� ���� ����
SELECT (10-2)*2,'DB SQL ����', userid || '_modified', usernm, reg_dt 
    /*userid+ '_modified', ���ڿ� ������ ���ϱ� ������ ���� */
    usernm || '_modified', reg_dt
FROM users
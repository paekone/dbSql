--table space 생성
SELECT *
FROM DBA_DATA_FILES;

  CREATE TABLESPACE TS_DBSQL
   DATAFILE 'E:\B_UTIL\4.ORACLE\APP\ORACLE\ORADATA\XE\DBSQL.DBF'
   SIZE 100M 
   AUTOEXTEND ON;


--사용자 추가
create user JBN identified by java
default tablespace TS_DBSQL
temporary tablespace temp
quota unlimited on TS_DBSQL
quota 0m on system;


--접속, 생성권한
GRANT CONNECT, RESOURCE TO JBN;

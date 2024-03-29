[MYSQL - DATABASE LIST - 000]
sql_desc='database 리스트를 가져온다.'
sql_param_cnt=0
0001=show databases

[MYSQL - DATABASE LIST - 001]
sql_desc='DB Connection Character Set를 가져온다.'
sql_param_cnt=0
0001=show variables like '%character_set_connection%'

[MYSQL - TABLE LIST - 002]
sql_desc='선택된Database의 Table 정보를 가져온다.'
sql_param_cnt=0
0001=show tables

[ORACLE - USER LIST - 003]
sql_desc='User 리스트를 가져온다.'
sql_param_cnt=0
0001=SELECT USERNAME FROM ALL_USERS ORDER BY USERNAME

[ORACLE - TABLE LIST - 004]
sql_desc='선택된 User의 Table 정보를 가져온다.'
sql_param_cnt=1
0001=SELECT TABLE_NAME FROM ALL_TABLES
0002= WHERE OWNER = :owner

[MYSQL - TABLE COLUMN LIST - 005]
sql_desc='Table Column List'
sql_param_cnt=2
0001=select column_name
0002=     , data_type
0003=  from information_schema.columns
0004= where table_schema = :table_schema
0005=   and table_name = :table_name
0006= order by ordinal_position

[ORACLE - TABLE COLUMN LIST - 006]
sql_desc='Table Column List'
sql_param_cnt=2
0001=SELECT COLUMN_NAME
0002=     , DATA_TYPE
0003=  FROM ALL_TAB_COLUMNS
0004= WHERE OWNER = :owner
0005=   AND TABLE_NAME = :table_name
0006= ORDER BY CASE WHEN DATA_TYPE IN ('NCLOB', 'CLOB', 'NBLOB', 'BLOB', 'LONG') THEN 99999 ELSE COLUMN_ID END, COLUMN_NAME

[MSSQL - DATABASE LIST - 007]
sql_desc='database 리스트를 가져온다.'
sql_param_cnt=0
0001=SELECT NAME FROM SYS.DATABASES

[MSSQL - TABLE LIST - 008]
sql_desc='Table List'
sql_param_cnt=0
0001=SELECT TABLE_NAME FROM INFORMATION_SCHEMA.TABLES

[MSSQL - TABLE COLUMN LIST - 009]
sql_desc='Table Column List'
sql_param_cnt=0
0001=SELECT COLUMN_NAME
0002=     , DATA_TYPE
0003=  FROM INFORMATION_SCHEMA.COLUMNS
0004= WHERE TABLE_NAME = :table_name

[ORACLE - NLS_DATE_FORMAT - 010]
sql_desc='Session NLS_DATE_FORMAT'
sql_param_cnt=0
0001=ALTER SESSION SET NLS_DATE_FORMAT='YYYY-MM-DD HH24:MI:SS'

[ORACLE - NLS_TIMESTAMP_FORMAT - 011]
sql_desc='Session NLS_TIMESTAMP_FORMAT'
sql_param_cnt=0
0001=ALTER SESSION SET NLS_TIMESTAMP_FORMAT='YYYY-MM-DD HH24:MI:SS.FFX'

[PG - DATABASE LIST - 012]
sql_desc='database 리스트를 가져온다.'
sql_param_cnt=0
0001=select datname from pg_database

[PG - DATABASE LIST - 013]
sql_desc='로그인 User의 Table 목록을 가져온다.'
sql_param_cnt=0
0001=select tablename from pg_tables
0002=where tableowner = :table_owner
0003=order by lower(tablename)

[PG - TABLE COLUMN LIST - 014]
sql_desc='Table Column List'
sql_param_cnt=2
0001=SELECT COLUMN_NAME
0002=     , DATA_TYPE
0003=  FROM INFORMATION_SCHEMA.COLUMNS
0004= WHERE TABLE_CATALOG = :table_catalog
0005=   AND TABLE_NAME = :table_name

[PG - TABLE COLUMN LIST - 015]
sql_desc='Autocommit off'
sql_param_cnt=0
0001=set AUTOCOMMIT off


--=================================================================================================

INSERT INTO ()
VALUES()


SELECT COLUMN_NAME
     , DATA_TYPE
  FROM ALL_TAB_COLUMNS
 WHERE OWNER = ''
   AND TABLE_NAME = ''


SELECT table_name
     , COLUMN_NAME
     , DATA_TYPE
     , TABLE_CATALOG
  FROM INFORMATION_SCHEMA.COLUMNS
 WHERE TABLE_CATALOG = :table_catalog
   AND concat(table_schema, '.', table_name) = :table_name



 SELECT *
  FROM INFORMATION_SCHEMA.COLUMNS
 WHERE TABLE_CATALOG = 'postgres'
   AND concat(table_schema, '.', table_name) = 'public.movies'
  order by ordinal_position

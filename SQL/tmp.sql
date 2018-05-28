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
0006= ORDER BY COLUMN_ID

--=================================================================================================

INSERT INTO ()
VALUES()


SELECT COLUMN_NAME
     , DATA_TYPE
  FROM ALL_TAB_COLUMNS
 WHERE OWNER = ''
   AND TABLE_NAME = ''

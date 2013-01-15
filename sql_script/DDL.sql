1.显示所有的字符集
show variables like 'character\_set\_%';
2.每次执行sql之前用这些语句修改字符集为gb2312
set character_set_client=gb2312;
set character_set_connection=gb2312;
set character_set_results=gb2312;
set character_set_database=gb2312;
set character_set_server=gb2312;

--USER
create table USER
(
	ID int PRIMARY KEY AUTO_INCREMENT,
	USER_NAME varchar(20),
	DISPLAY_NAME varchar(20),
	PASSWORD varchar(12)
)default charset=utf8;

--TOPIC
create table TOPIC
(
	ID int PRIMARY KEY AUTO_INCREMENT,
	title varchar(20),
	DESCRIPT varchar(50),
	CREATETIME date,
	LASTUPDATETIME date,
	USER_ID int,
	TOPIC_TYPE_ID int
)default charset=utf8;

--TOPIC_TYPE
create table TOPIC_TYPE
(
	ID int PRIMARY KEY AUTO_INCREMENT,
	NAME varchar(20),
	DESCRIPT varchar(20),
	CODE varchar(20),
	DISPLAY_ORDER int(2)
)default charset=utf8;

--TOPIC_PICTURE
drop table TOPIC_PICTURE;

CREATE TABLE TOPIC_PICTURE
(
    ID int PRIMARY KEY AUTO_INCREMENT,
    FILE_NAME VARCHAR(40),
    CONTENT MEDIUMBLOB,
    SIZE INT,
    WIDTH INT,
    HEIGHT INT,
    TOPIC_ID INT
)default charset=utf8;

--COMMENT
create table COMMENT
(
	ID int PRIMARY KEY AUTO_INCREMENT,
	CONTENT varchar(20),
	CREATETIME date,
	USER_ID int,
	TOPIC_ID int
)default charset=utf8;

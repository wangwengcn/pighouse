1.显示所有的字符集
show variables like 'character\_set\_%';
2.每次执行sql之前用这些语句修改字符集为gb2312
set character_set_client=gb2312;
set character_set_connection=gb2312;
set character_set_results=gb2312;

set character_set_database=gb2312;
set character_set_server=gb2312;
-- USER
drop table USER;

select * from USER;
delete from USER;

insert into USER(USER_NAME,DISPLAY_NAME,PASSWORD) values('wangwengcn@163.com','天亮说晚安','123456');

-- TOPIC_TYPE
drop table TOPIC_TYPE;
delete from TOPIC_TYPE;

insert into TOPIC_TYPE(NAME, DESCRIPT, CODE, DISPLAY_ORDER) values('美女','美女','belle','1');
insert into TOPIC_TYPE(NAME, DESCRIPT, CODE, DISPLAY_ORDER) values('美食','美食','cate','2');
insert into TOPIC_TYPE(NAME, DESCRIPT, CODE, DISPLAY_ORDER) values('搞笑','搞笑','joke','3');
insert into TOPIC_TYPE(NAME, DESCRIPT, CODE, DISPLAY_ORDER) values('旅游','旅游','travel','4');
insert into TOPIC_TYPE(NAME, DESCRIPT, CODE, DISPLAY_ORDER) values('汽车','汽车','car','5');
insert into TOPIC_TYPE(NAME, DESCRIPT, CODE, DISPLAY_ORDER) values('DOTA','DOTA','dota','6');

-- TOPIC
drop table TOPIC;

drop table TOPIC_PICTURE;


-- COMMENT
drop table COMMENT;

--회원가입 테이블
create table user_board ( 
    userName varchar2(10) not null,
	userId varchar2(20) primary key,
    password varchar2(30) not null,
    address varchar2 (100) not null,
    phoneNumber varchar2(13) not null,
    userEmail varchar2(50) not null,
    userBirth varchar2(12) not null,
    interest1 varchar2(50) not null,
    interest2 varchar2(50) not null,
    interest3 varchar2(50) not null,
    regDate date default sysdate,
    auth char(1) default 0 -- 0 user 1 teacher 2 admin
    );

select * from user_board;

update user_board set userInfo='vmfhfdjlkdsk' where userId='test1';

select userInfo from user_board;

update user_board set auth=2 where userId='admin';

alter table user_board add userInfo varchar2(300) default '프로필 정보란'; -- 추가
alter table user_board drop column userInfo;

ALTER TABLE user_board RENAME COLUMN auth TO user_level;

select * from user_board where user_level='2';

select writer_id from QANDA_BOARD where userId='1234';

SELECT * FROM    ALL_CONSTRAINTS
WHERE    TABLE_NAME = 'QANDA_BOARD';

select qb.bno, qb.title, qb.writer_id, qb.userId, ub.userId
from QANDA_BOARD qb, user_board ub
where qb.userId = ub.userId

select * from USER_BOARD where to_char(regDate,'yyyy-mm-dd') > '2021-01-01' order by regDate DESC;

select count(userId) from USER_BOARD;


select auth from user_board;
select * from chatroom1;

---------------------------------------

select * from QANDA_BOARD; --fk userId 추가
create table QandA_board(
	bno number primary key,
	title varchar2(20) not null,
	writer_id varchar2(10) not null,
	regdate date default Sysdate,
	written number default 0,
	content varchar2(100) not null,
	replyer_id varchar2(10) ,
	reply varchar(100) default '아직 답변되지 않았습니다',
	replyDate date 
	);
drop table QandA_board;
CREATE SEQUENCE  seq_QandA_board;
insert into user_board values('탈퇴','OUT','OUT','1','1','1','1','1','1','1','2020.11.11','1');

select count(bno) from QANDA_BOARD;

--추가

alter table QANDA_BOARD add userId varchar2(20);

alter table QANDA_BOARD drop column userId;

alter table QANDA_BOARD 
add CONSTRAINT fk_userId foreign key(userId) references user_board(userId);

ALTER TABLE QANDA_BOARD MODIFY (replyDate DEFAULT sysdate);

insert into QANDA_BOARD values(1,'test','1234',sysdate,1,'1','1','1',sysdate,'1234');


---------------------------------------------

create table announce_board(
	bno number primary key,
	title varchar2(20) not null,
	regdate date default Sysdate,
	written number default 0,
	content varchar2(100) not null,
	replycnt number default 0
	);
	drop table announce_board;
CREATE SEQUENCE  seq_announce_board;

select seq_announce_board   FROM DUAL; 
insert into announce_board(bno,title,content)
 values(seq_announce_board.nextval,'dtd','ddtt') ;

 select * from announce_board;
 
 select rn ,bno, title ,regdate,replycnt,written 
 from( select rownum rn,bno,title,regdate,replycnt,written from announce_board where rownum<=1*10)
 where rn>(1-1)*10;
 
--------------------------------------------------
  
 
 create table chattingroom(
 	roomnumber number(1) primary key,
 	useable number(1) default 0
 )
 insert into chattingroom 
 values(3,1)

 create table chatroom1(
 	rno number default seq_chat.nextval,
 	fromid number(1),
 	content varchar2(100)
 )
 create table chatroom2(
 	rno number default seq_chat.nextval,
 	fromid number(1),
 	content varchar2(100),
 )
 create table chatroom3(
 	rno number default seq_chat.nextval,
 	fromid number(1),
 	content varchar2(100),
 )
CREATE SEQUENCE  seq_chat;
 
 
 select * from announce_reply
 create table announce_reply(
 	bno number references announce_board(bno),
 	rno number primary key,
 	replyer varchar2(20),
 	regdate date,
 	content varchar2(30)
 );
 
 CREATE SEQUENCE  seq_announce_reply;
 select seq_announce_reply.nextval from dual;

 
---------------------------------------------------------------
 
 
-- 파일 첨부 테이블 생성
create table fit_attach(
	uuid varchar2(100) not null,
	uploadPath varchar2(200) not null,
	fileName varchar2(100) not null,
	fileType char(1) not null,
	userId varchar2(20)
);

--pk
alter table fit_attach add constraint pk_attach primary key(uuid);

--fk
alter table fit_attach 
add constraint fk_fit_attach foreign key(userId) references user_board(userId);

select * from fit_attach;

select * from user_board;




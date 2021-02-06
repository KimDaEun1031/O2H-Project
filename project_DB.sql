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

select auth from user_board;

---------------------------------------

select * from QANDA_BOARD;
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




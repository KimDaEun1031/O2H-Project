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

drop table user_board;

update user_board set auth=2 where userId='admin';

select auth from user_board;

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
CREATE SEQUENCE  seq_announce_board;
insert into user_board values('탈퇴','OUT','OUT','1','1','1','1','1','1','1','2020.11.11','1');


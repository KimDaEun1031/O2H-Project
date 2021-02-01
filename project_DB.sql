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
    auth char(1) default 0
    );

select * from user_board;

drop table user_board;

insert into user_board values('김다은','test1','test123','1','1','1','1','1','1','1','2020.11.11','1');

delete from user_board where userId='test';

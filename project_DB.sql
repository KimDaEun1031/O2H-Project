--회원가입 테이블
create table register (
    userName varchar2(10) primary key,
	userId varchar2(20) not null,
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

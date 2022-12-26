use market_db;
drop table schedule;
drop table movie;
drop table dayRoom;
drop table Room;
drop table ticket;
drop table member;
drop table reviews;

CREATE TABLE movie(
	movieNo INT primary key, 
	movieName VARCHAR(20), 
	category INT, -- 장르
	runtime INT,  
	img VARCHAR(50), 
	info VARCHAR(500) 
);

CREATE TABLE MEMBER(
	id VARCHAR(20) PRIMARY KEY,  
	pw VARCHAR(20), 
	email VARCHAR(50),  
	tel VARCHAR(20), 
	birth DATE 
);

CREATE TABLE SCHEDULE( 
	schNo int PRIMARY KEY, -- 스케줄 번호
	movieName varchar(20),
    movieNo int,
	runDay date, 
	runtime int, 
	roomNo int, -- 번호
    CONSTRAINT FK_movieNo foreign key(movieNo) REFERENCES movie(movieNo)
);

CREATE TABLE ROOM( 
    roomNo int primary key 
);

create table DayRoom(
    roomNo int,
    schNo int,
    seatCnt int default 0,
    CONSTRAINT FK_roomNo foreign key(roomNo) REFERENCES room(roomNo)
);

CREATE TABLE TICKET(
	ticketNo int PRIMARY KEY, -- 티켓 번호
	movieName varchar(20), -- 영화 이름
	bookDate DATE, -- 상영하는 날짜
	schNo int, -- 스케줄 번호
	roomNo int, -- 상영관
	seatNo int, -- 내가 선택한 좌석 번호
	id VARCHAR(20) -- 회원아이디
);
create table reviews(
    num int(8) default 0,
    id varchar(20),
    content varchar(200),
    movieNo int(8),
    writedate Date
);

#예약테이블 생성
create table reservation
(
    rno     bigint auto_increment,
    id      varchar(30)        not null,
    resDate date            not null,
    resCnt int default 0 null,
    constraint reservation_basic_pk
        primary key (rno),
    constraint reservation_user_res_null_fk
        foreign key (id) references user_res (id)
);

#예약_행사 테블
create table res_culture
(
    rc_no    bigint auto_increment,
    rno      bigint            not null,
    cno      bigint            not null,
    resPrice int default 0     null,
    resDate  date              not null,
    regDate  date default now() null,
    constraint res_culture_pk
        primary key (rc_no),
    constraint res_culture_reservation_null_fk
        foreign key (rno) references reservation (rno)
    -- constraint res_culture_culture_basic_null_fk
    --     foreign key (cno) references culture_basic (cno)
);



INSERT INTO movie VALUES(10000, '딸기', 01, 120, '1.png', '달다');
INSERT INTO movie VALUES(10001, '귤', 01, 120, '2.png', '새콤하다');
INSERT INTO movie VALUES(10002, '블루베리', 01, 120, '3.png', '쫌쫌따리하다');
INSERT INTO movie VALUES(10003, '사슴', 02, 60, '4.png', '귀엽다');
INSERT INTO movie VALUES(10004, '당나귀', 02, 120, '5.png', '킬링타임');
INSERT INTO movie VALUES(10005, '양', 02, 120, '6.png', '귀엽다');
INSERT INTO movie VALUES(10006, '향수', 03, 120, '7.png', '향기롭다');
INSERT INTO movie VALUES(10007, '크리스마스', 03, 150, '8.png', '이쁘다');
INSERT INTO movie VALUES(10008, '가죽지갑', 03, 150, '9.png', '꿀잼');


insert into member values('test','1234','test@test.com','010-1234-1234','2002-05-12');


insert into schedule values(1, '딸기',10000,str_to_date('202301051150', '%Y%m%d%H%i%s'),120,1);
insert into schedule values(2, '딸기',10000,str_to_date('202301051350', '%Y%m%d%H%i%s'),120,1);
insert into schedule values(3, '딸기',10000,str_to_date('202301051350', '%Y%m%d%H%i%s'),120,1);
insert into schedule values(4, '딸기',10000,str_to_date('202310301350', '%Y%m%d%H%i%s'),120,1);
insert into schedule values(5, '딸기',10000,str_to_date('202310301350', '%Y%m%d%H%i%s'),120,1);

insert into schedule values(6, '귤',10002,str_to_date('202310301350', '%Y%m%d%H%i%s'),120,2);
insert into schedule values(7, '귤',10002,str_to_date('202310301350', '%Y%m%d%H%i%s'),120,2);
insert into schedule values(8, '귤',10002,str_to_date('202310301350', '%Y%m%d%H%i%s'),120,2);
insert into schedule values(9, '귤',10002,str_to_date('202310301350', '%Y%m%d%H%i%s'),120,2);

insert into schedule values(10, '블루베리',10001,str_to_date('202310301350', '%Y%m%d%H%i%s'),120,3);
insert into schedule values(11, '블루베리',10001,str_to_date('202310301350', '%Y%m%d%H%i%s'),120,3);
insert into schedule values(12, '블루베리',10001,str_to_date('202310301350', '%Y%m%d%H%i%s'),120,3);
insert into schedule values(13, '블루베리',10001,str_to_date('202310301350', '%Y%m%d%H%i%s'),120,3);
insert into schedule values(14, '블루베리',10001,str_to_date('202310301350', '%Y%m%d%H%i%s'),120,3);

insert into schedule values(15, '사슴',10003,str_to_date('202310301350', '%Y%m%d%H%i%s'),130,4);
insert into schedule values(16, '사슴',10003,str_to_date('202310301350', '%Y%m%d%H%i%s'),130,4);
insert into schedule values(17, '사슴',10003,str_to_date('202310301350', '%Y%m%d%H%i%s'),130,4);
insert into schedule values(18, '사슴',10003,str_to_date('202310301350', '%Y%m%d%H%i%s'),130,4);
insert into schedule values(19, '사슴',10003,str_to_date('202310301350', '%Y%m%d%H%i%s'),130,4);

insert into schedule values(20, '당나귀',10004,str_to_date('202310301350', '%Y%m%d%H%i%s'),140,5);
insert into schedule values(21, '당나귀',10004,str_to_date('202310301350', '%Y%m%d%H%i%s'),140,5);
insert into schedule values(22, '당나귀',10004,str_to_date('202310301350', '%Y%m%d%H%i%s'),140,5);
insert into schedule values(23, '당나귀',10004,str_to_date('202310301350', '%Y%m%d%H%i%s'),140,5);
insert into schedule values(24, '당나귀',10004,str_to_date('202310301350', '%Y%m%d%H%i%s'),140,5);

insert into schedule values(25, '양',10005,str_to_date('202310301350', '%Y%m%d%H%i%s'),155,6);
insert into schedule values(26, '양',10005,str_to_date('202310301350', '%Y%m%d%H%i%s'),155,6);
insert into schedule values(27, '양',10005,str_to_date('202310301350', '%Y%m%d%H%i%s'),155,6);
insert into schedule values(28, '양',10005,str_to_date('202310301350', '%Y%m%d%H%i%s'),155,6);
insert into schedule values(29, '양',10005,str_to_date('202310301350', '%Y%m%d%H%i%s'),155,6);

insert into schedule values(30, '향수',10006,str_to_date('202310301350', '%Y%m%d%H%i%s'),150,7);
insert into schedule values(31, '향수',10006,str_to_date('202310301350', '%Y%m%d%H%i%s'),150,7);
insert into schedule values(32, '향수',10006,str_to_date('202310301350', '%Y%m%d%H%i%s'),150,7);
insert into schedule values(33, '향수',10006,str_to_date('202310301350', '%Y%m%d%H%i%s'),150,7);
insert into schedule values(34, '향수',10006,str_to_date('202310301350', '%Y%m%d%H%i%s'),150,7);

insert into schedule values(35, '크리스마스',10007,str_to_date('202310301350', '%Y%m%d%H%i%s'),150,8);
insert into schedule values(36, '크리스마스',10007,str_to_date('202310301350', '%Y%m%d%H%i%s'),150,8);
insert into schedule values(37, '크리스마스',10007,str_to_date('202310301350', '%Y%m%d%H%i%s'),150,8);
insert into schedule values(38, '크리스마스',10007,str_to_date('202310301350', '%Y%m%d%H%i%s'),150,8);
insert into schedule values(39, '크리스마스',10007,str_to_date('202310301350', '%Y%m%d%H%i%s'),150,8);

insert into schedule values(40, '가죽지갑',10008,str_to_date('202310301350', '%Y%m%d%H%i%s'),150,9);
insert into schedule values(41, '가죽지갑',10008,str_to_date('202310301350', '%Y%m%d%H%i%s'),150,9);
insert into schedule values(42, '가죽지갑',10008,str_to_date('202310301350', '%Y%m%d%H%i%s'),150,9);
insert into schedule values(43, '가죽지갑',10008,str_to_date('202310301350', '%Y%m%d%H%i%s'),150,9);
insert into schedule values(44, '가죽지갑',10008,str_to_date('202310301350', '%Y%m%d%H%i%s'),150,9);

insert into room values(1);
insert into room values(2);
insert into room values(3);
insert into room values(4);
insert into room values(5);
insert into room values(6);
insert into room values(7);
insert into room values(8);
insert into room values(9);

insert into Dayroom values(1,1,0);
insert into Dayroom values(1,2,0);
insert into Dayroom values(1,3,0);
insert into Dayroom values(1,4,0);
insert into Dayroom values(1,5,0);

insert into Dayroom values(2,6,0);
insert into Dayroom values(2,7,0);
insert into Dayroom values(2,8,0);
insert into Dayroom values(2,9,0);

insert into Dayroom values(3,10,0);
insert into Dayroom values(3,11,0);
insert into Dayroom values(3,12,0);
insert into Dayroom values(3,13,0);
insert into Dayroom values(3,14,0);

insert into Dayroom values(4,15,0);
insert into Dayroom values(4,16,0);
insert into Dayroom values(4,17,0);
insert into Dayroom values(4,18,0);
insert into Dayroom values(4,19,0);

insert into Dayroom values(5,20,0);
insert into Dayroom values(5,21,0);
insert into Dayroom values(5,22,0);
insert into Dayroom values(5,23,0);
insert into Dayroom values(5,24,0);

insert into Dayroom values(6,25,0);
insert into Dayroom values(6,26,0);
insert into Dayroom values(6,27,0);
insert into Dayroom values(6,28,0);
insert into Dayroom values(6,29,0);

insert into Dayroom values(7,30,0);
insert into Dayroom values(7,31,0);
insert into Dayroom values(7,32,0);
insert into Dayroom values(7,33,0);
insert into Dayroom values(7,34,0);

insert into Dayroom values(8,35,0);
insert into Dayroom values(8,36,0);
insert into Dayroom values(8,37,0);
insert into Dayroom values(8,38,0);
insert into Dayroom values(8,39,0);

insert into Dayroom values(9,40,0);
insert into Dayroom values(9,41,0);
insert into Dayroom values(9,42,0);
insert into Dayroom values(9,43,0);
insert into Dayroom values(9,44,0);

commit;

SELECT
    *
FROM member;
SELECT 
    *
FROM dayroom;
SELECT * FROM movie;
select * from room;
select * from schedule;
select * from ticket;
select * from reviews;

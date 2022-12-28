use market_db;
drop table schedule;
drop table trip;
drop table dayRoom;
drop table Room;
drop table ticket;
DROP TABLE t_Board;
DROP TABLE t_member;
drop table member;
drop table reviews;


CREATE TABLE trip(
	tripNo INT primary key, 
	tripName VARCHAR(200), 
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

CREATE TABLE t_member(
    id VARCHAR(20) primary key,
    pwd VARCHAR(10),
    name VARCHAR(50),
    email VARCHAR(50),
    joinDate datetime DEFAULT now()
);

CREATE TABLE t_board (
    articleNO BIGINT primary key,
    parentNO BIGINT default 0,
    title VARCHAR(500) NOT NULL,
    content VARCHAR(4000),
    imageFileName VARCHAR(100),
    writeDate DATETIME default (current_date) NOT NULL,
    id VARCHAR(10),
    CONSTRAINT FK_ID FOREIGN KEY(id) REFERENCES t_member(id)
);

CREATE TABLE SCHEDULE( 
	schNo int PRIMARY KEY, -- 스케줄 번호
	tripName varchar(20),
    tripNo int,
	runDay date, 
	runtime int, 
	roomNo int, -- 번호
    CONSTRAINT FK_tripNo foreign key(tripNo) REFERENCES trip(tripNo)
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
	tripName varchar(20), -- 영화 이름
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
    tripNo int(8),
    writedate Date
);

INSERT INTO trip VALUES(10000, '딸기 잼 만들기 체험', 01, 120, '1.png', '쉽고 재미있게, 직접 딴 딸기로 맛있는 딸기 잼을 만들어 보세요!');
INSERT INTO trip VALUES(10001, '귤 청 만들기 체험', 01, 120, '2.png', '새콤하고 맛있는 귤을 직접 따는 체험과 함께 맛있는 청을 만들어 보세요!');
INSERT INTO trip VALUES(10002, '블루베리 따기 체험', 01, 120, '3.png', '새콤달콤하고 맛있는 블루베리를 직접 수확하며, 수확의 즐거움을 느껴보세요!');
INSERT INTO trip VALUES(10003, '사슴 먹이 주기 체험', 02, 60, '4.png', '넓은 자연 환경에서 자유롭게 자란 사슴 친구들에게 먹이를 줄 수 있어요!');
INSERT INTO trip VALUES(10004, '당나귀 타기 체험', 02, 120, '5.png', '당나귀를 타는 체험을 해 보세요! 말과는 다른 특별한 느낌을 경험해볼 수 있어요!');
INSERT INTO trip VALUES(10005, '양유 치즈 만들기 체험', 02, 120, '6.png', '양유를 채취해 끓이고 굳히는 과정을 통해 양유로 치즈를 만드는 체험을 해 보세요!');
INSERT INTO trip VALUES(10006, '향수 만들기 체험', 03, 120, '7.png', '나를 표현할 수 있는 특별한 나만의 향, 본인이 좋아하는 향을 조합하여 만들어 보세요!');
INSERT INTO trip VALUES(10007, '크리스마스 리스 만들기 체험', 03, 150, '8.png', '크리스마스 리스를 나만의 재료와 아이디어로 특별하게 만들어 보세요!');
INSERT INTO trip VALUES(10008, '가죽 지갑 만들기 체험', 03, 150, '9.png', '가죽을 직접 잘라 본인만의 아이디어, 디자인으로 특별한 가죽 지갑을 만들어 보세요!');

insert into member values('test','1234','test@test.com','010-1234-1234','2002-05-12');
insert into member values('hong','1234','test@test.com','010-1234-1234','2002-05-12');
insert into member values('Lee','1234','test@test.com','010-1234-1234','2002-05-12');

insert into t_member
values('hong', '1212', '홍길동', 'hong@gmail.com', sysdate());
insert into t_member
values('lee', '1212', '이순신', 'lee@gmail.com', sysdate());
insert into t_member
values('kim', '1212', '김유신', 'kimg@gmail.com', sysdate());

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

-- 회원 정보 추가
insert into t_board(articleNO, parentNO, title, content, imageFileName,  writeDate, id)
values(1, 0, '테스트글입니다', '테스트글입니다', null, sysdate(), 'hong');

insert into t_board(articleNO, parentNO, title, content, imageFileName,  writeDate, id)
values(2, 0, '안녕하세요', '상품 후기입니다.', null, sysdate(), 'hong');

insert into t_board(articleNO, parentNO, title, content, imageFileName,  writeDate, id)
values(3, 2, '답변입니다.', '상품 후기에 대한 답변입니다.', null, sysdate(), 'hong');

insert into t_board(articleNO, parentNO, title, content, imageFileName,  writeDate, id)
values(5, 3, '답변입니다.','상품 좋습니다.', null, sysdate(), 'lee');

insert into t_board(articleNO, parentNO, title, content, imageFileName,  writeDate, id)
values(4, 0, '김유신입니다.', '김유신 테스트글입니다.', null, sysdate(), 'kim');

insert into t_board(articleNO, parentNO, title, content, imageFileName,  writeDate, id)
values(6, 2, '상품 후기입니다..', '이순신씨의 상품 사용 후기를 올립니다!!', null, sysdate(), 'lee');

commit;

select * from t_board;
    

COMMIT;

with recursive cte as
	(
	    select articleNO, parentNO, title, content, imageFileName, writedate, id,
       cast(id as char(100)) lvl
	    from t_board
	    where parentNo=0
    /* select 문의 결합을 위한 union all */
		union all
		select a.articleNO, a.parentNO, a.title, a.content, a.imageFileName, a.writedate, a.id,
		concat(b.lvl, ',', a.articleno) lvl
		from t_board a
		inner join cte b on a.parentno = b.articleno 
	)
		select articleno, parentno, concat(repeat('&nbsp;&nbsp', parentNO), 'ㄴ', title) as title, parentno, id, writedate
		from cte
		order by articleNO desc;


SELECT * FROM t_member;

DELETE FROM t_board
WHERE articleNO in (
WITH RECURSIVE CTE_CONNECT_BY AS (
SELECT 1 AS LEVEL, S.* FROM t_board S WHERE parentNO=0
UNION ALL
SELECT LEVEL + 1 AS LEVEL, S.* FROM CTE_CONNECT_BY R INNER JOIN t_board S ON  r.articleNO=s.parentNO
)
SELECT articleNO FROM  CTE_CONNECT_BY
 );

WITH RECURSIVE CTE_CONNECT_BY AS (
SELECT 1 AS LEVEL, S.* FROM t_board S WHERE parentNO=0
UNION ALL
SELECT LEVEL + 1 AS LEVEL, S.* FROM CTE_CONNECT_BY R INNER JOIN t_board S ON  r.articleNO=s.parentNO
)
SELECT LEVEL,articleNO,parentNO,title,content,id,writeDate
from cte_connect_by
ORDER BY articleNO DESC;

WITH RECURSIVE CTE_CONNECT_BY AS (
SELECT 1 AS LEVEL, S.* FROM t_board S WHERE articleNO = ?
UNION ALL
SELECT LEVEL + 1 AS LEVEL, S.* FROM CTE_CONNECT_BY R INNER JOIN t_board S ON   r.articleNO = s.parentNO
)
SELECT articleNO FROM  CTE_CONNECT_BY 
;

SELECT
    *
FROM member;
SELECT 
    *
FROM dayroom;
SELECT * FROM trip;
select * from room;
select * from schedule;
select * from ticket;
select * from reviews;
select * from t_member;
select * from t_board;


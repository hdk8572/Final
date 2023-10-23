DROP TABLE "CHATMESSAGE";
DROP TABLE "CHATROOM";
CREATE TABLE "USERS"(
    "USERID" VARCHAR2(40)	NOT NULL,
    "MNAME"  VARCHAR2(30)   NOT NULL
);
COMMENT ON COLUMN "USERS"."USERID" IS '유저ID';
COMMENT ON COLUMN "USERS"."MNAME" IS '이름';
ALTER TABLE "USERS" ADD CONSTRAINT "PK_USERS" PRIMARY KEY (
	"USERID"
);
INSERT INTO USERS ( USERID, MNAME) VALUES ('sample@kh.co.kr','김사장');
INSERT INTO USERS ( USERID, MNAME) VALUES ('sample1@kh.co.kr','김사장1');
CREATE TABLE "CHATROOM"(
    "ROOMID" VARCHAR2(50) NOT NULL,
    "ROOMNAME"	VARCHAR2(50)	NOT NULL,
    "USERID"	VARCHAR2(40)	NOT NULL
);
COMMENT ON COLUMN "CHATROOM"."ROOMID" IS '채팅방번호';
COMMENT ON COLUMN "CHATROOM"."ROOMNAME" IS '채팅방이름';
COMMENT ON COLUMN "CHATROOM"."USERID" IS 'ID';

CREATE TABLE "CHATMESSAGE" (
	"ROOMID"	VARCHAR2(50)	NOT NULL,
	"USERID"	VARCHAR2(40)	NOT NULL,
	"MESSAGE"	VARCHAR2(300)	NOT NULL,
	"CDATE"	TIMESTAMP	DEFAULT SYSTIMESTAMP NOT NULL
);
COMMENT ON COLUMN "CHATMESSAGE"."USERID" IS 'ID';
COMMENT ON COLUMN "CHATMESSAGE"."MESSAGE" IS '내용';
COMMENT ON COLUMN "CHATMESSAGE"."CDATE" IS '작성 시간';
COMMENT ON COLUMN "CHATMESSAGE"."ROOMID" IS '채팅방번호';
ALTER TABLE "CHATROOM" ADD CONSTRAINT "PK_CHATROOM" PRIMARY KEY (
	"ROOMID"
);

ALTER TABLE "CHATMESSAGE" ADD CONSTRAINT "FK_CHATROOM_TO_CHATMESSAGE_1" FOREIGN KEY (
	"ROOMID"
)
REFERENCES "CHATROOM" (
	"ROOMID"
);

ALTER TABLE "CHATMESSAGE" ADD CONSTRAINT "FK_USERS_TO_CHATMESSAGE_1" FOREIGN KEY (
	"USERID"
)
REFERENCES "USERS" (
	"USERID"
);


DROP TABLE "CHATMEMBER";
CREATE TABLE "CHATMEMBER" (
	"ROOMID"	VARCHAR2(50)	NOT NULL,	
	"USERID"	VARCHAR2(40)	NOT NULL	
);
COMMENT ON COLUMN "CHATMEMBER"."ROOMID" IS '채팅방번호';
COMMENT ON COLUMN "CHATMEMBER"."ROOMID" IS 'USERID';

ALTER TABLE "CHATMEMBER" ADD CONSTRAINT "FK_USERS_TO_CHATMEMBER_1" FOREIGN KEY (
	"USERID"
)
REFERENCES "USERS" (
	"USERID"
);
ALTER TABLE "CHATMEMBER" ADD CONSTRAINT "FK_CHATROOM_TO_CHATMEMBER_1" FOREIGN KEY (
	"ROOMID"
)
REFERENCES "CHATROOM" (
	"ROOMID"
);







SELECT * FROM CHATMEMBER;
SELECT  ROOMID FROM chatroom WHERE ROOMID='1';
SELECT MNAME FROM CHATROOM JOIN USERS USING(USERID);

select mname, cdate ,roomid
from chatmessage
join users USING(userid)
where roomid = '1';







INSERT INTO CHATMEMBER (ROOMID, USERID)
SELECT (SELECT MAX(ROOMid) FROM chatROOM), 'spam@kh.co.kr' FROM DUAL;
SELECT ccode,userId, mname
	FROM users
	WHERE (userId = 'orinog330@gmail.com' or ccode = (SELECT ccode FROM users WHERE userId = 'orinog330@gmail.com')) and enabled =1;
    SELECT ccode,userId, mname
	FROM users
	WHERE userId = 'orinog330@gmail.com' or ccode = (SELECT ccode FROM users WHERE userId = 'orinog330@gmail.com');
select *
from users;
select *
from chatmember;
select *
from chatroom;
select userId 
from users
where userid='kh0001@kh.com';

join chatmessage USING(roomId)
where roomid='22';
join users USING(userid)
insert into chatmessage (roomid,userid,message) VALUES('22','mplsam@kh.co.kr','되나?');
insert into chatmessage (roomid,userid,message) VALUES('22','sple@kh.co.kr','ghkrdls');
select * 
from chatmessage;
select mname, from CHATMESSAGE join users USING(userId) WHERE ROOMID = '22' ORDER BY CDATE ASC;
select mname from chatmessage join users using(userid);
select * 
from chatroom;
INSERT INTO chatmessage (ROOMID,ROOMNAME,"select mname from chatmessage join users using(userid)") VALUES ('fd1fe888-5dd2-48a0-91b5-16b448c8cb5f','임임임roomname','나사장');
SELECT roomid,roomname,mname
FROM CHATROOM 
join users USING(userid)
WHERE ROOMID='2';

SELECT * FROM CHATROOM where userid='sple@kh.co.kr';
SELECT ROOMID,ROOMNAME,MNAME,USERID FROM CHATROOM JOIN USERS USING(USERID) WHERE ROOMID='2';
select ROOMID,MNAME,MESSAGE,CDATE from CHATMESSAGE join users USING(userId) WHERE userid = 'sample@kh.co.kr' ORDER BY CDATE ASC;
select *
from users;

select roomid,roomname,users.mname
from chatroom
join users USING(userid);

select userid
from users
join chatmessage using(userid)
where roomid='22' and userid='mplsam@kh.co.kr';

select roomid,mname,message,cdate
from chatmessage
join users USING(userid)
ORDER BY CDATE ASC
;
select ROOMID,MNAME,MESSAGE,CDATE from CHATMESSAGE join users USING(userId) WHERE ROOMID = '22' ORDER BY CDATE ASC;
SELECT * FROM CHATMEMBER JOIN USERS USING(USERID) WHERE ROOMID='1';
select * from users;
select * from chatmember where roomid='22';
INSERT INTO CHATMEMBER(ROOMID,USERID) VALUES('22','sample@kh.co.kr');
INSERT INTO CHATMEMBER(ROOMID,USERID) VALUES('22','kh0002@kh.com');
select  * from chatmessage;
select MNAME from chatmessage join users using(userid);
INSERT INTO CHATMESSAGE (USERID, MESSAGE, ROOMID, cDate, MNAME)
VALUES ('sample@kh.co.kr', '흠', 169, SYSTIMESTAMP, (SELECT MNAME FROM USERS WHERE USERS.USERID = 'sample@kh.co.kr'));
INSERT INTO CHATMESSAGE (USERID,MESSAGE,ROOMID,cDate,mName) VALUES ('sample@kh.co.kr','흠','169',SYSTIMESTAMP,'황황황');
INSERT INTO CHATMESSAGE (USERID, MESSAGE, ROOMID, cDate, mName)VALUES ('sample@kh.co.kr', '흠', '21', SYSTIMESTAMP, (SELECT MNAME FROM USERS WHERE USERID='kh0002@kh.com'));
select * from chatmessage;
INSERT INTO CHATMESSAGE (USERID, MESSAGE, ROOMID, cDate, MNAME)
SELECT 'sample@kh.co.kr', '흠', '169', SYSTIMESTAMP, USERS.MNAME
FROM USERS
WHERE USERS.USERID = 'sample@kh.co.kr';
INSERT INTO CHATMESSAGE (USERID, MESSAGE, ROOMID, cDate, MNAME)
SELECT 'sample@kh.co.kr', '흠', 169, SYSTIMESTAMP, MNAME
FROM USERS
WHERE USERS.USERID = 'sample@kh.co.kr';

SELECT * FROM CHATMEMBER JOIN CHATROOM USING(ROOMID)
WHERE chatmember.userid='sple@kh.co.kr' OR CHATROOM.USERID='sple@kh.co.kr';
SELECT DISTINCT *
FROM CHATMEMBER
JOIN CHATROOM USING(ROOMID)
WHERE chatmember.userid='sple@kh.co.kr';
select * from chatroom;
SELECT * FROM CHATMEMBER 
JOIN CHATROOM USING(ROOMID) 
WHERE (chatmember.userid='sple@kh.co.kr' OR CHATROOM.USERID='sple@kh.co.kr') 
  AND CHATROOM.ROOMNAME != '정사원'};

select * from chatmember;
SELECT * FROM USERS ;
SELECT * FROM CHATROOM;
SELECT * FROM CHATMESSAGE;
select ROOMID,USERID,C.MNAME,MESSAGE,CDATE from CHATMESSAGE C join users USING(userId) WHERE ROOMID = '21' ORDER BY CDATE ASC;

select ROOMID,MNAME,MESSAGE,CDATE from CHATMESSAGE join users USING(userId) WHERE ROOMID = '2' ORDER BY CDATE ASC;
SELECT ROOMID,ROOMNAME,MNAME,userid FROM CHATROOM JOIN USERS USING(USERID) WHERE ROOMID='2';
SELECT * FROM CHATROOM where userid='sample@kh.co.kr';
select ROOMID,USERID,MNAME,MESSAGE,CDATE,ROOMNAME from CHATMESSAGE join users USING(userId) WHERE ROOMID = '169' ORDER BY CDATE ASC;
SELECT * FROM CHATROOM;
SELECT ROOMID,ROOMNAME,MNAME,USERID FROM CHATROOM JOIN USERS USING(USERID) WHERE ROOMID='1';
DROP SEQUENCE chat_sequence;
create SEQUENCE chat_sequence
start with 1
INCREMENT by 1;

SELECT * FROM CHATROOM  ;
SELECT * FROM CHATROOM  JOIN chatmember USING(USERID) WHERE USERID='sample@kh.co.kr';

INSERT INTO CHATMEMBER VALUES ('29', 'sple@kh.co.kr');
INSERT INTO CHATMEMBER VALUES ('29', 'mplsam@kh.co.kr');
SELECT R.ROOMNAME,C.USERID,ROOMID FROM CHATMEMBER C JOIN CHATROOM R USING(ROOMID) WHERE C.USERID='sple@kh.co.kr';
SELECT * FROM CHATROOM;
SELECT * FROM CHATMEMBER C JOIN CHATROOM R USING(ROOMID) ;
WHERE USERID='sple@kh.co.kr';

SELECT * FROM CHATROOM join chatmessage using(roomid) where roomid='30';

select * from users;

select *
from(select *
from
(select roomid, roomname, c1.userid roommaster, m1.userid chatter, message, cdate, row_number()over(order by cdate desc) rn 
    from chatroom c1
    join chatmessage m1 using(roomid)
    where roomid=30
    )
 );
 select * from chatroom;
 select * from chatmessage;
SELECT * FROM chatmember ORDER BY cdate DESC LIMIT 1;
select *
from ( select *
    from chat;
    
select roomid, m.userid, message, cdate,roomname
from chatmessage m
join chatroom c using(roomid)
where roomid=30
ORDER BY cdate DESC;

SELECT roomid, m.userid, message, cdate, roomname
FROM chatmessage m
JOIN chatroom c USING(roomid)
WHERE roomid = 30
AND cdate = (SELECT MAX(cdate) FROM chatmessage WHERE roomid = 30);

SELECT c.roomid, m.userid, m.message, m.cdate, c.roomname
FROM chatroom c
JOIN chatmessage m ON c.roomid = m.roomid
WHERE (m.roomid, m.cdate) IN (
  SELECT roomid, MAX(cdate)
  FROM chatmessage
  GROUP BY roomid
);

select roomid,roomname,c.userid,m.userid  from chatroom c join chatmember m using(roomid)
where c.userid= 'mplsam@kh.co.kr' or m.userid = 'mplsam@kh.co.kr'
;


select * from users;
SELECT c.roomid, m.userid, COALESCE(m.message, 'NULL') AS message, m.cdate, c.roomname
FROM chatroom c
LEFT JOIN chatmessage m ON c.roomid = m.roomid AND m.cdate = (
    SELECT MAX(cdate)
    FROM chatmessage
    WHERE roomid = c.roomid
);

select * from chatmessage
where roomid=30;
where cdate

select roomid, roomname, c1.userid roommaster, m1.userid chatter, message, cdate, row_number()over(order by cdate desc) rn 
    from chatroom c1
    join chatmessage m1 using(roomid)
    where  c1.userid='mplsam@kh.co.kr';

select roomname,message from chatmessage join chatroom using(roomid);
select *; 

SELECT *
FROM CHATROOM ;
JOIN CHATMESSAGE  USING(ROOMID)
WHERE ROOMID = '30'
ORDER BY m.CREATED_AT DESC;


select * from chatmessage;
SELECT * FROM CHATROOM  WHERE USERID='sple@kh.co.kr';
-------------------------------------
SELECT * FROM USERS;
SELECT * FROM chatmember ;
SELECT * FROM CHATROOM;
SELECT * FROM chatmessage;

--인원 추가를 위한 인원 리스트
select userid,mname
from users;

--채팅방 인원 추가 
INSERT INTO CHATMEMBER VALUES ('21', 'sample@kh.co.kr');
INSERT INTO CHATMEMBER VALUES ('21', 'mplsam@kh.co.kr');
INSERT INTO CHATMEMBER VALUES ('1', 'sple@kh.co.kr');
INSERT INTO CHATMEMBER VALUES ('1', 'mplsam@kh.co.kr');
INSERT INTO CHATMEMBER VALUES ('1', 'sql@ctest.co.kr');
select * from chatmember;

--findallroom
select USERID from chatroom JOIN CHATMEMBER USING(ROOMID) CHATMEMBER  where userid='mplsam@kh.co.kr';
SELECT * FROM CHATROOM;
---6번방에 인서트
INSERT INTO CHATMEMBER VALUES ('6', 'sample@kh.co.kr');
INSERT INTO CHATMEMBER VALUES ('6', 'mplsam@kh.co.kr');

--해당 채팅방에 초대된 사람만 리스트보이기
select * from chatroom;
select * from chatmember;
select roomid,roomname,userid from chatroom  join chatmember  using(roomid);

SELECT * FROM CHATMEMBER JOIN CHATROOM USING(ROOMID)
WHERE chatmember.userid='mplsam@kh.co.kr' OR CHATROOM.USERID='mplsam@kh.co.kr';

SELECT userId, mName, ccode
FROM users
WHERE userId = 'mplsam@kh.co.kr' AND ccode = ccode;

SELECT userId, mName, ccode
FROM users
WHERE userId = 'admin@stream.com' OR ccode = (SELECT ccode FROM users WHERE userId = 'admin@stream.com');

select * from users;
select userId,mName,ccode from users where userId='mplsam@kh.co.kr';
select * from users;
SELECT roomid, roomname, chatmember.userid AS userid
FROM chatroom
JOIN chatmember USING(roomid)
WHERE chatmember.userid='mplsam@kh.co.kr';

SELECT *
FROM chatroom;
del
JOIN chatmember USING(roomid)
WHERE chatmember.userid='mplsam@kh.co.kr' OR chatroom.USERID='mplsam@kh.co.kr';
SELECT MAX(ROOMid) ROOMid FROM chatROOM;

INSERT INTO CHATMEMBER VALUES ((SELECT MAX(ROOMid) ROOMid FROM chatROOM), 'spam@kh.co.kr');

SELECT MAX(ROOMid) ROOMid FROM chatROOM;
select *from chatmember;
SELECT * FROM CHATROOM;
select * from users;
INSERT INTO CHATMEMBER VALUES ('47', 'mplsam@kh.co.kr');

INSERT INTO CHATMEMBER VALUES(((SELECT MAX(ROOMid) ROOMid FROM chatROOM), 'spam@kh.co.kr'),((SELECT MAX(ROOMid) ROOMid FROM chatROOM), 'mplsam@kh.co.kr')));

INSERT INTO CHATMEMBER (ROOMID, USERID)
SELECT (SELECT MAX(ROOMid) FROM chatROOM), 'spam@kh.co.kr' FROM DUAL
UNION ALL
SELECT (SELECT MAX(ROOMid) FROM chatROOM), 'mplsam@kh.co.kr' FROM DUAL;

DELETE FROM CHATROOM;
DELETE FROM chatmember;
DELETE FROM chatmessage;



select * from users;
SELECT *FROM chatmessage;
select * from chatroom;
select * from chatmember;
select * from chatmessage;

SELECT * FROM CHATMEMBER JOIN CHATROOM USING(ROOMID)
WHERE chatmember.userid='sple@kh.co.kr' OR CHATROOM.USERID='mplsam@kh.co.kr';

select mname from users where userid='sample@kh.co.kr';
select mname from chatmember join users using (userid) where userid='mplsam@kh.co.kr';
select * from chatMember join users using (userId) where userId='mplsam@kh.co.kr';
JOIN chatmember USING(USERID)
--채팅방 진입 USERID를 세션으로 받아서 진입
SELECT MNAME FROM USERS WHERE USERID = 'sample@kh.co.kr';
SELECT ROOMID,MNAME,USERID FROM chatmember JOIN USERS USING(USERID) WHERE ROOMID='1' AND USERID='mplsam@kh.co.kr';
select * from chatmember;
--INSERT INTO CHATROOM (ROOMID,ROOMNAME,USERID) VALUES (#{roomId},#{USERID},#{roomName})
INSERT INTO CHATROOM (ROOMID,ROOMNAME) VALUES (chat_sequence.NEXTVAL,'roomname확인123');
INSERT INTO CHATROOM (ROOMID,ROOMNAME,USERID) VALUES (chat_sequence.NEXTVAL,'roomname확인2','sple@kh.co.kr');
DELETE FROM CHATROOM;
select * from chatmember;
select * from chatroom;
select * from chatmessage;
SELECT c.roomid, m.userid, m.message, m.cdate, c.roomname
		FROM chatroom c
		JOIN chatmessage m ON c.roomid = m.roomid
		WHERE (m.roomid, m.cdate) IN (
		  SELECT roomid, MAX(cdate)
		  FROM chatmessage;
SELECT m.roomid, m.userid, message, m.cdate 
FROM chatmember c
JOIN chatmessage m ON c.roomid = m.roomid 

ORDER BY m.cdate DESC;  
SELECT m.roomid, m.userid, message, MAX(m.cdate) AS max_cdate
FROM chatmember c
JOIN chatmessage m ON c.roomid = m.roomid
GROUP BY m.roomid, m.userid, message
ORDER BY max_cdate DESC;
select * from 
users;
SELECT roomid,max(cdate)
FROM chatmessage
group by roomid; 

SELECT roomid, userid, message, MAX(cdate) AS cdate, mname
FROM chatmessage
GROUP BY roomid, userid, message, mname;

select * from chatmessage
order by cdate desc;
select * from chatroom where userId;
select * from chatmember;
select * from chatmessage


select roomid,userid,message,cdate,mname from chatmessage;
SELECT DISTINCT *
		FROM CHATMEMBER
		JOIN CHATROOM USING(ROOMID)
		WHERE chatmember.userid='sple@kh.co.kr';
        
INSERT INTO CHATMEMBER (ROOMID, USERID) SELECT (SELECT MAX(ROOMid) FROM chatROOM)AS ROOMID, 'sple@kh.co.kr' FROM DUAL;
select ROOMID,MNAME,MESSAGE,CDATE from CHATMESSAGE join users USING(userId) WHERE ROOMID = '21' ORDER BY CDATE ASC;
SELECT MAX(ROOMid) FROM chatROOM ;
INSERT INTO CHATMEMBER (ROOMID, USERID)SELECT (SELECT MAX(ROOMid) FROM chatROOM)AS ROOMID, 'sple@kh.co.kr' FROM DUAL;
select * from chatmessage;

INSERT INTO CHATROOM (ROOMID,USERID,ROOMNAME) VALUES (chat_sequence.NEXTVAL,'sple@kh.co.kr','채팅방1');
INSERT INTO CHATROOM (ROOMID,USERID,ROOMNAME) VALUES ((SELECT MAX(ROOMid) FROM chatROOM),'sple@kh.co.kr','채팅방1');
SELECT * FROM CHATROOM;

INSERT INTO CHATROOM (ROOMID, USERID, ROOMNAME, MNAME)
VALUES (chat_sequence.NEXTVAL, 'sple@kh.co.kr', '?', (SELECT MNAME FROM USERS WHERE USERID ='sple@kh.co.kr'));
-----------------------------------------------
select mname from users where userid='sple@kh.co.kr';
select * 
from info;
select * from users;
drop SEQUENCE info_sequence;
CREATE SEQUENCE info_sequence
START WITH 1
INCREMENT BY 1;
SELECT info.ino, info.itext, info.userid, info.idate, info.ititle, users.mname AS iwriter
FROM info
JOIN users ON info.userid = users.userId
WHERE info.userid = 'admin@stream.com';
SELECT ino, itext, info.userid, idate,ititle, users.mname AS iwriter
		FROM info
		JOIN users ON info.userid = users.userId
		WHERE info.userid = 'sple@kh.co.kr';

--인서트 번호 시퀀스 날짜 자동 해당 세션 아이디로 --
INSERT INTO info (ino, itext, userid, idate, ititle, iwriter)
SELECT info_sequence.NEXTVAL, '공지내용', 'sample@kh.co.kr', TO_TIMESTAMP(TO_CHAR(SYSTIMESTAMP, 'YYYY-MM-DD HH24:MI'), 'YYYY-MM-DD HH24:MI'), '공지제목', mname
FROM users
WHERE userid = 'sample@kh.co.kr';
insert into info (ino,itext , userid, idate,ititle, iwriter) values (info_sequence.NEXTVAL,'공지내용','sple@kh.co.kr',TO_CHAR(SYSTIMESTAMP, 'yy/MM/dd HH24:MI'),'공지제목','sple@kh.co.kr');
insert into info (ino,itext , userid, idate,ititle, iwriter) values (info_sequence.NEXTVAL,'공지내용','admin@stream.com',TO_CHAR(SYSTIMESTAMP, 'yy/MM/dd HH24:MI'),'공지제목','admin@stream.com');
insert into info (ino,itext , userid, idate,ititle, iwriter) values (info_sequence.NEXTVAL,'공지내용','fffll@ctest.co.kr',TO_CHAR(SYSTIMESTAMP, 'yy/MM/dd HH24:MI'),'공지제목','fffll@ctest.co.kr');
insert into info (ino,itext , userid, idate,ititle, iwriter) values (info_sequence.NEXTVAL,'공지내용','sample@kh.co.kr',TO_TIMESTAMP(TO_CHAR(SYSTIMESTAMP, 'YYYY-MM-DD HH24:MI'),'공지제목','');
INSERT INTO info (ino, itext, userid, idate, ititle, iwriter)
VALUES (info_sequence.NEXTVAL, 'rrr', 'sple@kh.co.kr',DATE_FORMAT(NOW(), '%Y-%m-%d %H:%i'), '공지제목', 'sple@kh.co.kr');
INSERT INTO info (ino, itext, userid, idate, ititle, iwriter)
VALUES (info_sequence.NEXTVAL, '공지내용', 'sple@kh.co.kr', 
        TO_CHAR(SYSTIMESTAMP, 'YY/MM/DD HH24:MI'), '공지제목', 'sple@kh.co.kr');
select count(*) from info;
select * 
from( select rownum rn, a.*
        from(
             select *
             from info
             order by seq desc
             )
             )
where rn between 1 and 5;

--리스트
SELECT ino, userid, idate, ititle, iwriter, ccode,mname
FROM info
JOIN users USING (userid)
WHERE ccode = (SELECT ccode FROM users WHERE userid = 'sple@kh.co.kr');
select * from info join users using(userid);
--공지 상세
select *
from info
where ino='1';
select * from chatroom;
select * from chatmember;
delete from chatroom;
delete from chatmember;
delete from chatmessage;
select * from chatroom;
--공지삭제
delete from info where ino='4';
--공지 검색
SELECT ino, userid, idate, ititle, mname, ccode
FROM info
JOIN users USING (userid)
WHERE ccode = (SELECT ccode FROM users WHERE userid = 'sple@kh.co.kr') ;
select userId,mname from chatroom join users using (userid);
--공지수정 UPDATE [테이블] SET [열] = '변경할값' WHERE [조건]
update info set idate=TO_CHAR(SYSTIMESTAMP, 'DD/MM/YY HH24:MI'),ititle='수정1',itext='수정' where ino='3';
select count(*) from info JOIN users USING (userid) WHERE ccode = (SELECT ccode FROM users WHERE userid = 'sple@kh.co.kr');
select count (*) from chatmember where roomid='17';
select * from chatmember;
select *
    from (select rownum rn, *
                from (select *
                            from info where ccode not in'C000' order by ccode asc) a )
    where rn between #{start} and #{end};
SELECT ino, userid, idate, ititle, iwriter
FROM info
JOIN users USING (userid)
WHERE ccode = (SELECT ccode FROM users WHERE userid = 'sple@kh.co.kr')
AND (ititle = 'ㅇㅇㅇㅇ' OR iwriter = '');
select userId,mname from chatroom join users using (userid);
select *
	from (select rownum rn, i.*
			from (select *
					from info order by ino desc) i);
select * from users;	
commit;
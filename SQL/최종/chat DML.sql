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

select ROOMID,MNAME,MESSAGE,CDATE from CHATMESSAGE join users USING(userId) WHERE ROOMID = '2' ORDER BY CDATE ASC;
SELECT ROOMID,ROOMNAME,MNAME,userid FROM CHATROOM JOIN USERS USING(USERID) WHERE ROOMID='2';
SELECT * FROM CHATROOM where userid='sample@kh.co.kr';
 

SELECT ROOMID,ROOMNAME,MNAME,USERID FROM CHATROOM JOIN USERS USING(USERID) WHERE ROOMID='1';
DROP SEQUENCE chat_sequence;
create SEQUENCE chat_sequence
start with 1
INCREMENT by 1;
SELECT * FROM CHATROOM  ;
SELECT * FROM CHATROOM  JOIN chatmember USING(USERID) WHERE USERID='sample@kh.co.kr';

INSERT INTO CHATMEMBER VALUES ('1', 'sple@kh.co.kr');
SELECT * FROM CHATMEMBER JOIN CHATROOM USING(USERID)  WHERE USERID='sple@kh.co.kr';
SELECT *FROM CHATROOM;
SELECT * FROM CHATROOM  WHERE USERID='mplsam@kh.co.kr';
-------------------------------------
SELECT * FROM USERS;
SELECT * FROM chatmember;
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



select * from users;
select mname from chatmember join users using (userid) where userid='mplsam@kh.co.kr';
select * from chatMember join users using (userId) where userId='mplsam@kh.co.kr';
JOIN chatmember USING(USERID)
--채팅방 진입 USERID를 세션으로 받아서 진입
SELECT MNAME FROM USERS WHERE USERID = 'sample@kh.co.kr';
SELECT ROOMID,MNAME,USERID FROM chatmember JOIN USERS USING(USERID) WHERE ROOMID='1' AND USERID='mplsam@kh.co.kr';

--INSERT INTO CHATROOM (ROOMID,ROOMNAME,USERID) VALUES (#{roomId},#{USERID},#{roomName})
INSERT INTO CHATROOM (ROOMID,ROOMNAME) VALUES (chat_sequence.NEXTVAL,'roomname확인123');
INSERT INTO CHATROOM (ROOMID,ROOMNAME,USERID) VALUES (chat_sequence.NEXTVAL,'roomname확인2','sple@kh.co.kr');
DELETE FROM CHATROOM;

select ROOMID,MNAME,MESSAGE,CDATE from CHATMESSAGE join users USING(userId) WHERE ROOMID = '21' ORDER BY CDATE ASC;
commit;
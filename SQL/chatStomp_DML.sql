SELECT *
FROM chatroom;

SELECT *
FROM chatmessage;

--DML 기본 추가
INSERT INTO chatwriter (WRITER) VALUES ('김민성');
INSERT INTO chatwriter (WRITER) VALUES ('황대경');
INSERT INTO chatwriter (WRITER) VALUES ('임지연');
INSERT INTO chatroom (ROOMID,WRITER,roomname) VALUES ('ROOM1','김민성','ROOMNAME');
INSERT INTO chatroom (ROOMID,WRITER,roomname) VALUES ('ROOM2','황대경','ROOMNAME황');
INSERT INTO chatroom (ROOMID,WRITER,roomname) VALUES ('ROOM3','임지연','ROOMNAME임');
INSERT INTO chatmessage (WRITER,message,ROOMID,cdate) VALUES ('김민성','메세지내용테스트','ROOM1',systimestamp);
INSERT INTO chatmessage (WRITER,message,ROOMID,cdate) VALUES ('황대경','메세지내용테스트테스트','ROOM2',systimestamp);
INSERT INTO chatmessage (WRITER,message,ROOMID,cdate) VALUES ('임지연','메세지내용테스트메세지내용테스트테스트','ROOM3',systimestamp);
--채팅방 추가 INSERT
INSERT INTO chatroom (ROOMID,WRITER,roomname) VALUES ('ROOM1','김민성','ROOMNAME');

--채팅방 리스트 SELCET LIST
SELECT *
FROM chatroom;

--ROOMID 검색받아 해당 채팅방 찾기 SELECT ONE
SELECT *
FROM chatroom
WHERE roomid='ROOM1';

--채팅방 안에서의 대화 내용 저장 INSERT
INSERT INTO chatmessage (WRITER,message,ROOMID,cdate) VALUES ('임지연','메세지내용테스트메세지내용테스트테스트','ROOM3',systimestamp);

SELECT *
FROM chatmessage WHERE ROOMID = 'ROOM1'
ORDER BY CDATE ASC;

commit;
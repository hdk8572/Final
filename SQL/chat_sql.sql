select *
from chat;

select *
from chatlist;

drop SEQUENCE chat_sequence;

CREATE SEQUENCE chat_sequence
START WITH 1
INCREMENT BY 1;

INSERT INTO chatlist 
VALUES (chat_sequence.NEXTVAL, '채팅방이름1');
INSERT INTO chatlist 
VALUES (chat_sequence.NEXTVAL, '채팅방이름2');
INSERT INTO chatlist 
VALUES (chat_sequence.NEXTVAL, '채팅방이름3');
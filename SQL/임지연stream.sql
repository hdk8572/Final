INSERT INTO MEMBER_SCHEDULE (SNO, ATTENUSERID)
VALUES ('1','sple@kh.co.kr');
INSERT INTO MEMBER_SCHEDULE (SNO, ATTENUSERID)
VALUES ('1','sample@kh.co.kr');
INSERT INTO MEMBER_SCHEDULE (SNO, ATTENUSERID)
VALUES ('1','mplsam@kh.co.kr');
INSERT INTO MEMBER_SCHEDULE (SNO, ATTENUSERID)
VALUES ('1','fffll@ctest.co.kr');

select userid from MEMBER_PROJECT where pno='1'; 
select userid, ( select mname from users tu where tm.userid=tu.userid ) mname from MEMBER_PROJECT tm where pno='1'; 

select userid, ( select mname from users tu where tm.userid=tu.userid ) mname from MEMBER_PROJECT tm where pno=#{pno}; 

select * from users;
select * from project;
select * from MEMBER_PROJECT;
insert into MEMBER_PROJECT (pno, userid) values ('1', 'kh0001@kh.com');
insert into MEMBER_PROJECT (pno, userid) values ('1', 'kh0002@kh.com');
insert into MEMBER_PROJECT (pno, userid) values ('1', 'sple@kh.co.kr');
insert into MEMBER_PROJECT (pno, userid) values ('1', 'mplsam@kh.co.kr');
commit;

 select userid, ( select mname from users tu where tm.userid=tu.userid ) mname from MEMBER_PROJECT 
tm where pno='1' ;

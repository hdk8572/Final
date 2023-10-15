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

select * from schedule;
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


	SELECT SNO, USERID,
		to_char(SSTART, 'yyyy-mm-dd') as "START", to_char(SEND, 'yyyy-mm-dd')
		as END, STITLE
		as TITLE, SCOLOR as color
		,SPLACE, SMEMO
        , PNO
		FROM SCHEDULE
        WHERE PNO ='1';
        
-- view
desc member_project;
desc member_schedule;
desc users;
create view v_u_member_project
as
select PNO, USERID, MNAME, CCODE, DEPTNO
from member_project join users using(userid)
;
create view v_u_member_project
as
select PNO, USERID, MNAME, CCODE, DEPTNO
from member_project join users using(userid)
;
create view v_u_member_schedule
as
select SNO, ATTENDUSERID, MNAME as ATTENDNAME, CCODE, DEPTNO
from member_schedule join users on (ATTENDUSERID = USERID)
;
select * from v_u_member_schedule;

--view
create view v_u_schedule
as
select s.*, u.mname, CCODE, DEPTNO
from schedule s join users u on (s.userid = u.userid)
;

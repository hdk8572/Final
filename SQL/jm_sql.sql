desc task;
desc project;

select pname from project;

select pname, count(tno) cnt
    from project
    join task using(pno)
    group by (pno, pname)
    ;
    
select ttitle, userid, tstatus, tdate, tstartdate, tenddate
    from task 
    
    where pno in (select pno from project)
    ;
select  pname, pno, cnt, ttitle, userid, tstatus, tdate, tstartdate, tenddate
    from (select pname, pno, count(tno) cnt 
            from project 
            join task using(pno)
            group by (pno,pname))
            join task using(pno)
            where pno=pno
    ;

select pname, pno, ttitle, userid, tstatus, tdate, tstartdate, tenddate, bref, brestep, brelevel
    from project join task using(pno, userid)
    order by pno asc, brelevel asc, brestep asc
    ;

--원본글, 답글 확인하기 
--bref=tno : 원본글 bref <> tno : 답글
select bref from task where tno =1;

--brefstep = 1~N : 하위 업무들의 순서
select brestep+1 from task where tno =1;

--brelevel=0 : 원본글, =1 : 하위 업무
select brelevel+1 from task where tno = 1;


--insert into task (TNO, PNO, USERID, TTITLE, TSTATUS, TDATE, TSTARTDATE, TENDDATE, BREF, BRESTEP, BRELEVEL)
--		values (
--			task_sequence.NEXTVAL, #{pno}, #{userid}, #{ttitle}, #{tstatus}, sysdate, #{tstartdate}, #{tenddate}, 
--				(select bref from task where tno=#{tno}),
--				(select brestep+1 from task where tno=#{tno}),
--				(select brelevel+1 from task where tno=#{tno})
--				)
--;

select sysdate tdate from dual;
insert into task (TNO, PNO, USERID, tmember, TTITLE, tcontent, TSTATUS, TDATE, TSTARTDATE, TENDDATE, BREF, BRESTEP, BRELEVEL)
		values (
			task_sequence.NEXTVAL, '1', 'kh0001@kh.com', 'kh0001@kh.com', 'aaabb', 'dd', '진행 중', sysdate, sysdate, sysdate, 
				(select bref from task where tno='1'),
				(select brestep+1 from task where tno='1'),
				(select brelevel+1 from task where tno='1')
				)
;

select brestep from task where pno = '1';

select sysdate tdate from dual;
insert into task (TNO, PNO, USERID, tmember, TTITLE, tcontent, TSTATUS, TDATE, TSTARTDATE, TENDDATE, BREF, BRESTEP, BRELEVEL)
		values (
			task_sequence.NEXTVAL, '1', 'kh0001@kh.com', 'kh0001@kh.com', 'aaabb', 'dd', '진행 중', sysdate, sysdate, sysdate, 
				(select bref from task where tno='1'),
				(select brestep+1 from task where tno='1'),
				(select brelevel+1 from task where tno='1')
				)
;

update task set BRESTEP = BRESTEP +1 
    where BRESTEP > (SELECT BRESTEP FROM task WHERE tno = 1)
        and BREF = (select bref from task where tno = 1)
;

select bref from task where tno = 1;
SELECT BRESTEP FROM task WHERE tno = 1;
SELECT count(BRESTEP) FROM task WHERE bref = 1;
select brestep from task where tno =1 and brelevel=1;

select bref, brestep from task where bref =1;

select brelevel+1 from task where tno='1';
select brestep+1 from task where tno='1';

commit;


select pname, pno, tmember, ttitle, tstatus, tdate, tstartdate, tenddate, tno, bref, brestep, brelevel
    		from project join task using(pno)
    		order by pno asc, bref asc, brelevel asc, brestep asc ;

select pname, pno, tmember, ttitle, tstatus, tdate, tstartdate, tenddate, tno, bref, brestep, brelevel
    		from (select * from project where pno='8') join task using(pno)
    		order by brelevel asc, brestep asc	;
            
            
select ccode, userid, pname, pno, tmember, ttitle, tstatus, tdate, tstartdate, tenddate, tno, bref, brestep, brelevel
    from (select userid, pname, pno, tmember, ttitle, tstatus, tdate, tstartdate, tenddate, tno, bref, brestep, brelevel
    		from project join task using(pno, userid))
    join users using(userid)
    order by pno asc, bref asc, brelevel asc, brestep asc;
    		
select pname, pno, userid, tmember, ttitle, tstatus, tdate, tstartdate, tenddate, tno, bref, brestep, brelevel
    		from project right join task using(pno, userid)
    		where tmember ='sple@kh.co.kr'
    		order by pno asc, bref desc, brelevel asc, brestep asc
;
select * from project where pno=13;
select pname, pno, userid, tmember, ttitle, tstatus, tdate, tstartdate, tenddate, tno, bref, brestep, brelevel
    		from (select * from project where pno=13) right join task using(pno, userid)
            where tmember = 'sple@kh.co.kr'
    		order by brelevel asc, brestep asc
;

select pname, pno, userid, tmember, ttitle, tstatus, tdate, tstartdate, tenddate, tno, bref, brestep, brelevel
    		from project right join task using(pno, userid)
    		where tmember = 'sple@kh.co.kr' or userid = 'sple@kh.co.kr'
    		order by pno asc, bref desc, brelevel asc, brestep asc
;




select pname, pno,  tmember, ttitle, tstatus, tdate, tstartdate, tenddate, tno, bref, brestep, brelevel
    from (select * from project where pno=13) 
    join (select * from task where userid='sple@kh.co.kr' or tmember='sple@kh.co.kr') using (pno)
;
select pname, pno,  tmember, ttitle, tstatus, tdate, tstartdate, tenddate, tno, bref, brestep, brelevel
    from (select * from project where pno=13) 
    join (select * from task) using (pno)
;


select pname, pno, userid, tmember, ttitle, tstatus, tdate, tstartdate, tenddate, tno, bref, brestep, brelevel
    		from project  join task using(pno, userid)
    		where tmember = 'sple@kh.co.kr' or userid ='sple@kh.co.kr'
    		order by pno asc, bref desc, brelevel asc, brestep asc
;


		select pname, pno, userid, tmember, ttitle, tstatus, tdate, tstartdate, tenddate, tno, bref, brestep, brelevel
    		from (select * from project where pno='13') right join task using (pno, userid)
    		where tmember = 'sple@kh.co.kr' or userid = 'sple@kh.co.kr' 
    		order by pno asc, bref desc, brelevel asc, brestep asc
            ;

		select pname, pno, userid, tmember, ttitle, tstatus, tdate, tstartdate, tenddate, tno, bref, brestep, brelevel
    		from project right join task using (pno)
    		where tmember = 'sple@kh.co.kr' or userid = 'sple@kh.co.kr' 
    		order by pno asc, bref desc, brelevel asc, brestep asc
            ;
select *     		from project;
select *     		from task;



select pname, pno, p.userid, t.userid, tmember, ttitle, tstatus, tdate, tstartdate, tenddate, tno, bref, brestep, brelevel
    		from project p right join (select * from task t where pno='13') t using (pno)
    		where tmember = 'sple@kh.co.kr' or t.userid='sple@kh.co.kr' 
    		order by bref desc, brelevel asc, brestep asc
            ;
            
            
            
--===============================================================================

select count(ccode) ccnt from company;
select count(pno) pcnt from project;
select count(tno) tcnt from task;

select count(ccode), count(pno), count(tno)
    from company c
    join users using (ccode)
    join project using (userid)
    join task using (pno)
;

select distinct(ccode) ccnt
    from company c
    join users u using (ccode)
    join project p using (userid)
    join task t using (pno)
;
--같은 회사 인원
select userid from users
    where ccode = 'C001';
    
--같은 회사, 같은 부서 인원
select userid from users
    where ccode = 'C001' and deptno = 'D001'
    ;
    
select userid from member_project
    where pno = '13'
    ;
select pname, pno, p.userid, t.userid, tmember, ttitle, tstatus, tdate, tstartdate, tenddate, tno, bref, brestep, brelevel
	from project p right join task t using (pno)
	where tmember = 'sple@kh.co.kr' or t.userid ='sple@kh.co.kr'
	order by to_number(pno) desc, bref desc, brelevel asc, brestep asc, tno desc
;
select pname, pno, p.userid, t.userid, tmember, ttitle, tstatus, tdate, tstartdate, tenddate, tno, bref, brestep, brelevel
	from project p right join task t using (pno)
	order by to_number(pno) desc, bref desc, brelevel asc, brestep asc, tno desc
;
select pno, userid, mname 
    from member_project mp
    join users u using (userid)
    where pno=13;
    
select distinct * from
(select pname, pno, p.userid pid, t.userid, tmember, ttitle, tstatus, tdate, tstartdate, tenddate, tno, bref, brestep, brelevel
    from project p 
    right join task t using (pno)
    join member_project using(pno)
    where tmember = 'sple@kh.co.kr' or t.userid ='sple@kh.co.kr'
    order by to_number(pno) desc, bref desc, brelevel asc, brestep asc, tno desc)
;
select pname, pno, p.userid pid, t.userid, tmember, ttitle, tstatus, tdate, tstartdate, tenddate, tno, bref, brestep, brelevel
    from project p 
    right join task t using (pno)
    join member_project using(pno)
    where tmember = 'sple@kh.co.kr' or t.userid ='sple@kh.co.kr'
    group by (pname, pno, p.userid, t.userid, tmember, ttitle, tstatus, tdate, tstartdate, tenddate, tno, bref, brestep, brelevel)
    order by to_number(pno) desc, bref desc, brelevel asc, brestep asc, tno desc
    ;
    
select pname, pno, u.userid, projectwriter, taskwriter, mname, tmember, ttitle, tstatus, tdate, tstartdate, tenddate
        , tno, bref, brestep, brelevel
    from
(select pname, pno, p.userid projectwriter, t.userid taskwriter , tmember, ttitle, tstatus, tdate, tstartdate, tenddate, tno, bref, brestep, brelevel
    from project p 
    right join task t using (pno)
    join member_project mp using(pno)
    where tmember = 'sple@kh.co.kr' or t.userid ='sple@kh.co.kr'
    group by (pname, pno, p.userid, t.userid, tmember, ttitle, tstatus, tdate, tstartdate, tenddate, tno, bref, brestep, brelevel)
    order by to_number(pno) desc, bref desc, brelevel asc, brestep asc, tno desc) ff
    join users u on (u.userid= ff.taskwriter)
;

select pname, pno, u.userid, ff.userid, mname, tmember, ttitle, tstatus, tdate, tstartdate, tenddate
        , tno, bref, brestep, brelevel
    from
(select pname, pno, p.userid a, t.userid userid , tmember, ttitle, tstatus, tdate, tstartdate, tenddate, tno, bref, brestep, brelevel
    from project p 
    right join task t using (pno)
    join member_project mp using(pno)
    where tmember = 'sple@kh.co.kr' or t.userid ='sple@kh.co.kr'
    group by (pname, pno, p.userid, t.userid, tmember, ttitle, tstatus, tdate, tstartdate, tenddate, tno, bref, brestep, brelevel)
    order by to_number(pno) desc, bref desc, brelevel asc, brestep asc, tno desc) ff
    join users u on (u.userid= ff.userid)
    ;
    
    select pname, pno, userid, projectwriter, taskwriter, mname, tmember, ttitle, tstatus, tdate, tstartdate, tenddate, tno, bref, brestep, brelevel
    		from	(select pname, pno, p.userid projectwriter, t.userid taskwriter , tmember, ttitle, tstatus, tdate, tstartdate, tenddate, tno, bref, brestep, brelevel
   						from project p 
    					right join task t using (pno)
    					join member_project mp using(pno)
    					where tmember = 'sple@kh.co.kr' or t.userid = 'sple@kh.co.kr'
    					group by (pname, pno, p.userid, t.userid, tmember, ttitle, tstatus, tdate, tstartdate, tenddate, tno, bref, brestep, brelevel)
    					order by to_number(pno) desc, bref desc, brelevel asc, brestep asc, tno desc) ff
    		join users u on (u.userid= ff.taskwriter)
;

select userid, mname
    from member_project
    join users using(userid)
    where pno='13'
;

select pname, pno, p.userid, t.userid, tmember, ttitle, tstatus, tdate, tstartdate, tenddate, tno, bref, brestep, brelevel
    		from project p right join task t using (pno)
    		where tmember = 'mplsam@kh.co.kr' or t.userid ='mplsam@kh.co.kr'
    		order by pno asc, bref desc, brelevel asc, brestep asc, tno desc
            ;
            
            
            
            
            
            
select pname, pno, p.userid, t.userid, tmember, ttitle, tstatus, tdate, tstartdate, tenddate, tno, bref, brestep, brelevel
    		from project p right join task t using (pno)
    		where tmember = 'sple@kh.co.kr' or t.userid ='sple@kh.co.kr'
    		order by 
            pno asc, 
    bref desc, 
    brelevel asc
-- <choose>
--    <when test="ordertype == ttitle">
--        ttitle asc
--    </when>
--    <when test="ordertype == tstatus">
--      tstatus asc
--    </when>
--    <when test="ordertype == tstartdate">
--      tstartdate asc
--    </when>
--    <otherwise>
--        brestep asc
--    </otherwise>
--</choose>
    
--    tno desc
;

select pname, pno, p.userid, t.userid, tmember, ttitle, tstatus, tdate, tstartdate, tenddate, tno, bref, brestep, brelevel
    		from project p right join task t using (pno)
    		where tmember = 'sple@kh.co.kr' or t.userid ='sple@kh.co.kr'
    		order by 
            to_number(pno) desc, 
 to_number(bref) desc, 
 brelevel asc, 
-- <choose>
--    <when test="ordertype == ttitle">
        ttitle desc
--    </when>
--    <when test="ordertype == tstatus">
--      tstatus asc
--    </when>
--    <when test="ordertype == tstartdate">
--      tstartdate asc
--    </when>
--    <when test ="ordertype == "tno">
--    tno asc
--    </when>
--    <otherwise>
--        to_number(brestep) asc
--    </otherwise>
--</choose>
;  

select pname, pno, p.userid, t.userid, tmember, ttitle, tstatus, to_char(tdate, 'yyyy-mm-dd') tdate, to_char(tstartdate, 'yyyy-mm-dd') tstartdate, to_char(tenddate, 'yyyy-mm-dd') tenddate, tno, bref, brestep, brelevel
    		from project p right join task t using (pno)
    		where tmember = 'sple@kh.co.kr' or t.userid ='sple@kh.co.kr'
    		order by to_number(pno) desc, to_number(bref) desc, brelevel asc, to_number(brestep) asc
  ;
select ttitle, tstatus, tmember, tstartdate, tenddate, tdate, tno, pno, pname, userid, bref, brestep, brelevel
    from task join project using(pno, userid)
    where tmember = 'sple@kh.co.kr' or userid = 'sple@kh.co.kr'
    order by to_number(pno) desc, to_number(bref) desc,  to_number(tno) desc
    ;
--select message, cdate, rn 
--from
--(select roomid, message, cdate, row_number()over(order by cdate desc) rn
--    from chatmessage
--    where roomid=30)
--   where rn=1 
--    ;
    
    
--insert into task (TNO, PNO, USERID, tmember, TTITLE, tcontent, TSTATUS, TDATE, tstartdate, tenddate, BREF, BRESTEP, BRELEVEL)
--		values (
--			task_sequence.NEXTVAL, #{pno}, #{userid}, #{tmember}, #{ttitle}, 'DEFAULT', #{tstatus}, sysdate, #{tstartdate}, #{tenddate}, 
--				(select bref from task where tno=#{tno}),
--				'0','0'
--				
--				)

select (select pname from project where pno=t.pno) pname, pno, t.userid, tmember, ttitle, tstatus, to_char(tdate, 'yyyy-mm-dd') tdate, to_char(tstartdate, 'yyyy-mm-dd') tstartdate, to_char(tenddate, 'yyyy-mm-dd') tenddate, tno, bref, brestep, brelevel
    		from task t
    		where tmember = 'sple@kh.co.kr' or t.userid = 'sple@kh.co.kr'
    		order by to_number(pno) desc, to_number(bref) desc, brelevel asc, to_number(brestep) asc
;
select pname from project where pno=1;


select pname, pno, t.userid, tmember, ttitle, tstatus, to_char(tdate, 'yyyy-mm-dd') 
tdate, to_char(tstartdate, 'yyyy-mm-dd') tstartdate, to_char(tenddate, 'yyyy-mm-dd') tenddate, 
tno, bref, brestep, brelevel from project p right join task t using (pno) where tmember = 'sple@kh.co.kr' 
or t.userid = 'sple@kh.co.kr' 
--and ttitle='ttitle1' 
order by to_number(pno) desc, to_number(bref) 
desc, brelevel asc, ttitle asc 
;

select pname, pno, t.userid, tmember, ttitle, tstatus, to_char(tdate, 'yyyy-mm-dd') tdate, 
to_char(tstartdate, 'yyyy-mm-dd') tstartdate, to_char(tenddate, 'yyyy-mm-dd') tenddate, tno, 
bref, brestep, brelevel from project p right join task t using (pno) where tmember = 'sple@kh.co.kr' 
or t.userid = 'sple@kh.co.kr' order by to_number(pno) desc, to_number(bref) desc, brelevel 
asc, to_number(brestep) asc 
;




-- 강사님 수정. panme 하나 불러오면서 project join 하는건 비생산적.
select (select pname from project where pno=t.pno), pno, userid, tmember, ttitle, tstatus, to_char(tdate, 'yyyy-mm-dd') 
                tdate, to_char(tstartdate, 'yyyy-mm-dd') tstartdate, to_char(tenddate, 'yyyy-mm-dd') tenddate, 
tno, bref, brestep, brelevel 
from 
(
select * from task where tmember = 'sple@kh.co.kr' or userid = 'sple@kh.co.kr'
) t 
order by 
to_number(pno) desc
, brelevel asc
, ttitle asc 
--, to_number(bref) desc
--, ttitle asc 
;
desc task;

select (select pname from project where pno=t.pno) pname, pno, t.userid, tmember, ttitle, tstatus, to_char(tdate, 'yyyy-mm-dd') tdate, to_char(tstartdate, 'yyyy-mm-dd') tstartdate, to_char(tenddate, 'yyyy-mm-dd') tenddate, tno, bref, brestep, brelevel
    	from (select * from task t where pno=6 and tmember = 'sple@kh.co.kr' or t.userid='sple@kh.co.kr' ) t
    	order by to_number(pno) desc, to_number(bref) desc, brelevel asc, 
        to_number(brestep) asc
;

select mname, mrank, pmember, pmaster, deptname, deptno, ccode, pno, pname, pcontent, paccess, pdate, pstartdate, penddate, pcolor, pstatus
    from(
        select mname, mrank, userid, deptno, ccode from users where userid = 'sple@kh.co.kr') users
    join dept dept using(deptno, ccode)
    join (select pno, ppr.userid pmaster, pname, pcontent, paccess, pdate, pstartdate, penddate, pcolor, pstatus, jj.userid pmember
    from project ppr
    join (select mp.pno, userid
            from project pr
            join member_project mp using(userid)
           
            group by (mp.pno, userid)
            ) jj using(pno)) on (userid = pmember)
    ;
    
select (select pname from project where pno=t.pno) pname, pno, t.userid, tmember, ttitle, tstatus, to_char(tdate, 'yyyy-mm-dd') tdate, to_char(tstartdate, 'yyyy-mm-dd') tstartdate, to_char(tenddate, 'yyyy-mm-dd') tenddate, tno, bref, brestep, brelevel
    		from
    		(select tno, pno, userid, tmember, ttitle, tcontent, tstatus, tdate, tstartdate, tenddate, bref, brestep, brelevel
    			from task where tmember = 'sple@kh.co.kr' or userid = 'sple@kh.co.kr') t
    		order by to_number(pno) desc, to_number(bref) desc, brelevel asc, to_number(brestep) asc;
            
select mname from users where userid = 'sple@kh.co.kr';
select count(*) from task where tmember = 'mplsam@kh.co.kr';

select (select pname from project where pno=t.pno) pname, 
       (select mname from users where userid='sple@kh.co.kr') mname,
        pno, t.userid, tmember, ttitle, tstatus, to_char(tdate, 'yyyy-mm-dd') tdate, to_char(tstartdate, 'yyyy-mm-dd') tstartdate, to_char(tenddate, 'yyyy-mm-dd') tenddate, tno, bref, brestep, brelevel
    		from
    		(select tno, pno, userid, tmember, ttitle, tcontent, tstatus, tdate, tstartdate, tenddate, bref, brestep, brelevel
    			from task where tmember = 'sple@kh.co.kr' or userid = 'sple@kh.co.kr') t
    		order by to_number(pno) desc, to_number(bref) desc, brelevel asc, to_number(brestep)
;
select * from 
(
SELECT SNO, USERID, mname, to_char(SSTART, 'yyyy-mm-dd') SSTART, to_char(SEND, 'yyyy-mm-dd') SEND, STITLE, SCOLOR, SPLACE, SMEMO, PNO, ATTENDUSERID , ATTENDNAME
		FROM v_u_schedule tbs left outer join v_u_member_schedule tbms using(sno) 
		where pno=6)
        left join task using(pno, userid)        
;
select count(*) from schedule where userid='mplsam@kh.co.kr';

select pno, tno, ttitle, tstartdate, tenddate, sno, userid, mname, SSTART, SEND, STITLE, SCOLOR, SPLACE, SMEMO, PNO, ATTENDUSERID , ATTENDNAME
from (SELECT SNO, USERID, mname, to_char(SSTART, 'yyyy-mm-dd') SSTART, to_char(SEND, 'yyyy-mm-dd') SEND, STITLE, SCOLOR, SPLACE, SMEMO, PNO, ATTENDUSERID , ATTENDNAME
		FROM v_u_schedule tbs left outer join v_u_member_schedule tbms using(sno) 
		where pno=6)
        right join task using(pno, userid) 
; 		
select * from member_schedule join task on (tmember=attenduserid) where pno=6;

           
select pname, pstatus, pno, t.userid, tmember, ttitle, tstatus, to_char(tdate, 'yyyy-mm-dd') tdate, to_char(tstartdate, 'yyyy-mm-dd') tstartdate, to_char(tenddate, 'yyyy-mm-dd') tenddate, tno, bref, brestep, brelevel
    from
    (select tno, pno, userid, tmember, ttitle, tcontent, tstatus, tdate, tstartdate, tenddate, bref, brestep, brelevel
        from task where tmember = 'sple@kh.co.kr' or userid = 'sple@kh.co.kr') t
    join project using(pno)
        where pstatus in ('미진행', '진행', '보류')
    order by to_number(pno) desc, to_number(bref) desc, brelevel asc, to_number(brestep) asc, to_number(tno) desc
;

select mname, pname, pno, p.userid, t.userid, tmember, ttitle, tstatus, to_char(tdate, 'yyyy-mm-dd') 
tdate, to_char(tstartdate, 'yyyy-mm-dd') tstartdate, to_char(tenddate, 'yyyy-mm-dd') tenddate, 
tno, bref, brestep, brelevel 
from project p 
right join (select * from task t where pno='8') t using (pno) 
where tmember = 'sple@kh.co.kr' or t.userid='sple@kh.co.kr' 
order by to_number(pno) desc, to_number(bref) desc, brelevel asc, to_number(brestep) asc 
;
select pname, pno, p.userid, t.userid, tmember, ttitle, tstatus, to_char(tdate, 'yyyy-mm-dd') 
tdate, to_char(tstartdate, 'yyyy-mm-dd') tstartdate, to_char(tenddate, 'yyyy-mm-dd') tenddate, tno, bref, brestep, brelevel
from project p 
right join (select * from task t where pno=8) t using (pno)
where tmember = 'sple@kh.co.kr'  or t.userid='sple@kh.co.kr'  
order by to_number(pno) desc, to_number(bref) desc, brelevel asc 
;
select (select pname from project where pno=t.pno) pname, pno, t.userid, tmember, ttitle, tstatus, to_char(tdate, 'yyyy-mm-dd') tdate, to_char(tstartdate, 'yyyy-mm-dd') tstartdate, to_char(tenddate, 'yyyy-mm-dd') tenddate, tno, bref, brestep, brelevel
    	from (select pno, userid, tmember, ttitle, tstatus, tdate, tstartdate, tenddate, tno, bref, brestep, brelevel 
                    from task where pno=8 and tmember = 'sple@kh.co.kr' or userid= 'sple@kh.co.kr' ) t
    	order by to_number(pno) desc, to_number(bref) desc, brelevel asc, 
        to_number(brestep) asc
;

select (select pname from project where pno=t.pno) pname, pno, t.userid, tmember, ttitle, tstatus, to_char(tdate, 'yyyy-mm-dd') tdate, to_char(tstartdate, 'yyyy-mm-dd') tstartdate, to_char(tenddate, 'yyyy-mm-dd') tenddate, tno, bref, brestep, brelevel
    	from (select pno, userid, tmember, ttitle, tstatus, tdate, tstartdate, tenddate, tno, bref, brestep, brelevel 
                    from task where pno=8 and tmember = 'sple@kh.co.kr' or userid= 'sple@kh.co.kr' ) t
    	order by to_number(pno) desc, to_number(bref) desc, brelevel asc, 
        to_number(brestep) asc
;
select pname, pstatus, pno, tno, t.userid, tmember, ttitle, tstatus, to_char(tdate, 'yyyy-mm-dd') tdate, to_char(tstartdate, 'yyyy-mm-dd') tstartdate, to_char(tenddate, 'yyyy-mm-dd') tenddate, bref, brestep, brelevel
    	from	
    		(select tno, pno, userid, tmember, ttitle, tcontent, tstatus, tdate, tstartdate, tenddate, bref, brestep, brelevel
        		from task where tmember = 'sple@kh.co.kr' or userid = 'sple@kh.co.kr') t
    	join project using(pno)
        where pstatus in ('미진행', '진행', '보류')
    	order by to_number(pno) desc, to_number(bref) desc, brelevel asc,
        to_number(tno) asc
        
        ;
        
select mname, userid from users;

select pno, tno, userid, tmember
    from task
    where tmember = 'sple@kh.co.kr';
    
select pname, pstatus, pno, t.userid, tmember, ttitle, tstatus, to_char(tdate, 'yyyy-mm-dd') 
tdate, to_char(tstartdate, 'yyyy-mm-dd') tstartdate, to_char(tenddate, 'yyyy-mm-dd') tenddate, 
tno, bref, brestep, brelevel from (select tno, pno, userid, tmember, ttitle, tcontent, tstatus, 
tdate, tstartdate, tenddate, bref, brestep, brelevel from task where tmember = 'sple@kh.co.kr' 
or userid = 'sple@kh.co.kr') t join project using(pno) where pstatus in ('미진행', '진행', '보류') 
order by to_number(pno) desc, to_number(bref) desc, brelevel asc, to_number(brestep) asc ;



select j.userid, pr.userid attend, pno
    from project j
    join member_project pr using(pno)
    order by to_number(pno) asc
;
select pno, userid attenduser
    from member_project
    where userid='sple@kh.co.kr'
;
select userid, attenduser, pno
from project j
join (select pno, userid attenduser
            from member_project
            where userid='sple@kh.co.kr')
            using (pno)
;
--create view v_u_member_project
--as
--select PNO, USERID, MNAME, CCODE, DEPTNO
--from member_project join users using(userid)

--create view  v_p_member_project
select pno, pmaster, mname, ccode, deptno
    from v_u_member_project vv
    join (select userid pmaster, attenduser userid, pno
                from project j
                            join (select pno, userid attenduser
                                    from member_project
                                        where userid='sple@kh.co.kr')
                                        using (pno)) jj
    using(pno, userid)
    
    join (select userid, mname, mrank, deptno, deptname, ccode
            from users 
            join dept using(ccode, deptno)
            where userid='sple@kh.co.kr')
    using(userid, mname, ccode, deptno)
   
    order by to_number(pno) asc
;

select userid, mname, mrank from users;
select deptno, deptname, ccode from dept;

select userid, mname, mrank, deptno, deptname, ccode
    from users 
    join dept using(ccode, deptno)
    where userid='sple@kh.co.kr'
    ;
    
select count(distinct(ccode)) ccnt, count(distinct(pno)) pcnt, count(distinct(tno)) tcnt
    from company c
    left join users u using (ccode)
    left join project p using (userid)
    left join task t using (pno);
    
    select count(ccode) from company;
    
select ccode, cname, cphone, caddress from company where ccode not in 'C000' order by ccode asc;

select count(distinct(ccode)) ccnt, count(distinct(pno)) pcnt, count(distinct(tno)) tcnt
    from company c
    left join users u using (ccode)
    left join project p using (userid)
    left join task t using (pno)
    where ccode not in 'C000'
;
select rn, ccode, cname, cphone, caddress
    from (select rownum rn, ccode,cname,cphone, caddress
                from (select ccode, cname, cphone, caddress 
                            from company where ccode not in'C000' order by ccode asc) a )
  
    ;
    
select pname, pstatus, pno, t.userid, tmember, ttitle, tstatus, to_char(tdate, 'yyyy-mm-dd') tdate, to_char(tstartdate, 'yyyy-mm-dd') tstartdate, to_char(tenddate, 'yyyy-mm-dd') tenddate, tno, bref, brestep, brelevel
    	from	
    		(select tno, pno, userid, tmember, ttitle, tcontent, tstatus, tdate, tstartdate, tenddate, bref, brestep, brelevel
        		from task where tmember = 'sple@kh.co.kr' or userid = 'sple@kh.co.kr') t
    	join project using(pno)
        where pstatus in ('미진행', '진행', '보류')
    	order by to_number(pno) desc, to_number(bref) desc, brelevel asc, to_number(brestep) asc
;
select t.userid, t.tmember, mname from task t
--    join users using(userid)
    join users u on(u.userid=t.tmember)
;
select pname, pstatus, pno, ut.userid, tmember, ttitle, tstatus, to_char(tdate, 'yyyy-mm-dd') tdate, to_char(tstartdate, 'yyyy-mm-dd') tstartdate, to_char(tenddate, 'yyyy-mm-dd') tenddate, tno, bref, brestep, brelevel, mname
    	from ( select tno, pno, t.userid, tmember, ttitle, tcontent, tstatus, tdate, tstartdate, tenddate, bref, brestep, brelevel, mname
                    from task t
                    join users u on(u.userid=t.tmember)
                    where tmember = 'sple@kh.co.kr' or t.userid = 'sple@kh.co.kr') ut
        join project using(pno)
        where pstatus in ('미진행', '진행', '보류')
    	order by to_number(pno) desc, to_number(bref) desc, brelevel asc, to_number(brestep) asc
 ;
 
 
select (select pname from project where pno=t.pno) pname, pno, t.userid, tmember, ttitle, tstatus, to_char(tdate, 'yyyy-mm-dd') tdate, to_char(tstartdate, 'yyyy-mm-dd') tstartdate, to_char(tenddate, 'yyyy-mm-dd') tenddate, tno, bref, brestep, brelevel
    	from (select pno, userid, tmember, ttitle, tstatus, tdate, tstartdate, tenddate, tno, bref, brestep, brelevel 
                    from task where pno=47 and tmember ='sple@kh.co.kr' or userid='sple@kh.co.kr' ) t
    	order by to_number(pno) desc, to_number(bref) desc, brelevel asc, 
        to_number(brestep) asc
;
select userid, mname from users where userid='sple@kh.co.kr';

select pname, pstatus, pno, ut.userid, tmember, ttitle, tstatus, to_char(tdate, 'yyyy-mm-dd') tdate, to_char(tstartdate, 'yyyy-mm-dd') tstartdate, to_char(tenddate, 'yyyy-mm-dd') tenddate, tno, bref, brestep, brelevel, mname
    	from ( select tno, pno, t.userid, tmember, ttitle, tcontent, tstatus, tdate, tstartdate, tenddate, bref, brestep, brelevel, mname
                    from task t
                    join users u on(u.userid=t.tmember)
                    where tmember = 'sple@kh.co.kr' or t.userid = 'sple@kh.co.kr') ut
        join project using(pno)
        where pstatus in ('미진행', '진행', '보류')
    	order by to_number(pno) desc, to_number(bref) desc, brelevel asc, to_number(brestep) asc;
        
select (select pname from project where pno=t.pno) pname, pno, t.userid, tmember, ttitle, tstatus, to_char(tdate, 'yyyy-mm-dd') tdate, to_char(tstartdate, 'yyyy-mm-dd') tstartdate, to_char(tenddate, 'yyyy-mm-dd') tenddate, tno, bref, brestep, brelevel
    	from (select pno, userid, tmember, ttitle, tstatus, tdate, tstartdate, tenddate, tno, bref, brestep, brelevel 
                    from task where pno=47 and tmember ='sple@kh.co.kr' or userid='sple@kh.co.kr' ) t
    	order by to_number(pno) desc, to_number(bref) desc, brelevel asc, 
        to_number(brestep) asc;
        
select (select pname from project where pno=t.pno) pname, pno, t.userid, tmember, ttitle, tstatus, to_char(tdate, 'yyyy-mm-dd') tdate, to_char(tstartdate, 'yyyy-mm-dd') tstartdate, to_char(tenddate, 'yyyy-mm-dd') tenddate, tno, bref, brestep, brelevel
    	from (select pno, userid, tmember, ttitle, tstatus, tdate, tstartdate, tenddate, tno, bref, brestep, brelevel 
                    from task where pno=47 and tmember = 'sple@kh.co.kr' ) t
    	order by to_number(pno) desc, to_number(bref) desc, brelevel asc, 
        to_number(brestep) asc
;

select ccode, cname from company;
select deptname, ccode from dept;

select (select count(pno) from project) cntpno, 
        (select count(tno) from task) cnttno, 
        (select count(userid) from users) cntuid
    from dual
    ;

select deptno, deptname, userid, mname
    from users join dept using(deptno, ccode)
    where ccode='C001'
    order by deptno asc
;

select deptname, userid
    from dept 
    join users using(deptno, ccode)
    where ccode='C001';
    
select ccode, pno 
    from project
    join users using(userid)
    where ccode='C001'
    ;
    
select count(pno)over(partition by ccode), CCODE
    from project
    join users using(userid)
    where ccode='C001'
    ;

select count(tno)over(partition by pno), pno
    from task
    order by to_number(pno)
;
select pno
    from (select pno from project join users using (userid) where ccode='C001')
    
   
;
WITH CompanyInfo AS (
    SELECT
        C.CCODE AS "회사코드",
        C.CNAME AS "회사명",
        D.DEPTNO AS "부서번호",
        D.DEPTNAME AS "부서명",
        COUNT(U.USERID) AS "인원수",
        COUNT(DISTINCT P.PNO) AS "프로젝트수",
        COUNT(DISTINCT T.TNO) AS "작업수"
    FROM COMPANY C
    JOIN DEPT D ON C.CCODE = D.CCODE
    LEFT JOIN USERS U ON D.DEPTNO = U.DEPTNO AND D.CCODE = U.CCODE
    LEFT JOIN PROJECT P ON U.USERID = P.USERID
    LEFT JOIN TASK T ON P.PNO = T.PNO
    WHERE C.CCODE = 'C001'
    GROUP BY C.CCODE, C.CNAME, D.DEPTNO, D.DEPTNAME
)
SELECT
    "회사코드",
    "회사명",
    "부서번호",
    "부서명",
    "인원수",
    "프로젝트수",
    "작업수",
    SUM("프로젝트수") OVER () AS "프로젝트수_전체",
    SUM("작업수") OVER () AS "작업수_전체"
FROM CompanyInfo;

SELECT
    C.CCODE AS "회사코드",
    C.CNAME AS "회사명",
    D.DEPTNO AS "부서번호",
    D.DEPTNAME AS "부서명",
    COUNT(U.USERID) AS "인원수",
    COUNT(DISTINCT P.PNO) AS "프로젝트수",
    COUNT(DISTINCT T.TNO) AS "작업수"
FROM COMPANY C
JOIN DEPT D ON C.CCODE = D.CCODE
LEFT JOIN USERS U ON D.DEPTNO = U.DEPTNO AND D.CCODE = U.CCODE
LEFT JOIN PROJECT P ON U.USERID = P.USERID
LEFT JOIN TASK T ON P.PNO = T.PNO
WHERE C.CCODE = 'C001'
GROUP BY C.CCODE, C.CNAME, D.DEPTNO, D.DEPTNAME;


SELECT
        C.CCODE AS ccode,
        C.CNAME AS cname,
        D.DEPTNO AS deptno,
        D.DEPTNAME AS deptname,
        COUNT(U.USERID) AS ucnt,
        COUNT(DISTINCT P.PNO) AS pcnt,
        COUNT(DISTINCT T.TNO) AS tcnt
    FROM COMPANY C
    JOIN DEPT D ON C.CCODE = D.CCODE
    LEFT JOIN USERS U ON D.DEPTNO = U.DEPTNO AND D.CCODE = U.CCODE
    LEFT JOIN PROJECT P ON U.USERID = P.USERID
    LEFT JOIN TASK T ON P.PNO = T.PNO
    WHERE C.CCODE = 'C001'
    GROUP BY C.CCODE, C.CNAME, D.DEPTNO, D.DEPTNAME
;


select pdate, pname from project join users using(userid) where ccode='C001';
select pno, pstatus from project join users using(userid) where ccode='C001' ;


select pstatus, count(pno) piecount
    from project
    join users using(userid)
    where ccode='C001'
    group by pstatus;
    
    
select pname, pstatus, pno, ut.userid, tmember, ttitle, tstatus, to_char(tdate, 'yyyy-mm-dd') tdate, to_char(tstartdate, 'yyyy-mm-dd') tstartdate, to_char(tenddate, 'yyyy-mm-dd') tenddate, tno, bref, brestep, brelevel, mname
    	from ( select tno, pno, t.userid, tmember, ttitle, tcontent, tstatus, tdate, tstartdate, tenddate, bref, brestep, brelevel, mname
                    from task t
                    join users u on(u.userid=t.tmember)
                    where tmember = 'sple@kh.co.kr' or t.userid = 'sple@kh.co.kr' )ut
        join project using(pno)
        where pstatus in ('미진행', '진행', '보류') and pno=6
    	order by to_number(pno) desc, to_number(bref) desc, brelevel asc, to_number(brestep) asc
;
select pname, pstatus, pno, ut.userid, tmember, ttitle, tstatus, to_char(tdate, 'yyyy-mm-dd') tdate, to_char(tstartdate, 'yyyy-mm-dd') tstartdate, to_char(tenddate, 'yyyy-mm-dd') tenddate, tno, bref, brestep, brelevel, mname
    	from ( select tno, pno, t.userid, tmember, ttitle, tcontent, tstatus, tdate, tstartdate, tenddate, bref, brestep, brelevel, mname
                    from task t
                    join users u on(u.userid=t.tmember)
                    where tmember = 'sple@kh.co.kr' or t.userid = 'sple@kh.co.kr' )ut
        join project using(pno)
        where pstatus in ('미진행', '진행', '보류')
    	order by to_number(pno) desc, to_number(bref) desc, brelevel asc, to_number(brestep) asc
;    
select pname, pstatus, pno, ut.userid, tmember, ttitle, tstatus, to_char(tdate, 'yyyy-mm-dd') tdate, to_char(tstartdate, 'yyyy-mm-dd') tstartdate, to_char(tenddate, 'yyyy-mm-dd') tenddate, tno, bref, brestep, brelevel, mname
    	from ( select tno, pno, t.userid, tmember, ttitle, tcontent, tstatus, tdate, tstartdate, tenddate, bref, brestep, brelevel, mname
                    from task t
                    join users u on(u.userid=t.tmember)
                    where tmember = 'sple@kh.co.kr' or t.userid = 'sple@kh.co.kr' )ut
        join project using(pno)
        where pstatus in ('미진행', '진행', '보류')
    	order by to_number(pno) desc, to_number(bref) desc, brelevel asc, to_number(brestep) asc
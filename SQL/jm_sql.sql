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
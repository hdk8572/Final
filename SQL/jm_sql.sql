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

select pname, pno, ttitle, userid, tstatus, tdate, tstartdate, tenddate
    from project join task using(pno, userid)
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
commit;
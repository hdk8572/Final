create or replace procedure insertInnerTask
(
        p_tno IN task.tno%type
        ,p_pno  IN task.pno%type
        ,p_userid  IN task.userid%type
        ,p_tmember  IN task.tmember%type
        ,p_ttitle  IN task.ttitle%type
        ,p_tstatus  IN task.tstatus%type
        ,p_tstartdate  IN task.tstartdate%type
        ,p_tenddate  IN task.tenddate%type
) as
 r_result number;
begin
    r_result := 0;
    update task set brestep=brestep+1
        where brestep > (select brestep from task where tno = p_tno)
        and bref = (select bref from task where tno=p_tno);
        
    insert into task (TNO, PNO, USERID, tmember, TTITLE, tcontent, TSTATUS, TDATE, tstartdate, tenddate, BREF, BRESTEP, BRELEVEL)
        values (
            task_sequence.NEXTVAL, p_pno, p_userid, p_tmember, p_ttitle, 'DEFAULT', p_tstatus, 
                    sysdate, p_tstartdate, p_tenddate, 
                (select bref from task where tno=p_tno),
                (select brestep+1 from task where tno=p_tno),
                (select brelevel+1 from task where tno=p_tno)
                );
    r_result := 1;
    commit;
EXCEPTION 
    WHEN OTHERS THEN
    r_result:=0;
    rollback;
end;
/

variable r_result number;

exec insertInnerTask('9', '3', 'streamjj@naver.co.kr', 'streamjj2@naver.co.kr', 'TEST02', '진행', '2023-10-30', '2023-10-31')
;

--update task set BRESTEP = BRESTEP +1 where BRESTEP > (SELECT BRESTEP FROM task WHERE tno = 
--'9') and BREF = (select bref from task where tno = '9') 

--insert into task (TNO, PNO, USERID, tmember, TTITLE, tcontent, TSTATUS, TDATE, tstartdate, 
--tenddate, BREF, BRESTEP, BRELEVEL) values ( task_sequence.NEXTVAL, '3', 'streamjj@naver.co.kr', 
--'streamjj2@naver.co.kr', 'TEST01', 'DEFAULT', '진행', sysdate, '2023-10-30', '2023-10-31', (select 
--bref from task where tno='9'), (select brestep+1 from task where tno='9'), (select brelevel+1 
--from task where tno='9') ) 
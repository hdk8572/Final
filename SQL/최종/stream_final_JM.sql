insert into task (TNO, PNO, USERID, TMEMBER, TTITLE, TCONTENT, TSTATUS, 
                    tstartdate, tenddate, bref, brelevel, brestep)
    values (task_sequence.NEXTVAL, '3', 'streamjj@naver.co.kr', 'streamjj1@naver.co.kr', '업무 01', 'default', '진행',
            '2023-10-06', '2023-10-11', '9', '1', '1');       
insert into task (TNO, PNO, USERID, TMEMBER, TTITLE, TCONTENT, TSTATUS, 
                    tstartdate, tenddate, bref, brelevel, brestep)
    values (task_sequence.NEXTVAL, '3', 'streamjj1@naver.co.kr', 'streamjj@naver.co.kr', '업무 02', 'default', '미진행',
            '2023-10-17', '2023-10-21', '9', '1', '2');


commit;
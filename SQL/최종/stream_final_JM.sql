--Project
insert into project(PNO, USERID, PNAME, PCONTENT, PACCESS, PSTARTDATE, PENDDATE, PCOLOR, PSTATUS)
    values (project_sequence.NEXTVAL, 'streamjj1@naver.co.kr', '발표준비', '발표준비를 해야 합니다.', 'ACCESS',
            '2023-10-03', '2023-10-30', concat('RGB('||ROUND(DBMS_RANDOM.VALUE(200, 
                255))||' '||ROUND(DBMS_RANDOM.VALUE(0, 255))||' '||ROUND(DBMS_RANDOM.VALUE(0, 255)), ')'),'미진행');

insert into project(PNO, USERID, PNAME, PCONTENT, PACCESS, PSTARTDATE, PENDDATE, PCOLOR, PSTATUS)
    values (project_sequence.NEXTVAL, 'streamjj1@naver.co.kr', '깃허브 리드미 수정', '리드미 수정을 해야 합니다.', 'ACCESS',
            '2023-10-22', '2023-10-30', concat('RGB('||ROUND(DBMS_RANDOM.VALUE(200, 
                255))||' '||ROUND(DBMS_RANDOM.VALUE(0, 255))||' '||ROUND(DBMS_RANDOM.VALUE(0, 255)), ')'),'숨김');

insert into project(PNO, USERID, PNAME, PCONTENT, PACCESS, PSTARTDATE, PENDDATE, PCOLOR, PSTATUS)
    values (project_sequence.NEXTVAL, 'streamjj4@naver.co.kr', '보류된 기획입니다.', '보류.', 'ACCESS',
            '2023-10-22', '2023-10-30', concat('RGB('||ROUND(DBMS_RANDOM.VALUE(200, 
                255))||' '||ROUND(DBMS_RANDOM.VALUE(0, 255))||' '||ROUND(DBMS_RANDOM.VALUE(0, 255)), ')'),'보류');
                

--Member-Project  // PNO=4
insert into member_project(pno, userid)
    values('4', 'streamjj@naver.co.kr');
insert into member_project(pno, userid)
    values('4', 'streamjj1@naver.co.kr'); 
insert into member_project(pno, userid)
    values('4', 'streamjj2@naver.co.kr');
insert into member_project(pno, userid)
    values('4', 'streamjj3@naver.co.kr');   
insert into member_project(pno, userid)
    values('4', 'streamjj4@naver.co.kr');    
    
--InnerTask // PNO=3 // TNO=9
insert into task (TNO, PNO, USERID, TMEMBER, TTITLE, TCONTENT, TSTATUS, 
                    tstartdate, tenddate, bref, brelevel, brestep)
    values (task_sequence.NEXTVAL, '3', 'streamjj@naver.co.kr', 'streamjj1@naver.co.kr', '업무 01', 'default', '진행',
            '2023-10-06', '2023-10-11', '9', '1', '1');      
            
insert into task (TNO, PNO, USERID, TMEMBER, TTITLE, TCONTENT, TSTATUS, 
                    tstartdate, tenddate, bref, brelevel, brestep)
    values (task_sequence.NEXTVAL, '3', 'streamjj1@naver.co.kr', 'streamjj@naver.co.kr', '업무 02', 'default', '미진행',
            '2023-10-17', '2023-10-21', '9', '1', '2');

insert into task (TNO, PNO, USERID, TMEMBER, TTITLE, TCONTENT, TSTATUS, 
                    tstartdate, tenddate, bref, brelevel, brestep)
    values (task_sequence.NEXTVAL, '3', 'streamjj@naver.co.kr', 'streamjj3@naver.co.kr', '업무 03', 'default', '보류',
            '2023-10-17', '2023-10-21', '9', '1', '3');
            
commit;
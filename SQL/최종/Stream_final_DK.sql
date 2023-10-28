INSERT ALL INTO PROJECT (PNO, USERID, PNAME, PCONTENT, PACCESS, PSTARTDATE, PENDDATE, PCOLOR, 
PSTATUS) VALUES (project_sequence.NEXTVAL, 'streamjj@naver.co.kr', '공공데이터 융합 자바개발자 양성과정A23', '[강남 L] 2023. 05. 17 ~ 2023. 10. 31 ｜ 09:00 ~ 18:00
김은주 강사님 | 유진영 취업담임', 'ACCESS', '2023-05-17', '2023-10-31', concat('RGB('||ROUND(DBMS_RANDOM.VALUE(200, 
255))||' '||ROUND(DBMS_RANDOM.VALUE(0, 255))||' '||ROUND(DBMS_RANDOM.VALUE(0, 255)), ')'),'진행') 
INTO MEMBER_PROJECT(PNO, USERID) values (project_sequence.NEXTVAL, 'streamjj1@naver.co.kr' 
) INTO MEMBER_PROJECT(PNO, USERID) values (project_sequence.NEXTVAL, 'streamjj2@naver.co.kr' 
) INTO MEMBER_PROJECT(PNO, USERID) values (project_sequence.NEXTVAL, 'streamjj3@naver.co.kr' 
) INTO MEMBER_PROJECT(PNO, USERID) values (project_sequence.NEXTVAL, 'streamjj4@naver.co.kr' 
) INTO MEMBER_PROJECT(PNO, USERID) values (project_sequence.NEXTVAL, 'streamjj@naver.co.kr' 
) SELECT * FROM DUAL;

INSERT ALL INTO PROJECT (PNO, USERID, PNAME, PCONTENT, PACCESS, PSTARTDATE, PENDDATE, PCOLOR, 
PSTATUS) VALUES (project_sequence.NEXTVAL, 'streamjj1@naver.co.kr', '포트폴리오 제작', '취업을 위한 포트폴리오 
제작 프로젝트', 'ACCESS', '2023-09-12', '2023-10-31', concat('RGB('||ROUND(DBMS_RANDOM.VALUE(200, 
255))||' '||ROUND(DBMS_RANDOM.VALUE(0, 255))||' '||ROUND(DBMS_RANDOM.VALUE(0, 255)), ')'),'진행') 
INTO MEMBER_PROJECT(PNO, USERID) values (project_sequence.NEXTVAL, 'streamjj1@naver.co.kr' 
) INTO MEMBER_PROJECT(PNO, USERID) values (project_sequence.NEXTVAL, 'streamjj2@naver.co.kr' 
) INTO MEMBER_PROJECT(PNO, USERID) values (project_sequence.NEXTVAL, 'streamjj3@naver.co.kr' 
) INTO MEMBER_PROJECT(PNO, USERID) values (project_sequence.NEXTVAL, 'streamjj4@naver.co.kr' 
) INTO MEMBER_PROJECT(PNO, USERID) values (project_sequence.NEXTVAL, 'streamjj@naver.co.kr' 
) SELECT * FROM DUAL;

INSERT ALL INTO PROJECT (PNO, USERID, PNAME, PCONTENT, PACCESS, PSTARTDATE, PENDDATE, PCOLOR, 
PSTATUS) VALUES (project_sequence.NEXTVAL, 'streamjj2@naver.co.kr', '프로젝트 깃허브주소', 'https://github.com/hdk8572/Final<br>위 주소를 확인해주세요',
'ACCESS', '2023-10-01', '2023-10-31', concat('RGB('||ROUND(DBMS_RANDOM.VALUE(200, 
255))||' '||ROUND(DBMS_RANDOM.VALUE(0, 255))||' '||ROUND(DBMS_RANDOM.VALUE(0, 255)), ')'),'진행') 
INTO MEMBER_PROJECT(PNO, USERID) values (project_sequence.NEXTVAL, 'streamjj1@naver.co.kr' 
) INTO MEMBER_PROJECT(PNO, USERID) values (project_sequence.NEXTVAL, 'streamjj2@naver.co.kr' 
) INTO MEMBER_PROJECT(PNO, USERID) values (project_sequence.NEXTVAL, 'streamjj3@naver.co.kr' 
) INTO MEMBER_PROJECT(PNO, USERID) values (project_sequence.NEXTVAL, 'streamjj4@naver.co.kr' 
) INTO MEMBER_PROJECT(PNO, USERID) values (project_sequence.NEXTVAL, 'streamjj@naver.co.kr' 
) SELECT * FROM DUAL;

-- 공공데이터 융합 자바개발자 양성과정A23 - 업무 목록
INSERT INTO TASK (TNO, PNO, USERID, TMEMBER, TTITLE, TCONTENT, TSTATUS, tstartdate, tenddate, 
bref, brelevel, brestep) VALUES (task_sequence.NEXTVAL, '1', 'streamjj1@naver.co.kr', 'streamjj1@naver.co.kr', 
'1_프로그래밍 기초', '1_프로그래밍 기초', '진행', '2023-10-29', '2023-10-31', '1', '0', '0')
;

INSERT INTO TASK (TNO, PNO, USERID, TMEMBER, TTITLE, TCONTENT, TSTATUS, tstartdate, tenddate, 
bref, brelevel, brestep) VALUES (task_sequence.NEXTVAL, '1', 'streamjj1@naver.co.kr', 'streamjj1@naver.co.kr', 
'2_변수', '2_변수', '진행', '2023-10-29', '2023-10-30', '1', '0', '0')
;

INSERT INTO TASK (TNO, PNO, USERID, TMEMBER, TTITLE, TCONTENT, TSTATUS, tstartdate, tenddate, 
bref, brelevel, brestep) VALUES (task_sequence.NEXTVAL, '1', 'streamjj3@naver.co.kr', 'streamjj3@naver.co.kr', 
'3_연산자', '3_연산자', '진행', '2023-10-02', '2023-10-31', '1', '0', '0')
;

INSERT INTO TASK (TNO, PNO, USERID, TMEMBER, TTITLE, TCONTENT, TSTATUS, tstartdate, tenddate, 
bref, brelevel, brestep) VALUES (task_sequence.NEXTVAL, '1', 'streamjj2@naver.co.kr', 'streamjj2@naver.co.kr', 
'4_제어문', '4_제어문', '진행', '2023-10-04', '2023-10-31', '1', '0', '0')
;

-- 포트폴리오 제작 - 업무 목록
INSERT INTO TASK (TNO, PNO, USERID, TMEMBER, TTITLE, TCONTENT, TSTATUS, tstartdate, tenddate, 
bref, brelevel, brestep) VALUES (task_sequence.NEXTVAL, '2', 'streamjj1@naver.co.kr', 'streamjj1@naver.co.kr', 
'템플릿 선정', '템플릿을 선정해주세요', '진행', '2023-10-01', '2023-10-31', '1', '0', '0')
;

INSERT INTO TASK (TNO, PNO, USERID, TMEMBER, TTITLE, TCONTENT, TSTATUS, tstartdate, tenddate, 
bref, brelevel, brestep) VALUES (task_sequence.NEXTVAL, '2', 'streamjj2@naver.co.kr', 'streamjj2@naver.co.kr', 
'유스케이스 작성', '유스케이스 작성해주세요', '진행', '2023-10-02', '2023-10-31', '1', '0', '0')
;

INSERT INTO TASK (TNO, PNO, USERID, TMEMBER, TTITLE, TCONTENT, TSTATUS, tstartdate, tenddate, 
bref, brelevel, brestep) VALUES (task_sequence.NEXTVAL, '2', 'streamjj3@naver.co.kr', 'streamjj3@naver.co.kr', 
'클래스다이어그램 작성', '클래스 다이어그램 작성해주세요', '진행', '2023-10-03', '2023-10-31', '1', '0', '0')
;

INSERT INTO TASK (TNO, PNO, USERID, TMEMBER, TTITLE, TCONTENT, TSTATUS, tstartdate, tenddate, 
bref, brelevel, brestep) VALUES (task_sequence.NEXTVAL, '2', 'streamjj@naver.co.kr', 'streamjj@naver.co.kr', 
'화면설계서 작성', '화면설계서 작성해주세요', '진행', '2023-10-03', '2023-10-31', '1', '0', '0')
;

--프로젝트 깃허브주소 - 업무목록
INSERT INTO TASK (TNO, PNO, USERID, TMEMBER, TTITLE, TCONTENT, TSTATUS, tstartdate, tenddate, 
bref, brelevel, brestep) VALUES (task_sequence.NEXTVAL, '3', 'streamjj@naver.co.kr', 'streamjj@naver.co.kr', 
'회원가입 요청드립니다.', '신청했습니다!', '미진행', '2023-10-04', '2023-10-31', '1', '0', '0')
;

INSERT INTO TASK (TNO, PNO, USERID, TMEMBER, TTITLE, TCONTENT, TSTATUS, tstartdate, tenddate, 
bref, brelevel, brestep) VALUES (task_sequence.NEXTVAL, '3', 'streamjj1@naver.co.kr', 'streamjj1@naver.co.kr', 
'회원가입 요청이요.', '확인 부탁드립니다.', '미진행', '2023-10-05', '2023-10-31', '1', '0', '0')
;

INSERT INTO TASK (TNO, PNO, USERID, TMEMBER, TTITLE, TCONTENT, TSTATUS, tstartdate, tenddate, 
bref, brelevel, brestep) VALUES (task_sequence.NEXTVAL, '3', 'streamjj2@naver.co.kr', 'streamjj2@naver.co.kr', 
'회원가입 요청했습니다.', '확인 부탁드립니다.', '미진행', '2023-10-04', '2023-10-31', '1', '0', '0')
;

INSERT INTO TASK (TNO, PNO, USERID, TMEMBER, TTITLE, TCONTENT, TSTATUS, tstartdate, tenddate, 
bref, brelevel, brestep) VALUES (task_sequence.NEXTVAL, '3', 'streamjj3@naver.co.kr', 'streamjj3@naver.co.kr', 
'회원가입 받아주세요', '신청했습니다!', '미진행', '2023-10-04', '2023-10-31', '1', '0', '0')
;

INSERT INTO TASK (TNO, PNO, USERID, TMEMBER, TTITLE, TCONTENT, TSTATUS, tstartdate, tenddate, 
bref, brelevel, brestep) VALUES (task_sequence.NEXTVAL, '3', 'streamjj4@naver.co.kr', 'streamjj4@naver.co.kr', 
'회원가입 요청보냈는데... ', '확인 부탁드립니다.', '미진행', '2023-10-03', '2023-10-31', '1', '0', '0')
;

-- 프로젝트 깃허브주소 - 댓글
INSERT INTO REPLY(RNO, TNO, USERID, RCONTENT, RDATE)
VALUES (replyrno_sequence.nextval, '11', 'streamjj2@naver.co.kr', '가입 승인 되었습니다.', systimestamp)
;

INSERT INTO REPLY(RNO, TNO, USERID, RCONTENT, RDATE)
VALUES (replyrno_sequence.nextval, '11', 'streamjj1@naver.co.kr', '저도 승인해주세요', systimestamp)
;

INSERT INTO REPLY(RNO, TNO, USERID, RCONTENT, RDATE)
VALUES (replyrno_sequence.nextval, '9', 'streamjj2@naver.co.kr', '가입 승인 되었습니다.', systimestamp)
;

INSERT INTO REPLY(RNO, TNO, USERID, RCONTENT, RDATE)
VALUES (replyrno_sequence.nextval, '10', 'streamjj2@naver.co.kr', '가입 승인 되었습니다.', systimestamp)
;

INSERT INTO REPLY(RNO, TNO, USERID, RCONTENT, RDATE)
VALUES (replyrno_sequence.nextval, '12', 'streamjj2@naver.co.kr', '가입 승인 되었습니다.', systimestamp)
;

INSERT INTO REPLY(RNO, TNO, USERID, RCONTENT, RDATE)
VALUES (replyrno_sequence.nextval, '13', 'streamjj2@naver.co.kr', '가입 승인 되었습니다.', systimestamp)
;

commit;
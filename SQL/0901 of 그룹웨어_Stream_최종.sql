DROP TABLE "RANK";
DROP TABLE "ALARM";
DROP TABLE "SCHEDULE";
DROP TABLE "FILES";
DROP TABLE "COMMUTE";
DROP TABLE "REPLY";
DROP TABLE "CHAT_MEMBER";
DROP TABLE "CHAT";
DROP TABLE "MEMBER_PROJECT";
DROP TABLE "TASK";
DROP TABLE "CHATLIST";
DROP TABLE "PROJECT";
DROP TABLE "USERS";
DROP TABLE "WORKSTATE";
DROP TABLE "DEPT";
DROP TABLE "COMPANY";









CREATE TABLE "USERS" (
	"USERID"	VARCHAR2(40)		NOT NULL,
	"DEPTNO"	VARCHAR2(10)		NOT NULL,
	"CCODE"	VARCHAR2(10)		NOT NULL,
	"PASSWORD"	VARCHAR2(20)	DEFAULT 12345	NOT NULL,
	"ENABLED"	NUMBER(1)	DEFAULT 0	NOT NULL,
	"AUTHORITY"	VARCHAR2(3)	DEFAULT 'RC'	NOT NULL,
	"MNAME"	VARCHAR2(30)		NULL,
	"MPHONE"	VARCHAR2(20)		NULL,
	"MRANK"	VARCHAR2(12)		NULL
);

COMMENT ON COLUMN "USERS"."USERID" IS 'EMAIL';

COMMENT ON COLUMN "USERS"."DEPTNO" IS '부서번호';

COMMENT ON COLUMN "USERS"."CCODE" IS '회사코드';

COMMENT ON COLUMN "USERS"."AUTHORITY" IS '관리자 RA, 사장 B, 사원 C';

COMMENT ON COLUMN "USERS"."MNAME" IS '이름';

COMMENT ON COLUMN "USERS"."MPHONE" IS '전화번호';

COMMENT ON COLUMN "USERS"."MRANK" IS '직급';



CREATE TABLE "RANK" (
	"MRANKNO"	NUMBER(1)		NOT NULL,
	"MRANK"	VARCHAR2(12)		NOT NULL
);

COMMENT ON COLUMN "RANK"."MRANKNO" IS '직급분류번호';

COMMENT ON COLUMN "RANK"."MRANK" IS '직급';



CREATE TABLE "PROJECT" (
	"PNO"	VARCHAR2(20)		NOT NULL,
	"USERID"	VARCHAR2(40)		NOT NULL,
	"PNAME"	VARCHAR2(30)		NOT NULL,
	"PCOMENT"	VARCHAR2(300)		NULL,
	"PACCESS"	VARCHAR2(20)		NOT NULL,
	"PDATE"	DATE	DEFAULT SYSDATE	NOT NULL,
	"PSTARTDATE"	DATE		NULL,
	"PENDDATE"	DATE		NULL
);

COMMENT ON COLUMN "PROJECT"."PNO" IS '프로젝트번호';

COMMENT ON COLUMN "PROJECT"."USERID" IS 'EMAIL';

COMMENT ON COLUMN "PROJECT"."PNAME" IS '프로젝트명';

COMMENT ON COLUMN "PROJECT"."PCOMENT" IS '프로젝트설명';

COMMENT ON COLUMN "PROJECT"."PACCESS" IS '허용/불가';

COMMENT ON COLUMN "PROJECT"."PDATE" IS '작성날짜';

COMMENT ON COLUMN "PROJECT"."PSTARTDATE" IS '프로젝트시작날짜';

COMMENT ON COLUMN "PROJECT"."PENDDATE" IS '프로젝트끝날짜';



CREATE TABLE "CHATLIST" (
	"CHATNO"	VARCHAR2(10)		NOT NULL,
	"PNO"	VARCHAR2(20)		NOT NULL,
	"CHATNAME"	VARCHAR2(30)		NOT NULL
);

COMMENT ON COLUMN "CHATLIST"."CHATNO" IS '채팅방번호';

COMMENT ON COLUMN "CHATLIST"."PNO" IS '프로젝트번호';

COMMENT ON COLUMN "CHATLIST"."CHATNAME" IS '채팅방이름';



CREATE TABLE "TASK" (
	"TNO"	VARCHAR2(10)		NOT NULL,
	"PNO"	VARCHAR2(20)		NOT NULL,
	"USERID"	VARCHAR2(40)		NOT NULL,
	"TMEMBER"	VARCHAR2(40)		NOT NULL,
	"TCONTENT"	VARCHAR2(1200)		NOT NULL,
	"TSTATUS"	VARCHAR2(10)		NOT NULL,
	"TDATE"	DATE	DEFAULT SYSDATE	NOT NULL,
	"TSTARTDATE"	DATE		NULL,
	"TENDDATE"	DATE		NULL
);

COMMENT ON COLUMN "TASK"."TNO" IS '글번호';

COMMENT ON COLUMN "TASK"."PNO" IS '프로젝트번호';

COMMENT ON COLUMN "TASK"."USERID" IS 'EMAIL';

COMMENT ON COLUMN "TASK"."TMEMBER" IS 'EMAIL';

COMMENT ON COLUMN "TASK"."TCONTENT" IS '글내용';

COMMENT ON COLUMN "TASK"."TSTATUS" IS '진행도';

COMMENT ON COLUMN "TASK"."TDATE" IS '작성날짜';

COMMENT ON COLUMN "TASK"."TSTARTDATE" IS '시작일';

COMMENT ON COLUMN "TASK"."TENDDATE" IS '마감일';



CREATE TABLE "MEMBER_PROJECT" (
	"PNO"	VARCHAR2(20)		NOT NULL,
	"USERID"	VARCHAR2(40)		NOT NULL
);

COMMENT ON COLUMN "MEMBER_PROJECT"."PNO" IS '프로젝트번호';

COMMENT ON COLUMN "MEMBER_PROJECT"."USERID" IS 'EMAIL';



CREATE TABLE "CHAT" (
	"CCNO"	VARCHAR2(10)		NOT NULL,
	"CHATNO"	VARCHAR2(10)		NOT NULL,
	"USERID"	VARCHAR2(40)		NOT NULL,
	"CCONTENT"	VARCHAR2(300)		NOT NULL,
	"CDATE"	TIMESTAMP	DEFAULT SYSTIMESTAMP	NOT NULL
);

COMMENT ON COLUMN "CHAT"."CCNO" IS '대화순번';

COMMENT ON COLUMN "CHAT"."CHATNO" IS '채팅방번호';

COMMENT ON COLUMN "CHAT"."USERID" IS 'EMAIL';

COMMENT ON COLUMN "CHAT"."CCONTENT" IS '대화내용';

COMMENT ON COLUMN "CHAT"."CDATE" IS '작성날짜';



CREATE TABLE "CHAT_MEMBER" (
	"CHATNO"	VARCHAR2(10)		NOT NULL,
	"USERID"	VARCHAR2(40)		NOT NULL,
	"CLOSED"	TIMESTAMP	DEFAULT SYSTIMESTAMP	NOT NULL
);

COMMENT ON COLUMN "CHAT_MEMBER"."CHATNO" IS '채팅방번호';

COMMENT ON COLUMN "CHAT_MEMBER"."USERID" IS 'EMAIL';

COMMENT ON COLUMN "CHAT_MEMBER"."CLOSED" IS '창닫은시간';



CREATE TABLE "REPLY" (
	"RNO"	VARCHAR2(4)		NOT NULL,
	"TNO"	VARCHAR2(10)		NOT NULL,
	"USERID"	VARCHAR2(40)		NOT NULL,
	"RCONTENT"	VARCHAR2(300)		NULL,
	"RDATE"	TIMESTAMP	DEFAULT SYSTIMESTAMP	NOT NULL
);

COMMENT ON COLUMN "REPLY"."TNO" IS '글번호';

COMMENT ON COLUMN "REPLY"."USERID" IS 'EMAIL';



CREATE TABLE "COMMUTE" (
	"CDATE"	DATE		NOT NULL,
	"USERID"	VARCHAR2(40)		NOT NULL,
	"CSTATENO"	NUMBER(1)		NOT NULL,
	"CSTARTDATE"	DATE		NOT NULL,
	"CENDDATE"	DATE		NULL,
	"CWORKTIME"	NUMBER		NOT NULL,
	"CREASON"	VARCHAR2(300)		NULL
);

COMMENT ON COLUMN "COMMUTE"."CDATE" IS '출퇴근날짜';

COMMENT ON COLUMN "COMMUTE"."USERID" IS 'EMAIL';

COMMENT ON COLUMN "COMMUTE"."CSTATENO" IS '근무상태번호';

COMMENT ON COLUMN "COMMUTE"."CSTARTDATE" IS '출근시각';

COMMENT ON COLUMN "COMMUTE"."CENDDATE" IS '퇴근시각';

COMMENT ON COLUMN "COMMUTE"."CWORKTIME" IS '근무시간';

COMMENT ON COLUMN "COMMUTE"."CREASON" IS '사유';



CREATE TABLE "FILES" (
	"FNAME"	VARCHAR2(100)		NOT NULL,
	"TNO"	VARCHAR2(10)		NOT NULL,
	"USERID"	VARCHAR2(40)		NOT NULL,
	"FDATE"	DATE	DEFAULT SYSDATE	NOT NULL,
	"FSIZE"	NUMBER(10)		NOT NULL,
	"FPATH"	VARCHAR2(120)		NOT NULL,
	"FORIGINNAME"	VARCHAR2(120)		NOT NULL
);

COMMENT ON COLUMN "FILES"."FNAME" IS '파일명';

COMMENT ON COLUMN "FILES"."TNO" IS '글번호';

COMMENT ON COLUMN "FILES"."USERID" IS 'EMAIL';

COMMENT ON COLUMN "FILES"."FDATE" IS '업로드일시';

COMMENT ON COLUMN "FILES"."FSIZE" IS '파일크기(단위byte)';

COMMENT ON COLUMN "FILES"."FPATH" IS '파일경로';

COMMENT ON COLUMN "FILES"."FORIGINNAME" IS '파일원본이름';



CREATE TABLE "DEPT" (
	"DEPTNO"	VARCHAR2(10)		NOT NULL,
	"CCODE"	VARCHAR2(10)		NOT NULL,
	"DEPTNAME"	VARCHAR2(50)		NOT NULL
);

COMMENT ON COLUMN "DEPT"."DEPTNO" IS '부서번호';

COMMENT ON COLUMN "DEPT"."CCODE" IS '회사코드';

COMMENT ON COLUMN "DEPT"."DEPTNAME" IS '부서명';



CREATE TABLE "WORKSTATE" (
	"CSTATENO"	NUMBER(1)		NOT NULL,
	"CSTATE"	VARCHAR2(10)		NOT NULL
);

COMMENT ON COLUMN "WORKSTATE"."CSTATENO" IS '근무상태번호';

COMMENT ON COLUMN "WORKSTATE"."CSTATE" IS '근무상태';



CREATE TABLE "SCHEDULE" (
	"USERID"	VARCHAR2(40)		NOT NULL,
	"SSTARTDATE"	VARCHAR2(20)		NOT NULL,
	"SENDDATE"	VARCHAR2(20)		NOT NULL,
	"SPLACE"	VARCHAR2(50)		NULL,
	"SMEMO"	VARCHAR2(100)		NULL,
	"STITLE"	VARCHAR2(100)		NOT NULL,
	"SNO"	VARCHAR2(10)		NOT NULL
);

COMMENT ON COLUMN "SCHEDULE"."USERID" IS 'EMAIL';

COMMENT ON COLUMN "SCHEDULE"."SSTARTDATE" IS '시작일시';

COMMENT ON COLUMN "SCHEDULE"."SENDDATE" IS '종료일시';

COMMENT ON COLUMN "SCHEDULE"."SPLACE" IS '장소';

COMMENT ON COLUMN "SCHEDULE"."SMEMO" IS '일정내용';

COMMENT ON COLUMN "SCHEDULE"."STITLE" IS '일정명';

COMMENT ON COLUMN "SCHEDULE"."SNO" IS '일정번호';



CREATE TABLE "ALARM" (
	"ANO"	VARCHAR2(5)		NOT NULL,
	"ATYPE"	VARCHAR2(10)		NOT NULL,
	"REFNO"	NUMBER		NOT NULL,
	"ACONTENT"	VARCHAR2(50)		NOT NULL,
	"ADATE"	DATE	DEFAULT SYSDATE	NOT NULL,
	"ACHECK"	NUMBER(1)	DEFAULT 0	NOT NULL
);

COMMENT ON COLUMN "ALARM"."ATYPE" IS '업무,프로젝트,채팅,캘린더("MNO", "PNO")';

COMMENT ON COLUMN "ALARM"."REFNO" IS '35';



CREATE TABLE "COMPANY" (
	"CCODE"	VARCHAR2(10)		NOT NULL,
	"CNAME"	VARCHAR2(50)		NOT NULL
);

COMMENT ON COLUMN "COMPANY"."CCODE" IS '회사코드';

COMMENT ON COLUMN "COMPANY"."CNAME" IS '회사명';

ALTER TABLE "USERS" ADD CONSTRAINT "PK_USERS" PRIMARY KEY (
	"USERID"
);

ALTER TABLE "RANK" ADD CONSTRAINT "PK_RANK" PRIMARY KEY (
	"MRANKNO"
);

ALTER TABLE "PROJECT" ADD CONSTRAINT "PK_PROJECT" PRIMARY KEY (
	"PNO"
);

ALTER TABLE "CHATLIST" ADD CONSTRAINT "PK_CHATLIST" PRIMARY KEY (
	"CHATNO"
);

ALTER TABLE "TASK" ADD CONSTRAINT "PK_TASK" PRIMARY KEY (
	"TNO"
);

ALTER TABLE "MEMBER_PROJECT" ADD CONSTRAINT "PK_MEMBER_PROJECT" PRIMARY KEY (
	"PNO",
	"USERID"
);

ALTER TABLE "CHAT" ADD CONSTRAINT "PK_CHAT" PRIMARY KEY (
	"CCNO"
);

ALTER TABLE "CHAT_MEMBER" ADD CONSTRAINT "PK_CHAT_MEMBER" PRIMARY KEY (
	"CHATNO",
	"USERID"
);

ALTER TABLE "REPLY" ADD CONSTRAINT "PK_REPLY" PRIMARY KEY (
	"RNO"
);

ALTER TABLE "COMMUTE" ADD CONSTRAINT "PK_COMMUTE" PRIMARY KEY (
	"CDATE",
	"USERID"
);

ALTER TABLE "FILES" ADD CONSTRAINT "PK_FILES" PRIMARY KEY (
	"FNAME"
);

ALTER TABLE "DEPT" ADD CONSTRAINT "PK_DEPT" PRIMARY KEY (
	"DEPTNO",
	"CCODE"
);

ALTER TABLE "WORKSTATE" ADD CONSTRAINT "PK_WORKSTATE" PRIMARY KEY (
	"CSTATENO"
);

ALTER TABLE "ALARM" ADD CONSTRAINT "PK_ALARM" PRIMARY KEY (
	"ANO"
);

ALTER TABLE "COMPANY" ADD CONSTRAINT "PK_COMPANY" PRIMARY KEY (
	"CCODE"
);

ALTER TABLE "USERS" ADD CONSTRAINT "FK_DEPT_TO_USERS_1" FOREIGN KEY (
	"DEPTNO", "CCODE"
)
REFERENCES "DEPT" (
	"DEPTNO", "CCODE"
);

--ALTER TABLE "USERS" ADD CONSTRAINT "FK_DEPT_TO_USERS_2" FOREIGN KEY (
--	
--)
--REFERENCES "DEPT" (
--	
--);

ALTER TABLE "PROJECT" ADD CONSTRAINT "FK_USERS_TO_PROJECT_1" FOREIGN KEY (
	"USERID"
)
REFERENCES "USERS" (
	"USERID"
);

ALTER TABLE "CHATLIST" ADD CONSTRAINT "FK_PROJECT_TO_CHATLIST_1" FOREIGN KEY (
	"PNO"
)
REFERENCES "PROJECT" (
	"PNO"
);

ALTER TABLE "TASK" ADD CONSTRAINT "FK_PROJECT_TO_TASK_1" FOREIGN KEY (
	"PNO"
)
REFERENCES "PROJECT" (
	"PNO"
);

ALTER TABLE "TASK" ADD CONSTRAINT "FK_USERS_TO_TASK_1" FOREIGN KEY (
	"USERID"
)
REFERENCES "USERS" (
	"USERID"
);

ALTER TABLE "TASK" ADD CONSTRAINT "FK_USERS_TO_TASK_2" FOREIGN KEY (
	"TMEMBER"
)
REFERENCES "USERS" (
	"USERID"
);

ALTER TABLE "MEMBER_PROJECT" ADD CONSTRAINT "FK_PROJECT_TO_MEMBER_PROJECT_1" FOREIGN KEY (
	"PNO"
)
REFERENCES "PROJECT" (
	"PNO"
);

ALTER TABLE "MEMBER_PROJECT" ADD CONSTRAINT "FK_USERS_TO_MEMBER_PROJECT_1" FOREIGN KEY (
	"USERID"
)
REFERENCES "USERS" (
	"USERID"
);

ALTER TABLE "CHAT" ADD CONSTRAINT "FK_CHATLIST_TO_CHAT_1" FOREIGN KEY (
	"CHATNO"
)
REFERENCES "CHATLIST" (
	"CHATNO"
);

ALTER TABLE "CHAT" ADD CONSTRAINT "FK_USERS_TO_CHAT_1" FOREIGN KEY (
	"USERID"
)
REFERENCES "USERS" (
	"USERID"
);

ALTER TABLE "CHAT_MEMBER" ADD CONSTRAINT "FK_CHATLIST_TO_CHAT_MEMBER_1" FOREIGN KEY (
	"CHATNO"
)
REFERENCES "CHATLIST" (
	"CHATNO"
);

ALTER TABLE "CHAT_MEMBER" ADD CONSTRAINT "FK_USERS_TO_CHAT_MEMBER_1" FOREIGN KEY (
	"USERID"
)
REFERENCES "USERS" (
	"USERID"
);

ALTER TABLE "REPLY" ADD CONSTRAINT "FK_TASK_TO_REPLY_1" FOREIGN KEY (
	"TNO"
)
REFERENCES "TASK" (
	"TNO"
);

ALTER TABLE "REPLY" ADD CONSTRAINT "FK_USERS_TO_REPLY_1" FOREIGN KEY (
	"USERID"
)
REFERENCES "USERS" (
	"USERID"
);

ALTER TABLE "COMMUTE" ADD CONSTRAINT "FK_USERS_TO_COMMUTE_1" FOREIGN KEY (
	"USERID"
)
REFERENCES "USERS" (
	"USERID"
);

ALTER TABLE "COMMUTE" ADD CONSTRAINT "FK_WORKSTATE_TO_COMMUTE_1" FOREIGN KEY (
	"CSTATENO"
)
REFERENCES "WORKSTATE" (
	"CSTATENO"
);

ALTER TABLE "FILES" ADD CONSTRAINT "FK_TASK_TO_FILES_1" FOREIGN KEY (
	"TNO"
)
REFERENCES "TASK" (
	"TNO"
);

ALTER TABLE "FILES" ADD CONSTRAINT "FK_USERS_TO_FILES_1" FOREIGN KEY (
	"USERID"
)
REFERENCES "USERS" (
	"USERID"
);

ALTER TABLE "DEPT" ADD CONSTRAINT "FK_COMPANY_TO_DEPT_1" FOREIGN KEY (
	"CCODE"
)
REFERENCES "COMPANY" (
	"CCODE"
);

ALTER TABLE "SCHEDULE" ADD CONSTRAINT "FK_USERS_TO_SCHEDULE_1" FOREIGN KEY (
	"USERID"
)
REFERENCES "USERS" (
	"USERID"
);


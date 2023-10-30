
--drop sequence
DROP SEQUENCE schedule_sequence;
DROP SEQUENCE task_sequence;
DROP SEQUENCE project_sequence;
DROP SEQUENCE brestep_sequence;
DROP SEQUENCE replyrno_sequence;
DROP SEQUENCE company_sequence;
DROP SEQUENCE dept_sequence;
DROP SEQUENCE chat_sequence;
DROP SEQUENCE info_sequence;

-- create sequence
CREATE SEQUENCE project_sequence
START WITH 1
INCREMENT BY 1;

CREATE SEQUENCE task_sequence
START WITH 1
INCREMENT BY 1;

CREATE SEQUENCE schedule_sequence
START WITH 1
INCREMENT BY 1;

CREATE SEQUENCE brestep_sequence
START WITH 1
INCREMENT BY 1;

CREATE SEQUENCE company_sequence
START WITH 10
INCREMENT BY 1;

CREATE SEQUENCE dept_sequence
START WITH 1
INCREMENT BY 1;

CREATE SEQUENCE replyrno_sequence
START WITH 1
INCREMENT BY 1;

create SEQUENCE chat_sequence
start with 1
INCREMENT by 1;

CREATE SEQUENCE info_sequence
START WITH 1
INCREMENT BY 1;

--

INSERT INTO COMPANY VALUES ('C01', '올리브영');
INSERT INTO COMPANY VALUES ('C02', '교촌치킨');

INSERT INTO DEPT VALUES ('A', 'C01', '스킨케어');
INSERT INTO DEPT VALUES ('B', 'C01', '헤어케어');
INSERT INTO DEPT VALUES ('C', 'C01', '메이크업');
INSERT INTO DEPT VALUES ('S', 'C01', '임원');

INSERT INTO USERS VALUES ('skin01@gmail.com', 'A', 'C01', DEFAULT, DEFAULT, DEFAULT, '김스킨', '000-0000-0000', '사원');
INSERT INTO USERS VALUES ('skin02@gmail.com', 'A', 'C01', DEFAULT, DEFAULT, DEFAULT, '이스킨', '000-0000-0000', '대리');
INSERT INTO USERS VALUES ('oliveyoungboss@gmail.com', 'S', 'C01', DEFAULT, 1, 'RA', '김사장', '000-0000-0000', '대표');

commit;
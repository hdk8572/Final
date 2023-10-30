--스트림전자 회사등록
INSERT INTO COMPANY (CCODE, CNAME, CPHONE, CADDRESS) VALUES ('C004', '스트림전자', '010-1111-1111', 
'서울시 광진구 화양동');

--스트림전자 부서등록
INSERT ALL INTO DEPT (DEPTNO, CCODE, DEPTNAME) VALUES ('D000', 'C004', '부서미선택') INTO DEPT (DEPTNO, 
CCODE, DEPTNAME) VALUES ( REPLACE('D'||TO_CHAR(TO_NUMBER(SUBSTR(DEPTNO, 2)) + 0 +1, '000'),' ','') , 'C004', '영업부') INTO DEPT (DEPTNO, CCODE, DEPTNAME) VALUES ( REPLACE('D'||TO_CHAR(TO_NUMBER(SUBSTR(DEPTNO, 
2)) + 1 +1, '000'),' ','') , 'C004', '인사부') INTO DEPT (DEPTNO, CCODE, DEPTNAME) VALUES ( REPLACE('D'||TO_CHAR(TO_NUMBER(SUBSTR(DEPTNO, 
2)) + 2 +1, '000'),' ','') , 'C004', '가전제품') INTO DEPT (DEPTNO, CCODE, DEPTNAME) VALUES ( REPLACE('D'||TO_CHAR(TO_NUMBER(SUBSTR(DEPTNO, 
2)) + 3 +1, '000'),' ','') , 'C004', '통신기기') INTO DEPT (DEPTNO, CCODE, DEPTNAME) VALUES ( REPLACE('D'||TO_CHAR(TO_NUMBER(SUBSTR(DEPTNO, 
2)) + 4 +1, '000'),' ','') , 'C004', '행정부') SELECT NVL(MAX(DEPTNO), 'D000') DEPTNO FROM DEPT 
WHERE CCODE= 'C004';

--스트림전자 사원등록
INSERT ALL INTO USERS (USERID, DEPTNO, CCODE, PASSWORD, ENABLED, AUTHORITY) VALUES ('streamjj1@naver.co.kr', 
'D000', 'C004', default, 0, 'ROLE_M') INTO USERS (USERID, DEPTNO, CCODE, PASSWORD, ENABLED, 
AUTHORITY) VALUES ('streamjj2@naver.co.kr', 'D000', 'C004', default, 0, 'ROLE_M') INTO USERS 
(USERID, DEPTNO, CCODE, PASSWORD, ENABLED, AUTHORITY) VALUES ('streamjj3@naver.co.kr', 'D000', 
'C004', default, 0, 'ROLE_M') INTO USERS (USERID, DEPTNO, CCODE, PASSWORD, ENABLED, AUTHORITY) 
VALUES ('streamjj4@naver.co.kr', 'D000', 'C004', default, 0, 'ROLE_M') INTO USERS (USERID, 
DEPTNO, CCODE, PASSWORD, ENABLED, AUTHORITY) VALUES ('streamjj5@naver.co.kr', 'D000', 'C004', 
default, 0, 'ROLE_M') INTO USERS (USERID, DEPTNO, CCODE, PASSWORD, ENABLED, AUTHORITY) VALUES 
('streamjj6@naver.co.kr', 'D000', 'C004', default, 0, 'ROLE_M') INTO USERS (USERID, DEPTNO, 
CCODE, PASSWORD, ENABLED, AUTHORITY) VALUES ('streamjj7@naver.co.kr', 'D000', 'C004', default, 
0, 'ROLE_M') INTO USERS (USERID, DEPTNO, CCODE, PASSWORD, ENABLED, AUTHORITY) VALUES ('streamjj8@naver.co.kr', 
'D000', 'C004', default, 0, 'ROLE_M') INTO USERS (USERID, DEPTNO, CCODE, PASSWORD, ENABLED, 
AUTHORITY) VALUES ('streamjj9@naver.co.kr', 'D000', 'C004', default, 0, 'ROLE_M') INTO USERS 
(USERID, DEPTNO, CCODE, PASSWORD, ENABLED, AUTHORITY) VALUES ('streamjj@naver.co.kr', 'D000', 
'C004', default, 0, 'ROLE_M') select * from dual;

--스트림전자 회사계정
INSERT INTO USERS (USERID, DEPTNO, CCODE, PASSWORD, ENABLED, AUTHORITY, MNAME, MPHONE, MRANK) 
VALUES ('C004'||'@stream.com', 'D000', 'C004', '$2a$10$G6IfJXdCVTXJsvYCVLQabOf5BjOwVFrREHLT5HU9YestrnKTtAVPi', 
1, 'ROLE_C', '스트림전자', '010-1111-1111', '회사' );

--스트림전자 사원회원가입
UPDATE USERS SET DEPTNO = 'D005', PASSWORD = '$2a$10$JFebGecPwxjOKBUVduBI/u3d53pFFXbSaXdxesJtxQ2QFLUzofl3i', 
MNAME = '이지영', ENABLED= 1 WHERE USERID = 'streamjj@naver.co.kr';
UPDATE USERS SET DEPTNO = 'D002', PASSWORD = '$2a$10$NfbPatqmXbp01UVEPhdFXOmCc70WBrOsCbD445nC/B2MCxkV7jJnC', 
MNAME = '황대경', ENABLED= 1 WHERE USERID = 'streamjj1@naver.co.kr';
UPDATE USERS SET DEPTNO = 'D002', PASSWORD = '$2a$10$AzbgsZELaMIgiD/ThaKaJuVzhF.9sx6d6qLLuicaWWGFfSWSHgrdC', 
MNAME = '임지연', ENABLED= 1 WHERE USERID = 'streamjj2@naver.co.kr';
UPDATE USERS SET DEPTNO = 'D001', PASSWORD = '$2a$10$FQYkqaqRz6Nya5d0he4QbeUkFLOQRkI8EIPKDO2Uc0NfFKPIsydxK', 
MNAME = '김민성', ENABLED= 1 WHERE USERID = 'streamjj3@naver.co.kr';
UPDATE USERS SET DEPTNO = 'D001', PASSWORD = '$2a$10$6yjbCNFNUH2689Eg9iqotOn/ttBnlCKe27iArADdRpBCc0HGPW3oy', 
MNAME = '박준모', ENABLED= 1 WHERE USERID = 'streamjj4@naver.co.kr';
UPDATE USERS SET DEPTNO = 'D003', PASSWORD = '$2a$10$nKxLj6NN80Wjh24YMAYhRuTAsPBeb1FeeWUPmNx.no7LPYRu6HAt.', 
MNAME = '임은우', ENABLED= 1 WHERE USERID = 'streamjj5@naver.co.kr';
UPDATE USERS SET DEPTNO = 'D003', PASSWORD = '$2a$10$XczXz8JNQRP42eRGhErvseOm750j9S03FXozni82ThxqUdWmnzfbW', 
MNAME = '남아름', ENABLED= 1 WHERE USERID = 'streamjj6@naver.co.kr';
UPDATE USERS SET DEPTNO = 'D004', PASSWORD = '$2a$10$g/W6e0DSjaHYaX1cF7WLi.vKNEyDp69jUVj4tDBlUCapVriX6rPYa', 
MNAME = '송현준', ENABLED= 1 WHERE USERID = 'streamjj7@naver.co.kr';
UPDATE USERS SET DEPTNO = 'D004', PASSWORD = '$2a$10$q0LOnAkY.Pj4OvBW4Fe3negWqlbG.lfRs60biXC479hL8M1IVczNm', 
MNAME = '하지호', ENABLED= 1 WHERE USERID = 'streamjj8@naver.co.kr';
UPDATE USERS SET DEPTNO = 'D005', PASSWORD = '$2a$10$lIsasuxyabyvnSVwCL.te.G6J0gxdpGbwVvMtcMntmEBfqmML8nEy', 
MNAME = '이재훈', ENABLED= 1 WHERE USERID = 'streamjj9@naver.co.kr';

--streambucks 회사등록
INSERT INTO COMPANY (CCODE, CNAME, CPHONE, CADDRESS) VALUES ('C005', 'Streambucks', '010-2222-2222', 
'서울시 양천구 신정동');

--streambucks 부서등록
INSERT ALL INTO DEPT (DEPTNO, CCODE, DEPTNAME) VALUES ('D000', 'C005', '부서미선택') INTO DEPT (DEPTNO, 
CCODE, DEPTNAME) VALUES ( REPLACE('D'||TO_CHAR(TO_NUMBER(SUBSTR(DEPTNO, 2)) + 0 +1, '000'),' ','') , 'C005', 'coffee') INTO DEPT (DEPTNO, CCODE, DEPTNAME) VALUES ( REPLACE('D'||TO_CHAR(TO_NUMBER(SUBSTR(DEPTNO, 
2)) + 1 +1, '000'),' ','') , 'C005', 'bakery') INTO DEPT (DEPTNO, CCODE, DEPTNAME) VALUES ( 
REPLACE('D'||TO_CHAR(TO_NUMBER(SUBSTR(DEPTNO, 2)) + 2 +1, '000'),' ','') , 'C005', 'marketing') 
INTO DEPT (DEPTNO, CCODE, DEPTNAME) VALUES ( REPLACE('D'||TO_CHAR(TO_NUMBER(SUBSTR(DEPTNO, 
2)) + 3 +1, '000'),' ','') , 'C005', 'sales') SELECT NVL(MAX(DEPTNO), 'D000') DEPTNO FROM DEPT 
WHERE CCODE= 'C005';

--streambucks 사원등록
INSERT ALL INTO USERS (USERID, DEPTNO, CCODE, PASSWORD, ENABLED, AUTHORITY) VALUES ('streambucks@naver.co.kr', 
'D000', 'C005', default, 0, 'ROLE_M') INTO USERS (USERID, DEPTNO, CCODE, PASSWORD, ENABLED, 
AUTHORITY) VALUES ('streambucks_01@naver.co.kr', 'D000', 'C005', default, 0, 'ROLE_M') INTO 
USERS (USERID, DEPTNO, CCODE, PASSWORD, ENABLED, AUTHORITY) VALUES ('streambucks_02@naver.co.kr', 
'D000', 'C005', default, 0, 'ROLE_M') INTO USERS (USERID, DEPTNO, CCODE, PASSWORD, ENABLED, 
AUTHORITY) VALUES ('streambucks_03@naver.co.kr', 'D000', 'C005', default, 0, 'ROLE_M') INTO 
USERS (USERID, DEPTNO, CCODE, PASSWORD, ENABLED, AUTHORITY) VALUES ('streambucks_04@naver.co.kr', 
'D000', 'C005', default, 0, 'ROLE_M') INTO USERS (USERID, DEPTNO, CCODE, PASSWORD, ENABLED, 
AUTHORITY) VALUES ('streambucks_05@naver.co.kr', 'D000', 'C005', default, 0, 'ROLE_M') select 
* from dual;

--streambucks 회사계정
INSERT INTO USERS (USERID, DEPTNO, CCODE, PASSWORD, ENABLED, AUTHORITY, MNAME, MPHONE, MRANK) 
VALUES ('C005'||'@stream.com', 'D000', 'C005', '$2a$10$Ol9TzFpPYkNnbRuVfijnP.ajsjV5xByrRPmy8jzplJoXTVpWU6bye', 
1, 'ROLE_C', 'Streambucks', '010-2222-2222', '회사' );

--streambucks 사원회원가입
UPDATE USERS SET DEPTNO = 'D001', PASSWORD = '$2a$10$hWBjFcUIIh5vlFBmb83qBegIkEJMMFukcy2HpKPjiA1.WL3QNlSb.', 
MNAME = '임다영', ENABLED= 1 WHERE USERID = 'streambucks@naver.co.kr';
UPDATE USERS SET DEPTNO = 'D002', PASSWORD = '$2a$10$1ZfrPgk5rIPlOX7ZQs/CV.fpukSJZ5HgerRu8KlzBsb21LIKFObAu', 
MNAME = '노민아', ENABLED= 1 WHERE USERID = 'streambucks_01@naver.co.kr';
UPDATE USERS SET DEPTNO = 'D003', PASSWORD = '$2a$10$pqDDqbHLoIE2mbzI73X3zeJzocovc/ntFk6ff/oCB9fIq/uLeDQSe', 
MNAME = '조서현', ENABLED= 1 WHERE USERID = 'streambucks_02@naver.co.kr';
UPDATE USERS SET DEPTNO = 'D003', PASSWORD = '$2a$10$76vl2ZmCQGq4SYYOkH4hK.4mZWMv3LRRzdCf5HRspSz4JoyWiKWI.', 
MNAME = '성태성', ENABLED= 1 WHERE USERID = 'streambucks_03@naver.co.kr';
UPDATE USERS SET DEPTNO = 'D004', PASSWORD = '$2a$10$yvp/pADNeBX3r/XoYBnKCeO9noznQ.wHL1y0u3jS4hGJFOGOto/SG', 
MNAME = '남윤건', ENABLED= 1 WHERE USERID = 'streambucks_04@naver.co.kr';
UPDATE USERS SET DEPTNO = 'D004', PASSWORD = '$2a$10$sSLQelnpwgDf.zwlRgJx6uroaGoYH/BFbxb/itsI2/o2MwuOBWy8m', 
MNAME = '김준후', ENABLED= 1 WHERE USERID = 'streambucks_05@naver.co.kr';

--SGVmovies 회사등록
INSERT INTO COMPANY (CCODE, CNAME, CPHONE, CADDRESS) VALUES ('C006', 'SGVmovies', '010-3333-3333', 
'서울시 강남구 역삼동');

--SGVmovies 부서등록
INSERT ALL INTO DEPT (DEPTNO, CCODE, DEPTNAME) VALUES ('D000', 'C006', '부서미선택') INTO DEPT (DEPTNO, 
CCODE, DEPTNAME) VALUES ( REPLACE('D'||TO_CHAR(TO_NUMBER(SUBSTR(DEPTNO, 2)) + 0 +1, '000'),' ','') , 'C006', '영화부') INTO DEPT (DEPTNO, CCODE, DEPTNAME) VALUES ( REPLACE('D'||TO_CHAR(TO_NUMBER(SUBSTR(DEPTNO, 
2)) + 1 +1, '000'),' ','') , 'C006', '식음료부') INTO DEPT (DEPTNO, CCODE, DEPTNAME) VALUES ( REPLACE('D'||TO_CHAR(TO_NUMBER(SUBSTR(DEPTNO, 
2)) + 2 +1, '000'),' ','') , 'C006', '영업부') INTO DEPT (DEPTNO, CCODE, DEPTNAME) VALUES ( REPLACE('D'||TO_CHAR(TO_NUMBER(SUBSTR(DEPTNO, 
2)) + 3 +1, '000'),' ','') , 'C006', '마케팅부') INTO DEPT (DEPTNO, CCODE, DEPTNAME) VALUES ( REPLACE('D'||TO_CHAR(TO_NUMBER(SUBSTR(DEPTNO, 
2)) + 4 +1, '000'),' ','') , 'C006', '인사부') INTO DEPT (DEPTNO, CCODE, DEPTNAME) VALUES ( REPLACE('D'||TO_CHAR(TO_NUMBER(SUBSTR(DEPTNO, 
2)) + 5 +1, '000'),' ','') , 'C006', '행정부') SELECT NVL(MAX(DEPTNO), 'D000') DEPTNO FROM DEPT 
WHERE CCODE= 'C006';

--SGVmovies 사원등록
INSERT ALL INTO USERS (USERID, DEPTNO, CCODE, PASSWORD, ENABLED, AUTHORITY) VALUES ('sgv_movies@naver.co.kr', 
'D000', 'C006', default, 0, 'ROLE_M') INTO USERS (USERID, DEPTNO, CCODE, PASSWORD, ENABLED, 
AUTHORITY) VALUES ('sgv_movies1@naver.co.kr', 'D000', 'C006', default, 0, 'ROLE_M') INTO USERS 
(USERID, DEPTNO, CCODE, PASSWORD, ENABLED, AUTHORITY) VALUES ('sgv_movies2@naver.co.kr', 'D000', 
'C006', default, 0, 'ROLE_M') INTO USERS (USERID, DEPTNO, CCODE, PASSWORD, ENABLED, AUTHORITY) 
VALUES ('sgv_movies3@naver.co.kr', 'D000', 'C006', default, 0, 'ROLE_M') INTO USERS (USERID, 
DEPTNO, CCODE, PASSWORD, ENABLED, AUTHORITY) VALUES ('sgv_movies4@naver.co.kr', 'D000', 'C006', 
default, 0, 'ROLE_M') INTO USERS (USERID, DEPTNO, CCODE, PASSWORD, ENABLED, AUTHORITY) VALUES 
('sgv_movies5@naver.co.kr', 'D000', 'C006', default, 0, 'ROLE_M') INTO USERS (USERID, DEPTNO, 
CCODE, PASSWORD, ENABLED, AUTHORITY) VALUES ('sgv_movies6@naver.co.kr', 'D000', 'C006', default, 
0, 'ROLE_M') INTO USERS (USERID, DEPTNO, CCODE, PASSWORD, ENABLED, AUTHORITY) VALUES ('sgv_movies7@naver.co.kr', 
'D000', 'C006', default, 0, 'ROLE_M') INTO USERS (USERID, DEPTNO, CCODE, PASSWORD, ENABLED, 
AUTHORITY) VALUES ('sgv_movies8@naver.co.kr', 'D000', 'C006', default, 0, 'ROLE_M') INTO USERS 
(USERID, DEPTNO, CCODE, PASSWORD, ENABLED, AUTHORITY) VALUES ('sgv_movies9@naver.co.kr', 'D000', 
'C006', default, 0, 'ROLE_M') INTO USERS (USERID, DEPTNO, CCODE, PASSWORD, ENABLED, AUTHORITY) 
VALUES ('sgv_movies10@naver.co.kr', 'D000', 'C006', default, 0, 'ROLE_M') INTO USERS (USERID, 
DEPTNO, CCODE, PASSWORD, ENABLED, AUTHORITY) VALUES ('sgv_movies11@naver.co.kr', 'D000', 'C006', 
default, 0, 'ROLE_M') INTO USERS (USERID, DEPTNO, CCODE, PASSWORD, ENABLED, AUTHORITY) VALUES 
('sgv_movies12@naver.co.kr', 'D000', 'C006', default, 0, 'ROLE_M') INTO USERS (USERID, DEPTNO, 
CCODE, PASSWORD, ENABLED, AUTHORITY) VALUES ('sgv_movies13@naver.co.kr', 'D000', 'C006', default, 
0, 'ROLE_M') INTO USERS (USERID, DEPTNO, CCODE, PASSWORD, ENABLED, AUTHORITY) VALUES ('sgv_movies14@naver.co.kr', 
'D000', 'C006', default, 0, 'ROLE_M') INTO USERS (USERID, DEPTNO, CCODE, PASSWORD, ENABLED, 
AUTHORITY) VALUES ('sgv_movies15@naver.co.kr', 'D000', 'C006', default, 0, 'ROLE_M') select 
* from dual;

INSERT INTO USERS (USERID, DEPTNO, CCODE, PASSWORD, ENABLED, AUTHORITY, MNAME, MPHONE, MRANK) 
VALUES ('C006'||'@stream.com', 'D000', 'C006', '$2a$10$4v/g58DuswwrgrZxEk/7LeOfHgqG3s1rOizJ0KiAskPr7NyvcKlKS', 
1, 'ROLE_C', 'SGVmovies', '010-3333-3333', '회사' );

--stream 회사(계정, 부서, admin)
INSERT INTO COMPANY (CCODE, CNAME, CPHONE, CADDRESS)
VALUES ('C000', 'STREAM', '010-1234-5678', '서울시 강남구 역삼동');
INSERT INTO DEPT (DEPTNO, CCODE, DEPTNAME)
VALUES ('D000', 'C000', '관리자');
INSERT INTO USERS (USERID, DEPTNO, CCODE, PASSWORD, ENABLED, AUTHORITY, MNAME, MPHONE, MRANK)
VALUES ('admin@stream.com', 'D000', 'C000', '12345', 1, 'ROLE_A', 'admin', '010-1234-5678', '관리자');

--dummy회사(올리브올드)
INSERT INTO COMPANY (CCODE, CNAME, CPHONE, CADDRESS) VALUES ('C007', '올리브올드', '010-4444-4444', 
'인천광역시 부평구');
INSERT ALL INTO DEPT (DEPTNO, CCODE, DEPTNAME) VALUES ('D000', 'C007', '부서미선택') INTO DEPT (DEPTNO, 
CCODE, DEPTNAME) VALUES ( REPLACE('D'||TO_CHAR(TO_NUMBER(SUBSTR(DEPTNO, 2)) + 0 +1, '000'),' ','') , 'C007', '스킨케어') INTO DEPT (DEPTNO, CCODE, DEPTNAME) VALUES ( REPLACE('D'||TO_CHAR(TO_NUMBER(SUBSTR(DEPTNO, 
2)) + 1 +1, '000'),' ','') , 'C007', '헤어케어') INTO DEPT (DEPTNO, CCODE, DEPTNAME) VALUES ( REPLACE('D'||TO_CHAR(TO_NUMBER(SUBSTR(DEPTNO, 
2)) + 2 +1, '000'),' ','') , 'C007', '식음료') INTO DEPT (DEPTNO, CCODE, DEPTNAME) VALUES ( REPLACE('D'||TO_CHAR(TO_NUMBER(SUBSTR(DEPTNO, 
2)) + 3 +1, '000'),' ','') , 'C007', '메이크업') SELECT NVL(MAX(DEPTNO), 'D000') DEPTNO FROM DEPT 
WHERE CCODE= 'C007';
INSERT ALL INTO USERS (USERID, DEPTNO, CCODE, PASSWORD, ENABLED, AUTHORITY) VALUES ('olive_old@naver.co.kr', 
'D000', 'C007', default, 0, 'ROLE_M') INTO USERS (USERID, DEPTNO, CCODE, PASSWORD, ENABLED, 
AUTHORITY) VALUES ('olive_old1@naver.co.kr', 'D000', 'C007', default, 0, 'ROLE_M') INTO USERS 
(USERID, DEPTNO, CCODE, PASSWORD, ENABLED, AUTHORITY) VALUES ('olive_old2@naver.co.kr', 'D000', 
'C007', default, 0, 'ROLE_M') INTO USERS (USERID, DEPTNO, CCODE, PASSWORD, ENABLED, AUTHORITY) 
VALUES ('olive_old3@naver.co.kr', 'D000', 'C007', default, 0, 'ROLE_M') INTO USERS (USERID, 
DEPTNO, CCODE, PASSWORD, ENABLED, AUTHORITY) VALUES ('olive_old4@naver.co.kr', 'D000', 'C007', 
default, 0, 'ROLE_M') INTO USERS (USERID, DEPTNO, CCODE, PASSWORD, ENABLED, AUTHORITY) VALUES 
('olive_old5@naver.co.kr', 'D000', 'C007', default, 0, 'ROLE_M') INTO USERS (USERID, DEPTNO, 
CCODE, PASSWORD, ENABLED, AUTHORITY) VALUES ('olive_old6@naver.co.kr', 'D000', 'C007', default, 
0, 'ROLE_M') INTO USERS (USERID, DEPTNO, CCODE, PASSWORD, ENABLED, AUTHORITY) VALUES ('olive_old7@naver.co.kr', 
'D000', 'C007', default, 0, 'ROLE_M') select * from dual;
INSERT INTO USERS (USERID, DEPTNO, CCODE, PASSWORD, ENABLED, AUTHORITY, MNAME, MPHONE, MRANK) 
VALUES ('C007'||'@stream.com', 'D000', 'C007', '$2a$10$Ek/JNFtan7QaFUFywH7nE.KYkXwHjSNlSRzsLpQkOJ9p1jmQe0Wlq', 
1, 'ROLE_C', '올리브올드', '010-4444-4444', '회사' );

--dummy회사(스트림의약)
INSERT INTO COMPANY (CCODE, CNAME, CPHONE, CADDRESS) VALUES ('C008', '스트림의약', '010-5555-5555', 
'대전광역시 동구');
INSERT ALL INTO DEPT (DEPTNO, CCODE, DEPTNAME) VALUES ('D000', 'C008', '부서미선택') INTO DEPT (DEPTNO, 
CCODE, DEPTNAME) VALUES ( REPLACE('D'||TO_CHAR(TO_NUMBER(SUBSTR(DEPTNO, 2)) + 0 +1, '000'),' ','') , 'C008', '영업부') INTO DEPT (DEPTNO, CCODE, DEPTNAME) VALUES ( REPLACE('D'||TO_CHAR(TO_NUMBER(SUBSTR(DEPTNO, 
2)) + 1 +1, '000'),' ','') , 'C008', '인사부') INTO DEPT (DEPTNO, CCODE, DEPTNAME) VALUES ( REPLACE('D'||TO_CHAR(TO_NUMBER(SUBSTR(DEPTNO, 
2)) + 2 +1, '000'),' ','') , 'C008', '행정부') SELECT NVL(MAX(DEPTNO), 'D000') DEPTNO FROM DEPT 
WHERE CCODE= 'C008';
INSERT ALL INTO USERS (USERID, DEPTNO, CCODE, PASSWORD, ENABLED, AUTHORITY) VALUES ('streammedicine1@naver.co.kr', 
'D000', 'C008', default, 0, 'ROLE_M') INTO USERS (USERID, DEPTNO, CCODE, PASSWORD, ENABLED, 
AUTHORITY) VALUES ('streammedicine2@naver.co.kr', 'D000', 'C008', default, 0, 'ROLE_M') INTO 
USERS (USERID, DEPTNO, CCODE, PASSWORD, ENABLED, AUTHORITY) VALUES ('streammedicine3@naver.co.kr', 
'D000', 'C008', default, 0, 'ROLE_M') select * from dual;
INSERT INTO USERS (USERID, DEPTNO, CCODE, PASSWORD, ENABLED, AUTHORITY, MNAME, MPHONE, MRANK) 
VALUES ('C008'||'@stream.com', 'D000', 'C008', '$2a$10$QoShaKTxi5RGopMgfNLm/.I3z3xQHlpCySGMkfvCqhfzxGAtRvli2', 
1, 'ROLE_C', '스트림의약', '010-5555-5555', '회사' );

--dummy회사(khkhkh치킨)
INSERT INTO COMPANY (CCODE, CNAME, CPHONE, CADDRESS) VALUES ('C009', 'khkhkh치킨', '010-6666-6666', 
'경상남도 창녕시 창녕읍');
INSERT ALL INTO DEPT (DEPTNO, CCODE, DEPTNAME) VALUES ('D000', 'C009', '부서미선택') INTO DEPT (DEPTNO, 
CCODE, DEPTNAME) VALUES ( REPLACE('D'||TO_CHAR(TO_NUMBER(SUBSTR(DEPTNO, 2)) + 0 +1, '000'),' ','') , 'C009', '영업부') INTO DEPT (DEPTNO, CCODE, DEPTNAME) VALUES ( REPLACE('D'||TO_CHAR(TO_NUMBER(SUBSTR(DEPTNO, 
2)) + 1 +1, '000'),' ','') , 'C009', '행정부') INTO DEPT (DEPTNO, CCODE, DEPTNAME) VALUES ( REPLACE('D'||TO_CHAR(TO_NUMBER(SUBSTR(DEPTNO, 
2)) + 2 +1, '000'),' ','') , 'C009', '인사부') SELECT NVL(MAX(DEPTNO), 'D000') DEPTNO FROM DEPT 
WHERE CCODE= 'C009';
INSERT ALL INTO USERS (USERID, DEPTNO, CCODE, PASSWORD, ENABLED, AUTHORITY) VALUES ('khchicken1@naver.co.kr', 
'D000', 'C009', default, 0, 'ROLE_M') INTO USERS (USERID, DEPTNO, CCODE, PASSWORD, ENABLED, 
AUTHORITY) VALUES ('khchicken2@naver.co.kr', 'D000', 'C009', default, 0, 'ROLE_M') INTO USERS 
(USERID, DEPTNO, CCODE, PASSWORD, ENABLED, AUTHORITY) VALUES ('khchicken3@naver.co.kr', 'D000', 
'C009', default, 0, 'ROLE_M') select * from dual;
INSERT INTO USERS (USERID, DEPTNO, CCODE, PASSWORD, ENABLED, AUTHORITY, MNAME, MPHONE, MRANK) 
VALUES ('C009'||'@stream.com', 'D000', 'C009', '$2a$10$Mm/SOFYSE/hRi2NL8DXxju3JS4l4vpGzVn.maEQfTbxoLiRT5IQgS', 
1, 'ROLE_C', 'khkhkh치킨', '010-6666-6666', '회사' );

INSERT INTO WORKSTATE VALUES (0, '미출근');
INSERT INTO WORKSTATE VALUES (1, '출근');
INSERT INTO WORKSTATE VALUES (2, '퇴근');
INSERT INTO WORKSTATE VALUES (3, '지각');
INSERT INTO WORKSTATE VALUES (4, '조퇴');

-- DK dml
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
'1_프로그래밍 기초', '1_프로그래밍 기초', '진행', '2023-10-29', '2023-10-31', task_sequence.NEXTVAL, '0', '0')
;

INSERT INTO TASK (TNO, PNO, USERID, TMEMBER, TTITLE, TCONTENT, TSTATUS, tstartdate, tenddate, 
bref, brelevel, brestep) VALUES (task_sequence.NEXTVAL, '1', 'streamjj1@naver.co.kr', 'streamjj1@naver.co.kr', 
'2_변수', '2_변수', '진행', '2023-10-29', '2023-10-30', task_sequence.NEXTVAL, '0', '0')
;

INSERT INTO TASK (TNO, PNO, USERID, TMEMBER, TTITLE, TCONTENT, TSTATUS, tstartdate, tenddate, 
bref, brelevel, brestep) VALUES (task_sequence.NEXTVAL, '1', 'streamjj3@naver.co.kr', 'streamjj3@naver.co.kr', 
'3_연산자', '3_연산자', '진행', '2023-10-02', '2023-10-31', task_sequence.NEXTVAL, '0', '0')
;

INSERT INTO TASK (TNO, PNO, USERID, TMEMBER, TTITLE, TCONTENT, TSTATUS, tstartdate, tenddate, 
bref, brelevel, brestep) VALUES (task_sequence.NEXTVAL, '1', 'streamjj2@naver.co.kr', 'streamjj2@naver.co.kr', 
'4_제어문', '4_제어문', '진행', '2023-10-04', '2023-10-31', task_sequence.NEXTVAL, '0', '0')
;

-- 포트폴리오 제작 - 업무 목록
INSERT INTO TASK (TNO, PNO, USERID, TMEMBER, TTITLE, TCONTENT, TSTATUS, tstartdate, tenddate, 
bref, brelevel, brestep) VALUES (task_sequence.NEXTVAL, '2', 'streamjj1@naver.co.kr', 'streamjj1@naver.co.kr', 
'템플릿 선정', '템플릿을 선정해주세요', '진행', '2023-10-01', '2023-10-31', task_sequence.NEXTVAL, '0', '0')
;

INSERT INTO TASK (TNO, PNO, USERID, TMEMBER, TTITLE, TCONTENT, TSTATUS, tstartdate, tenddate, 
bref, brelevel, brestep) VALUES (task_sequence.NEXTVAL, '2', 'streamjj2@naver.co.kr', 'streamjj2@naver.co.kr', 
'유스케이스 작성', '유스케이스 작성해주세요', '진행', '2023-10-02', '2023-10-31', task_sequence.NEXTVAL, '0', '0')
;

INSERT INTO TASK (TNO, PNO, USERID, TMEMBER, TTITLE, TCONTENT, TSTATUS, tstartdate, tenddate, 
bref, brelevel, brestep) VALUES (task_sequence.NEXTVAL, '2', 'streamjj3@naver.co.kr', 'streamjj3@naver.co.kr', 
'클래스다이어그램 작성', '클래스 다이어그램 작성해주세요', '진행', '2023-10-03', '2023-10-31', task_sequence.NEXTVAL, '0', '0')
;

INSERT INTO TASK (TNO, PNO, USERID, TMEMBER, TTITLE, TCONTENT, TSTATUS, tstartdate, tenddate, 
bref, brelevel, brestep) VALUES (task_sequence.NEXTVAL, '2', 'streamjj@naver.co.kr', 'streamjj@naver.co.kr', 
'화면설계서 작성', '화면설계서 작성해주세요', '진행', '2023-10-03', '2023-10-31', task_sequence.NEXTVAL, '0', '0')
;

--프로젝트 깃허브주소 - 업무목록
INSERT INTO TASK (TNO, PNO, USERID, TMEMBER, TTITLE, TCONTENT, TSTATUS, tstartdate, tenddate, 
bref, brelevel, brestep) VALUES (task_sequence.NEXTVAL, '3', 'streamjj@naver.co.kr', 'streamjj@naver.co.kr', 
'회원가입 요청드립니다.', '신청했습니다!', '미진행', '2023-10-04', '2023-10-31', task_sequence.NEXTVAL, '0', '0')
;

INSERT INTO TASK (TNO, PNO, USERID, TMEMBER, TTITLE, TCONTENT, TSTATUS, tstartdate, tenddate, 
bref, brelevel, brestep) VALUES (task_sequence.NEXTVAL, '3', 'streamjj1@naver.co.kr', 'streamjj1@naver.co.kr', 
'회원가입 요청이요.', '확인 부탁드립니다.', '미진행', '2023-10-05', '2023-10-31', task_sequence.NEXTVAL, '0', '0')
;

INSERT INTO TASK (TNO, PNO, USERID, TMEMBER, TTITLE, TCONTENT, TSTATUS, tstartdate, tenddate, 
bref, brelevel, brestep) VALUES (task_sequence.NEXTVAL, '3', 'streamjj2@naver.co.kr', 'streamjj2@naver.co.kr', 
'회원가입 요청했습니다.', '확인 부탁드립니다.', '미진행', '2023-10-04', '2023-10-31', task_sequence.NEXTVAL, '0', '0')
;

INSERT INTO TASK (TNO, PNO, USERID, TMEMBER, TTITLE, TCONTENT, TSTATUS, tstartdate, tenddate, 
bref, brelevel, brestep) VALUES (task_sequence.NEXTVAL, '3', 'streamjj3@naver.co.kr', 'streamjj3@naver.co.kr', 
'회원가입 받아주세요', '신청했습니다!', '미진행', '2023-10-04', '2023-10-31', task_sequence.NEXTVAL, '0', '0')
;

INSERT INTO TASK (TNO, PNO, USERID, TMEMBER, TTITLE, TCONTENT, TSTATUS, tstartdate, tenddate, 
bref, brelevel, brestep) VALUES (task_sequence.NEXTVAL, '3', 'streamjj4@naver.co.kr', 'streamjj4@naver.co.kr', 
'회원가입 요청보냈는데... ', '확인 부탁드립니다.', '미진행', '2023-10-03', '2023-10-31', task_sequence.NEXTVAL, '0', '0')
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
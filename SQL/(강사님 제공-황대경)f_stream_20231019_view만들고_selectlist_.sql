		SELECT u.mname, pr.pstatus, u.mrank, pr.pmember AS userid, d.deptname, pr.pno, pr.pname, pr.pcontent, pr.paccess, pr.pdate, TO_CHAR(pr.PSTARTDATE, 'yyyy-mm-dd') PSTARTDATE, TO_CHAR(pr.PENDDATE, 'yyyy-mm-dd') PENDDATE, pr.pcolor, pr.pstatus as project_status, ROWNUM PROW , c.member_count as countMember
		FROM (SELECT mname, mrank, userid , deptno , ccode FROM users WHERE userid = 'sple@kh.co.kr') u
				JOIN dept d ON (u.deptno = d.deptno AND u.ccode = d.ccode)
			JOIN (SELECT ppr.*, jj.userid AS pmember FROM project ppr
				JOIN (SELECT mp.pno ,userid  FROM project pr JOIN member_project mp USING(userid)
						GROUP BY (mp.pno ,userid)
				) jj ON (ppr.pno = jj.PNO)
		WHERE PSTATUS IN ('미진행', '진행', '보류'))  pr ON (u.userid = pmember)
			LEFT JOIN (SELECT pno,COUNT(userid) AS member_count
						FROM member_project GROUP BY pno) c ON c.PNO=pr.PNO
                        ;

--sple@kh.co.kr
--로그인인한 회사?
--로그인한  - member_project - userid
--로그인한  - project - userid
--paccess - 'ACCESS'
(
    select * from project 
    where (userid='sple@kh.co.kr' or pno in (select pno from member_project where userid='sple@kh.co.kr'))
        and PSTATUS IN ('미진행', '진행', '보류'
--        , '숨김'
        )
        and PACCESS IN ('ACCESS')   
)
;
(select pno from member_project where userid='sple@kh.co.kr');


--project - userid  
-- + dept -dname 부서명 + users 직급, 이름
--project - pno, pname, 
-- countmember + member_project -
(select count(*) from member_project where pno=3);

-- 필요하면 넣기, pstatus, pdate, pstardate, penddate, pcolor, paccess, 
select tp.pno, tp.pname, tp.pstatus, tp.paccess
 , tp.userid, vud.mname, vud.mrank, vud.deptname   -- 작성자
-- , vump.userid as attend_userid, vump.mname as attend_mname, vump.MRANK as attend_mark, vump.mname as attend_detpname
 , (select count(*) from member_project where pno= tp.pno) as countmember
 from (
    select * from project 
    where (userid='sple@kh.co.kr' or pno in (select pno from member_project where userid='sple@kh.co.kr'))
        and PSTATUS IN ('미진행', '진행', '보류')
        and PACCESS IN ('ACCESS')
 ) tp
        join V_U_DEPT vud        on tp.userid = vud.userid
--        left outer join V_U_MEMBER_PROJECT vump on tp.pno = vump.pno
order by to_number(pno) desc
;

-- select one
-- 필요하면 넣기, pstatus, pdate, pstardate, penddate, pcolor, paccess, 
select tp.pno, tp.pname, tp.pstatus, tp.paccess
-- 날짜 등등 넣기
 , tp.userid, vud.mname, vud.mrank, vud.deptname   -- 작성자
 , vump.userid as attend_userid, vump.mname as attend_mname, vump.MRANK as attend_mark, vump.mname as attend_detpname
 , (select count(*) from member_project where pno= tp.pno) as countmember
 from (
    select * from project 
    where pno = '23'
 ) tp
        join V_U_DEPT vud        on tp.userid = vud.userid
        left outer join V_U_MEMBER_PROJECT vump on tp.pno = vump.pno
;



--    where
--    group by
--    having
--    order by

select * from project;
desc V_U_MEMBER_PROJECT;
select * from v_u_member_project;
CREATE OR REPLACE FORCE VIEW V_U_MEMBER_PROJECT
as 
  select PNO, USERID, MNAME, CCODE, DEPTNO
from member_project join users using(userid)
;

CREATE OR REPLACE FORCE VIEW V_U_MEMBER_PROJECT
as 
select PNO, USERID, MNAME, CCODE, DEPTNO, mrank, deptname
from member_project join  V_U_DEPT 
using (userid)
;
select * from V_U_MEMBER_PROJECT;

desc member_project;
select * from V_U_DEPT;
desc V_U_DEPT;
CREATE OR REPLACE FORCE VIEW V_U_DEPT
as 
select tu.userid, tu.mname, tu.mrank, td.deptno, td.deptname, tu.ccode
from users tu 
join dept td 
on (tu.deptno= td.deptno and tu.ccode= td.ccode)
;
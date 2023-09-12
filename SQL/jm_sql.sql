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
select count(pno) cnt from task group by pno;
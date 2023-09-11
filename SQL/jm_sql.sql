desc task;
desc project;

select pname from project;

select pname, count(tno) cnt
    from project
    join task using(pno)
    group by (pno, pname)
    ;
select tcontent, userid, tstatus, tdate, tstartdate, tenddate
    from task
    join project using(pno, userid)
    where pno=1
    ;

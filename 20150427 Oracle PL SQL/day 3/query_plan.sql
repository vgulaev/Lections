explain plan for
select *
--from CLIENTDEBT
--LEFT JOIN OURCLIENTS on OURCLIENTS.ID = CLIENTDEBT.CLIENTID;
from BILLSUM, OURCLIENTS
where OURCLIENTS.ID = BILLSUM.CLIENTID;

select * from table(dbms_xplan.display);
SET serveroutput ON
DECLARE
type array_c is TABLE of INTEGER index by BINARY_INTEGER;
companies array_c;
indx BINARY_INTEGER := 0;
i integer;

begin
  for rec in ( select * from ourclients) loop
    companies( indx ) := rec.id;
    indx := indx + 1;
  end loop;
  indx := 0;
  forall i in 1..200000
    INsert into billsum ( PERIOD, CLIENTID, CHARGE ) values ( TO_TIMESTAMP( '01-01-2003 2:00:00' ) + SYS.DBMS_RANDOM.VALUE() * 2000, companies( i ), SYS.DBMS_RANDOM.VALUE() * 10 );
  --for i in 1..10 loop
  --end loop;
  SYS.DBMS_OUTPUT.PUT_LINE( companies(4) );
end;
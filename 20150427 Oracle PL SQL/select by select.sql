DECLARE
    empname   INTEGER;
    locname VARCHAR2( 13 );
BEGIN
    SELECT DEPTNO
        INTO empname        
        FROM vg.emp
        WHERE empno = 7839;
    DBMS_OUTPUT.put_line( empname );
    select LOC
      into locname
      from VG.DEPT
      where DEPTNO = empname;
    DBMS_OUTPUT.put_line( locname );    
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.put_line('No records found!');
    WHEN TOO_MANY_ROWS THEN
        DBMS_OUTPUT.put_line('Found more than one string!');
END;
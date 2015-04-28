DECLARE

PROCEDURE create_table_clients AS
  sqltext VARCHAR2( 2000 );
  droptext VARCHAR2( 2000 );
BEGIN
    sqltext := 'CREATE TABLE myclient (
    id integer primary key,
    caption VARCHAR2( 200 ),
    DEBTLIMIT number( 10, 2 ) )';
    BEGIN
        EXECUTE IMMEDIATE sqltext;
        EXCEPTION
        WHEN OTHERS THEN
        droptext := 'drop table myclient';
        EXECUTE IMMEDIATE droptext;
        commit;
        EXECUTE IMMEDIATE sqltext;
        commit;
    end;

    DBMS_OUTPUT.PUT_LINE( 'create table' );
    for i in 1..200000 loop
        INSERT INTO myclient ( id, caption, DEBTLIMIT ) VALUES ( i, concat( 'Компания', i ), 1000 * round( (SYS.DBMS_RANDOM.VALUE() * 50 + 10 ) ) );
    end loop;

END create_table_clients;

PROCEDURE create_current_debt AS
  sqltext VARCHAR2( 2000 );
  droptext VARCHAR2( 2000 );
  instext VARCHAR2( 2000 );
BEGIN
    sqltext := 'CREATE TABLE currentdebt (
    idClient integer,
    debtsum number( 10, 2 ) )';
    BEGIN
        EXECUTE IMMEDIATE sqltext;
        EXCEPTION
        WHEN OTHERS THEN
        droptext := 'drop table currentdebt';
        EXECUTE IMMEDIATE droptext;
        commit;
        EXECUTE IMMEDIATE sqltext;
        commit;
    end;

    DBMS_OUTPUT.PUT_LINE( 'create table' );
    instext := 'INSERT INTO currentdebt ( idClient, debtsum ) VALUES ( :i, 1000 * round( (SYS.DBMS_RANDOM.VALUE() * 50 + 10 ) ) )';
 
    for i in 1..200000 loop
        EXECUTE IMMEDIATE instext USING i;
    end loop;

END create_current_debt;

BEGIN
create_table_clients();
create_current_debt();
end;
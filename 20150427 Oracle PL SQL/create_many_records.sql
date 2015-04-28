DECLARE
  i INTEGER;
BEGIN
  delete from goods;
  for i in 1..10000 loop
    INSERT into goods ( ID, CAPTION ) VALUES ( i, i );
  end loop;
end;
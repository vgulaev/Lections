create TABLE clientdebt (
clientid integer,
agreement VARCHAR2(50),
debtsum NUMBER(8,2),
CONSTRAINT pk_ClientDebt PRIMARY key ( clientid, agreement )
)
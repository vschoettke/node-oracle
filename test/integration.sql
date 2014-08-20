CREATE TABLE person (id INTEGER PRIMARY KEY, name VARCHAR(255));
CREATE SEQUENCE person_seq START WITH 1 INCREMENT BY 1 NOMAXVALUE;
CREATE TRIGGER person_pk_trigger BEFORE INSERT ON person FOR EACH row
 BEGIN
   SELECT person_seq.nextval INTO :new.id FROM dual;
 END;
/
CREATE TABLE datatype_test (
id INTEGER PRIMARY KEY,
tvarchar2 VARCHAR2(255),
tnvarchar2 NVARCHAR2(255),
tchar CHAR(255),
tnchar NCHAR(255),
tnumber NUMBER(10,5),
tdate DATE,
ttimestamp TIMESTAMP,
tclob CLOB,
tnclob NCLOB,
tblob BLOB);
CREATE SEQUENCE datatype_test_seq START WITH 1 INCREMENT BY 1 NOMAXVALUE;
CREATE TRIGGER datatype_test_pk_trigger BEFORE INSERT ON datatype_test FOR EACH row
 BEGIN
   SELECT datatype_test_seq.nextval INTO :new.id FROM dual;
 END;
/
-- CREATE TABLES
CREATE TABLE PERSON (
    driver_id VARCHAR(5) PRIMARY KEY,
    name VARCHAR(10),
    address VARCHAR(10)
);

CREATE TABLE CAR (
    regno VARCHAR(5) PRIMARY KEY,
    model VARCHAR(10),
    year NUMBER(4)
);

CREATE TABLE ACCIDENT (
    reportno VARCHAR(5) PRIMARY KEY,
    accdate NUMBER(4),
    location VARCHAR(10)
);

CREATE TABLE OWNS (
    driver_id VARCHAR(5),
    regno VARCHAR(5),
    PRIMARY KEY (driver_id, regno),
    FOREIGN KEY (driver_id) REFERENCES PERSON(driver_id),
    FOREIGN KEY (regno) REFERENCES CAR(regno)
);

CREATE TABLE PARTICIPATED (
    driver_id VARCHAR(5),
    regno VARCHAR(5),
    reportno VARCHAR(5),
    damageamount NUMBER(5),
    PRIMARY KEY (driver_id, regno, reportno),
    FOREIGN KEY (driver_id) REFERENCES PERSON(driver_id),
    FOREIGN KEY (regno) REFERENCES CAR(regno),
    FOREIGN KEY (reportno) REFERENCES ACCIDENT(reportno)
);

-- INSERT DATA
REM INSERTING into "SYSTEM"."PERSON"
SET DEFINE OFF;
Insert into "SYSTEM"."PERSON" (DRIVER_ID,NAME,ADDRESS) values ('1','John','Kolkata');
Insert into "SYSTEM"."PERSON" (DRIVER_ID,NAME,ADDRESS) values ('2','Jane','Chennai');
Insert into "SYSTEM"."PERSON" (DRIVER_ID,NAME,ADDRESS) values ('3','Alice','Mumbai');

REM INSERTING into "SYSTEM"."CAR"
SET DEFINE OFF;
Insert into "SYSTEM"."CAR" (REGNO,MODEL,YEAR) values ('KA01','Toyota',2015);
Insert into "SYSTEM"."CAR" (REGNO,MODEL,YEAR) values ('MH02','Honda',2018);
Insert into "SYSTEM"."CAR" (REGNO,MODEL,YEAR) values ('TN03','Ford',2012);

REM INSERTING into "SYSTEM"."ACCIDENT"
SET DEFINE OFF;
Insert into "SYSTEM"."ACCIDENT" (REPORTNO,ACCDATE,LOCATION) values ('101',2002,'20B More');
Insert into "SYSTEM"."ACCIDENT" (REPORTNO,ACCDATE,LOCATION) values ('102',2003,'A Road');
Insert into "SYSTEM"."ACCIDENT" (REPORTNO,ACCDATE,LOCATION) values ('103',2002,'B Road');

REM INSERTING into "SYSTEM"."OWNS"
SET DEFINE OFF;
Insert into "SYSTEM"."OWNS" (DRIVER_ID,REGNO) values ('1','KA01');
Insert into "SYSTEM"."OWNS" (DRIVER_ID,REGNO) values ('2','MH02');
Insert into "SYSTEM"."OWNS" (DRIVER_ID,REGNO) values ('3','TN03');

REM INSERTING into "SYSTEM"."PARTICIPATED"
SET DEFINE OFF;
Insert into "SYSTEM"."PARTICIPATED" (DRIVER_ID,REGNO,REPORTNO,DAMAGEAMOUNT) values ('1','KA01','101',5000);
Insert into "SYSTEM"."PARTICIPATED" (DRIVER_ID,REGNO,REPORTNO,DAMAGEAMOUNT) values ('2','MH02','102',6000);
Insert into "SYSTEM"."PARTICIPATED" (DRIVER_ID,REGNO,REPORTNO,DAMAGEAMOUNT) values ('3','TN03','103',8000);

--QUESTION 1
UPDATE PARTICIPATED 
SET damageamount = 8000
WHERE regno = 'TN03' AND reportno BETWEEN 1 AND 200;   --can change the values of the constraints regno and damageamout 
SELECT * FROM PARTICIPATED;
COMMIT;

--QUESTION 2
SELECT COUNT(DISTINCT OWNS.driver_id) AS OWNERS FROM OWNS
JOIN PARTICIPATED ON OWNS.regno = PARTICIPATED.regno
JOIN ACCIDENT ON PARTICIPATED.reportno = ACCIDENT.reportno
WHERE ACCIDENT.accdate = 2002;              --change the statements where EXTRACT(YEAR FROM ACCIDENT.accdate) to YEAR= (if taken NUMBER as datatype)

--QUESTION 3
SELECT COUNT(*) AS no_of_accidents FROM PARTICIPATED
JOIN CAR ON PARTICIPATED.regno = CAR.regno
WHERE CAR.model = 'Honda';        --can change the value of the constraint model

--QUESTION 4
SELECT PARTICIPATED.driver_id, PARTICIPATED.reportno FROM PARTICIPATED
JOIN ACCIDENT ON PARTICIPATED.reportno = ACCIDENT.reportno
WHERE PARTICIPATED.driver_id = 2 AND ACCIDENT.accdate = 2003;  --can change the value of the constraint driver_id

--QUESTION 5
SELECT PERSON.driver_id, PERSON.name, CAR.model FROM PERSON
JOIN OWNS ON PERSON.driver_id = OWNS.driver_id
JOIN CAR ON OWNS.regno = CAR.regno;
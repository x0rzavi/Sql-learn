-- CREATE TABLES
CREATE TABLE STUDENT (
    regno VARCHAR(5) PRIMARY KEY,
    name VARCHAR(10),
    major VARCHAR(5),
    bdate DATE
);

CREATE TABLE COURSE (
    courseno VARCHAR(5) PRIMARY KEY,
    cname VARCHAR(10),
    dept VARCHAR(5)
);

CREATE TABLE ENROLL (
    regno VARCHAR(5) PRIMARY KEY,
    courseno VARCHAR(5) NOT NULL,
    sem NUMBER(1),
    marks NUMBER(3),
    FOREIGN KEY (regno) REFERENCES STUDENT(regno),
    FOREIGN KEY (courseno) REFERENCES COURSE(courseno)
);

CREATE TABLE TEXT (
    book_isbn NUMBER(5) PRIMARY KEY,
    book_title VARCHAR(10),
    publisher VARCHAR(10),
    author VARCHAR(10)
);

CREATE TABLE BOOK_ADAPTATION (
    courseno VARCHAR(5),
    sem NUMBER(1),
    book_isbn NUMBER(5) NOT NULL,
    FOREIGN KEY (courseno) REFERENCES COURSE(courseno),
    FOREIGN KEY (book_isbn) REFERENCES TEXT(book_isbn)
);

-- INSERT DATA
REM INSERTING into "SYSTEM"."STUDENT"
SET DEFINE OFF;
Insert into "SYSTEM"."STUDENT" (REGNO,NAME,MAJOR,BDATE) values ('101','Alice','CS',to_date('15/04/03','DD/MM/RR'));
Insert into "SYSTEM"."STUDENT" (REGNO,NAME,MAJOR,BDATE) values ('102','Bob','IT',to_date('22/07/02','DD/MM/RR'));
Insert into "SYSTEM"."STUDENT" (REGNO,NAME,MAJOR,BDATE) values ('103','Carol','CS',to_date('05/09/03','DD/MM/RR'));
Insert into "SYSTEM"."STUDENT" (REGNO,NAME,MAJOR,BDATE) values ('104','David','EE',to_date('19/11/01','DD/MM/RR'));
Insert into "SYSTEM"."STUDENT" (REGNO,NAME,MAJOR,BDATE) values ('105','Eva','ME',to_date('27/02/02','DD/MM/RR'));

REM INSERTING into "SYSTEM"."COURSE"
SET DEFINE OFF;
Insert into "SYSTEM"."COURSE" (COURSENO,CNAME,DEPT) values ('201','DBMS','CS');
Insert into "SYSTEM"."COURSE" (COURSENO,CNAME,DEPT) values ('202','OS','CS');
Insert into "SYSTEM"."COURSE" (COURSENO,CNAME,DEPT) values ('203','CN','IT');
Insert into "SYSTEM"."COURSE" (COURSENO,CNAME,DEPT) values ('204','CONSYS','EE');
Insert into "SYSTEM"."COURSE" (COURSENO,CNAME,DEPT) values ('205','THERMO','ME');
Insert into "SYSTEM"."COURSE" (COURSENO,CNAME,DEPT) values ('206','OOPS','IT');

REM INSERTING into "SYSTEM"."ENROLL"
SET DEFINE OFF;
Insert into "SYSTEM"."ENROLL" (REGNO,COURSENO,SEM,MARKS) values ('101','201',4,85);
Insert into "SYSTEM"."ENROLL" (REGNO,COURSENO,SEM,MARKS) values ('102','202',3,78);
Insert into "SYSTEM"."ENROLL" (REGNO,COURSENO,SEM,MARKS) values ('103','201',4,91);
Insert into "SYSTEM"."ENROLL" (REGNO,COURSENO,SEM,MARKS) values ('104','204',5,72);
Insert into "SYSTEM"."ENROLL" (REGNO,COURSENO,SEM,MARKS) values ('105','205',5,88);

REM INSERTING into "SYSTEM"."TEXT"
SET DEFINE OFF;
Insert into "SYSTEM"."TEXT" (BOOK_ISBN,BOOK_TITLE,PUBLISHER,AUTHOR) values (1001,'Dbms','Hill','Navathe');
Insert into "SYSTEM"."TEXT" (BOOK_ISBN,BOOK_TITLE,PUBLISHER,AUTHOR) values (1002,'Os','Pearson','Siber');
Insert into "SYSTEM"."TEXT" (BOOK_ISBN,BOOK_TITLE,PUBLISHER,AUTHOR) values (1003,'Datacomms','Tata','Tanen');
Insert into "SYSTEM"."TEXT" (BOOK_ISBN,BOOK_TITLE,PUBLISHER,AUTHOR) values (1004,'Connsys','Wiley','Ogata');
Insert into "SYSTEM"."TEXT" (BOOK_ISBN,BOOK_TITLE,PUBLISHER,AUTHOR) values (1005,'Thermo','Camb','Sonntag');

REM INSERTING into "SYSTEM"."BOOK_ADAPTATION"
SET DEFINE OFF;
Insert into "SYSTEM"."BOOK_ADAPTATION" (COURSENO,SEM,BOOK_ISBN) values ('201',4,1001);
Insert into "SYSTEM"."BOOK_ADAPTATION" (COURSENO,SEM,BOOK_ISBN) values ('202',3,1002);
Insert into "SYSTEM"."BOOK_ADAPTATION" (COURSENO,SEM,BOOK_ISBN) values ('203',3,1003);
Insert into "SYSTEM"."BOOK_ADAPTATION" (COURSENO,SEM,BOOK_ISBN) values ('204',5,1004);
Insert into "SYSTEM"."BOOK_ADAPTATION" (COURSENO,SEM,BOOK_ISBN) values ('205',5,1005);

-- QUESTION i
INSERT INTO TEXT VALUES(1006,'Oop','Springer','Carls');
INSERT INTO BOOK_ADAPTATION VALUES(206,3,1006);

-- MORE VALUES NEEDED
REM INSERTING into "SYSTEM"."BOOK_ADAPTATION"
SET DEFINE OFF;
Insert into "SYSTEM"."BOOK_ADAPTATION" (COURSENO,SEM,BOOK_ISBN) values ('201',3,1001);
Insert into "SYSTEM"."BOOK_ADAPTATION" (COURSENO,SEM,BOOK_ISBN) values ('202',5,1002);
Insert into "SYSTEM"."BOOK_ADAPTATION" (COURSENO,SEM,BOOK_ISBN) values ('201',6,1001);
Insert into "SYSTEM"."BOOK_ADAPTATION" (COURSENO,SEM,BOOK_ISBN) values ('202',6,1002);

COMMIT; 

-- QUESTION ii
SELECT DISTINCT t.book_title
FROM TEXT t
JOIN BOOK_ADAPTATION ba ON t.book_isbn = ba.book_isbn
JOIN Course c ON ba.courseNo = c.courseNo
WHERE c.dept = 'CS'
GROUP BY t.book_title
HAVING COUNT(ba.book_isbn) > 2
ORDER BY t.book_title;

-- QUESTION iii
SELECT c.dept
FROM COURSE c
JOIN BOOK_ADAPTATION ba ON c.courseNo = ba.courseNo
JOIN TEXT t ON ba.book_isbn = t.book_isbn
WHERE t.publisher = 'Wiley'  
GROUP BY c.dept
HAVING COUNT(DISTINCT t.publisher) = 1; 

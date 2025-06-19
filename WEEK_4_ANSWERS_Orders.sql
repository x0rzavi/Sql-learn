-- CREATE TABLES
CREATE TABLE CUSTOMER (
    cid NUMBER(5) PRIMARY KEY,
    cname VARCHAR(10),
    city VARCHAR(10)
);

CREATE TABLE ORDERS (
    ono NUMBER(5) PRIMARY KEY,
    odate DATE,
    cid NUMBER(5),
    order_amt NUMBER(5),
    FOREIGN KEY (cid) REFERENCES CUSTOMER(cid)
);

CREATE TABLE ITEM_4 (
    ino NUMBER(5) PRIMARY KEY,
    price NUMBER(5)
);

CREATE TABLE ORDER_ITEM (
    ono NUMBER(5),
    ino NUMBER(5),
    qty NUMBER(5),
    PRIMARY KEY(ono, ino),
    FOREIGN KEY (ono) REFERENCES ORDERS(ono),
    FOREIGN KEY (ino) REFERENCES ITEM_4(ino)
);

CREATE TABLE WAREHOUSE (
    wareno NUMBER(5) PRIMARY KEY,
    city VARCHAR(10)
);

CREATE TABLE SHIPMENT (
    ono NUMBER(5),
    wareno NUMBER(5),
    shipdate DATE,
    FOREIGN KEY (ono) REFERENCES ORDERS(ono),
    FOREIGN KEY (wareno) REFERENCES WAREHOUSE(wareno)
);

-- INSERT DATA
REM INSERTING into "SYSTEM"."CUSTOMER"
SET DEFINE OFF;
Insert into "SYSTEM"."CUSTOMER" (CID,CNAME,CITY) values (1,'Alice','Delhi');
Insert into "SYSTEM"."CUSTOMER" (CID,CNAME,CITY) values (2,'Bob','Mumbai');
Insert into "SYSTEM"."CUSTOMER" (CID,CNAME,CITY) values (3,'Charlie','Kolkata');
Insert into "SYSTEM"."CUSTOMER" (CID,CNAME,CITY) values (4,'David','Delhi');
Insert into "SYSTEM"."CUSTOMER" (CID,CNAME,CITY) values (5,'Eve','Mumbai');

REM INSERTING into "SYSTEM"."ORDERS"
SET DEFINE OFF;
Insert into "SYSTEM"."ORDERS" (ONO,ODATE,CID,ORDER_AMT) values (101,to_date('01/03/25','DD/MM/RR'),1,500);
Insert into "SYSTEM"."ORDERS" (ONO,ODATE,CID,ORDER_AMT) values (102,to_date('02/03/25','DD/MM/RR'),2,700);
Insert into "SYSTEM"."ORDERS" (ONO,ODATE,CID,ORDER_AMT) values (103,to_date('03/03/25','DD/MM/RR'),3,300);
Insert into "SYSTEM"."ORDERS" (ONO,ODATE,CID,ORDER_AMT) values (104,to_date('04/03/25','DD/MM/RR'),4,900);
Insert into "SYSTEM"."ORDERS" (ONO,ODATE,CID,ORDER_AMT) values (105,to_date('05/03/25','DD/MM/RR'),5,1200);

REM INSERTING into "SYSTEM"."ITEM_4"
SET DEFINE OFF;
Insert into "SYSTEM"."ITEM_4" (INO,PRICE) values (201,50);
Insert into "SYSTEM"."ITEM_4" (INO,PRICE) values (202,150);
Insert into "SYSTEM"."ITEM_4" (INO,PRICE) values (203,200);
Insert into "SYSTEM"."ITEM_4" (INO,PRICE) values (204,500);
Insert into "SYSTEM"."ITEM_4" (INO,PRICE) values (205,300);

REM INSERTING into "SYSTEM"."ORDER_ITEM"
SET DEFINE OFF;
Insert into "SYSTEM"."ORDER_ITEM" (ONO,INO,QTY) values (101,201,2);
Insert into "SYSTEM"."ORDER_ITEM" (ONO,INO,QTY) values (102,202,1);
Insert into "SYSTEM"."ORDER_ITEM" (ONO,INO,QTY) values (103,203,6);
Insert into "SYSTEM"."ORDER_ITEM" (ONO,INO,QTY) values (104,204,12);
Insert into "SYSTEM"."ORDER_ITEM" (ONO,INO,QTY) values (105,205,7);

REM INSERTING into "SYSTEM"."WAREHOUSE"
SET DEFINE OFF;
Insert into "SYSTEM"."WAREHOUSE" (WARENO,CITY) values (301,'Delhi');
Insert into "SYSTEM"."WAREHOUSE" (WARENO,CITY) values (302,'Mumbai');
Insert into "SYSTEM"."WAREHOUSE" (WARENO,CITY) values (303,'Kolkata');
Insert into "SYSTEM"."WAREHOUSE" (WARENO,CITY) values (304,'Chennai');
Insert into "SYSTEM"."WAREHOUSE" (WARENO,CITY) values (305,'Gujrat');

REM INSERTING into "SYSTEM"."SHIPMENT"
SET DEFINE OFF;
Insert into "SYSTEM"."SHIPMENT" (ONO,WARENO,SHIPDATE) values (101,301,to_date('07/03/24','DD/MM/RR'));
Insert into "SYSTEM"."SHIPMENT" (ONO,WARENO,SHIPDATE) values (102,302,to_date('08/03/24','DD/MM/RR'));
Insert into "SYSTEM"."SHIPMENT" (ONO,WARENO,SHIPDATE) values (103,303,to_date('09/03/24','DD/MM/RR'));
Insert into "SYSTEM"."SHIPMENT" (ONO,WARENO,SHIPDATE) values (104,304,to_date('10/03/24','DD/MM/RR'));
Insert into "SYSTEM"."SHIPMENT" (ONO,WARENO,SHIPDATE) values (105,305,to_date('12/03/24','DD/MM/RR'));

--QUESTION i
SELECT c.cname, COUNT(o.ono) AS no_of_orders, AVG(o.order_amt) AS avg_order_amt
FROM CUSTOMER c 
JOIN ORDERS o ON c.cid = o.cid
GROUP BY c.cname;

--QUESTION ii
SELECT s.ono order_no
FROM SHIPMENT s 
JOIN WAREHOUSE w ON s.wareno = w.wareno
WHERE w.city = 'Delhi';           --can change this

--QUESTION iii
SELECT o.ono order_no
FROM ORDERS o
JOIN CUSTOMER c ON o.cid = c.cid
WHERE c.city = 'Kolkata';         ---can change this

--QUESTION iv
SELECT * 
FROM ORDERS 
NATURAL JOIN ORDER_ITEM;

COMMIT;
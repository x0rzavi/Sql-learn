-- Create tables
create table patient (
   p_id      varchar(5) primary key,
   p_name    varchar(10),
   p_dob     date,
   p_ailment varchar(10),
   p_bill    number(10),
   p_contact varchar(10),
   p_addr    varchar(10)
);

-- Insert data
INSERT ALL
   INTO PATIENT(P_ID, P_NAME, P_DOB, P_AILMENT, P_BILL, P_CONTACT, P_ADDR)
   VALUES ('P1', 'Amit', '15-JUN-1955', 'Diabetes', 18000, 9876543210, 'Kolkata')
   INTO PATIENT(P_ID, P_NAME, P_DOB, P_AILMENT, P_BILL, P_CONTACT, P_ADDR)
   VALUES ('P2', 'Rina', '23-NOV-1982', 'Heart', 25000, 9876543211, 'Delhi')
   INTO PATIENT(P_ID, P_NAME, P_DOB, P_AILMENT, P_BILL, P_CONTACT, P_ADDR)
   VALUES ('P3', 'Soham', '10-APR-1987', 'Tension', 15000, 9876543212, 'Kolkata')
   INTO PATIENT(P_ID, P_NAME, P_DOB, P_AILMENT, P_BILL, P_CONTACT, P_ADDR)
   VALUES ('P4', 'Neha', '01-SEP-1992', 'Arthritis', 22000, 9876543122, 'Mumbai')
   INTO PATIENT(P_ID, P_NAME, P_DOB, P_AILMENT, P_BILL, P_CONTACT, P_ADDR)
   VALUES ('P5', 'Rajesh', '05-DEC-1950', 'Heart', 30000, 9876543215, 'Kolkata')
SELECT 1 FROM DUAL;

-- 2
select *
  from patient;

-- 3
select p_name
  from patient
 where months_between(
   sysdate,
   p_dob
) / 12 >= 60;

-- 4
select p_name
  from patient
 where p_ailment = 'Heart'
   and p_addr = 'Kolkata';

-- 5
select p_id,
       p_name,
       p_bill
  from patient
 where p_bill >= 20000
   and p_addr <> 'Kolkata';

-- 6
select p_name,
       p_dob
  from patient
 where p_dob between '01-JAN-1980' and '31-DEC-1990';

-- 7
select p_name
  from patient
 where p_addr = 'Kolkata';
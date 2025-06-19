-- Branch table
CREATE TABLE BRANCH (
    branch_name VARCHAR2(10) PRIMARY KEY,
    branch_city VARCHAR2(10) NOT NULL,
    assets NUMBER NOT NULL
);

-- Customer table
CREATE TABLE CUSTOMER_7 (
    customer_name VARCHAR2(10) PRIMARY KEY,
    customer_street VARCHAR2(10) NOT NULL,
    city VARCHAR2(10) NOT NULL
);

-- Account table
CREATE TABLE ACCOUNT (
    accno NUMBER PRIMARY KEY,
    branch_name VARCHAR2(10) NOT NULL,
    balance NUMBER NOT NULL,
    FOREIGN KEY (branch_name) REFERENCES BRANCH(branch_name)
);

-- Depositor table
CREATE TABLE DEPOSITOR (
    customer_name VARCHAR2(10),
    accno NUMBER,
    FOREIGN KEY (customer_name) REFERENCES CUSTOMER_7(customer_name),
    FOREIGN KEY (accno) REFERENCES ACCOUNT(accno)
);

-- Loan table
CREATE TABLE LOAN (
    loan_number NUMBER PRIMARY KEY,
    branch_name VARCHAR2(10) NOT NULL,
    amount NUMBER NOT NULL,
    FOREIGN KEY (branch_name) REFERENCES BRANCH(branch_name)
);

-- Borrower table
CREATE TABLE BORROWER (
    customer_name VARCHAR2(10),
    loan_number NUMBER,
    FOREIGN KEY (customer_name) REFERENCES CUSTOMER_7(customer_name),
    FOREIGN KEY (loan_number) REFERENCES LOAN(loan_number)
);

-- Insert tuples into Branch table
INSERT INTO BRANCH VALUES ('B001', 'New York', 1000000);
INSERT INTO BRANCH VALUES ('B002', 'Los A', 2000000);
INSERT INTO BRANCH VALUES ('B003', 'Chicago', 1500000);
INSERT INTO BRANCH VALUES ('B004', 'Houston', 1200000);
INSERT INTO BRANCH VALUES ('B005', 'Phoenix', 1100000);

-- Insert tuples into Account table
INSERT INTO ACCOUNT VALUES (1001, 'B001', 5000);
INSERT INTO ACCOUNT VALUES (1002, 'B001', 8000);
INSERT INTO ACCOUNT VALUES (1003, 'B002', 6000);
INSERT INTO ACCOUNT VALUES (1004, 'B003', 7000);
INSERT INTO ACCOUNT VALUES (1005, 'B004', 9000);

-- Insert tuples into Customer table
INSERT INTO CUSTOMER_7 VALUES ('Alice', '1st Street', 'New York');
INSERT INTO CUSTOMER_7 VALUES ('Bob', '2nd Street', 'Los A');
INSERT INTO CUSTOMER_7 VALUES ('Charlie', '3rd Street', 'Chicago');
INSERT INTO CUSTOMER_7 VALUES ('David', '4th Street', 'Houston');
INSERT INTO CUSTOMER_7 VALUES ('Eve', '5th Street', 'Phoenix');

-- Insert tuples into Depositor table
INSERT INTO DEPOSITOR VALUES ('Alice', 1001);
INSERT INTO DEPOSITOR VALUES ('Alice', 1002);
INSERT INTO DEPOSITOR VALUES ('Bob', 1003);
INSERT INTO DEPOSITOR VALUES ('Charlie', 1004);
INSERT INTO DEPOSITOR VALUES ('David', 1005);

-- Insert tuples into Loan table
INSERT INTO LOAN VALUES (2001, 'B001', 10000);
INSERT INTO LOAN VALUES (2002, 'B001', 15000);
INSERT INTO LOAN VALUES (2003, 'B002', 20000);
INSERT INTO LOAN VALUES (2004, 'B003', 25000);
INSERT INTO LOAN VALUES (2005, 'B004', 30000);

-- Insert tuples into Borrower table
INSERT INTO BORROWER VALUES ('Alice', 2001);
INSERT INTO BORROWER VALUES ('Bob', 2002);
INSERT INTO BORROWER VALUES ('Charlie', 2003);
INSERT INTO BORROWER VALUES ('David', 2004);
INSERT INTO BORROWER VALUES ('Eve', 2005);

-- Question iii
SELECT customer_name
FROM Depositor D
JOIN Account A ON D.accno = A.accno
WHERE A.branch_name = 'B001'
GROUP BY customer_name
HAVING COUNT(DISTINCT A.accno) >= 2;

-- Question iv
SELECT customer_name
FROM Depositor D
JOIN Account A ON D.accno = A.accno
JOIN Branch B ON A.branch_name = B.branch_name
WHERE B.branch_city = 'New York'
GROUP BY customer_name
HAVING COUNT(DISTINCT A.branch_name) = 
    (SELECT COUNT(branch_name) FROM Branch 
    WHERE branch_city = 'New York');

-- Question v
DELETE FROM Account
WHERE branch_name IN (SELECT branch_name FROM Branch WHERE branch_city = 'Los Angeles');

COMMIT;
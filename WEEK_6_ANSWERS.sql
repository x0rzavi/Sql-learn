-- 1. Creating Tables with Primary and Foreign Keys in Oracle
CREATE TABLE Author (
    author_id NUMBER PRIMARY KEY,
    aname VARCHAR2(100),
    acity VARCHAR2(100),
    acountry VARCHAR2(100)
);

CREATE TABLE Publisher (
    pub_id NUMBER PRIMARY KEY,
    pname VARCHAR2(100),
    pcity VARCHAR2(100),
    pcountry VARCHAR2(100)
);

CREATE TABLE Category (
    category_id NUMBER PRIMARY KEY,
    description VARCHAR2(255)
);

CREATE TABLE Catalog_6 (
    book_id NUMBER PRIMARY KEY,
    btitle VARCHAR2(255),
    author_id NUMBER,
    pub_id NUMBER,
    category_id NUMBER,
    year NUMBER,
    price NUMBER,
    FOREIGN KEY (author_id) REFERENCES Author(author_id),
    FOREIGN KEY (pub_id) REFERENCES Publisher(pub_id),
    FOREIGN KEY (category_id) REFERENCES Category(category_id)
);

CREATE TABLE Order_details (
    order_no NUMBER PRIMARY KEY,
    book_id NUMBER,
    quantity NUMBER,
    FOREIGN KEY (book_id) REFERENCES Catalog_6(book_id)
);


-- 2. Inserting Sample Data (At least 5 tuples per relation)
INSERT INTO Author VALUES 
(1, 'John Doe', 'New York', 'USA');
INSERT INTO Author VALUES 
(2, 'Alice Smith', 'London', 'UK');
INSERT INTO Author VALUES 
(3, 'Mark Johnson', 'Los Angeles', 'USA');
INSERT INTO Author VALUES 
(4, 'Emily Davis', 'Paris', 'France');
INSERT INTO Author VALUES 
(5, 'Robert Brown', 'Berlin', 'Germany');

INSERT INTO Publisher VALUES 
(1, 'Pearson', 'New York', 'USA');
INSERT INTO Publisher VALUES 
(2, 'Oxford Press', 'Oxford', 'UK');
INSERT INTO Publisher VALUES 
(3, 'McGraw-Hill', 'Boston', 'USA');
INSERT INTO Publisher VALUES 
(4, 'Penguin', 'London', 'UK');
INSERT INTO Publisher VALUES 
(5, 'Springer', 'Berlin', 'Germany');

INSERT INTO Category VALUES 
(1, 'Fiction');
INSERT INTO Category VALUES 
(2, 'Non-Fiction');
INSERT INTO Category VALUES 
(3, 'Science');
INSERT INTO Category VALUES 
(4, 'Technology');
INSERT INTO Category VALUES 
(5, 'History');

INSERT INTO Catalog_6 VALUES 
(101, 'Book A', 1, 1, 3, 2015, 500);
INSERT INTO Catalog_6 VALUES 
(102, 'Book B', 2, 2, 2, 2018, 600);
INSERT INTO Catalog_6 VALUES 
(103, 'Book C', 2, 3, 1, 2021, 700);
INSERT INTO Catalog_6 VALUES 
(104, 'Book D', 3, 4, 4, 2005, 800);
INSERT INTO Catalog_6 VALUES 
(105, 'Book E', 3, 5, 5, 2022, 900);

INSERT INTO Order_details VALUES 
(1001, 101, 5);
INSERT INTO Order_details VALUES 
(1002, 102, 10);
INSERT INTO Order_details VALUES 
(1003, 103, 8);
INSERT INTO Order_details VALUES 
(1004, 104, 12);
INSERT INTO Order_details VALUES 
(1005, 105, 15);

-- 3. 
SELECT a.author_id, a.aname, a.acity, a.acountry
FROM Author a
JOIN Catalog_6 c ON a.author_id = c.author_id
WHERE c.price > (SELECT AVG(price) FROM Catalog_6)
AND c.year > 2000
GROUP BY a.author_id, a.aname, a.acity, a.acountry
HAVING COUNT(c.book_id) >= 2;

-- 4. 
SELECT a.author_id, a.aname, a.acity, a.acountry
FROM Author a
JOIN Catalog_6 c ON a.author_id = c.author_id
JOIN Order_details o ON c.book_id = o.book_id
WHERE o.quantity = (
    SELECT MAX(quantity) 
    FROM Order_details
);

--5.
UPDATE Catalog_6
SET price = price * 1.10
WHERE pub_id = (SELECT pub_id FROM Publisher WHERE pname = 'Pearson');

SELECT * FROM Catalog_6;







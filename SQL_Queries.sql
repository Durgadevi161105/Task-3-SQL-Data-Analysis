Database: task3_sql

Create Database
CREATE DATABASE IF NOT EXISTS task3_sql;

Use Database
USE task3_sql;

Create Tables
CREATE TABLE IF NOT EXISTS Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(100),
    City VARCHAR(50),
    Country VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Category VARCHAR(50),
    Price DECIMAL(10,2)
);

CREATE TABLE IF NOT EXISTS Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    ProductID INT,
    Quantity INT,
    OrderDate DATE,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

Insert Data
INSERT INTO Customers VALUES
(1,'Arun','Chennai','India'),
(2,'Priya','Coimbatore','India'),
(3,'Rahul','Bangalore','India'),
(4,'John','New York','USA'),
(5,'Sara','London','UK');

INSERT INTO Products VALUES
(101,'Laptop','Electronics',50000),
(102,'Mobile','Electronics',25000),
(103,'Headphones','Accessories',2000),
(104,'Keyboard','Accessories',1500),
(105,'Mouse','Accessories',800);

INSERT INTO Orders VALUES
(1001,1,101,1,'2025-07-01'),
(1002,2,102,2,'2025-07-02'),
(1003,3,103,3,'2025-07-03'),
(1004,1,104,2,'2025-07-04'),
(1005,5,105,5,'2025-07-05');

SELECT
SELECT * FROM Customers;
SELECT * FROM Products;
SELECT * FROM Orders;


WHERE
SELECT *
FROM Customers
WHERE Country='India';


ORDER BY
SELECT *
FROM Products
ORDER BY Price DESC;

GROUP BY
SELECT Category,
AVG(Price) AS AveragePrice
FROM Products
GROUP BY Category;


Aggregate Functions
SELECT SUM(Quantity) AS TotalQuantity
FROM Orders;

SELECT AVG(Price) AS AveragePrice
FROM Products;

INNER JOIN
SELECT
Customers.CustomerName,
Products.ProductName,
Orders.Quantity
FROM Orders
INNER JOIN Customers
ON Orders.CustomerID=Customers.CustomerID
INNER JOIN Products
ON Orders.ProductID=Products.ProductID;

LEFT JOIN
SELECT
Customers.CustomerName,
Orders.OrderID
FROM Customers
LEFT JOIN Orders
ON Customers.CustomerID=Orders.CustomerID;

RIGHT JOIN
SELECT
Customers.CustomerName,
Orders.OrderID
FROM Customers
RIGHT JOIN Orders
ON Customers.CustomerID=Orders.CustomerID;


Subquery
SELECT *
FROM Products
WHERE Price >
(
SELECT AVG(Price)
FROM Products
);

View
CREATE OR REPLACE VIEW CustomerOrders AS
SELECT
Customers.CustomerName,
Products.ProductName,
Orders.Quantity
FROM Orders
INNER JOIN Customers
ON Orders.CustomerID=Customers.CustomerID
INNER JOIN Products
ON Orders.ProductID=Products.ProductID;

SELECT * FROM CustomerOrders;


Index
CREATE INDEX idx_customer
ON Orders(CustomerID);

SHOW INDEX FROM Orders;


Additional Queries
Highest priced product
SELECT *
FROM Products
ORDER BY Price DESC
LIMIT 1;

Total Orders by Customer
SELECT
Customers.CustomerName,
COUNT(Orders.OrderID) AS TotalOrders
FROM Customers
LEFT JOIN Orders
ON Customers.CustomerID=Orders.CustomerID
GROUP BY Customers.CustomerName;

Revenue of each Order
SELECT
Orders.OrderID,
Products.ProductName,
Orders.Quantity,
Products.Price,
(Orders.Quantity * Products.Price) AS Revenue
FROM Orders
INNER JOIN Products
ON Orders.ProductID=Products.ProductID;

Total Revenue
SELECT
SUM(Orders.Quantity * Products.Price) AS TotalRevenue
FROM Orders
INNER JOIN Products
ON Orders.ProductID=Products.ProductID;


-- End of Task
-- ===========================================

USE task3_sql;

-- Display all customers
SELECT * FROM Customers;

-- Display all products
SELECT * FROM Products;

-- Display all orders
SELECT * FROM Orders;

-- WHERE
SELECT *
FROM Products
WHERE Price > 5000;

-- ORDER BY
SELECT *
FROM Products
ORDER BY Price DESC;

-- GROUP BY
SELECT ProductID,
SUM(Quantity) AS Total_Quantity
FROM Orders
GROUP BY ProductID;

-- INNER JOIN
SELECT
o.OrderID,
c.CustomerName,
p.ProductName,
o.Quantity
FROM Orders o
INNER JOIN Customers c
ON o.CustomerID = c.CustomerID
INNER JOIN Products p
ON o.ProductID = p.ProductID;

-- LEFT JOIN
SELECT
c.CustomerName,
o.OrderID
FROM Customers c
LEFT JOIN Orders o
ON c.CustomerID = o.CustomerID;

-- RIGHT JOIN
SELECT
p.ProductName,
o.OrderID
FROM Orders o
RIGHT JOIN Products p
ON o.ProductID = p.ProductID;

-- Aggregate SUM
SELECT
SUM(Quantity) AS Total_Items_Sold
FROM Orders;

-- Aggregate AVG
SELECT
AVG(Price) AS Average_Product_Price
FROM Products;

-- Revenue
SELECT
SUM(p.Price * o.Quantity) AS Total_Revenue
FROM Orders o
JOIN Products p
ON o.ProductID = p.ProductID;

-- Subquery
SELECT *
FROM Products
WHERE Price >
(
SELECT AVG(Price)
FROM Products
);

-- View
CREATE VIEW CustomerOrders AS
SELECT
c.CustomerName,
p.ProductName,
o.Quantity
FROM Orders o
JOIN Customers c
ON o.CustomerID=c.CustomerID
JOIN Products p
ON o.ProductID=p.ProductID;

SELECT * FROM CustomerOrders;

-- Index
CREATE INDEX idx_product
ON Products(ProductName);

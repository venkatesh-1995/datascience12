-- select * from PRODUCTS1


--1.INNER JOIN

SELECT 
    t1.CustomerID, 
    t1.CustomerName, 
    t2.ProductName, 
    t2.Price
FROM 
    CUSTOMERS1 t1
INNER JOIN 
    PRODUCTS1 t2
ON 
    t1.CustomerID = t2.CustomerID;

--LEFT JOIN (LEFT OUTER JOIN)
SELECT 
    t1.CustomerID, 
    t1.CustomerName, 
    t2.ProductName, 
    t2.Price
FROM 
    Customers t1
LEFT JOIN 
    Products t2
ON 
    t1.CustomerID = t2.CustomerID;



--- 3. RIGHT JOIN (RIGHT OUTER JOIN)
---------------------------------------------------------
SELECT 
    t1.CustomerID, 
    t1.CustomerName, 
    t2.ProductName, 
    t2.Price
FROM 
    Customers t1
RIGHT JOIN 
    Products t2
ON 
    t1.CustomerID = t2.CustomerID;

---------------------------------------------------------
-- 4.FULL OUTER JOIN
---------------------------------------------------------
SELECT 
    t1.CustomerID, 
    t1.CustomerName, 
    t2.ProductName, 
    t2.Price
FROM 
    Customers t1
FULL OUTER JOIN 
    Products t2
ON 
    t1.CustomerID = t2.CustomerID;

---------------------------------------------------------
-- 5️.SYMMETRIC DIFFERENCE (records not matching)
---------------------------------------------------------
SELECT 
    t1.CustomerID, 
    t1.CustomerName, 
    t2.ProductName, 
    t2.Price
FROM 
    Customers t1
LEFT JOIN 
    Products t2
ON 
    t1.CustomerID = t2.CustomerID
WHERE 
    t2.CustomerID IS NULL

UNION

SELECT 
    t1.CustomerID, 
    t1.CustomerName, 
    t2.ProductName, 
    t2.Price
FROM 
    Customers t1
RIGHT JOIN 
    Products t2
ON 
    t1.CustomerID = t2.CustomerID
WHERE 
    t1.CustomerID IS NULL;
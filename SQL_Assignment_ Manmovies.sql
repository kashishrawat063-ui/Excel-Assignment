USE sql_assignment;

SELECT 
    c.CustomerName,
    o.OrderID,
    o.OrderAmount
FROM Customers c
JOIN Orders o
    ON c.CustomerID = o.CustomerID
ORDER BY o.OrderAmount DESC
LIMIT 5;
SELECT CustomerName
FROM Customers
WHERE CustomerName REGEXP '^[ARS]';
SELECT 
    c.CustomerName,
    o.OrderID,
    o.OrderAmount,
    o.Status
FROM Customers c
JOIN Orders o
    ON c.CustomerID = o.CustomerID
WHERE o.OrderAmount > 10000
  AND o.Status = 'Pending';
  SELECT
    CustomerName,
    JoinDate,
    DATEDIFF(CURDATE(), JoinDate) AS DaysAssociated
FROM Customers
WHERE DATEDIFF(CURDATE(), JoinDate) > 365;
SELECT
    OrderID,
    OrderAmount AS CurrentAmount,
    OrderAmount * 0.18 AS GST,
    OrderAmount + (OrderAmount * 0.18) AS TotalAmountAfterGST,
    DATE_ADD(OrderDate, INTERVAL 15 DAY) AS ExpectedCollectionDate
FROM Orders;
SELECT
    OrderID,
    CustomerID,
    OrderAmount
FROM Orders
ORDER BY OrderAmount DESC
LIMIT 10 OFFSET 10;
SELECT
    c.CustomerID,
    c.CustomerName,
    c.JoinDate,
    DATEDIFF(CURDATE(), c.JoinDate) AS DaysSinceRegistration
FROM Customers c
LEFT JOIN Orders o
    ON c.CustomerID = o.CustomerID
WHERE o.OrderID IS NULL;
SELECT
    e.EmployeeName AS EmployeeName,
    m.EmployeeName AS ManagerName,
    e.Department
FROM Employees e
LEFT JOIN Employees m
    ON e.ManagerID = m.EmployeeID;
    SELECT
    c.CustomerName,
    c.JoinDate,
    MIN(o.OrderDate) AS OrderDate,
    DATEDIFF(MIN(o.OrderDate), c.JoinDate) AS DaysTakenToPlaceFirstOrder
FROM Customers c
JOIN Orders o
    ON c.CustomerID = o.CustomerID
GROUP BY
    c.CustomerID,
    c.CustomerName,
    c.JoinDate
HAVING DATEDIFF(MIN(o.OrderDate), c.JoinDate) BETWEEN 0 AND 30;
SELECT
    c.CustomerName,
    COALESCE(SUM(o.OrderAmount), 0) AS TotalPurchaseAmount,

    CASE
        WHEN COALESCE(SUM(o.OrderAmount), 0) > 50000 THEN 'Premium'
        WHEN COALESCE(SUM(o.OrderAmount), 0) >= 20000 THEN 'Gold'
        ELSE 'Silver'
    END AS SpendingCategory,

    CASE
        WHEN c.JoinDate < '2024-01-01' THEN 'Loyal Customer'
        ELSE 'New Customer'
    END AS LoyaltyStatus

FROM Customers c
LEFT JOIN Orders o
    ON c.CustomerID = o.CustomerID

GROUP BY
    c.CustomerID,
    c.CustomerName,
    c.JoinDate;
    SELECT
    c.CustomerName,
    o.OrderID,
    o.OrderAmount
FROM Customers c
JOIN Orders o
    ON c.CustomerID = o.CustomerID
WHERE o.OrderAmount > (
    SELECT AVG(OrderAmount)
    FROM Orders
);
SELECT
    c.CustomerName,
    o.OrderID,
    o.OrderAmount
FROM Customers c
JOIN Orders o
    ON c.CustomerID = o.CustomerID
ORDER BY o.OrderAmount DESC
LIMIT 5 OFFSET 1;
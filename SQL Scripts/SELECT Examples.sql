SELECT o.Id, o.OrderDate, o.OrderAmount, o.OrderStatus, c.FirstName + ' ' + c.LastName AS CustomerName
FROM Orders o
JOIN Customers c ON o.CustomerId = c.Id
WHERE o.OrderStatus = 'Delivered';


SELECT *
FROM Orders
WHERE CustomerId = 12345;


SELECT SUM(OrderAmount) AS TotalGasto
FROM Orders
WHERE CustomerId = 12345;

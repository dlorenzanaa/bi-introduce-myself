SELECT o.Id, o.OrderDate, o.OrderAmount, o.OrderStatus, c.FirstName + ' ' + c.LastName AS CustomerName
FROM Orders o
JOIN Customers c ON o.CustomerId = c.Id
WHERE o.OrderStatus = 'Delivered';

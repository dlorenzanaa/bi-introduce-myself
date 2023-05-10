UPDATE c
SET c.TotalSpent = c.TotalSpent + o.OrderAmount,
    c.TotalOrders = c.TotalOrders + 1
FROM Customers c
JOIN Orders o ON c.Id = o.CustomerId;

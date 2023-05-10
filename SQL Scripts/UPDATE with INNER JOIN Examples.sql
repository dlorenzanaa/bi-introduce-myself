UPDATE c
SET c.TotalSpent = c.TotalSpent + o.OrderAmount,
    c.TotalOrders = c.TotalOrders + 1
FROM Customers c
JOIN Orders o ON c.Id = o.CustomerId;


UPDATE o
SET o.OrderStatus = 'Sent', d.DeliveryStatus = 'Sent'
FROM Orders o
INNER JOIN Deliveries d ON o.Id = d.OrderId
WHERE o.OrderStatus = 'Pending' AND d.DeliveryStatus = 'Scheduled'


UPDATE c
SET c.TotalSpent = (SELECT SUM(OrderAmount) FROM Orders WHERE CustomerId = c.Id)
FROM Customers c
INNER JOIN Orders o ON c.Id = o.CustomerId


UPDATE o
SET o.PaymentMethod = 'Credit Card'
FROM Orders o
INNER JOIN Customers c ON o.CustomerId = c.Id
WHERE o.PaymentMethod = 'PayPal' AND c.TotalSpent > 1000


UPDATE o
SET o.ShippingAddress = d.DeliveryAddress
FROM Orders o
INNER JOIN Deliveries d ON o.Id = d.OrderId
WHERE o.ShippingMethod = 'Delivery' AND o.ShippingAddress <> d.DeliveryAddress

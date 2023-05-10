SELECT o.Id, o.OrderDate, o.OrderAmount, o.OrderStatus, o.ShippingAddress, d.DeliveryAddress
FROM Orders o
LEFT JOIN Deliveries d ON o.Id = d.OrderId;

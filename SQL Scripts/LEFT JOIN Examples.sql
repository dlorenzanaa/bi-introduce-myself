SELECT o.Id, o.OrderDate, o.OrderAmount, o.OrderStatus, o.ShippingAddress, d.DeliveryAddress
FROM Orders o
LEFT JOIN Deliveries d ON o.Id = d.OrderId;


SELECT o.Id, o.OrderDate, o.OrderAmount, o.ShippingAddress, o.BillingAddress, o.OrderStatus,
       o.PaymentMethod, o.ShippingMethod, o.TaxAmount, c.FirstName, c.LastName, c.Email,
       c.PhoneNumber, c.AddressLine1, c.AddressLine2, c.City, c.State, c.PostalCode
FROM Orders o
LEFT JOIN Customers c ON o.CustomerId = c.Id;


SELECT o.Id, o.OrderDate, o.OrderAmount, o.ShippingAddress, o.BillingAddress, o.OrderStatus,
       o.PaymentMethod, o.ShippingMethod, o.TaxAmount, d.DeliveryDate, d.DeliveryAddress,
       d.DeliveryStatus, d.DeliveryMethod
FROM Orders o
LEFT JOIN Deliveries d ON o.Id = d.OrderId;


SELECT c.Id, c.FirstName, c.LastName, c.Email, c.PhoneNumber, c.AddressLine1, c.AddressLine2,
       c.City, c.State, c.PostalCode, o.OrderDate, o.OrderAmount, o.ShippingAddress,
       o.BillingAddress, o.OrderStatus, o.PaymentMethod, o.ShippingMethod, o.TaxAmount
FROM Customers c
LEFT JOIN Orders o ON c.Id = o.CustomerId;


SELECT d.Id, d.DeliveryDate, d.DeliveryAddress, d.DeliveryStatus, d.DeliveryMethod,
       o.Id AS OrderId, o.CustomerId, o.OrderDate, o.OrderAmount, o.ShippingAddress,
       o.BillingAddress, o.OrderStatus, o.PaymentMethod, o.ShippingMethod, o.TaxAmount
FROM Deliveries d
LEFT JOIN Orders o ON d.OrderId = o.Id;

CREATE VIEW VW_Orders_BI
AS
SELECT o.Id, o.OrderDate, o.OrderAmount, o.OrderStatus, c.FirstName + ' ' + c.LastName AS CustomerName
FROM Orders o
JOIN Customers c ON o.CustomerId = c.Id;


CREATE VIEW VW_OrderInfo_BI 
AS 
SELECT Id, CustomerId, OrderDate, OrderAmount, OrderStatus, PaymentMethod
FROM Orders;


CREATE VIEW VW_OrderDetails_BI
AS 
SELECT o.Id, o.CustomerId, o.OrderDate, o.OrderAmount, o.OrderStatus, o.PaymentMethod,
       c.FirstName, c.LastName, c.Email, c.PhoneNumber, c.AddressLine1, c.AddressLine2,
       c.City, c.State, c.PostalCode
FROM Orders o
JOIN Customers c ON o.CustomerId = c.Id;

CREATE VIEW VW_TotalSpentByCustomer_BI 
AS 
SELECT c.Id, c.FirstName, c.LastName, c.Email, c.PhoneNumber, c.TotalSpent
FROM Customers c
JOIN (SELECT CustomerId, SUM(OrderAmount) AS TotalSpent FROM Orders GROUP BY CustomerId) o
ON c.Id = o.CustomerId;


CREATE VIEW VW_OrdersPendingDelivery_BI 
AS 
SELECT o.Id, o.CustomerId, o.OrderDate, o.OrderAmount, o.OrderStatus, o.PaymentMethod,
       c.FirstName, c.LastName, c.Email, c.PhoneNumber, c.AddressLine1, c.AddressLine2,
       c.City, c.State, c.PostalCode
FROM Orders o
JOIN Customers c ON o.CustomerId = c.Id
WHERE o.OrderStatus = 'Pending' AND o.ShippingMethod IS NOT NULL;


CREATE VIEW VW_DeliveryHistory_BI 
AS 
SELECT d.Id, d.OrderId, d.DeliveryDate, d.DeliveryAddress, d.DeliveryStatus, d.DeliveryMethod,
       o.OrderAmount, o.ShippingAddress, o.BillingAddress, o.TaxAmount,
       c.FirstName, c.LastName, c.Email, c.PhoneNumber, c.AddressLine1, c.AddressLine2,
       c.City, c.State, c.PostalCode
FROM Deliveries d
JOIN Orders o ON d.OrderId = o.Id
JOIN Customers c ON o.CustomerId = c.Id;

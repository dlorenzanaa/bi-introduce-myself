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

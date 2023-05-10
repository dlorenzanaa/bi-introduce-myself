WITH OrderDelivery AS (
  SELECT o.Id, o.OrderDate, d.DeliveryDate, d.DeliveryStatus
  FROM Orders o
  JOIN Deliveries d ON o.Id = d.OrderId
)
SELECT *
FROM OrderDelivery;


WITH cte_orders_per_customer AS (
   SELECT 
      CustomerId,
      COUNT(*) AS num_orders,
      AVG(OrderAmount) AS avg_order_amount
   FROM Orders
   GROUP BY CustomerId
)
SELECT 
   c.Id, 
   c.FirstName, 
   c.LastName, 
   cte.num_orders, 
   cte.avg_order_amount
FROM Customers c
LEFT JOIN cte_orders_per_customer cte ON cte.CustomerId = c.Id;


WITH cte_deliveries AS (
   SELECT 
      OrderId, 
      STRING_AGG(DeliveryDate, ', ') WITHIN GROUP (ORDER BY Id) AS delivery_dates, 
      STRING_AGG(DeliveryStatus, ', ') WITHIN GROUP (ORDER BY Id) AS delivery_statuses
   FROM Deliveries
   GROUP BY OrderId
)
SELECT 
   o.Id, 
   o.OrderDate, 
   c.FirstName + ' ' + c.LastName AS customer_name, 
   cte.delivery_dates, 
   cte.delivery_statuses
FROM Orders o
JOIN Customers c ON c.Id = o.CustomerId
LEFT JOIN cte_deliveries cte ON cte.OrderId = o.Id;


WITH cte_order_addresses AS (
   SELECT 
      Id, 
      ShippingAddress, 
      BillingAddress
   FROM Orders
)
SELECT 
   o.Id, 
   o.OrderDate, 
   c.FirstName + ' ' + c.LastName AS customer_name, 
   cte.ShippingAddress, 
   cte.BillingAddress
FROM Orders o
JOIN Customers c ON c.Id = o.CustomerId
LEFT JOIN cte_order_addresses cte ON cte.Id = o.Id;


WITH cte_avg_order_amount AS (
   SELECT AVG(OrderAmount) AS avg_order_amount
   FROM Orders
)
SELECT 
   o.Id, 
   o.OrderDate, 
   c.FirstName + ' ' + c.LastName AS customer_name, 
   o.OrderAmount
FROM Orders o
JOIN Customers c ON c.Id = o.CustomerId
CROSS JOIN cte_avg_order_amount cte
WHERE o.OrderAmount > cte.avg_order_amount;

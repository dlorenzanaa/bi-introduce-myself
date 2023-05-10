WITH OrderDelivery AS (
  SELECT o.Id, o.OrderDate, d.DeliveryDate, d.DeliveryStatus
  FROM Orders o
  JOIN Deliveries d ON o.Id = d.OrderId
)
SELECT *
FROM OrderDelivery;

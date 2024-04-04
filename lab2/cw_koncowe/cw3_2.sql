SELECT ShipVia as Shipper, SUM(Freight) as Freight
FROM Orders
GROUP BY ShipVia
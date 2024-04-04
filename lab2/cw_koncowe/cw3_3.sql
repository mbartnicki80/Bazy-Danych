SELECT ShipVia as Shipper, SUM(Freight) as Freight
FROM Orders
WHERE ShippedDate > '01.01.1996' and ShippedDate < '01.01.1998'
GROUP BY ShipVia
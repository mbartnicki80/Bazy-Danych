SELECT CompanyName, COUNT(OrderID)
FROM Shippers
JOIN Orders on Shippers.ShipperID = Orders.ShipVia
WHERE YEAR(ShippedDate)=1997
GROUP BY CompanyName
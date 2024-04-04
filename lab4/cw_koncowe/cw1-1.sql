SELECT CompanyName, ISNULL(Phone, '')
FROM Customers
WHERE EXISTS(SELECT * FROM Orders where Orders.CustomerID = Customers.CustomerID
            and YEAR(ShippedDate)=1997 and ShipVia=(SELECT ShipperID FROM Shippers where
            CompanyName='United Package'))
SELECT DISTINCT ContactName, Customers.Phone, Shippers.CompanyName
from Orders INNER JOIN Customers ON Orders.CustomerID = Customers.CustomerID and YEAR(ShippedDate)=1997
INNER JOIN Shippers ON Orders.ShipVia = Shippers.ShipperID AND Shippers.CompanyName = 'United Package'
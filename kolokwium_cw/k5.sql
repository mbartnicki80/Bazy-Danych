-- Podział na company, year month i suma freight

SELECT CompanyName, DATEPART(year, OrderDate), DATEPART(month, OrderDate), SUM(Freight)
from Customers c
JOIN dbo.Orders O on c.CustomerID = O.CustomerID
group by CompanyName, DATEPART(year, OrderDate), DATEPART(month, OrderDate)
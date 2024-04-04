SELECT EmployeeID, COUNT(OrderID) as OrdersQuantity, DATEPART(MONTH, OrderDate) as Month, DATEPART(YEAR , OrderDate) as Year
FROM Orders
GROUP BY DATEPART(YEAR, OrderDate), DATEPART(MONTH, OrderDate), EmployeeID
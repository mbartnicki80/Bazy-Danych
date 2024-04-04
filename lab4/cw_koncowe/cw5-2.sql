SELECT TOP 1 firstname, lastname, ROUND((SELECT SUM(quantity*unitprice*(1-discount))
FROM [Order Details] od
INNER JOIN orders o ON o.orderid=od.orderid AND o.EmployeeID=e.employeeid) +
(SELECT SUM(freight) FROM orders o WHERE o.EmployeeID=e.EmployeeID AND YEAR(o.ShippedDate)=1997), 2)
AS total_cost FROM Employees e
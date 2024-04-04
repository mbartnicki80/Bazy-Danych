SELECT (e.FirstName + ' ' + e.LastName) as Name, SUM((1-Discount)*Quantity*UnitPrice) as Value
FROM Employees e
JOIN Orders o on o.EmployeeID = e.EmployeeID
JOIN Employees as ee ON e.EmployeeID=ee.ReportsTo --b)
JOIN [Order Details] od on o.OrderID = od.OrderID
--JOIN Employees as ee ON ee.EmployeeID=e.ReportsTo --a)
--WHERE ee.EmployeeID is NULL
GROUP BY e.FirstName, e.LastName
ORDER BY 2 DESC
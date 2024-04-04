SELECT TOP 1 (e.FirstName + ' ' + e.LastName) as Name, SUM((1-Discount)*Quantity*UnitPrice) as Value
FROM Employees e
JOIN Orders o on e.EmployeeID = o.EmployeeID
JOIN [Order Details] od on o.OrderID = od.OrderID
GROUP BY FirstName, LastName
ORDER BY 2 DESC
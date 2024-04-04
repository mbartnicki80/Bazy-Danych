SELECT (FirstName + ' ' + LastName) as Name, SUM((1-Discount)*UnitPrice*od.Quantity)
FROM Employees
JOIN Orders on Employees.EmployeeID = Orders.EmployeeID
JOIN [Order Details] od on Orders.OrderID = od.OrderID
GROUP BY FirstName, LastName
ORDER BY 2 DESC
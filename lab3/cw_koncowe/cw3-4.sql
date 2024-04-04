SELECT TOP 1 (FirstName + ' ' + LastName) as Name, COUNT(OrderID) as Quantity
FROM Employees
JOIN Orders on Employees.EmployeeID = Orders.EmployeeID
WHERE YEAR(OrderDate)=1997
GROUP BY FirstName, LastName
ORDER BY 2 DESC
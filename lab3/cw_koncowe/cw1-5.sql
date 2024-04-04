SELECT Orders.OrderID, CompanyName, SUM((1-Discount)*Quantity*UnitPrice), FirstName, LastName
FROM Orders
JOIN Customers on Orders.CustomerID = Customers.CustomerID
JOIN [Order Details] on Orders.OrderID = [Order Details].OrderID
JOIN Employees on Orders.EmployeeID = Employees.EmployeeID
GROUP BY Orders.OrderID, CompanyName, FirstName, LastName
HAVING SUM(Quantity) > 250
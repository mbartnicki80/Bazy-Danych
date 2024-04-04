SELECT EmployeeID, COUNT(EmployeeID) as OrdersQuantity
FROM Orders
GROUP BY EmployeeID
ORDER BY COUNT(*) DESC

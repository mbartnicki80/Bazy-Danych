SELECT Customers.CustomerID, Address, Orders.OrderID
FROM Orders RIGHT OUTER JOIN Customers
ON Orders.CustomerID = Customers.CustomerID AND YEAR(OrderDate) = 1997
WHERE OrderID is null

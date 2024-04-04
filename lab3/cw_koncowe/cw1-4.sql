SELECT Orders.OrderID, CompanyName, SUM((1-Discount)*Quantity*UnitPrice)
FROM Orders
JOIN Customers on Orders.CustomerID = Customers.CustomerID
JOIN [Order Details] on Orders.OrderID = [Order Details].OrderID
GROUP BY Orders.OrderID, CompanyName
HAVING SUM(Quantity) > 250
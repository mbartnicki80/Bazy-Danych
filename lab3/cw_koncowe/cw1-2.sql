SELECT Orders.OrderID, CompanyName, SUM(Quantity)
FROM Orders
JOIN Customers on Orders.CustomerID = Customers.CustomerID
JOIN [Order Details] on Orders.OrderID = [Order Details].OrderID
GROUP BY Orders.OrderID, CompanyName
HAVING SUM(Quantity) > 250
order by 3 desc
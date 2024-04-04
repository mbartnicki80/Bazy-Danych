SELECT Address
FROM Customers
Where not exists(SELECT CustomerID FROM Orders WHERE
                Orders.CustomerID = Customers.CustomerID
                and YEAR(OrderDate)=1997)
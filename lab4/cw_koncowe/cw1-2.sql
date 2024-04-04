SELECT CompanyName, ISNULL(Phone, '') AS Phone
FROM Customers
WHERE EXISTS(SELECT 1 FROM Orders WHERE CustomerID = Customers.CustomerID
      AND EXISTS(SELECT 1 FROM [Order Details] WHERE OrderID = Orders.OrderID
            AND EXISTS (SELECT 1 FROM Products WHERE ProductID = [Order Details].ProductID
                  AND EXISTS (SELECT 1 FROM Categories WHERE CategoryID = Products.CategoryID
                        AND CategoryName = 'Confections'))))
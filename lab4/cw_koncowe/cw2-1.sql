SELECT ProductName, (SELECT DISTINCT MAX(od.Quantity) from [Order Details] od
                    where p.ProductID = od.ProductID) as MaxQuantity
FROM Products p
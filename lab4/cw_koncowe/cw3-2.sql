SELECT (SELECT CategoryName FROM Categories c WHERE p.CategoryID=c.CategoryID), ProductName,
       UnitPrice, (SELECT AVG(p2.UnitPrice) from Products p2 WHERE p.CategoryID=p2.CategoryID) as AVGPrice,
       UnitPrice - (SELECT AVG(p2.UnitPrice) from Products p2 WHERE p.CategoryID=p2.CategoryID) as PriceDiff
FROM Products p
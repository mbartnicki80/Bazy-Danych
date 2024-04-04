SELECT ProductName, UnitPrice, (SELECT AVG(p2.UnitPrice) from Products p2) as AVGPrice,
       UnitPrice - (SELECT AVG(p2.UnitPrice) from Products p2) as PriceDiff
FROM Products p
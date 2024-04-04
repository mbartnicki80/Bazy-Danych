SELECT CategoryID, MAX(UnitPrice) as MaxPrice, MIN(UnitPrice) as MinPrice
FROM Products
GROUP BY CategoryID
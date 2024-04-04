SELECT TOP 10 OrderID, SUM((UnitPrice * Quantity) * (1-Discount)) as OrderSum
FROM [Order Details]
GROUP BY OrderID
ORDER BY OrderSum DESC
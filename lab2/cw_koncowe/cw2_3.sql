SELECT OrderID, SUM((UnitPrice * Quantity) * (1-Discount)) as OrderSum
FROM [Order Details]
GROUP BY OrderID
HAVING SUM(Quantity) > 250
--ORDER BY ProductID
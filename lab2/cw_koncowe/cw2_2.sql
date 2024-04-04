SELECT ProductID, SUM(Quantity) as QuantitySum
FROM [Order Details]
GROUP BY ProductID
--ORDER BY ProductID
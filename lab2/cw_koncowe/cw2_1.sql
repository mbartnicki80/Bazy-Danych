SELECT ProductID, SUM(Quantity) as QuantitySum
FROM [Order Details]
WHERE ProductID<3
GROUP BY ProductID
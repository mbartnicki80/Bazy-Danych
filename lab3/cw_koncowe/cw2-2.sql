SELECT CategoryName, SUM((1-Discount)*Quantity*od.UnitPrice) as Value
FROM Orders
JOIN [Order Details] od on Orders.OrderID = od.OrderID
JOIN Products p on od.ProductID = p.ProductID
JOIN Categories c on p.CategoryID = c.CategoryID
group by CategoryName
ORDER BY 2 DESC
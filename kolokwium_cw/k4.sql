--Dla każdego klienta najczęściej zamawianą kategorię w dwóch wersjach

with t1 as (Select distinct CompanyName, CategoryName, count(p.CategoryID) as total
from Customers c
JOIN Orders o on c.CustomerID = o.CustomerID
join [Order Details] od on o.OrderID = od.OrderID
join Products p on od.ProductID = p.ProductID
join dbo.Categories C2 on p.CategoryID = C2.CategoryID
group by CompanyName, CategoryName)

select CompanyName, CategoryName from t1
where total=(select max(total) from t1 as t2 where t1.CompanyName=t2.CompanyName)

SELECT DISTINCT c.CustomerID,
FIRST_VALUE(cat.CategoryName) OVER (PARTITION BY c.CustomerID ORDER BY COUNT(o.CustomerID) DESC) AS MostOrderedCategory
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
JOIN [Order Details] od ON o.OrderID = od.OrderID
JOIN Products p ON od.ProductID = p.ProductID
JOIN Categories cat ON p.CategoryID = cat.CategoryID
GROUP BY c.CustomerID, cat.CategoryName;
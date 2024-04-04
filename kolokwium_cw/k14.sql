--Wybierz kategorię, która w danym roku 1997 najwięcej zarobiła, podział na miesiące
with t1 as (SELECT CategoryName, round(SUM(od.UnitPrice*od.Quantity*(1-Discount)),2) as SUM,
                   DATEPART(MONTH, OrderDate) as MONTH
from Categories
join dbo.Products P on Categories.CategoryID = P.CategoryID
join dbo.[Order Details] od on P.ProductID = od.ProductID
join dbo.Orders O on od.OrderID = O.OrderID
where year(OrderDate)=1997
group by CategoryName, OrderDate)
select CategoryName, SUM, MONTH from t1
where sum = (select max(SUM) from t1 as t2 where t1.MONTH=t2.MONTH)
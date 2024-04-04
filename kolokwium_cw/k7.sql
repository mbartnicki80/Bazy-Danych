--Najczęściej wybierana kategoria w 1997 dla każdego klienta
with t1 as (SELECT DISTINCT CompanyName, CategoryName, count(o.OrderID) as total_orders
from Customers
join Orders o on Customers.CustomerID = o.CustomerID and YEAR(OrderDate)=1997
join dbo.[Order Details] od on o.OrderID = od.OrderID
join dbo.Products P on od.ProductID = P.ProductID
join dbo.Categories C on P.CategoryID = C.CategoryID
group by CompanyName, CategoryName)
select CompanyName, CategoryName from t1
where total_orders = (Select max(total_orders) from t1 as t2 where t1.CompanyName = t2.CompanyName)
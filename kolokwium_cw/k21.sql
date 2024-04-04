--Znajdź produkt (podaj jego nazwę), który przyniósł najmniejszy dochód (większy od zera) w 1996 roku
with t1 as (
select ProductName, isnull(round((select sum(od.UnitPrice*od.Quantity-(1-Discount)) from [Order Details] od
    join dbo.Orders O on od.OrderID = O.OrderID
    where Products.ProductID=od.ProductID and year(OrderDate)=1996),2),0) as price
from Products), t2 as
(select ProductName, price from t1
where price>0)
select top 1 ProductName from t2
order by t2.price
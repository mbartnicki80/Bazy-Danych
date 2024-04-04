--Wypisz te produkty które kupiło conajmniej 2 klientów
--join)
select ProductName
from Products
join [Order Details] od on Products.ProductID = od.ProductID
join Orders o on od.OrderID = o.OrderID
group by ProductName
having count(distinct o.CustomerID)>1
--in)
with t1 as (select ProductName, (select count(distinct Orders.CustomerID) from Orders
    join dbo.[Order Details] od on Orders.OrderID = od.OrderID where Products.ProductID=od.ProductID)
    as counter from Products)
select ProductName from t1
where counter>2
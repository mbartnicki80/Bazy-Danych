--Wyświetl produkt, który przyniósł najmniejszy, ale niezerowy, przychód w 1996 roku
select top 1 ProductName
from Products p
join dbo.[Order Details] od on p.ProductID = od.ProductID
join dbo.Orders O on od.OrderID = O.OrderID
where year(OrderDate)=1996
group by ProductName
having round(sum(od.UnitPrice*Quantity*(1-Discount)),2)>0
order by round(sum(od.UnitPrice*Quantity*(1-Discount)),2)
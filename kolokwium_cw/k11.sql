--Kategorie które w roku 1997 grudzień były obsłużone wyłącznie przez ‘United
--Package’
Select DISTINCT CategoryName
from Orders o
join dbo.[Order Details] od on o.OrderID = od.OrderID
join dbo.Products P on od.ProductID = P.ProductID
join dbo.Categories C on P.CategoryID = C.CategoryID
join Shippers s on o.ShipVia = s.ShipperID
where YEAR(OrderDate)=1997 and MONTH(OrderDate)=12 and CompanyName='United Package' and
      CategoryName not in (select CategoryName from Orders o2
                            join dbo.[Order Details] od2 on o2.OrderID = od2.OrderID
                            join dbo.Products P2 on od2.ProductID = P2.ProductID
                            join dbo.Categories C2 on P2.CategoryID = C2.CategoryID
                            join Shippers s2 on o2.ShipVia = s2.ShipperID
                            where s2.CompanyName <> 'United Package' and YEAR(OrderDate)=1997
                              and MONTH(OrderDate)=12)
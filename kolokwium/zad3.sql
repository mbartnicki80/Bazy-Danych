--id zamowienia, gdzie oplata wieksza od avg freight w tym samym roku

--3)
Select o.OrderID --Freight, DATEPART(year, OrderDate) as Year, (select avg(o2.Freight) from orders o2
                    --where DATEPART(YEAR, o.OrderDate)=DATEPART(YEAR, o2.OrderDate)) as AVGpriceInYear
from Orders o
where o.Freight > (select avg(o2.Freight) from orders o2
                    where DATEPART(YEAR, o.OrderDate)=DATEPART(YEAR, o2.OrderDate))
--wyświetl ile każdy z przewoźników miał dostać wynagrodzenia w poszczególnych latach i miesiącach.
--a) bez podzapytań
select CompanyName, datepart(YEAR, OrderDate), datepart(MONTH, OrderDate), sum(Freight)
from Shippers s
join Orders o on s.ShipperID = o.ShipVia
group by CompanyName, datepart(YEAR, OrderDate), datepart(MONTH, OrderDate)
--b) podzapytaniami
select CompanyName, datepart(YEAR, OrderDate), datepart(MONTH, OrderDate),
       (select sum(freight)) as Freight
from Shippers s
join Orders o on s.ShipperID = o.ShipVia
group by CompanyName, datepart(YEAR, OrderDate), datepart(MONTH, OrderDate)
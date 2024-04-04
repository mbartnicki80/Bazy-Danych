--3. wyświetl numery zamówień, których cena dostawy była większa niż średnia cena za przesyłkę w tym roku
--a) bez podzapytań

--b) podzapytaniami
with t1 as (select OrderID, Freight, (select avg(Freight) from orders o2) as AVGFreight
from Orders o)
select OrderID, Freight, AVGFreight from t1
where Freight>AVGFreight
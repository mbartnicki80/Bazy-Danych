--Zamówienia z Freight większym niż AVG danego roku

SELECT OrderID, Freight
from Orders o1
where Freight > (select avg(o2.Freight) from Orders o2
                WHERE DATEPART(YEAR, o1.OrderDate) = DATEPART(YEAR, o2.OrderDate))
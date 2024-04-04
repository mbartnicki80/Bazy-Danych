--Wyświetl podsumowanie zamówień (całkowita cena + fracht) obsłużonych
--przez pracowników w lutym 1997 roku, uwzględnij wszystkich, nawet jeśli suma
--wyniosła 0.

select firstname, lastname, isnull(Round((select sum(quantity*unitprice*(1-discount)) from [Order Details] oo
inner join orders o on o.orderid=oo.orderid and o.EmployeeID=e.employeeid) +
(select sum(freight) from orders o where o.EmployeeID=e.EmployeeID and year(OrderDate)=1997
                                   and month(OrderDate)=2),2),0) as total_cost
from Employees e
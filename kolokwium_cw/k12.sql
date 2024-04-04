--Wybierz klientów, którzy kupili przedmioty wyłącznie z jednej kategorii w marcu
--1997 i wypisz nazwę tej kategorii

select CompanyName, CategoryName
from Customers
join dbo.Orders O on Customers.CustomerID = O.CustomerID
join dbo.[Order Details] od on O.OrderID = od.OrderID
join dbo.Products P on od.ProductID = P.ProductID
join dbo.Categories C on P.CategoryID = C.CategoryID
where YEAR(OrderDate)=1997 and MONTH(OrderDate)=3
group by CompanyName, CategoryName
having count(DISTINCT P.CategoryID)=1
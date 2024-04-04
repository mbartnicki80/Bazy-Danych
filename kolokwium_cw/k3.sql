--Klienci, którzy nie zamówili nigdy nic z kategorii 'Seafood' w trzech wersjach.
--1)
Select CompanyName
from Customers
where CustomerID not in (Select CustomerID from Orders where OrderID in
                        (Select OrderID from [Order Details] where ProductID in
                        (Select ProductID from Products where CategoryID in
                        (Select CategoryID from Categories where CategoryName='Seafood'))))
--2)
Select CompanyName
from Customers c
where not exists    (Select * from Orders o
                    join [Order Details] od on o.OrderID = od.OrderID
                    join Products p on od.ProductID = p.ProductID
                    join Categories cat on p.CategoryID = cat.CategoryID
                    where CategoryName='Seafood' and c.CustomerID = o.CustomerID)
--3)
SELECT DISTINCT c.CompanyName
FROM Customers c
LEFT JOIN Orders o ON c.CustomerID = o.CustomerID
LEFT JOIN [Order Details] od ON o.OrderID = od.OrderID
LEFT JOIN Products p ON od.ProductID = p.ProductID
LEFT JOIN Categories cat ON p.CategoryID = cat.CategoryID and cat.CategoryName='Seafood'
group by CompanyName having count(cat.CategoryName)=0
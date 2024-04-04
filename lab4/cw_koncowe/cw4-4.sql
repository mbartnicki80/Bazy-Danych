SELECT DISTINCT ProductName
from Products
where exists (
    select count(CustomerID)
    from Customers
    where CustomerID in (
        select Orders.CustomerID
        from Orders
        where OrderID in (
            select OrderID
            from [Order Details]
            where [Order Details].OrderID = Products.ProductID
            )
        )
)
--WHERE ProductID in (Select ProductID from [Order Details] where OrderID in (Select OrderID from
 --                   Orders group by OrderID having COUNT(Distinct CustomerID)>1))
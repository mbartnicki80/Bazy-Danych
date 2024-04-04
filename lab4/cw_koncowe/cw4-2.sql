SELECT OrderID ,Round((Select (SUM((1-Discount)*UnitPrice*Quantity)) from [Order Details]
            where Orders.OrderID=[Order Details].OrderID) + Freight, 2) as Value
FROM Orders
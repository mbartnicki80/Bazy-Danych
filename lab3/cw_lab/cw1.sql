SELECT ProductName, UnitPrice, Address
FROM Products JOIN Suppliers
ON Products.SupplierID = Suppliers.SupplierID
WHERE UnitPrice BETWEEN 20 AND 30
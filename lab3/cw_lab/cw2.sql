SELECT ProductName, UnitsInStock
FROM Products INNER JOIN Suppliers
ON Products.SupplierID = Suppliers.SupplierID
WHERE CompanyName = 'Tokyo Traders'
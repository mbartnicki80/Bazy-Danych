SELECT CompanyName, Phone
FROM Products INNER JOIN Suppliers
ON Products.SupplierID = Suppliers.SupplierID
WHERE UnitsInStock = 0
SELECT ProductName, UnitPrice, Suppliers.CompanyName, Categories.CategoryName
from Products INNER JOIN Suppliers ON Products.SupplierID = Suppliers.SupplierID
INNER JOIN Categories ON Products.CategoryID = Categories.CategoryID
WHERE CategoryName = 'Confections'
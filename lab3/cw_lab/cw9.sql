SELECT ProductName, UnitPrice, Suppliers.Address, Categories.CategoryName
from Products INNER JOIN Suppliers ON Products.SupplierID = Suppliers.SupplierID
INNER JOIN Categories ON Products.CategoryID = Categories.CategoryID
WHERE ((UnitPrice BETWEEN 20 AND 30) AND (CategoryName = 'Meat/Poultry'))
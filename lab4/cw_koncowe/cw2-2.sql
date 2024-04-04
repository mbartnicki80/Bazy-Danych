SELECT ProductName, UnitPrice
from Products
WHERE UnitPrice < (Select AVG(UnitPrice) from Products)
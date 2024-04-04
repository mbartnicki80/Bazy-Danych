SELECT ProductName, UnitPrice
from Products p1
WHERE UnitPrice < (Select AVG(p2.UnitPrice) from Products p2 WHERE p1.CategoryID= p2.CategoryID)
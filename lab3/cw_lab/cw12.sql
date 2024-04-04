SELECT DISTINCT ContactName, Customers.Phone, Categories.CategoryName
from Orders INNER JOIN Customers ON Orders.CustomerID = Customers.CustomerID
INNER JOIN Categories ON Orders.CategoryID = Categories.CategoryID
WHERE CategoryName = 'Confections'
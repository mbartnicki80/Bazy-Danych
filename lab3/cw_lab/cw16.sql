SELECT (e.LastName + ' ' + e.FirstName) as Employee, (ee.LastName + ' ' + ee.FirstName) as Boss
FROM Employees as e
INNER JOIN Employees as ee ON ee.EmployeeID=e.ReportsTo
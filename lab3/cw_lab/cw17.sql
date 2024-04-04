SELECT (e.LastName + ' ' + e.FirstName) as Employee, (ee.LastName + ' ' + ee.FirstName) as Boss
FROM Employees as e
LEFT OUTER JOIN Employees as ee ON ee.EmployeeID=e.ReportsTo
WHERE ee.EmployeeID is NULL
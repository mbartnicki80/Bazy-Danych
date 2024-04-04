--Dane pracownika i najczęstszy dostawca pracowników bez podwładnych
with t1 as (SELECT (e.FirstName + ' ' + e.LastName) as Name, CompanyName, count(*) as count
from Employees e
join dbo.Orders O2 on e.EmployeeID = O2.EmployeeID
join Shippers s on O2.ShipVia = s.ShipperID
where not exists (select * from Employees ee where ee.ReportsTo=e.EmployeeID)
group by CompanyName, e.LastName, e.FirstName)
select Name, CompanyName, count from t1
where count = (select max(count) from t1 as t2 where t1.Name = t2.Name)
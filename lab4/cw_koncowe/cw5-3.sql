--a)

select firstname, lastname, Round((select sum(quantity*unitprice*(1-discount)) from [Order Details] oo
inner join orders o on o.orderid=oo.orderid and o.EmployeeID=e.employeeid) +
(select sum(freight) from orders o where o.EmployeeID=e.EmployeeID),2) as total_cost from Employees e
where exists (select * from employees ee where ee.ReportsTo=e.EmployeeID)


--b)
select firstname, lastname, Round((select sum(quantity*unitprice*(1-discount)) from [Order Details] oo
inner join orders o on o.orderid=oo.orderid and o.EmployeeID=e.employeeid) +
(select sum(freight) from orders o where o.EmployeeID=e.EmployeeID),2) as total_cost from Employees e
where not exists (select * from employees ee where ee.ReportsTo=e.EmployeeID)
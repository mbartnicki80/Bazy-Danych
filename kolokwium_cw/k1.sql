--Wypisz wszystkich członków biblioteki z adresami i info czy jest dzieckiem czy nie i
--ilość wypożyczeń w poszczególnych latach i miesiącach.

Select firstname, lastname, m.member_no, a.street, 'Adult', DATEPART(year, out_date) as year,
DATEPART(month, out_date) as month, count(lh.member_no) as BookQuantity
from member m
inner join dbo.adult a on m.member_no = a.member_no
join dbo.loanhist lh on m.member_no = lh.member_no
group by m.member_no, lastname, firstname, a.street, out_date
UNION
Select firstname, lastname, m1.member_no, a2.street, 'Child', DATEPART(year, out_date) as year,
DATEPART(month, out_date) as month, count(lh1.member_no) as BookQuantity
from member m1
inner join dbo.juvenile j on m1.member_no = j.member_no
join dbo.adult a2 on j.adult_member_no = a2.member_no
join dbo.loanhist lh1 on m1.member_no = lh1.member_no
group by m1.member_no, lastname, firstname, a2.street, out_date
order by 3
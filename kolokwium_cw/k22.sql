--1.a) Wyświetl imię, nazwisko, dane adresowe oraz ilość wypożyczonych książek dla
-- każdego członka biblioteki. Ilość wypożyczonych książek nie może być nullem, co najwyżej zerem.
--b) j/w + informacja, czy dany członek jest dzieckiem
--a)
select m.member_no, firstname, lastname, street, state, isnull(count(lh.member_no),0) as booksCount
from member m
join dbo.adult a on m.member_no = a.member_no
left join loanhist lh on m.member_no = lh.member_no
group by m.member_no, firstname, lastname, street, state
union
select m.member_no, firstname, lastname, street, state, isnull(count(lh.member_no),0) as booksCount
from member m
join juvenile j on m.member_no = j.member_no
join dbo.adult a on j.adult_member_no = a.member_no
left join loanhist lh on m.member_no = lh.member_no
group by m.member_no, firstname, lastname, street, state
order by 1
--b)
select m.member_no, firstname, lastname, street, state, isnull(count(lh.member_no),0) as booksCount, 'Adult'
from member m
join dbo.adult a on m.member_no = a.member_no
left join loanhist lh on m.member_no = lh.member_no
group by m.member_no, firstname, lastname, street, state
union
select m.member_no, firstname, lastname, street, state, isnull(count(lh.member_no),0) as booksCount, 'Child'
from member m
join juvenile j on m.member_no = j.member_no
join dbo.adult a on j.adult_member_no = a.member_no
left join loanhist lh on m.member_no = lh.member_no
group by m.member_no, firstname, lastname, street, state
order by 1
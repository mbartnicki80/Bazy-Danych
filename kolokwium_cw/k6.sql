--Wypisać wszystkich czytelników, którzy nigdy nie wypożyczyli książki dane
--adresowe i podział czy ta osoba jest dzieckiem (joiny, in, exists)
--join)
SELECT firstname, lastname, street, city, 'Adult'
from member m
join dbo.adult a on m.member_no = a.member_no
left join loanhist lh on m.member_no = lh.member_no
left join loan l on m.member_no = l.member_no
where l.member_no is null and lh.member_no is null
union
SELECT firstname, lastname, street, city, 'Child'
from member m
join dbo.juvenile j on m.member_no = j.member_no
join dbo.adult a on j.adult_member_no = a.member_no
left join loanhist lh on m.member_no = lh.member_no
left join loan l on m.member_no = l.member_no
where lh.member_no is null and l.member_no is null
order by 1, 2

--in)
SELECT firstname, lastname, street, city, 'Adult'
from member m
inner join dbo.adult a on m.member_no = a.member_no
where m.member_no not in (select lh.member_no from loanhist lh
union select l.member_no from loan l)
union
SELECT firstname, lastname, street, city, 'Child'
from member m
join juvenile j on m.member_no = j.member_no
join dbo.adult a on j.adult_member_no = a.member_no
where m.member_no not in (select lh.member_no from loanhist lh
union select l.member_no from loan l)
order by 1, 2
--exists)
SELECT m.firstname, m.lastname, a.street, a.city, 'Adult'
FROM member m
JOIN dbo.adult a ON m.member_no = a.member_no
WHERE NOT EXISTS (
  SELECT 1
  FROM loan l
  WHERE l.member_no = m.member_no
  union
  select 1
  from loanhist lh
  where lh.member_no = m.member_no
)
union
SELECT firstname, lastname, street, city, 'Child'
from member m
inner join dbo.juvenile j on m.member_no = j.member_no
inner join dbo.adult a on j.adult_member_no = a.member_no
WHERE NOT EXISTS (
  SELECT 1
  FROM loan l
  WHERE l.member_no = m.member_no
  union
  select 1
  from loanhist lh
  where lh.member_no = m.member_no
)
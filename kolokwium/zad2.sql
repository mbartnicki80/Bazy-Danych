--tytuly ksiazek pozyczone przez wiecej niz 1 czytelnika w przeszlosci, imiona i nazwiska czytelnikow
--tylko czytelnicy, ktorzy maja dzieci

--2)
SELECT title, firstname, lastname
from title
join loanhist lh on title.title_no = lh.title_no
join member m on lh.member_no = m.member_no
join adult a on m.member_no = a.member_no
where a.member_no in (select adult_member_no from juvenile)
group by title, firstname, lastname
having count(DISTINCT lh.member_no)>1
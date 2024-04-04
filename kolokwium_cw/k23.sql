--wyświetl imiona i nazwiska osób, które nigdy nie wypożyczyły żadnej książki
--a) bez podzapytań
select m.member_no, firstname + ' ' + lastname as Name
from member m
left join dbo.loanhist l on m.member_no = l.member_no
group by firstname, lastname, m.member_no
having isnull(count(l.member_no),0)=0
--b) podzapytaniami
select m.member_no, firstname + ' ' + lastname as Name
from member m
where member_no not in (select member_no from loanhist)
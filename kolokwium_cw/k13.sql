--Wybierz dzieci wraz z adresem, które nie wypożyczyły książek w lipcu 2001
--autorstwa ‘Jane Austin’
select firstname, lastname, street, state
from member m
join dbo.juvenile j on m.member_no = j.member_no
join dbo.adult a on j.adult_member_no = a.member_no
where m.member_no not in (select lh.member_no from loanhist lh
                        join title t on lh.title_no = t.title_no
                        where author='Jane Austen' and YEAR(out_date)=2001 and MONTH(out_date)=7)
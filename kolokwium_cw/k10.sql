--Dla każdego dziecka wybierz jego imię nazwisko, adres, imię i nazwisko rodzica i
--ilość książek, które oboje przeczytali w 2001
--nieskonczone
with t1 as (select a.member_no , count(lh.member_no) +
                   (select count(lh1.member_no) from loanhist lh1
                    join juvenile j on j.member_no = lh1.member_no and j.adult_member_no = a.member_no)
            as book_read from loanhist lh
            join adult a on lh.member_no = a.member_no
            where year(out_date)=2001
            group by a.member_no)
select (firstname + ' ' + lastname) as child_name, (select m1.lastname from member m1
        join dbo.adult a2 on m1.member_no = a2.member_no and a2.member_no = j2.adult_member_no)
from member m1
join dbo.juvenile j2 on m1.member_no = j2.member_no
join dbo.adult a3 on a3.member_no = j2.adult_member_no
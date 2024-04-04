--Jaki był najpopularniejszy autor wśród dzieci w Arizonie w 2001
SELECT top 1 author, count(title) as count
from loanhist lh
join title on lh.title_no = title.title_no
join juvenile j on lh.member_no = j.member_no
join adult a on j.adult_member_no = a.member_no
where YEAR(lh.out_date)=2001 and state='AZ'
group by author
order by 2 desc
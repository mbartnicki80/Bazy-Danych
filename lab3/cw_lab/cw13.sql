SELECT firstname, lastname, birth_date, (city + ' ' + street + ' ' + state) as Address
from juvenile INNER JOIN dbo.member as m on juvenile.member_no = m.member_no
inner join dbo.adult a on a.member_no = juvenile.adult_member_no

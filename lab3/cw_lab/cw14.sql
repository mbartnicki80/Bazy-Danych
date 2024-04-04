SELECT m.firstname, m.lastname, j.birth_date, AdultMember.firstname, AdultMember.lastname
from member as m INNER JOIN dbo.juvenile as j on j.member_no = m.member_no
inner join dbo.adult adult on adult.member_no = j.adult_member_no
inner join member as AdultMember on AdultMember.member_no = adult.member_no

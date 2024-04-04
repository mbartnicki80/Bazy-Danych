SELECT firstname, lastname, COUNT(juvenile.adult_member_no) as children_count
FROM member
JOIN juvenile on member.member_no = juvenile.adult_member_no
JOIN dbo.adult a on juvenile.adult_member_no = a.member_no
WHERE state='AZ'
GROUP BY member.member_no, firstname, lastname
HAVING COUNT(juvenile.adult_member_no) > 2
UNION
SELECT firstname, lastname, COUNT(juvenile.adult_member_no) as children_count
FROM member
JOIN juvenile on member.member_no = juvenile.adult_member_no
JOIN dbo.adult a on juvenile.adult_member_no = a.member_no
WHERE state='CA'
GROUP BY member.member_no, firstname, lastname
HAVING COUNT(juvenile.adult_member_no) > 3
SELECT DISTINCT (city + ' ' + street + ' ' + state) as Address
FROM adult as a
INNER JOIN juvenile as j on a.member_no = j.adult_member_no
LEFT JOIN loan as l on a.member_no = l.member_no
WHERE YEAR(j.birth_date) < 1996 AND (GETDATE() < due_date or l.member_no is NULL)

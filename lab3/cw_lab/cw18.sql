SELECT DISTINCT (city + ' ' + street + ' ' + state) as Address
FROM adult as a
INNER JOIN juvenile as j on a.member_no = j.adult_member_no
WHERE YEAR(j.birth_date) < 1996
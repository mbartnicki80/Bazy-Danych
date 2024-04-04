SELECT in_date, DATEDIFF(day, due_date, in_date) as number_of_days, fine_assessed, fine_paid
FROM loanhist INNER JOIN title ON loanhist.title_no = title.title_no
WHERE title = 'Tao Teh King' and in_date > loanhist.due_date
SELECT DATEPART(q, l.in_date) as kwartał, COUNT(l.fine_assessed) as kara
FROM loanhist as l
WHERE ISNULL(fine_assessed, 0) > 0 AND (in_date <= due_date)
group by DATEPART(q, l.in_date)
ORDER BY COUNT(l.fine_assessed) DESC

--w ktorym kwartale naliczono najwiecej kar za nieprzetrzymywanie ksiazek
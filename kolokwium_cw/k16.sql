--Wybierz tytuły książek, gdzie ilość wypożyczeń książki jest większa od średniej ilości
--wypożyczeń książek tego samego autora.
--nie dziala chyba?
select distinct title from item
join title t on item.title_no = t.title_no
where (select count(*) from loan where item.isbn = loan.isbn) +
      (select count(*) from loanhist where item.isbn = loanhist.isbn) >
      ((select count(*) from loan where item.isbn = loan.isbn) +
      (select count(*) from loanhist where item.isbn = loanhist.isbn))/
      ((select count(*) from loan join title on loan.title_no = title.title_no where t.author = title.author) +
      (select count(*) from loanhist join title on loanhist.title_no = title.title_no where t.author = title.author))

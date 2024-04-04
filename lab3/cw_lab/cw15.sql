SELECT a.buyer_id AS buyer1, a.prod_id, b.buyer_id AS buyer2, prod_name
FROM Sales as a
JOIN Sales as b ON a.prod_id = b.prod_id
JOIN Produce AS p on a.prod_id = p.prod_id
WHERE a.buyer_id > b.buyer_id
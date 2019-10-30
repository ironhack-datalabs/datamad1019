SELECT ar.au_id, ar.title_id, sum(the_royalty*qty) AS ag_royalties
FROM (
SELECT au.au_id, t.title_id, ti.price * s.qty * ti.royalty / 100 * t.royaltyper / 100 AS 'the_royalty', s.qty
FROM authors au
JOIN titleauthor t ON au.au_id = t.au_id
LEFT JOIN sales s ON t.title_id = s.title_id
LEFT JOIN titles ti ON t.title_id = ti.title_id
GROUP BY au.au_id, t.title_id, s.qty
order by au.au_id ASC) as ar
group by ar.au_id, ar.title_id, the_royalty
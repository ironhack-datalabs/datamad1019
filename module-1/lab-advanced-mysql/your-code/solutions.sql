# Challenge 1 & 2 ???
SELECT au_id, (SUM(royalties)+SUM(advance)) as profit 
FROM (
SELECT au.au_id, t.title_id, ti.price * s.qty * ti.royalty / 100 * t.royaltyper / 100 AS 'royalties', ti.advance*s.qty AS 'advance'
FROM authors au
JOIN titleauthor t ON au.au_id = t.au_id
LEFT JOIN sales s ON t.title_id = s.title_id
LEFT JOIN titles ti ON t.title_id = ti.title_id
GROUP BY au.au_id, t.title_id, s.qty
order by au.au_id ASC) as ar
group by au_id
order by profit desc

# Challenge 3

CREATE TABLE most_profiting_authors(
SELECT au_id, (SUM(royalties)+SUM(advance)) as profit 
FROM (
SELECT au.au_id, t.title_id, ti.price * s.qty * ti.royalty / 100 * t.royaltyper / 100 AS 'royalties', ti.advance*s.qty AS 'advance'
FROM authors au
JOIN titleauthor t ON au.au_id = t.au_id
LEFT JOIN sales s ON t.title_id = s.title_id
LEFT JOIN titles ti ON t.title_id = ti.title_id
GROUP BY au.au_id, t.title_id, s.qty
order by au.au_id ASC) as ar
group by au_id
order by profit desc)
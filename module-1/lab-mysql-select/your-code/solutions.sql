select a.au_id as AUTHOR_ID, a.au_lname as LAST_NAME, a.au_fname as FIRST_NAME, t.title as TITLE, p.pub_name as PUBLISHER
from publications.authors a
left join publications.titleauthor ta
on a.au_id = ta.au_id
inner join publications.titles t
on ta.title_id = t.title_id
inner join publications.publishers p
on t.pub_id = p.pub_id
order by AUTHOR_ID;
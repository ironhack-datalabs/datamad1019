# Challenge 1
select a.au_id as AUTHOR_ID, a.au_lname as LAST_NAME, a.au_fname as FIRST_NAME, t.title as TITLE, p.pub_name as PUBLISHER
from publications.authors a
left join publications.titleauthor ta
on a.au_id = ta.au_id
inner join publications.titles t
on ta.title_id = t.title_id
inner join publications.publishers p
on t.pub_id = p.pub_id
order by AUTHOR_ID;


# Challenge 2

#Si da error ejecutad esto:
-- set
-- sql_mode=
-- 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';

select a.au_id as AUTHOR_ID, a.au_lname as LAST_NAME, a.au_fname as FIRST_NAME, p.pub_name as PUBLISHER, count(*) as TITLE_COUNT
from publications.authors a
left join publications.titleauthor ta
on a.au_id = ta.au_id
left join publications.titles t
on ta.title_id = t.title_id
inner join publications.publishers p
on t.pub_id = p.pub_id
group by t.title_id
order by AUTHOR_ID desc;

# Challenge 3

select a.au_id as AUTHOR_ID, a.au_lname as LAST_NAME, a.au_fname as FIRST_NAME, count(*) as TITLE
from publications.authors a
left join publications.titleauthor ta
on a.au_id = ta.au_id
left join publications.sales s
on ta.title_id = s.title_id
group by s.title_id
order by TITLE desc
limit 3;

# Challenge 4










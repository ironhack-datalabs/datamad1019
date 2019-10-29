#Challenge 1
SELECT publications.authors.au_id,publications.authors.au_lname,
		publications.authors.au_fname,publications.titles.title,
        publications.publishers.pub_name FROM publications.authors
        INNER JOIN publications.titleauthor ON publications.authors.au_id = publications.titleauthor.au_id
        INNER JOIN publications.titles ON publications.titles.title_id = publications.titleauthor.title_id
        INNER JOIN publications.publishers ON publications.titles.pub_id = publications.publishers.pub_id;
#Challenge 2
SELECT publications.authors.au_id,publications.authors.au_lname,
		publications.authors.au_fname,publications.publishers.pub_name, 
        count(*) AS "TITLE COUNT" FROM publications.authors
        INNER JOIN publications.titleauthor ON publications.authors.au_id = publications.titleauthor.au_id
        INNER JOIN publications.titles ON publications.titles.title_id = publications.titleauthor.title_id
        INNER JOIN publications.publishers ON publications.titles.pub_id = publications.publishers.pub_id
        GROUP BY publications.titles.pub_id, publications.authors.au_id
        ORDER BY au_id DESC;
#Challenge 3
SELECT publications.authors.au_id, publications.authors.au_lname, publications.authors.au_fname, 
sum(publications.sales.qty) AS "TITLES_SALES"
FROM publications.authors
	INNER JOIN publications.titleauthor ON publications.titleauthor.au_id = publications.authors.au_id
    INNER JOIN publications.titles ON publications.titles.title_id = publications.titleauthor.title_id
    INNER JOIN publications.sales ON publications.sales.title_id = publications.titles.title_id
	GROUP BY publications.authors.au_id
ORDER BY TITLES_SALES DESC
LIMIT 3;
#Challenge 4
SELECT publications.authors.au_id, publications.authors.au_lname, publications.authors.au_fname, 
IFNULL(sum(publications.sales.qty),0) AS "TITLES_SALES"
FROM publications.authors
	LEFT JOIN publications.titleauthor ON publications.titleauthor.au_id = publications.authors.au_id
    LEFT JOIN publications.titles ON publications.titles.title_id = publications.titleauthor.title_id
    LEFT JOIN publications.sales ON publications.sales.title_id = publications.titles.title_id
	GROUP BY publications.authors.au_id
	ORDER BY TITLES_SALES DESC

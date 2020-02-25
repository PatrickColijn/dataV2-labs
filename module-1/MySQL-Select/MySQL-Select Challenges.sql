'''
Challenge 1
* `AUTHOR ID` - the ID of the author
* `LAST NAME` - author last name
* `FIRST NAME` - author first name
* `TITLE` - name of the published title
	au_id (authors) -> title_id (titleauthor) -> title (titles)
* `PUBLISHER` - name of the publisher where the title was published
	au_id (authors) -> title_id (titleauthor) -> tilte(titles) -> pub_id(titles) -> pub_id (publishers) -> pub_name(publishers)

''';

SELECT a.au_id AS AUTHOR_ID, a.au_lname AS LASTNAME, a.au_fname AS FIRSTNAME, t.title AS TITLE, pub_name AS PUBLISHERS
FROM authors as a
LEFT JOIN titleauthor as ta
ON a.au_id = ta.au_id
LEFT JOIN titles as t
ON ta.title_id = t.title_id
LEFT JOIN publishers as p
ON t.pub_id = p.pub_id;

'''
Challenge 2
Elevating from your solution in Challenge 1, query how many titles each author has published at each publisher.
''';

SELECT a.au_id AS AUTHOR_ID, a.au_lname AS LASTNAME, a.au_fname AS FIRSTNAME, pub_name AS PUBLISHERS, COUNT(t.title_id) AS TITLE_COUNT
FROM authors as a
LEFT JOIN titleauthor as ta
ON a.au_id = ta.au_id
LEFT JOIN titles as t
ON ta.title_id = t.title_id
LEFT JOIN publishers as p
ON t.pub_id = p.pub_id
GROUP BY a.au_id, a.au_lname, a.au_fname, pub_name;

'''
Challenge 3
Who are the top 3 authors who have sold the highest number of titles? Write a query to find out.
'''

SELECT a.au_id AS AUTHOR_ID, a.au_lname AS LASTNAME, a.au_fname AS FIRSTNAME, SUM(s.qty) AS TOTAL
FROM authors as a
LEFT JOIN titleauthor as ta
ON a.au_id = ta.au_id
LEFT JOIN sales AS s
ON ta.title_id = s.title_id
GROUP BY a.au_id, a.au_lname, a.au_fname
ORDER BY TOTAL DESC
LIMIT 3;

'''
Challenge 4
Modify your solution in Challenge 3 so that the output will display all 23 authors instead of the top 3.
'''
SELECT a.au_id AS AUTHOR_ID, a.au_lname AS LASTNAME, a.au_fname AS FIRSTNAME, SUM(s.qty) AS TOTAL
FROM authors as a
LEFT JOIN titleauthor as ta
ON a.au_id = ta.au_id
LEFT JOIN sales AS s
ON ta.title_id = s.title_id
GROUP BY a.au_id, a.au_lname, a.au_fname
ORDER BY TOTAL DESC
LIMIT 23;
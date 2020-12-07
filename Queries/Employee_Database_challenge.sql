--- DELIVERALE 1 Queries ----------------

SELECT emp_no, first_name, last_name
FROM employees

SELECT title, from_date, to_date
FROM titles
--step 1 to 10
SELECT em.emp_no, em.first_name ,em.last_name ,ti.title, ti.from_date, ti.to_date
INTO retirement_titles
FROM employees AS em INNER JOIN titles AS ti
ON (em.emp_no = ti.emp_no)
WHERE (em.birth_date BETWEEN '1952-01-01' AND '1955-12-31')	
ORDER BY em.emp_no ASC;

-- step 11 to 14
SELECT DISTINCT ON (emp_no) emp_no,
first_name,
last_name,
title
INTO unique_titles
FROM retirement_titles
ORDER BY emp_no ASC, to_date DESC;

-- step 15 to 21

SELECT count(title), title
INTO Retiring_Titles
FROM dist_retirement_titles
GROUP BY title
ORDER BY count(title) DESC 

-- DELIVERABLE 2------------------------------------

SELECT DISTINCT ON (emp_no) e.emp_no, e.first_name, e.last_name, e.birth_date, de.from_date, de.to_date, t.title
INTO mentorship_eligibilty
FROM employees AS e INNER JOIN dept_employees AS de
ON (e.emp_no = de.emp_no) INNER JOIN titles AS t ON (e.emp_no = t.emp_no)
WHERE (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31') AND (t.to_date = '9999-01-01')
ORDER BY e.emp_no ASC

SELECT de.emp_no
FROM dept_employees
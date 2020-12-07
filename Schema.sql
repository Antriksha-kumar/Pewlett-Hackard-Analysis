create table departments(
	dept_no VARCHAR(4) not null,
	dept_name varchar(40) not null,
	primary key (dept_no),
	unique(dept_name)
);
CREATE TABLE employees (
	emp_no INT NOT NULL,
	birth_date DATE NOT NULL,
	first_name VARCHAR NOT NULL,
	last_name VARCHAR NOT NULL,
	gender VARCHAR NOT NULL,
	hire_date DATE NOT NULL,
	PRIMARY KEY(emp_no)
	);

CREATE TABLE dept_manager(
	dept_no VARCHAR(4) not null,
	emp_no INT NOT NULL,
	from_date DATE NOT NULL,
	to_date DATE NOT NULL,
	FOREIGN KEY (emp_no)REFERENCES employees(emp_no),
	FOREIGN KEY (dept_no)REFERENCES Departments(dept_no),
	PRIMARY KEY(emp_no,dept_no)
);

CREATE TABLE salaries(
	emp_no INT NOT NULL,
	salary INT NOT NULL,
	from_date DATE NOT NULL,
	to_date DATE NOT NULL,
	FOREIGN KEY(emp_no) REFERENCES employees(emp_no),
	PRIMARY KEY(emp_no)
);

CREATE TABLE dept_employees(
	emp_no INT NOT NULL,
	dept_no VARCHAR(4) NOT NULL,
	from_date DATE NOT NULL,
	to_date DATE NOT NULL,
	FOREIGN KEY(dept_no) REFERENCES departments(dept_no),
	FOREIGN KEY(emp_no) REFERENCES salaries(emp_no),
	PRIMARY KEY(emp_no)
);

CREATE TABLE titles(
	emp_no INT NOT NULL, 
	title VARCHAR(40) NOT NULL,
	from_date DATE NOT NULL,
	to_date DATE NOT NULL,
	FOREIGN KEY(emp_no) REFERENCES salaries(emp_no),
	FOREIGN KEY(emp_no) REFERENCES employees(emp_no),
	PRIMARY KEY(emp_no, title, from_date)
);

--- To add th emissing foreign keys:

ALTER TABLE dept_employees
ADD FOREIGN KEY(emp_no) REFERENCES salaries(emp_no);

-- To add th ePrimary keys

ALTER TABLE dept_employees
ADD PRIMARY KEY(emp_no, dept_no);

-- to filter the retiring employees and exporting those names in a .csv file

SELECT first_name, last_name
INTO retirement_info
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31') AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31')


SELECT * FROM retirement_info



SELECT first_name, last_name, emp_no
INTO retirement_info
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31') AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31')


SELECT * FROM retirement_info

DROP TABLE retirement_info

-- Joing the Dept and Employees table

SELECT departments.dept_name, departments.dept_no, dept_manager.emp_no, 
dept_manager.from_date , dept_manager.to_date 
FROM departments INNER JOIN dept_manager
ON departments.dept_no = dept_manager.dept_no;

-- with aliases

SELECT d.dept_name, d.dept_no, dm.emp_no, dm.from_date, dm.to_date
FROM departments AS d INNER JOIN dept_manager AS dm
ON d.dept_no = dm.dept_no


-- finding the people which are still with the company


SELECT retirement_info.first_name, retirement_info.last_name, retirement_info.emp_no, dept_employees.to_date 
FROM retirement_info LEFT JOIN dept_employees
ON retirement_info.emp_no = dept_employees.emp_no

-- with aliases

SELECT ri.first_name, ri.last_name , ri.emp_no, de.to_date 
FROM retirement_info as ri LEFT JOIN dept_employees as de
ON ri.emp_no = de.emp_no

-- create a table with the current employees

SELECT ri.first_name , ri.last_name, ri.emp_no, de.to_date
INTO current_emp
FROM retirement_info AS ri LEFT JOIN dept_employees AS de 
ON ri.emp_no = de.emp_no
WHERE de.to_date = ('9999-01-01');
DROP TABLE current_emp

-- Count the no of employees leaving per dept and creating a new Table.

SELECT COUNT(ce.emp_no), de.dept_no
INTO ToRetire_emp
FROM current_emp as ce LEFT JOIN dept_employees as de
ON ce.emp_no = de.emp_no
GROUP BY de.dept_no
ORDER BY de.dept_no

SELECT * FROM salaries
ORDER BY to_date DESC


SELECT emp_no, first_name, last_name, gender
INTO emp_info
FROM employees 
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31') AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31')
DROP TABLE emp_info

SELECT e.emp_no, e.first_name, e.last_name , e.gender , s.salary, de.to_date
INTO emp_info
FROM employees AS e INNER JOIN salaries AS s 
ON (s.emp_no = e.emp_no) INNER JOIN dept_employees AS de
ON (e.emp_no = de.emp_no)
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31') AND 
(hire_date BETWEEN '1985-01-01' AND '1988-12-31') AND de.to_date = ('9999-01-01')

-- List of Mangers from retiring population

SELECT dm.dept_no, d.dept_name, ce.first_name , ce.last_name, dm.emp_no, dm.from_date, dm.to_date
INTO manager_info
FROM dept_manager as dm INNER JOIN departments AS d 
ON (dm.dept_no = d.dept_no)
INNER JOIN current_emp as ce
ON (dm.emp_no = ce.emp_no)


-- List of retirees as per the dept

SELECT ce.emp_no, ce.first_name, ce.last_name, d.dept_name
INTO dept_info
FROM current_emp AS ce INNER JOIN dept_employees AS de
ON (ce.emp_no = de.emp_no)
INNER JOIN departments AS d
ON (de.dept_no = d.dept_no)

-- for SALES dept

SELECT * FROM dept_info 

--- List of employees retiring from SALES dept

SELECT * 
INTO ToRetire_emp_SALES
FROM dept_info 
WHERE dept_name = 'Sales'


--- List of employees retiring from SALES dept
SELECT * 
INTO ToRetire_emp_SALES_Marketing
FROM dept_info 
WHERE dept_name IN ('Sales', 'Marketing') 

7?}\o/jmk<\<.
.
3

INTO ToRetire_emp_SALES
FROM dept_info 
WHERE dept_name = 'Sales'
GROUP BY de.dept_no
ORDER BY de.dept_no

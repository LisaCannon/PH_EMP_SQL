CREATE TABLE departments(
	dept_no VARCHAR(4),
	dept_name VARCHAR
);

CREATE TABLE dept_emp(
	emp_no INT,
	dept_no VARCHAR(4),
	from_date VARCHAR,
	to_date VARCHAR
);

CREATE TABLE dept_manager(
	dept_no VARCHAR(4),
	emp_no INT,
	from_date VARCHAR,
	to_date VARCHAR
);
DROP TABLE employees; 
CREATE TABLE employees(
	emp_no INT,
	birth_date VARCHAR,
	first_name VARCHAR,
	last_name VARCHAR,
	gender VARCHAR,
	hire_date DATE
);

CREATE TABLE salaries(
	emp_no INT,
	salary INT,
	from_date VARCHAR,
	to_date VARCHAR
);

CREATE TABLE titles (
	emp_no INT,
	title VARCHAR,
	from_date VARCHAR,
	to_date VARCHAR
);

SELECT * FROM departments;
SELECT * FROM dept_emp;
SELECT * FROM dept_manager;
SELECT * FROM employees;
SELECT * FROM salaries;
SELECT * FROM titles;

SELECT * FROM departments AS dep
RIGHT JOIN dept_emp AS de ON dep.dept_no = de.dept_no
ORDER BY dep.dept_no
;

SELECT em.emp_no AS "Employee Number",em.birth_date, em.first_name, 
	em.last_name, em.gender, em.hire_date, 
	de.dept_no, de.from_date, de.to_date 
FROM employees AS em
LEFT JOIN dept_emp AS de ON em.emp_no = de.emp_no
ORDER BY em.emp_no
;

SELECT em.emp_no AS "Employee Number",
	em.first_name AS "First Name", 
	em.last_name as "Last Name", 
	em.gender AS "Gender", 
	sa.salary AS "Salary"
FROM employees AS em
LEFT JOIN salaries AS sa ON em.emp_no = sa.emp_no
ORDER BY em.emp_no
;

ALTER TABLE employees
ADD COLUMN hire_yr INT
;

UPDATE employees
SET hire_yr = EXTRACT(YEAR FROM hire_date)
;

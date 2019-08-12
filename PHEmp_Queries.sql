
--List the following details of each employee: 
--employee number, last name, first name, 
--gender, and salary.
SELECT e.emp_no, e.last_name, e.first_name, 
	e.gender, s.salary
FROM employees AS e
INNER JOIN salaries AS s
ON e.emp_no = s.emp_no
;

--List employees who were hired in 1986.
SELECT emp_no, last_name, first_name, hire_date
FROM employees 
WHERE DATE_PART('year',hire_date) = 1986 ;

--List the manager of each department with the 
--following information: department number, 
--department name, the manager's employee 
--number, last name, first name, and start and 
--end employment dates.
SELECT dep.dept_no, dep.dept_name, 
	dep.emp_no as manager_emp_no,
	e.last_name, e.first_name, 
	--dep.manage_from, dep.manage_to,
	dep.emp_from, dep.emp_to
FROM employees as e
RIGHT JOIN
(SELECT dem.dept_no, d.dept_name, dem.emp_no, 
	  	dem.manage_from, dem.manage_to,
	  	dem.emp_from, dem.emp_to
FROM (
SELECT dm.dept_no, dm.emp_no, 
	  	dm.from_date as manage_from, 
	  	dm.to_date as manage_to,
	  	dm.from_date as emp_from,
	  	de.to_date as emp_to
FROM dept_manager as dm
LEFT JOIN dept_emp as de
ON dm.emp_no = de.emp_no) as dem
LEFT JOIN  "Departments" as d
ON dem.dept_no = d.dept_no) as dep
ON e.emp_no = dep.emp_no
;

--List the department of each employee with the
--following information: employee number, last 
--name, first name, and department name.
SELECT emp_d.emp_no, emp_d.last_name, 
	emp_d.first_name, d.dept_name
FROM "Departments" as d
RIGHT JOIN 
(SELECT e.emp_no, e.last_name, e.first_name, 
	de.dept_no
FROM employees as e
LEFT JOIN dept_emp as de 
ON e.emp_no = de.emp_no) as emp_d
ON emp_d.dept_no = d.dept_no
;

--List all employees whose first name is 
--"Hercules" and last names begin with "B."
SELECT * 
FROM employees
WHERE first_name = 'Hercules' and 
	last_name LIKE 'B%'
;

--List all employees in the Sales department, 
--including their employee number, last name, 
--first name, and department name.
SELECT emp_d.emp_no,emp_d.last_name, 
	emp_d.first_name, d.dept_name
FROM "Departments" as d
RIGHT JOIN (
SELECT e.emp_no,e.last_name, e.first_name, 
	de.dept_no 
FROM employees as e
INNER JOIN dept_emp as de
ON e.emp_no = de.emp_no) as emp_d
ON emp_d.dept_no = d.dept_no
WHERE d.dept_name = 'Sales'
;

--List all employees in the Sales and 
--Development departments, including their 
--employee number, last name, first name, 
--and department name.
SELECT emp_d.emp_no,emp_d.last_name, 
	emp_d.first_name, d.dept_name
FROM "Departments" as d
RIGHT JOIN (
SELECT e.emp_no,e.last_name, e.first_name, 
	de.dept_no 
FROM employees as e
INNER JOIN dept_emp as de
ON e.emp_no = de.emp_no) as emp_d
ON emp_d.dept_no = d.dept_no
WHERE d.dept_name IN ('Sales','Development')
;


--In descending order, list the frequency 
--count of employee last names, i.e., how many 
--employees share each last name.
SELECT last_name, count(last_name) as last_name_count
FROM employees
GROUP BY last_name
ORDER BY last_name_count DESC;

--Search your ID number
--499942
SELECT * FROM employees
WHERE emp_no = 499942;
--Haha, April Fool's Day in August

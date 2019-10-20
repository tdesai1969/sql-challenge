-- 1
-- List the following details of each employee: 
-- employee number, last name, first name, gender, and salary.

SELECT e.emp_no, e.last_name, e.first_name, e.gender,s.salary
FROM employees e
JOIN salaries s
ON (e.emp_no = s.emp_no);

-- 2
--List employees who were hired in 1986.

SELECT first_name,last_name,hire_date
FROM employees
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31'
limit 100;

SELECT * FROM employees

--3
-- List the manager of each department with the following information:
-- department number, department name, the manager's employee number, last name, first name, 
-- and start and end employment dates.

SELECT B.dept_no,B.dept_name, 
C.emp_no AS "manager employee number", A.last_name, A.first_name,
C.from_date AS "Start Date",C.to_date AS "End Date"
FROM
employees A,
department B,
dept_manager C
WHERE 
A.emp_no = C.emp_no AND
B.dept_no = C.dept_no;

-- 3 JOIN METHOD 
SELECT B.dept_no,B.dept_name, 
C.emp_no AS "manager employee number", A.last_name, A.first_name,
C.from_date AS "Start Date",C.to_date AS "End Date"
FROM
employees A INNER JOIN dept_manager C
ON 
A.emp_no = C.emp_no
INNER JOIN 
department B 
ON
B.dept_no = C.dept_no




-- 4 
-- List the department of each employee with the following information: 
-- employee number, last name, first name, and department name.

SELECT A.emp_no AS employees_Number, A.last_name, A.first_name, B.dept_name
FROM 
employees A,
department B,
dept_emp C
WHERE 
A.emp_no = C.emp_no AND
B.dept_no = C.dept_no;


-- 5
-- List all employees whose first name is "Hercules" and last names begin with "B."

SELECT e.first_name, e.last_name
FROM employees e
WHERE first_name = 'Hercules' AND last_name LIKE 'B%'
Limit 100;


-- 6 
-- List all employees in the Sales department, 
-- including their employee number, last name, first name, and department name.

SELECT A.emp_no AS employees_Number, A.last_name, A.first_name, B.dept_name
FROM 
employees A,
department B,
dept_emp C
WHERE 
A.emp_no = C.emp_no AND
B.dept_no = C.dept_no AND
B.dept_name = 'Sales'


-- 7
-- List all employees in the Sales and Development departments, 
-- including their employee number, last name, first name, and department name.


SELECT A.emp_no AS employees_Number, A.last_name, A.first_name, B.dept_name
FROM 
employees A,
department B,
dept_emp C
WHERE 
A.emp_no = C.emp_no AND
B.dept_no = C.dept_no AND
B.dept_name IN ('Sales', 'Development')
ORDER by B.dept_name ASC


-- 8 In descending order, list the frequency count of employee last names, 
-- i.e., how many employees share each last name.

SELECT employees.last_name, count(last_name)  AS "Last Name Count" 
FROM employees
GROUP BY last_name
ORDER BY "last_name" DESC




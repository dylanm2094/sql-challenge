-- (can't use do to admin block) COPY [insert table name] FROM '/Applications/PostgreSQL 12/temp-data/[insert file name].csv' DELIMITER ',' CSV HEADER;
-- manually import through schema (/Users/user/Desktop/DataCourse/HW7_sql/sql-challenge/EmployeeSQL/[insert file name].csv)

-- Drop tables
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS departments;
DROP TABLE IF EXISTS salaries;
DROP TABLE IF EXISTS titles;
DROP TABLE IF EXISTS dept_emp;
DROP TABLE IF EXISTS dept_manager;

-- Create tables
CREATE TABLE employees (
  	emp_no int NOT NULL PRIMARY KEY,
	birth_date date NOT NULL,
  	first_name varchar(45) NOT NULL,
  	last_name varchar(45) NOT NULL,
  	gender varchar(45) NOT NULL,
	hire_date date NOT NULL
);
CREATE TABLE departments (
 	dept_no varchar(45) NOT NULL PRIMARY KEY,
  	dept_name varchar(45) NOT NULL
);
CREATE TABLE salaries (
  	emp_no int NOT NULL,
  	salary int NOT NULL,
  	from_date date NOT NULL,
  	to_date date NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);
CREATE TABLE titles (
    emp_no int NOT NULL,
  	title varchar(45) NOT NULL,
  	from_date date NOT NULL,
  	to_date date NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);
CREATE TABLE dept_emp (
  	emp_no int NOT NULL,
	dept_no varchar(45) NOT NULL,
	from_date date NOT NULL,
	to_date date NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);
CREATE TABLE dept_manager (
	dept_no varchar(45) NOT NULL,
	emp_no int NOT NULL,
	from_date date NOT NULL,
	to_date date NOT NULL,
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

-- reviewing table output
SELECT * FROM departments;
SELECT * FROM employees;
SELECT * FROM dept_emp;
SELECT * FROM dept_manager;
SELECT * FROM salaries;
SELECT * FROM titles;

-- List the following details of each employee: employee number, last name, first name, gender, and salary.
SELECT e.emp_no, e.last_name, e.first_name, e.gender, s.salary
FROM employees e
JOIN salaries s ON s.emp_no = e.emp_no;

-- List employees who were hired in 1986.
SELECT emp_no, last_name, first_name, hire_date
FROM employees e
WHERE hire_date >= '1986-01-01'
AND hire_date < '1987-01-01';

-- List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name, and start and end employment dates.
SELECT dm.dept_no, d.dept_name, dm.emp_no, e.last_name, e.first_name, dm.from_date, dm.to_date
FROM dept_manager dm
JOIN departments d ON d.dept_no = dm.dept_no
JOIN employees e ON e.emp_no = dm.emp_no;

-- List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT de.emp_no, e.last_name, e.first_name, d.dept_name
FROM dept_emp de
JOIN departments d ON d.dept_no = de.dept_no
JOIN employees e ON e.emp_no = de.emp_no;

-- List all employees whose first name is "Hercules" and last names begin with "B."
SELECT emp_no, first_name, last_name
FROM employees
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%';

-- List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT de.emp_no, e.last_name, e.first_name, d.dept_name
FROM dept_emp de
JOIN departments d ON d.dept_no = de.dept_no
JOIN employees e ON e.emp_no = de.emp_no
WHERE d.dept_name = 'Sales';

--  List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT de.emp_no, e.last_name, e.first_name, d.dept_name
FROM dept_emp de
JOIN departments d ON d.dept_no = de.dept_no
JOIN employees e ON e.emp_no = de.emp_no
WHERE d.dept_name = 'Sales'
OR d.dept_name = 'Development';

-- In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT last_name, count(last_name) as "Frequency"
FROM employees
GROUP BY 1
ORDER BY "Frequency" DESC;

-- Epilouge
SELECT e.emp_no, e.last_name, e.first_name, e.gender, s.salary
FROM employees e
JOIN salaries s ON s.emp_no = e.emp_no
WHERE e.emp_no = 499942;
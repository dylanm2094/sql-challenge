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

SELECT * FROM departments;
SELECT * FROM employees;
SELECT * FROM dept_emp;
SELECT * FROM dept_manager;
SELECT * FROM salaries;
SELECT * FROM titles;
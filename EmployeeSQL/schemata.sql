employees
-
emp_no INT PK
birth_date DATE
first_name VARCHAR(45)
last_name VARCHAR(45)
gender VARCHAR(45)
hire_date DATE

departments
-
dept_no VARCHAR(45) PK
dept_name VARCHAR(45)

salaries
-
emp_no INT FK >- employees.emp_no
salary INT
from_date DATE
to_date DATE

titles
-
emp_no INT FK >- employees.emp_no
title VARCHAR(45)
from_date DATE
to_date DATE

dept_emp
-
emp_no INT FK >- employees.emp_no
dept_no VARCHAR(45) FK >- departments.dept_no
from_date DATE
to_date DATE

dept_manager
-
dept_no VARCHAR(45) FK >- departments.dept_no
emp_no INT FK >- employees.emp_no
from_date DATE
to_date DATE
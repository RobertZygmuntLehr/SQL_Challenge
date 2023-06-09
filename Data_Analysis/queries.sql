-- 1. List the employee number, last name, first name, sex, and salary of each employee.
SELECT employees.employee_number, last_name, first_name, sex, salary
FROM employees
JOIN salaries ON employees.employee_number = salaries.employee_number;

-- 2. List the first name, last name, and hire date for the employees who were hired in 1986.
SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31';

/* 3. List the manager of each department along with their department number,
department name, employee number, last name, and first name.*/
SELECT department_manager.department_number, departments.department_name, department_manager.employee_number, employees.last_name, employees.first_name
FROM department_manager
JOIN departments ON department_manager.department_number = departments.department_number
JOIN employees ON department_manager.employee_number = employees.employee_number;

/* 4. List the department number for each employee along with that employee’s employee number,
last name, first name, and department name.*/
SELECT department_employees.employee_number, employees.last_name, employees.first_name, departments.department_name
FROM department_employees
JOIN employees ON department_employees.employee_number = employees.employee_number
JOIN departments ON department_employees.department_number = departments.department_number;

/* 5. List first name, last name, and sex of each employee whose first name is Hercules
and whose last name begins with the letter B.*/
SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

/* 6. List each employee in the Sales department, including their employee number, 
last name, and first name.*/
SELECT employees.employee_number, employees.last_name, employees.first_name
FROM employees
JOIN department_employees ON employees.employee_number = department_employees.employee_number
JOIN departments ON department_employees.department_number = departments.department_number
WHERE departments.department_name = 'Sales';

/* 7. List each employee in the Sales and Development departments, 
including their employee number, last name, first name, and department name.*/
SELECT employees.employee_number, employees.last_name, employees.first_name, departments.department_name
FROM employees
JOIN department_employees ON employees.employee_number = department_employees.employee_number
JOIN departments ON department_employees.department_number = departments.department_number
WHERE departments.department_name IN ('Sales', 'Development');

/* 8. List the frequency counts, in descending order, of all the employee last names
(that is, how many employees share each last name).*/
SELECT last_name, COUNT(*) AS frequency
FROM employees
GROUP BY last_name
ORDER BY frequency DESC;

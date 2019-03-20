SELECT departments.dept_name as 'Имя отдела', AVG(salaries.salary) as 'Средняя зарплата' FROM dept_emp
LEFT JOIN departments
ON dept_emp.dept_no = departments.dept_no
LEFT JOIN salaries
ON dept_emp.emp_no = salaries.emp_no
GROUP BY dept_emp.dept_no;
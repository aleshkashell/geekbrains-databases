SELECT departments.dept_name AS 'Имя отдела', count(dept_emp.emp_no) AS 'Количество сотрудников' FROM dept_emp
LEFT JOIN departments
ON dept_emp.dept_no = departments.dept_no
GROUP BY dept_emp.dept_no;
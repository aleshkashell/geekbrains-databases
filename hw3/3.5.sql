DELETE FROM employees WHERE emp_no = (SELECT emp_no FROM salaries
	WHERE salary = (SELECT MAX(salary) FROM salaries))
;
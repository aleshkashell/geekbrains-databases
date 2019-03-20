-- Средняя зарплата по отделам
CREATE OR REPLACE VIEW avg_salary AS
    SELECT departments.dept_name AS 'Имя отдела', AVG(salaries.salary) AS 'Средняя зарплата' FROM dept_emp
    LEFT JOIN departments
    ON dept_emp.dept_no = departments.dept_no
    LEFT JOIN salaries
    ON dept_emp.emp_no = salaries.emp_no
    GROUP BY dept_emp.dept_no;

-- Максимальная зарплата
CREATE OR REPLACE VIEW max_salary AS
    SELECT MAX(salary) AS 'Максимальная зарплата сотрудника' FROM salaries;

-- Количество сотрудников
CREATE OR REPLACE VIEW count_employees AS
    SELECT departments.dept_name AS 'Имя отдела', count(dept_emp.emp_no) AS 'Количество сотрудников' FROM dept_emp
    LEFT JOIN departments
    ON dept_emp.dept_no = departments.dept_no
    GROUP BY dept_emp.dept_no;
    
-- Общая зарплата по отделам
CREATE OR REPLACE VIEW sum_salary AS
    SELECT t1.dept_name AS 'Имя отдела', COUNT(DISTINCT t1.unique_emp_no) AS 'Количество сотрудников', SUM(avg_salary) AS 'Общая зарплата'
    FROM (  
        SELECT 
            departments.dept_name AS dept_name, 
            AVG(salaries.salary) AS avg_salary,
            dept_emp.emp_no AS unique_emp_no
        FROM dept_emp
        LEFT JOIN departments
        ON dept_emp.dept_no = departments.dept_no
        LEFT JOIN salaries
        ON dept_emp.emp_no = salaries.emp_no
        GROUP BY dept_name, unique_emp_no
        ) AS t1
    GROUP BY t1.dept_name;
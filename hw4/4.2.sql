DELIMITER //
CREATE FUNCTION `get_manager` (firstname VARCHAR(30), lastname VARCHAR(30))
RETURNS VARCHAR(60)
DETERMINISTIC
READS SQL DATA
RETURN(
-- Выводим менеджера отдела
    SELECT CONCAT(employees.first_name, ' ', employees.last_name) AS 'Manager' FROM dept_manager 
    JOIN departments
    ON departments.dept_no = dept_manager.dept_no
    JOIN employees
    ON dept_manager.emp_no = employees.emp_no
    -- Ограничение по дате, чтобы определить, что информация актуальна
    WHERE dept_manager.to_date = '9999-01-01' AND departments.dept_no = (
    -- Получаем отдел сотрудника
        SELECT dept_emp.dept_no FROM dept_emp
        JOIN employees
        ON dept_emp.emp_no = employees.emp_no
        JOIN titles
        ON dept_emp.emp_no = titles.emp_no
        -- Ограничение по дате, чтобы определить, что информация актуальна
        WHERE employees.first_name = firstname AND employees.last_name = lastname AND titles.to_date = '9999-01-01')
    );
DELIMITER ;
CREATE DATABASE IF NOT EXISTS assignment_2;
USE assignment_2;

DROP DATABASE assignment_2;

-- 1. Відділи
CREATE TABLE departments (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    location VARCHAR(100)
);

-- 2. Працівники
CREATE TABLE employees (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    position VARCHAR(100),
    hire_date DATE,
    department_id INT,
    manager_id INT	
);

-- 3. Проєкти
CREATE TABLE projects (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    start_date DATE,
    end_date DATE,
    budget DECIMAL(12, 2)
);

-- 4. Проміжна таблиця працівник ⇄ проєкт
CREATE TABLE employee_project (
    employee_id INT,
    project_id INT,
    role VARCHAR(50),
    allocation_percent INT CHECK (allocation_percent >= 0 AND allocation_percent <= 100),
    PRIMARY KEY (employee_id, project_id)
);

-- 5. Зарплати
CREATE TABLE salaries (
    id INT PRIMARY KEY,
    employee_id INT,
    salary_month DATE,
    base_salary DECIMAL(10, 2),
    bonus DECIMAL(10, 2)
);

-- 6. Відпустки
CREATE TABLE vacations (
    id INT PRIMARY KEY,
    employee_id INT,
    start_date DATE,
    end_date DATE,
    approved_by INT
);

-- 7. Журнал логінів
CREATE TABLE login_audit (
    id INT PRIMARY KEY,
    employee_id INT,
    login_time TIMESTAMP,
    logout_time TIMESTAMP,
    device VARCHAR(100)
);


-- --- --- --


-- Відділи
INSERT INTO departments VALUES
(1, 'Engineering', 'Kyiv'),
(2, 'HR', 'Lviv'),
(3, 'Finance', 'Odesa');

-- Працівники
INSERT INTO employees VALUES
(1, 'Andriy Smirnov', 'Team Lead', '2020-01-01', 1, NULL),
(2, 'Iryna Bondarenko', 'Developer', '2021-03-15', 1, 1),
(3, 'Svitlana Makarova', 'HR Manager', '2019-07-10', 2, NULL),
(4, 'Dmytro Hrytsenko', 'Accountant', '2022-02-20', 3, NULL),
(5, 'Olga Lysenko', 'Developer', '2023-01-10', 1, 1);

-- Проєкти
INSERT INTO projects VALUES
(1, 'ERP System', '2023-01-01', '2023-12-31', 100000.00),
(2, 'Website Redesign', '2023-06-01', '2024-03-01', 30000.00);

-- Призначення на проєкти
INSERT INTO employee_project VALUES
(2, 1, 'Backend Dev', 60),
(5, 1, 'Frontend Dev', 40),
(2, 2, 'Fullstack Dev', 40),
(1, 1, 'Project Manager', 100);

-- Зарплати
INSERT INTO salaries VALUES
(1, 1, '2024-12-01', 3000.00, 500.00),
(2, 2, '2024-12-01', 2000.00, 300.00),
(3, 5, '2024-12-01', 1800.00, 200.00);

-- Відпустки
INSERT INTO vacations VALUES
(1, 2, '2024-08-01', '2024-08-15', 1),
(2, 5, '2024-09-10', '2024-09-20', 1);

-- Логи входу
INSERT INTO login_audit VALUES
(1, 2, '2025-05-01 08:15:00', '2025-05-01 17:01:00', 'Windows-Laptop'),
(2, 5, '2025-05-01 08:30:00', '2025-05-01 16:45:00', 'MacBook-Pro');



-- --- не оптимізовано --- --

EXPLAIN ANALYZE
SELECT 
    e.name AS employee_name,
    d.name AS department_name,
    p.name AS project_name,
    ep.role,
    p.start_date,
    (SELECT s.base_salary + s.bonus 
     FROM salaries s 
     WHERE s.employee_id = e.id 
       AND s.salary_month = '2024-12-01') AS total_payment,
    (SELECT COUNT(*) 
     FROM login_audit la 
     WHERE la.employee_id = e.id) AS login_count
FROM employees e,
     departments d,
     employee_project ep,
     projects p
WHERE e.department_id = d.id
  AND ep.employee_id = e.id
  AND ep.project_id = p.id
  AND e.id IN (
      SELECT s.employee_id 
      FROM salaries s 
      WHERE s.salary_month = '2024-12-01'
  )
ORDER BY e.name;



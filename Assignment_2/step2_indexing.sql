USE assignment_2;                              

-- index for join
CREATE INDEX idx_employees_department_id ON employees(department_id);
CREATE INDEX idx_departments_id ON departments(id);
CREATE INDEX idx_projects_id ON projects(id);

-- index for percent
CREATE INDEX idx_employee_project_emp_proj_alloc ON employee_project(employee_id, project_id, allocation_percent);

-- index для зарплат 
CREATE INDEX idx_salaries_emp_month ON salaries(employee_id, salary_month);

SHOW INDEX FROM employees;
SHOW INDEX FROM departments;
SHOW INDEX FROM projects;
SHOW INDEX FROM employee_project;
SHOW INDEX FROM salaries;


EXPLAIN ANALYZE
SELECT 
    e.name AS employee_name,
    d.name AS department_name,
    p.name AS project_name,
    ep.role,
    p.start_date,
    s.base_salary + s.bonus AS total_payment
FROM employees e
JOIN departments d ON e.department_id = d.id
JOIN employee_project ep ON ep.employee_id = e.id
JOIN projects p ON ep.project_id = p.id
JOIN salaries s ON s.employee_id = e.id AND s.salary_month = '2024-12-01'
WHERE ep.allocation_percent >= 50
ORDER BY e.name;

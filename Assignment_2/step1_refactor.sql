USE assignment_2;


-- --- краща читабельність --- --
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
       AND s.salary_month = '2024-12-01') AS total_payment
FROM employees e
JOIN departments d ON e.department_id = d.id
JOIN employee_project ep ON ep.employee_id = e.id
JOIN projects p ON ep.project_id = p.id
WHERE ep.allocation_percent >= 30
  AND e.id IN (
      SELECT s.employee_id 
      FROM salaries s 
      WHERE s.salary_month = '2024-12-01'
  )
ORDER BY e.name;



-- --- додано left join --- --
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
LEFT JOIN salaries s ON s.employee_id = e.id AND s.salary_month = '2024-12-01'
WHERE ep.allocation_percent >= 30
  AND s.id IS NOT NULL
ORDER BY e.name;



-- --- сte --- --
EXPLAIN ANALYZE
WITH december_salaries AS (
    SELECT employee_id, base_salary + bonus AS total_payment
    FROM salaries
    WHERE salary_month = '2024-12-01'
)
SELECT 
    e.name AS employee_name,
    d.name AS department_name,
    p.name AS project_name,
    ep.role,
    p.start_date,
    ds.total_payment
FROM employees e
JOIN departments d ON e.department_id = d.id
JOIN employee_project ep ON ep.employee_id = e.id
JOIN projects p ON ep.project_id = p.id
JOIN december_salaries ds ON ds.employee_id = e.id
WHERE ep.allocation_percent >= 30
ORDER BY e.name;

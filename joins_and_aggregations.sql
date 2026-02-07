-- ========== Setup (sample schema + data) ==========
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS departments;

CREATE TABLE departments (
  department_id INT PRIMARY KEY,
  department_name VARCHAR(50)
);

CREATE TABLE employees (
  employee_id INT PRIMARY KEY AUTO_INCREMENT,
  first_name VARCHAR(50),
  department_id INT,
  salary INT
);

INSERT INTO departments VALUES
(10,'HR'), (20,'IT'), (30,'Finance'), (40,'Marketing');

INSERT INTO employees (first_name, department_id, salary) VALUES
('John',10,60000),
('Sara',20,80000),
('Mike',10,50000),
('Nina',30,90000),
('Alex',NULL,40000);

-- Show all employees and their departments (LEFT JOIN)
SELECT e.first_name, d.department_name
FROM employees e
LEFT JOIN departments d
  ON e.department_id = d.department_id;

-- Find employees without department
SELECT e.first_name
FROM employees e
LEFT JOIN departments d
  ON e.department_id = d.department_id
WHERE d.department_id IS NULL;

-- Total salary by department where sum > 100000
SELECT d.department_name, SUM(e.salary) AS total_salary
FROM departments d
JOIN employees e
  ON e.department_id = d.department_id
GROUP BY d.department_name
HAVING SUM(e.salary) > 100000;
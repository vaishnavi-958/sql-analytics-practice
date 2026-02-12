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
    salary INT,
    hire_year INT
);

INSERT INTO departments VALUES
(10, 'HR'),
(20, 'IT'),
(30, 'Finance'),
(40, 'Marketing');

INSERT INTO employees (first_name, department_id, salary, hire_year) VALUES
('John', 10, 60000, 2020),
('Sara', 20, 80000, 2021),
('Mike', 10, 50000, 2019),
('Nina', 30, 90000, 2022),
('Alex', NULL, 40000, 2023),
('David', 20, 75000, 2020),
('Emma', 30, 85000, 2021),
('Liam', 40, 55000, 2022);

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
    salary INT,
    hire_year INT
);

INSERT INTO departments VALUES
(10, 'HR'),
(20, 'IT'),
(30, 'Finance'),
(40, 'Marketing');

INSERT INTO employees (first_name, department_id, salary, hire_year) VALUES
('John', 10, 60000, 2020),
('Sara', 20, 80000, 2021),
('Mike', 10, 50000, 2019),
('Nina', 30, 90000, 2022),
('Alex', NULL, 40000, 2023),
('David', 20, 75000, 2020),
('Emma', 30, 85000, 2021),
('Liam', 40, 55000, 2022);
-- ============================================
-- CASE + GROUP BY + LEFT JOIN + NULL handling
-- Database: MySQL
-- Author: Vaishnavi
-- ============================================

-- 1) Salary category for each employee (row-level)
SELECT
    first_name,
    salary,
    CASE
        WHEN salary > 75000 THEN 'HIGH'
        WHEN salary BETWEEN 55000 AND 75000 THEN 'MEDIUM'
        ELSE 'LOW'
    END AS salary_category
FROM employees;

-- 2) Count employees per salary category (group-level)
SELECT
    CASE
        WHEN salary > 75000 THEN 'HIGH'
        WHEN salary BETWEEN 55000 AND 75000 THEN 'MEDIUM'
        ELSE 'LOW'
    END AS salary_category,
    COUNT(*) AS total_employees
FROM employees
GROUP BY salary_category
ORDER BY total_employees DESC;

-- 3) Average salary per department (JOIN + aggregation)
SELECT
    d.department_name,
    AVG(e.salary) AS avg_salary
FROM departments d
JOIN employees e
    ON e.department_id = d.department_id
GROUP BY d.department_name
ORDER BY avg_salary DESC;

-- 4) Department summary (keep ALL departments)
-- Note: SUM/AVG return NULL when there are no employee rows, so we convert to 0 using IFNULL
-- Note: COUNT(e.employee_id) correctly returns 0 for departments with no employees
SELECT
    d.department_name,
    IFNULL(SUM(e.salary), 0) AS total_salary,
    IFNULL(AVG(e.salary), 0) AS avg_salary,
    COUNT(e.employee_id) AS employee_count
FROM departments d
LEFT JOIN employees e
    ON d.department_id = e.department_id
GROUP BY d.department_name
ORDER BY total_salary DESC;

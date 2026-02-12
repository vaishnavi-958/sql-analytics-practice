-- ============================================
-- Subquery-Based Analytical Queries
-- Database: MySQL
-- Author: Vaishnavi
-- ============================================

-- 1) Employees earning above company average salary
SELECT
    first_name,
    salary
FROM employees
WHERE salary > (
    SELECT AVG(salary)
    FROM employees
);

-- 2) Employees hired after 2020 and earning above company average
SELECT
    first_name,
    hire_year,
    salary
FROM employees
WHERE hire_year > 2020
  AND salary > (
    SELECT AVG(salary)
    FROM employees
);

-- 3) Highest paid employee(s) in each department
SELECT
    first_name,
    department_id,
    salary
FROM employees e1
WHERE salary = (
    SELECT MAX(salary)
    FROM employees e2
    WHERE e2.department_id = e1.department_id
);

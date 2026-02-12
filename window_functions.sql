-- ============================================
-- Window Function Practice
-- Database: MySQL 8+
-- Author: Vaishnavi
-- ============================================

-- 1) Rank employees by salary within each department
SELECT
    first_name,
    department_id,
    salary,
    ROW_NUMBER() OVER (
        PARTITION BY department_id
        ORDER BY salary DESC
    ) AS rank_in_department
FROM employees;


-- 2) Top 2 highest paid employees per department (strictly 2)
SELECT *
FROM (
    SELECT
        first_name,
        department_id,
        salary,
        ROW_NUMBER() OVER (
            PARTITION BY department_id
            ORDER BY salary DESC
        ) AS rn
    FROM employees
) t
WHERE rn <= 2;


-- 3) Company-wide salary ranking (including ties)
SELECT
    first_name,
    department_id,
    salary,
    DENSE_RANK() OVER (
        ORDER BY salary DESC
    ) AS company_salary_rank
FROM employees
ORDER BY company_salary_rank;

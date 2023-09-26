-- 1

SELECT *
  FROM hcm.employees
 ORDER BY last_name ASC

-- 2

SELECT *
  FROM hcm.employees
 ORDER BY salary DESC

-- 3

SELECT *
  FROM hcm.employees
 ORDER BY hire_date DESC

-- 4

SELECT *
  FROM hcm.employees
 ORDER BY department_id ASC,
          salary DESC

-- 5

SELECT TOP 10 employee_id,
       first_name,
       last_name
  FROM hcm.employees
 ORDER BY salary DESC

-- 6

SELECT TOP 1 WITH TIES employee_id,
       first_name,
       last_name,
       salary
  FROM hcm.employees
 ORDER BY salary

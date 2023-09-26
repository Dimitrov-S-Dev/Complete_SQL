-- 1

SELECT e.employee_id,
       e.first_name,
       e.last_name,
       e.salary,
       d.department_name
  FROM hcm.employees AS e
  JOIN hcm.departments AS d
    ON e.department_id = d.department_id

-- 2

SELECT e.employee_id,
       e.first_name,
       e.last_name,
       e.salary,
       d.department_name
  FROM hcm.employees AS e
  LEFT JOIN hcm.departments AS d
    ON e.department_id = d.department_id

-- 3

SELECT d.department_name,
       COUNT(*) AS ECNT
  FROM hcm.employees AS e
  LEFT JOIN hcm.departments AS d
    ON e.department_id = d.department_id
 GROUP BY d.department_name

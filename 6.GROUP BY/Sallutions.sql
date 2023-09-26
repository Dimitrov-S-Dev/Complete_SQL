-- 1

SELECT department_id,
       COUNT(*) AS total_employee
  FROM hcm.employees
 GROUP BY department_id

-- 2

SELECT department_id,
       ROUND(AVG(salary), 1) AS avg_salary
  FROM hcm.employees
 GROUP BY department_id
 ORDER BY avg_salary DESC

-- 3

SELECT warehouse_id,
       SUM(quantity_on_hand) AS TN
  FROM oes.inventories
 GROUP BY warehouse_id
HAVING SUM(quantity_on_hand) > 5000


-- 4

SELECT locality,
       MAX(date_of_count) AS date_of_recent_pop_count
  FROM bird.antarctic_populations
 GROUP BY locality


-- 5

SELECT locality,
       species_id,
       MAX(date_of_count) AS date_of_recent_pop_count
  FROM bird.antarctic_populations
 GROUP BY locality,
          species_id

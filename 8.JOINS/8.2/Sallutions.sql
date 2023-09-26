-- 1

SELECT e.employee_id,
       e.first_name,
       e.last_name,
       m.first_name AS m_first_name,
       m.last_name AS m_last_name
  FROM hcm.employees e
  LEFT JOIN hcm.employees AS m
    ON e.manager_id = m.employee_id

-- 2

SELECT p.product_id,
       p.product_name,
       w.warehouse_id,
       w.warehouse_name,
       i.quantity_on_hand
  FROM oes.products AS p
  JOIN oes.inventories AS i
    ON p.product_id   = i.product_id
  JOIN oes.warehouses AS w
    ON i.warehouse_id = w.warehouse_id

-- 3

SELECT e.employee_id,
       e.first_name,
       e.last_name,
       d.department_name,
       j.job_title,
       e.state_province
  FROM hcm.employees AS e
  LEFT JOIN hcm.departments AS d
    ON e.department_id = d.department_id
  JOIN hcm.countries AS c
    ON e.country_id    = c.country_id
  JOIN hcm.jobs AS j
    ON j.job_id        = e.job_id
 WHERE c.country_name = 'Australia'


-- 4

SELECT pc.category_name,
       p.product_name,
       SUM(oi.quantity) AS total_quantity_ordered
  FROM oes.products AS p
  JOIN oes.order_items AS oi
    ON oi.product_id  = p.product_id
  JOIN oes.product_categories AS pc
    ON pc.category_id = p.category_id
 GROUP BY pc.category_name,
          p.product_name
 ORDER BY pc.category_name,
          p.product_name

-- 5

SELECT pc.category_name,
       p.product_name,
       COALESCE(SUM(oi.quantity), 0) as total_quantity_ordered
  FROM oes.products AS p
  LEFT JOIN oes.order_items AS oi
    ON p.product_id  = oi.product_id
  JOIN oes.product_categories AS pc
    ON p.category_id = p.category_id
 GROUP BY pc.category_name,
          p.product_name
 ORDER BY pc.category_nam

-- 1

SELECT *
  FROM oes.products
 WHERE list_price > 100

-- 2

SELECT *
  FROM oes.orders
 WHERE shipped_date IS NULL

-- 3

SELECT *
  FROM oes.orders
 WHERE order_date = '2020-02-26'

-- 4

SELECT *
  FROM oes.orders
 WHERE order_date >= '2020-01-01'

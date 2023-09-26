--1

SELECT *
  FROM hcm.countries
 WHERE country_name LIKE 'N%'

-- 2

SELECT *
  FROM oes.customers
 WHERE email LIKE '%gmail.com'

-- 3

SELECT product_name
  FROM oes.products
 WHERE product_name LIKE '%mouse%'

-- 4

SELECT product_name
  FROM oes.products
 WHERE product_name LIKE '%[0-9]'

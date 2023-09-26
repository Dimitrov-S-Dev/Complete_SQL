-- 1

SELECT *
  FROM hcm.employees
 WHERE city IN ( 'Seattle', 'Sydney' )

-- 2

SELECT *
  FROM hcm.employees
 WHERE city IN ( 'Seattle', 'Sydney', 'Ascot', 'Hilston' )

-- 3

SELECT *
  FROM hcm.employees
 WHERE city   = 'Sydney'
   AND salary > 200000

-- 4

SELECT *
  FROM hcm.employees
 WHERE (   city  = 'Seattle'
      OR   city  = 'Sydney')
   AND hire_date >= '2019-01-01'

-- 5

SELECT *
  FROM oes.products
 WHERE category_id NOT IN ( 1, 2, 5 )

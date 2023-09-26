
-- 1 return product details for the cheapest product(s)
SELECT product_id,
       product_name,
       list_price,
       category_id
  FROM oes.products
 WHERE list_price = (SELECT MIN(list_price) FROM oes.products);


--equivalent using TOP:
SELECT TOP (1) WITH TIES product_id,
       product_name,
       list_price,
       category_id
  FROM oes.products
 ORDER BY list_price ASC;



/*
Solution to Challenge 2 - return product details for the cheapest product(s) in
each product category by using a correlated subquery:
*/
SELECT p.product_id,
       p.product_name,
       p.list_price,
       p.category_id
  FROM oes.products p
 WHERE p.list_price = (   SELECT MIN(p2.list_price)
                            FROM oes.products p2
                           WHERE p2.category_id = p.category_id);



/*
Solution to Challenge 3 - return product details for the cheapest product(s)
in each product category by using a join to a derived table:
*/
SELECT p.product_id,
       p.product_name,
       p.list_price,
       p.category_id
  FROM oes.products p
 INNER JOIN (   SELECT category_id,
                       MIN(list_price) as min_list_price
                  FROM oes.products
                 GROUP BY category_id) p2
    ON p.category_id = p2.category_id
   AND p.list_price  = p2.min_list_price;



/*
Solution to Challenge 4 - return product details for the cheapest product(s)
in each product category by using a common table expression:
*/
WITH cheapest_product_by_category
  AS (SELECT category_id,
             MIN(list_price) as min_list_price
        FROM oes.products
       GROUP BY category_id)
SELECT p.product_id,
       p.product_name,
       p.list_price,
       p.category_id
  FROM oes.products p
 INNER JOIN cheapest_product_by_category p2
    ON p.category_id = p2.category_id
   AND p.list_price  = p2.min_list_price;



/*
Solution to Challenge 5 - return product details for the cheapest product(s)
in each product category. Include the category name:
*/
WITH cheapest_product_by_category
  AS (SELECT category_id,
             MIN(list_price) as min_list_price
        FROM oes.products
       GROUP BY category_id)
SELECT p.product_id,
       p.product_name,
       p.list_price,
       p.category_id,
       pc.category_name
  FROM oes.products p
 INNER JOIN oes.product_categories pc
    ON pc.category_id = p.category_id
 INNER JOIN cheapest_product_by_category p2
    ON p.category_id  = p2.category_id
   AND p.list_price   = p2.min_list_price;



/*
Solution to Challenge 6 - return all employees who have never been the salesperson
for any customer order. Use the NOT IN operator:
*/
SELECT employee_id,
       first_name,
       last_name
  FROM hcm.employees
 WHERE employee_id NOT IN ( SELECT employee_id FROM oes.orders WHERE employee_id IS NOT NULL );



/*
Solution to Challenge 7 - return all employees who have never been the salesperson
for any customer order. Use the NOT EXISTS operator:
*/
SELECT e.employee_id,
       e.first_name,
       e.last_name
  FROM hcm.employees e
 WHERE NOT EXISTS (SELECT 1 FROM oes.orders o WHERE o.employee_id = e.employee_id);



/*
Solution to Challenge 8 - Return unique customers who have
ordered the 'PBX Smart Watch 4':
*/
SELECT c.customer_id,
       c.first_name,
       c.last_name,
       c.email
  FROM oes.customers c
 WHERE c.customer_id IN (   SELECT o.customer_id
                              FROM oes.orders o
                              JOIN oes.order_items oi
                                ON oi.order_id  = o.order_id
                              JOIN oes.products p
                                ON p.product_id = oi.product_id
                             WHERE p.product_name = 'PBX Smart Watch 4' );

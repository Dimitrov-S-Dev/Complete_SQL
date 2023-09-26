-- 1

SELECT *
  FROM bird.california_sightings
UNION ALL
SELECT *
  FROM bird.arizona_sightings

-- 2

SELECT scientific_name
  FROM bird.california_sightings
UNION
SELECT scientific_name
  FROM bird.arizona_sightings

-- 3

SELECT scientific_name,
       'California' AS state_name
  FROM bird.california_sightings
UNION
SELECT scientific_name,
       'Arizona'
  FROM bird.arizona_sightings
 ORDER BY state_name,
          scientific_name

-- 4

SELECT sighting_id,
       common_name,
       scientific_name,
       location_of_sighting,
       sighting_date,
       'California' AS state
  FROM bird.california_sightings
UNION ALL
SELECT sighting_id,
       common_name,
       scientific_name,
       sighting_location,
       sighting_date,
       'Arizona'
  FROM bird.arizona_sightings
UNION ALL
SELECT observation_id,
       NULL AS common_name,
       scientific_name,
       locality,
       sighting_datetime,
       'Florida'
  FROM bird.florida_sightings

-- 5

SELECT customer_id
  FROM oes.customers
INTERSECT
SELECT customer_id
  FROM oes.orders

-- 6

SELECT product_id
  FROM oes.products
EXCEPT
SELECT product_id
  FROM oes.inventories

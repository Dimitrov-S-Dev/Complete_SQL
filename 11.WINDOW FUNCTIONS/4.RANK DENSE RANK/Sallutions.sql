--1

SELECT
	p.Name AS ProductName,
	p.ListPrice,
	s.Name AS ProductSubcategory,
	c.Name AS ProductCategory,
	ROW_NUMBER() OVER(ORDER BY p.ListPrice DESC) AS PriceRank,
	ROW_NUMBER() OVER(PARTITION BY c.Name ORDER BY p.ListPrice DESC) AS [Category Price Rank],
	[Top 5 Price In Category] = CASE
									WHEN ROW_NUMBER() OVER(PARTITION BY c.Name ORDER BY p.ListPrice) <= 5 THEN 'Yes'
									ELSE 'No' END,
	[Category Price Rank With Rank] = RANK() OVER(PARTITION BY c.Name ORDER BY p.ListPrice DESC)
FROM
	Production.Product AS p
JOIN Production.ProductSubcategory AS s
ON p.ProductSubcategoryID = s.ProductSubcategoryID
JOIN Production.ProductCategory AS c
ON s.ProductCategoryID = c.ProductCategoryID

-- 2

SELECT
	p.Name AS ProductName,
	p.ListPrice,
	s.Name AS ProductSubcategory,
	c.Name AS ProductCategory,
	ROW_NUMBER() OVER(ORDER BY p.ListPrice DESC) AS PriceRank,
	ROW_NUMBER() OVER(PARTITION BY c.Name ORDER BY p.ListPrice DESC) AS [Category Price Rank],
	[Category Price Rank with Dense Rank] = DENSE_RANK() OVER(PARTITION BY c.Name ORDER BY p.ListPrice DESC),
	[Top 5 Price In Category] = CASE
									WHEN ROW_NUMBER() OVER(PARTITION BY c.Name ORDER BY p.ListPrice) <= 5 THEN 'Yes'
									ELSE 'No' END,
	[Category Price Rank With Rank] = RANK() OVER(PARTITION BY c.Name ORDER BY p.ListPrice DESC)

FROM
	Production.Product AS p
JOIN Production.ProductSubcategory AS s
ON p.ProductSubcategoryID = s.ProductSubcategoryID
JOIN Production.ProductCategory AS c
ON s.ProductCategoryID = c.ProductCategoryID

-- 3

SELECT
	p.Name AS ProductName,
	p.ListPrice,
	s.Name AS ProductSubcategory,
	c.Name AS ProductCategory,
	ROW_NUMBER() OVER(ORDER BY p.ListPrice DESC) AS PriceRank,
	ROW_NUMBER() OVER(PARTITION BY c.Name ORDER BY p.ListPrice DESC) AS [Category Price Rank],
	[Category Price Rank with Dense Rank] = DENSE_RANK() OVER(PARTITION BY c.Name ORDER BY p.ListPrice DESC),
	[Top 5 Price In Category] = CASE
									WHEN DENSE_RANK() OVER(PARTITION BY c.Name ORDER BY p.ListPrice) <= 5 THEN 'Yes'
									ELSE 'No' END,
	[Category Price Rank With Rank] = RANK() OVER(PARTITION BY c.Name ORDER BY p.ListPrice DESC)
FROM
	Production.Product AS p
JOIN Production.ProductSubcategory AS s
ON p.ProductSubcategoryID = s.ProductSubcategoryID
JOIN Production.ProductCategory AS c
ON s.ProductCategoryID = c.ProductCategoryID

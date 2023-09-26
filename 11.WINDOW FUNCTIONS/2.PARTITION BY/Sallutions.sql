-- 1

SELECT p.ListPrice,
       s.Name AS ProductSubcategory,
       c.Name AS ProductCategory
  FROM Production.Product AS p
  JOIN Production.ProductSubcategory AS s
    ON p.ProductSubcategoryID = s.ProductSubcategoryID
  JOIN Production.ProductCategory AS c
    ON p.ProductSubcategoryID = c.ProductCategoryID

-- 2

SELECT p.ListPrice,
       s.Name AS ProductSubcategory,
       c.Name AS ProductCategory,
       AVG(p.ListPrice) OVER (PARTITION BY c.Name) AS AvgPriceByCategory
  FROM Production.Product AS p
  JOIN Production.ProductSubcategory AS s
    ON p.ProductSubcategoryID = s.ProductSubcategoryID
  JOIN Production.ProductCategory AS c
    ON p.ProductSubcategoryID = c.ProductCategoryID

-- 3

SELECT p.ListPrice,
       s.Name AS ProductSubcategory,
       c.Name AS ProductCategory,
       AVG(p.ListPrice) OVER (PARTITION BY c.Name) AS AvgPriceByCategory,
       AVG(p.ListPrice) OVER (PARTITION BY c.Name, s.Name) AS AvgPriceByCategoryAndSubcategory
  FROM Production.Product AS p
  JOIN Production.ProductSubcategory AS s
    ON p.ProductSubcategoryID = s.ProductSubcategoryID
  JOIN Production.ProductCategory AS c
    ON p.ProductSubcategoryID = c.ProductCategoryID

-- 4

SELECT p.ListPrice,
       s.Name AS ProductSubcategory,
       c.Name AS ProductCategory,
       AVG(p.ListPrice) OVER (PARTITION BY c.Name) AS AvgPriceByCategory,
       AVG(p.ListPrice) OVER (PARTITION BY c.Name, s.Name) AS AvgPriceByCategoryAndSubcategory,
       (p.ListPrice - AVG(p.ListPrice) OVER (PARTITION BY c.Name)) AS ProductVsCategoryDelta
  FROM Production.Product AS p
  JOIN Production.ProductSubcategory AS s
    ON p.ProductSubcategoryID = s.ProductSubcategoryID
  JOIN Production.ProductCategory AS c
    ON p.ProductSubcategoryID = c.ProductCategoryID

-- 1

SELECT p.FirstName,
       p.LastName,
       e.JobTitle,
       eh.Rate,
       AVG(eh.rate) OVER () AS AverageRate
  FROM Person.Person AS p
  JOIN HumanResources.Employee AS e
    ON e.BusinessEntityID  = p.BusinessEntityID
  JOIN HumanResources.EmployeePayHistory AS eh
    ON eh.BusinessEntityID = p.BusinessEntityID

-- 2

SELECT p.FirstName,
       p.LastName,
       e.JobTitle,
       eh.Rate,
       AVG(eh.Rate) OVER () AS AverageRate,
       MAX(eh.Rate) OVER () AS MaximumRate
  FROM Person.Person AS p
  JOIN HumanResources.Employee AS e
    ON e.BusinessEntityID  = p.BusinessEntityID
  JOIN HumanResources.EmployeePayHistory AS eh
    ON eh.BusinessEntityID = p.BusinessEntityID

-- 3

SELECT p.FirstName,
       p.LastName,
       e.JobTitle,
       eh.Rate,
       AVG(eh.Rate) OVER () AS AverageRate,
       MAX(eh.Rate) OVER () AS MaximumRate,
       eh.Rate - AVG(eh.Rate) OVER () AS DiffFromAvgRate
  FROM Person.Person AS p
  JOIN HumanResources.Employee AS e
    ON e.BusinessEntityID  = p.BusinessEntityID
  JOIN HumanResources.EmployeePayHistory AS eh
    ON eh.BusinessEntityID = p.BusinessEntityID

-- 4

SELECT p.FirstName,
       p.LastName,
       e.JobTitle,
       eh.Rate,
       AVG(eh.Rate) OVER () AS AverageRate,
       MAX(eh.Rate) OVER () AS MaximumRate,
       eh.Rate - AVG(eh.Rate) OVER () AS DiffFromAvgRate,
       (eh.Rate / MAX(eh.Rate) OVER ()) * 100 AS PercentOfMaxRate
  FROM Person.Person AS p
  JOIN HumanResources.Employee AS e
    ON e.BusinessEntityID  = p.BusinessEntityID
  JOIN HumanResources.EmployeePayHistory AS eh
    ON eh.BusinessEntityID = p.BusinessEntityID

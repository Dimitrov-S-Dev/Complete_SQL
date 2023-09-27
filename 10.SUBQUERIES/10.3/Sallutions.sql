-- 1

SELECT BusinessEntityID,
       JobTitle,
       VacationHours,
       MaxVacationHours = (SELECT MAX(VacationHours) FROM HumanResources.Employee)
  FROM HumanResources.Employee

-- 2

SELECT BusinessEntityID,
       JobTitle,
       VacationHours,
       MaxVacationHours = (SELECT MAX(VacationHours) FROM HumanResources.Employee),
       [Percent] = ((VacationHours * 1.0) / (SELECT MAX(VacationHours) FROM HumanResources.Employee) * 100)
  FROM HumanResources.Employee

-- 3

SELECT BusinessEntityID,
       JobTitle,
       VacationHours,
       MaxVacationHours = (SELECT MAX(VacationHours) FROM HumanResources.Employee),
       [Percent] = ((VacationHours * 1.0) / (SELECT MAX(VacationHours) FROM HumanResources.Employee) * 100)
  FROM HumanResources.Employee
 WHERE ((VacationHours * 1.0) / (SELECT MAX(VacationHours) FROM HumanResources.Employee) * 100) >= 80

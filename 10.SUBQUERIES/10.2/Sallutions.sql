-- 1

SELECT *
  FROM (   SELECT PurchaseOrderID,
                  VendorID,
                  OrderDate,
                  TaxAmt,
                  Freight,
                  TotalDue,
                  [Most Expensive] = ROW_NUMBER() OVER (PARTITION BY VendorID ORDER BY TotalDue DESC)
             FROM Purchasing.PurchaseOrderHeader) AS Sub
 WHERE Sub.[Most Expensive] <= 3


-- 2

SELECT *
  FROM (   SELECT PurchaseOrderID,
                  VendorID,
                  OrderDate,
                  TaxAmt,
                  Freight,
                  TotalDue,
                  [Most Expensive] = DENSE_RANK() OVER (PARTITION BY VendorID ORDER BY TotalDue DESC)
             FROM Purchasing.PurchaseOrderHeader) AS Sub
 WHERE Sub.[Most Expensive] <= 3

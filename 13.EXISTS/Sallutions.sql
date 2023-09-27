-- 1

SELECT A.PurchaseOrderID,
       A.OrderDate,
       A.SubTotal,
       A.TaxAmt
  FROM AdventureWorks2019.Purchasing.PurchaseOrderHeader A
 WHERE EXISTS (   SELECT 1
                    FROM AdventureWorks2019.Purchasing.PurchaseOrderDetail B
                   WHERE A.PurchaseOrderID = B.PurchaseOrderID
                     AND B.OrderQty        > 500)
 ORDER BY 1




--2

SELECT A.*
  FROM AdventureWorks2019.Purchasing.PurchaseOrderHeader A
 WHERE EXISTS (   SELECT 1
                    FROM AdventureWorks2019.Purchasing.PurchaseOrderDetail B
                   WHERE A.PurchaseOrderID = B.PurchaseOrderID
                     AND B.OrderQty        > 500
                     AND B.UnitPrice       > 50)
 ORDER BY 1





-- 3

SELECT A.*
  FROM AdventureWorks2019.Purchasing.PurchaseOrderHeader A
 WHERE NOT EXISTS (   SELECT 1
                        FROM AdventureWorks2019.Purchasing.PurchaseOrderDetail B
                       WHERE A.PurchaseOrderID = B.PurchaseOrderID
                         AND B.RejectedQty     > 0)
 ORDER BY 1

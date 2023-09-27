-- 1

SELECT PurchaseOrderID,
       VendorID,
       OrderDate,
       TotalDue,
       NonRejectedItems = (   SELECT COUNT(*)
                                FROM Purchasing.PurchaseOrderDetail AS b
                               WHERE a.PurchaseOrderID = b.PurchaseOrderID
                                 AND b.RejectedQty     = 0)
  FROM Purchasing.PurchaseOrderHeader AS a

-- 2

SELECT PurchaseOrderID,
       VendorID,
       OrderDate,
       TotalDue,
       NonRejectedItems = (   SELECT COUNT(*)
                                FROM Purchasing.PurchaseOrderDetail AS b
                               WHERE a.PurchaseOrderID = b.PurchaseOrderID
                                 AND b.RejectedQty     = 0),
       MostExpensiveItem = (   SELECT MAX(b.UnitPrice)
                                 FROM Purchasing.PurchaseOrderDetail AS b
                                WHERE a.PurchaseOrderID = b.PurchaseOrderID)
  FROM Purchasing.PurchaseOrderHeader AS a

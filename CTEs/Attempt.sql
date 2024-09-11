-- Challenge 1
WITH CTE AS(
  SELECT
    *,
    COUNT(p.ProductId) AS HighValueProductCount
  FROM Suppliers s
  INNER JOIN Products p
  ON s.SupplierId = p.SupplierId
  WHERE
    p.UnitPrice > (
      SELECT
        AVG(UnitPrice)
      FROM
        Products
      )
    GROUP BY
      s.SupplierId,
      s.SupplierName
  )
SELECT
  SupplierId,
  SupplierName,
  HighValueProductCount
FROM CTE
ORDER BY HighValueProductCount DESC;

-- Challenge 2
WITH CTE AS (
  SELECT
    *
  FROM Products
  WHERE StockQuantity < 50
  )
SELECT
  CTE.ProductId,
  CTE.ProductName,
  C.CategoryName,
  CTE.StockQuantity
FROM CTE
LEFT JOIN Categories C
ON CTE.CategoryId = C.CategoryId;
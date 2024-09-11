-- Challenge 1

SELECT
  CustomerId,
  SUM(Amount) TotalPurchases,
  DENSE_RANK() OVER (ORDER BY SUM(Amount) DESC) Rank
FROM Orders
GROUP BY CustomerId
ORDER BY TotalPurchases DESC
LIMIT 3;

-- Challenge 2
SELECT
  OrderID,
  Product,
  Quantity CurrentQuantity,
  LAG(Quantity,1,0) OVER (ORDER BY OrderID ASC) PreviousQuantity,
  Quantity-LAG(Quantity,1,0) OVER (ORDER BY OrderID ASC) QuantityDifference
FROM Orders
ORDER BY OrderID ASC;
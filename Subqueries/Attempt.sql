-- Challenge 1
SELECT
  e.EmployeeID,
  e.FirstName,
  e.LastName,
  d.DepartmentName,
  e.Salary
FROM Employees e
INNER JOIN Departments d
ON e.DepartmentID = d.DepartmentID
WHERE Salary > (
  SELECT
    AVG(Salary)
  FROM
    Employees
  WHERE
    e.DepartmentID = DepartmentID
  );

-- Challenge 2
SELECT
  e.EmployeeID,
  e.FirstName,
  e.LastName,
  e.Salary,
  d.DepartmentName
FROM Employees e
INNER JOIN Departments d
ON e.DepartmentID = d.DepartmentID
WHERE e.Salary = (
  SELECT
    MAX(Salary)
  FROM
    Employees
  WHERE DepartmentID = e.DepartmentID
  AND d.DepartmentName != 'IT');
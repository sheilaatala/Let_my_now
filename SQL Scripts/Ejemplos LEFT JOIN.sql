SELECT e.EmployeeName,dn.DepartamentoName FROM Employees AS e 
LEFT JOIN 
Departamentos AS dn ON e.DepartmentoID = dn.DepartamentoID;


SELECT dn.DepartamentoName, COUNT(e.EmployeeName) AS 'Personas por Departamento' FROM Departamentos AS dn 
LEFT JOIN 
Employees AS e ON dn.DepartamentoID = e.DepartmentoID
GROUP BY dn.DepartamentoName;


SELECT e.EmployeeName, dn.DepartamentoName 
FROM Employees AS e 
LEFT JOIN Departamentos AS dn ON e.DepartmentoID = dn.DepartamentoID 
WHERE e.DepartmentoID IS NULL OR 
      e.DepartmentoID IN (
          SELECT DepartmentoID FROM Employees 
          GROUP BY DepartmentoID 
          HAVING COUNT(*) > 1
      );


SELECT e.EmployeeName, dn.DepartamentoName 
FROM Employees AS e 
LEFT JOIN Departamentos AS dn ON e.DepartmentoID = dn.DepartamentoID 
WHERE e.DepartmentoID IS NULL OR 
      EXISTS (
          SELECT *
          FROM Employees AS e2 
          WHERE e.DepartmentoID = e2.DepartmentoID
          AND e.EmployeeName <> e2.EmployeeName
      );

SELECT e.EmployeeName,dn.DepartamentoName FROM Employees AS e 
RIGHT JOIN 
Departamentos AS dn ON e.DepartmentoID = dn.DepartamentoID;


SELECT e.EmployeeName, dn.DepartamentoName FROM Employees AS e 
RIGHT JOIN 
Departamentos AS dn ON e.DepartmentoID = dn.DepartamentoID 
WHERE dn.DepartamentoID IN (SELECT DepartmentoID FROM Employees WHERE EmployeeName = e.EmployeeName);

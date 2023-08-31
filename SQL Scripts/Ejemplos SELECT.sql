SELECT TOP 2 * 
FROM pacientes 
WHERE apellido = 'Perez'


SELECT DISTINCT idpaciente,apellido 
FROM pacientes 


SELECT apellido,MAX(idpaciente)
FROM pacientes
GROUP BY apellido 
  

 SELECT br.Name, COUNT(*) Total FROM Beer AS b
 INNER JOIN Brand AS br
 ON br.BrandID = b.BrandID
 GROUP BY br.Name
 HAVING COUNT(*) > 1
  

SELECT c.MonthID, SUM(c.PrintColor + c.CopyColor) AS Color, 
        SUM(c.PrintBlack + c.CopyBlack) AS 'B/N', 
        SUM(c.PrintColor + c.CopyColor + c.PrintBlack + c.CopyBlack) AS 'Total Consumo' 
FROM Consumo AS c
GROUP BY c.MonthID
ORDER BY c.MonthID




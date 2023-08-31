 SELECT br.BrandID, b.BeerID,
 (br.BrandID + B.BrandID) AS Suma,
 CONCAT(Br.Name, ' ',b.Name) AS Description
 FROM Beer AS b
 INNER JOIN Brand AS br 
 ON br.BrandID = B.BrandID


SELECT Name, Total FROM 
( SELECT Br.Name,COUNT(br.BrandID) AS Total FROM Beer AS b
  INNER JOIN Brand AS br ON br.BrandID = b.BrandID
  GROUP BY br.Name) AS MyTable


SELECT * FROM Brand AS br
JOIN 
	(SELECT b.BrandID,
	CONCAT('SOMOS CHEVES',  ' ' ,NEWID()) AS X
	FROM Beer AS b
	) AS S ON S.BrandID = br.BrandID

SELECT br.Name FROM Brand AS br
UNION
SELECT b.Name FROM Beer AS b


UPDATE V
SET V.PrecioUnitario = C.PrecioUnitario
FROM Ventas V
INNER JOIN Compras C ON V.ProductoID = C.ProductoID;


UPDATE V
SET V.PrecioUnitario = C.PrecioUnitarioPromedio
FROM Ventas V
INNER JOIN (
    SELECT 
        ProductoID,
        AVG(PrecioUnitario) AS PrecioUnitarioPromedio
    FROM Compras
    GROUP BY ProductoID
) C ON V.ProductoID = C.ProductoID;


CREATE VIEW VWImpresoras
AS
SELECT c.MonthID, i.AreaDesc AS Area, SUM(c.PrintColor + c.CopyColor) AS Color, SUM(c.PrintBlack + c.CopyBlack) AS 'B/N', 
SUM(c.PrintColor + c.CopyColor + c.PrintBlack + c.CopyBlack) AS 'Total Consumo' FROM Impresoras AS i
INNER JOIN Consumo AS c
ON i.MachineID = c.MachineID
WHERE AreaDesc = 'RH'
GROUP BY c.MonthID, i.AreaDesc
---ORDER BY c.MonthID


CREATE VIEW vista_ventas AS
SELECT
    v.id_ventas,
    v.fecha,
    bf.nombre AS nombre_bebida_fria,
    bc.nombre AS nombre_bebida_caliente,
    l.nombre AS nombre_lanzamiento,
    bf.tamaño AS tamaño_bebida_fria,
    bc.tamaño AS tamaño_bebida_caliente,
    l.tamaño AS tamaño_lanzamiento,
    bf.precio AS precio_bebida_fria,
    bc.precio AS precio_bebida_caliente,
    l.precio AS precio_lanzamiento
FROM ventas v
LEFT JOIN bebidasfrias bf ON v.id_bebida_fria = bf.id_bebida_fria
LEFT JOIN bebidascalientes bc ON v.id_bebida_caliente = bc.id_bebida_caliente
LEFT JOIN lanzamientos l ON v.id_lanzamiento = l.id_lanzamiento;


CREATE VIEW VistaEmpleadosDepartamentos AS
SELECT
    E.EmployeeID,
    E.EmployeeName,
    D.DepartamentoID,
    D.DepartamentoName
FROM Employees E
LEFT JOIN Departamentos D ON E.DepartmentoID = D.DepartamentoID;


CREATE VIEW VistaAnalisisVentas AS
SELECT
    V.Id_Venta,
    V.Fecha,
    A.Nombre AS NombreAuto,
    A.Color,
    A.Precio,
    V.Autos_Vendidos,
    V.Autos_Vendidos * A.Precio AS TotalVenta,
    (SELECT COUNT(*) FROM Ventas WHERE Id_Auto = A.Id_auto) AS TotalVentasAuto,
    (SELECT SUM(Autos_Vendidos) FROM Ventas WHERE Id_Auto = A.Id_auto) AS TotalAutosVendidosAuto
FROM Ventas V
INNER JOIN Autos A ON V.Id_Auto = A.Id_auto;


CREATE VIEW dbo.[VW_Inventory_BI]
AS
SELECT 
inv.*,
stgwh.Description as StorageWareHouseName,
stgwh.StorageLocation,
pdt.ProductName,
pdt.Weight,
pdt.Category,
pdt.SubCategory

FROM Inventory inv
LEFT JOIN
StorageWareHouse stgwh on inv.StorageWareHouseId = stgwh.Id
LEFT JOIN
Products pdt on inv.ProductId = pdt.Id

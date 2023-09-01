## DAX y  Power BI

Este dashboard contiene las principales funciones con fórmulas DAX (Data Analysis Expressions) con Power BI. El principal proposito de este dashboard es aprovechar las herramientas de visualizacion de datos que aprovecha sus capacidades de las funciones DAX.

## Contenido de Dashboard

Este Dashboard contiene las principales funciones DAX que contiene Power BI 

-**SUMX: Suma de los valores de una columna en la vista.**
Total Ventas = SUMX(VW_Inventory_BI, VW_Inventory_BI[TotalInventory])
Suponiendo que la columna que contiene las ventas se llama "TotalInventory" en la vista VW_Inventory_BI, esta medida calculará el total de ventas.

-** AVERAGE: Calcula el promedio de los valores de una columna.**
Promedio Peso = AVERAGE(VW_Inventory_BI[Weight])
Esta medida calculará el promedio del peso de los productos en la vista.

**- COUNTROWS: Cuenta el número de filas en la vista.**
Cantidad de Productos = COUNTROWS(VW_Inventory_BI)
Esta medida cuenta el número de productos en la vista.

**- FILTER: Filtra la vista en función de una condición.**
Ventas por ProductId = CALCULATE(SUM(VW_Inventory_BI[UnitaryCost]), FILTER(VW_Inventory_BI, VW_Inventory_BI[ProductId] = 123))
En este ejemplo, se filtran los costos unitarios para mostrarel total de ventas para el producto con ProductId igual a 123. 

**- CALCULATE: Modifica el contexto de filtrado en una medida.**
Ventas de marcas = CALCULATE(SUM(VW_Inventory_BI[UnitaryCost]), VW_Inventory_BI[ProductName] = "Apple")
Esta medida calcula la suma del coato unitario solo del producto mencionado.


**- RANKX: Utiliza  el rango de un valor en una columna en función de un criterio de ordenamiento específico.**
Rango de Ventas = RANKX(ALL(VW_Inventory_BI), VW_Inventory_BI[Total Ventas])

# Power BI con DAX

Este repositorio contiene un Dashboard implementado con fórmulas DAX (Data Analysis Expressions). El objetivo de este Dashboard es proporcionar una herramienta de visualización de datos que aprovecha las potentes capacidades de DAX para el análisis y cálculo de métricas.


## Sobre el Dashboard

* 





## En la página "Medidas" del Dashboard encontraremos las siguientes fórmulas:

 1. Ratio Devoluciones = DIVIDE([Cantidad Devoluciones] , [Cantidad Ventas] , 0)
 2. Cantidad Devoluciones = SUM(FactSales[ReturnQuantity])
 3. Cantidad Ventas = SUM(FactSales[SalesQuantity])
 4. PU Promedio = AVERAGE(DimProduct[UnitPrice])
 5. Cantidad Tiendas = COUNT(DimStores[StoreKey])
 6. Cantidad Tiendas con Ventas = DISTINCTCOUNT(FactSales[StoreKey])
 7. Cantidad Regiones = COUNTA(DimGeography[RegionCountryName])
 8. Cantidad Regiones 2 = COUNTROWS(DimGeography)
 9. Cantidad Regiones en Blanco = COUNTBLANK(DimGeography[RegionCountryName])
 10. Cantidad Regiones Unicas = DISTINCTCOUNT(DimGeography[RegionCountryName])



<p align="center">
  <img src="https://github.com/dlorenzanaa/bi-introduce-myself/blob/main/Imagenes/Dashboard%20DAX%20_Medidas.png" width="auto" alt="Logo">
</p>



## En la Página "CALCULATE" encontraremos las siguientes fórmulas:

1. Total Ordenes = COUNTROWS(FactSales)
2. ALL Total Ordenes = CALCULATE([Total Ordenes], ALL(FactSales))
3. % Ordenes Devueltas = DIVIDE([Total Ordenes Devueltas] , [ALL Total Ordenes])
4. ALL Total Ordenes = CALCULATE([Total Ordenes], ALL(FactSales))
5. PU Promedio = AVERAGE(DimProduct[UnitPrice])
6. PU Promedio General = CALCULATE([PU Promedio], ALL(DimProduct))
7. Total Ordenes = COUNTROWS(FactSales)
8. Total Ordenes Devueltas = CALCULATE([Total Ordenes] , FactSales[ReturnQuantity] > 0 )
9. Total Ordenes PU Alto = CALCULATE([Total Ordenes], FILTER( DimProduct, DimProduct[UnitPrice] > [PU Promedio General]))
10. Total Ordenes Devueltas Multiples = CALCULATE( [Total Ordenes], FactSales[Tipo Devolucion] = "Multiple")
11. Total Ordenes Devueltas Multiples FILTER = CALCULATE([Total Ordenes] , FILTER(FactSales,FactSales[Tipo Devolucion] =  "Multiple"))



<p align="center">
  <img src="https://github.com/dlorenzanaa/bi-introduce-myself/blob/main/Imagenes/Dashboard%20DAX%20_CALCULATE.png" width="auto" alt="Logo">
</p>



## En la página "SUMX" encontraremos la siguiente fórmula:

1. Total Ingresos = SUMX(FactSales, FactSales[Cantidad Total] * RELATED(DimProduct[UnitPrice]) * (1 - FactSales[Descuento]))



<p align="center">
  <img src="https://github.com/dlorenzanaa/bi-introduce-myself/blob/main/Imagenes/Dashboard%20DAX_SUMX.png" width="auto" alt="Logo">
</p>



## En la página "YTD" encontraremos las siguientes fórmulas:

1. YTD Ingresos = CALCULATE([Total Ingresos], DATESYTD(DimCalendar[DateKey]))
2. YTD Ingresos 2 = TOTALYTD([Total Ingresos], DimCalendar[DateKey])
3. MTD Ingresos = TOTALMTD([Total Ingresos], DimCalendar[DateKey])



<p align="center">
  <img src="https://github.com/dlorenzanaa/bi-introduce-myself/blob/main/Imagenes/Dashboard%20DAX_YTD.png" width="auto" alt="Logo">
</p>



## En la página "LY" encontraremos las siguientes fórmulas:

1. Total Ingresos LY = CALCULATE([Total Ingresos], SAMEPERIODLASTYEAR(DimCalendar[DateKey]))
2. Total Ingresos Variacion LY = [Total Ingresos] - [Total Ingresos LY]



<p align="center">
  <img src="https://github.com/dlorenzanaa/bi-introduce-myself/blob/main/Imagenes/Dashboard%20DAX%20_LY.png" width="auto" alt="Logo">
</p>




## En la página "LM" encontraremos las siguientes fórmulas:

1. Total Ingresos LM = CALCULATE([Total Ingresos], DATEADD(DimCalendar[DateKey], -1,MONTH))


<p align="center">
  <img src="https://github.com/dlorenzanaa/bi-introduce-myself/blob/main/Imagenes/Dashboard%20DAX_LM.png" width="auto" alt="Logo">
</p>


## En la página "Dcto" encontraremos las siguientes fórmulas:

1. Total Ingresos sin Dcto = SUMX(FactSales, FactSales[Cantidad Total] * RELATED(DimProduct[UnitPrice]))



<p align="center">
  <img src="https://github.com/dlorenzanaa/bi-introduce-myself/blob/main/Imagenes/Dashboard%20DAX%20_Dcto.png" width="auto" alt="Logo">
</p>



## En la página "RANKX" encontraremos las siguientes fórmulas:

1. Rank Ingresos Tiedas = IF(ISBLANK([Total Ingresos]) , BLANK(), RANKX(ALL(DimStores),[Total Ingresos]))
2. Rank Ingresos Tiendas Cat = IF(HASONEVALUE(DimStores[Tienda]), SWITCH( TRUE(), [Rank Ingresos Tiedas] <= 10 , "Top 10", [Rank Ingresos Tiedas] <= 25 , "Sobresaliente",[Rank Ingresos Tiedas] <= 50 , "Bueno", [Rank Ingresos Tiedas] <= 100, "Regular", "Incompetente"),BLANK())
3. Rank Ingresos Tiendas Cat Unichar =  VAR star = "⭐️" VAR star0 = UNICHAR(9734) RETURN IF(HASONEVALUE(DimStores[Tienda]), SWITCH( TRUE(), [Rank Ingresos Tiedas] <= 10 , REPT(star,5), [Rank Ingresos Tiedas] <= 25 , REPT(star,4) & REPT(star0,1), [Rank Ingresos Tiedas] <= 50 , REPT(star,3) & REPT(star0,2),[RanK Ingresos Tiedas] <= 100, REPT(star,2) & REPT(star0,3),REPT(star,1) & REPT(star0,4)),BLANK())
4. Rank Ingresos Tiendas Seleccionadas = IF(ISBLANK([Total Ingresos]) , BLANK(), RANKX(ALLSELECTED(DimStores),[Total Ingresos]))
5. Total Ingresos = SUMX(FactSales, FactSales[Cantidad Total] * RELATED(DimProduct[UnitPrice]) * (1 - FactSales[Descuento]))
 



<p align="center">
  <img src="https://github.com/dlorenzanaa/bi-introduce-myself/blob/main/Imagenes/Dashboard%20DAX%20_RANKX.png" width="auto" alt="Logo">
</p>



## En la página "SWITCH" encontraremos la siguiente fórmula:

1.Total Selección = IF(ISCROSSFILTERED(Selector[Selección]), SWITCH(TRUE(),VALUES(Selector[Selección]) = "Total Ingresos",[Total Ingresos],VALUES(Selector[Selección]) = "Total Ingresos", [Total Costos],VALUES(Selector[Selección]) = "Total Utilidad", [Total Utilidad][Total Ingresos]),[Total Ingresos])




<p align="center">
  <img src="https://github.com/dlorenzanaa/bi-introduce-myself/blob/main/Imagenes/Dashboard%20DAX%20_SWITCH.png" width="auto" alt="Logo">
</p>



## En la página "FORECAST" encontraremos la siguiente fórmula:

1. Total Utilidad = [Total Ingresos] - [Total Costos]




<p align="center">
  <img src="https://github.com/dlorenzanaa/bi-introduce-myself/blob/main/Imagenes/Dashboard%20DAX%20_FORECAST.png" width="auto" alt="Logo">
</p>



## En la página #SCENARIO" encontraremos las siguientes fórmulas:

1. PU Promedio = AVERAGE(DimProduct[UnitPrice])
2. PU Promedio Ajuste = [PU Promedio] *  (1 +  '% Ajuste PU'[Valor de % Ajuste PU])
3. Total Ingresos = SUMX(FactSales, FactSales[Cantidad Total] * RELATED(DimProduct[UnitPrice]) * (1 - FactSales[Descuento]))
4. Total Ingresos Ajuste = [Total Ingresos] * (1 + '% Ajuste PU'[Valor de % Ajuste PU])
5. Total Utilidad = [Total Ingresos] - [Total Costos]
6. Total Utilidad Ajuste = [Total Ingresos Ajuste] - [Total Costos]



<p align="center">
  <img src="https://github.com/dlorenzanaa/bi-introduce-myself/blob/main/Imagenes/Dashboard%20DAX%20_SCENARIO.png" width="auto" alt="Logo">
</p>



## En las páginas "Tooltip 1 e Ingresos Productos Tooltip" encontraremos la siguiente fórmula:

1. Total Ingresos = SUMX(FactSales, FactSales[Cantidad Total] * RELATED(DimProduct[UnitPrice]) * (1 - FactSales[Descuento]))




<p align="center">
  <img src="https://github.com/dlorenzanaa/bi-introduce-myself/blob/main/Imagenes/Dashboard%20DAX%20_Tooltip%201.png" width="auto" alt="Logo">
</p>



<p align="center">
  <img src="https://github.com/dlorenzanaa/bi-introduce-myself/blob/main/Imagenes/Dashboard%20DAX%20_Ingresos%20P%20Tooltip.png" width="auto" alt="Logo">
</p>



## En las páginas "Tooltip 2 y Deevoluciones Tooltip" encontraremos la siguiente fórmula:

1. % Ordenes Devueltas = DIVIDE([Total Ordenes Devueltas] , [ALL Total Ordenes])




<p align="center">
  <img src="https://github.com/dlorenzanaa/bi-introduce-myself/blob/main/Imagenes/Dashboard%20DAX%20_Tooltip%202.png" width="auto" alt="Logo">
</p>



<p align="center">
  <img src="https://github.com/dlorenzanaa/bi-introduce-myself/blob/main/Imagenes/Dashboard%20DAX%20_Devoluciones%20Tooltip.png" width="auto" alt="Logo">
</p>


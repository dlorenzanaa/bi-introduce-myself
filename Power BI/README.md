# Power BI con DAX

Este repositorio contiene un Dashboard implementado con fórmulas DAX (Data Analysis Expressions). El objetivo de este Dashboard es proporcionar una herramienta de visualización de datos que aprovecha las potentes capacidades de DAX para el análisis y cálculo de métricas.


## Sobre el Dashboard

Estas son solo algunas de las funciones DAX utilizadas en este Dashboard. Cada una de ellas tiene un propósito específico y se emplea para realizar diferentes tipos de cálculos y análisis de datos:

* MEDIDAS: Las medidad en DAX se crean usando funciones y operadores para realizar operaciones mátematicas, estadísticas y de resumen en los valores de una columna o conjunto de datos. Estas medidas permiten calcular métricas Totales, promedios, porcentajes y otros cálculos agrgados que proporcionan  información valiosa sobre los datos subyacentes.

* DIVIDE: La función DIVIDE se utiliza para realizar una división en DAX. Toma dos argumentos y devuelve el cociente de la división del primer argumento por el segundo argumento. También permite especificar un valor opcional para mostrar en caso de que el divisor sea cero, evitando errores.

* SUM: La función SUM se utiliza para sumar los valores numéricos de una columna o expresión en una tabla o contexto determinado. Suma los valores de todas las filas que satisfacen las condiciones especificadas.

* AVERAGE: La función AVERAGE se utiliza para calcular el promedio de los valores numéricos de una columna o expresión en una tabla o contexto específico. Suma todos los valores y los divide por el número total de filas que cumplen las condiciones dadas.

* COUNT: La función COUNT se utiliza para contar el número de filas en una tabla o expresión que cumplen ciertas condiciones. Cuenta el número de filas no nulas en la columna o expresión especificada.

* DISCOUNT: La función DISCOUNT se utiliza para aplicar un descuento a un valor. Toma un valor y un porcentaje de descuento como argumentos y devuelve el valor después de aplicar el descuento.

* COUNTA: La función COUNTA se utiliza para contar el número de valores no nulos en una columna o expresión. Cuenta tanto los valores numéricos como los valores de texto, excluyendo las filas vacías.

* COUNTROWS: La función COUNTROWS se utiliza para contar el número de filas en una tabla o expresión. Cuenta todas las filas, incluidas las filas vacías y las filas duplicadas.

* COUNTBLANK: La función COUNTBLANK se utiliza para contar el número de filas en una columna o expresión que están en blanco. Cuenta las filas que no tienen ningún valor o tienen un valor nulo.

* DISTINCTCOUNT: La función DISTINCTCOUNT se utiliza para contar el número de valores distintos en una columna o expresión. Cuenta solo los valores únicos y elimina los duplicados.

* SUMX: La función SUMX realiza una suma iterativa de una expresión evaluada para cada fila de una tabla o una expresión de tabla. Es útil para calcular la suma de valores en un conjunto de datos que puede variar según diferentes condiciones.

* CALCULATE: La función CALCULATE permite modificar el contexto de evalución de una expresión en DAX. Es útil para aplicar filtros y condiciones a las fórmulas y realizar cálculos condicionales.

* DATESYTD: La función DATESYTD devuelve un conjunto de fechas que representa el periodo desde el inicio del año hasta una fecha específica. Es útil para realizar cálculos acumulativos o comparativos en el año en curso.

* TOTALYTD: La función TOTALYTD calcula una medida acumulada a lo largo del tiempo, desde el inicio del año hasta una fecha específica. Es útil para calcular métricas acumulativas, como ventas acumuladas o ingresos acumulados.

* SAMEPERIODLASTYEAR: La función SAMEPERIODLASTYEAR devuelve un conjunto de fechas que representa el mismo periodo en el año anterior. Es útil para realizar comparaciones entre el mismo periodo en años diferentes.

* DATEADD: La función DATEADD permite agregar o restar una cantidad específica de tiempo a una fecha. Es útil para calcular fechas futuras o pasadas en función de una fecha base.

* RELATED: La función RELATED devuelve el valor relacionado de una columna en una tabla relacionada. Es útil para acceder a datos de otras tablas basados en una relación establecida entre ellas.

* IF: La función IF es una función condicional que permite realizar una evaluación lógica y ejecutar diferentes acciones dependiendo del resultado. Es útil para establecer condiciones y tomar decisiones basadas en ellas.

* RANKX: La función RANKX asigna un rango numérico a los elementos en una columna, según los valores de otra columna o medida. Es útil para realizar clasificaciones y rankings basados en criterios específicos.

* SWITCH: La función SWITCH evalúa una expresión y devuelve un resultado correspondiente a uno de los casos definidos. Es útil para realizar múltiples evaluaciones y seleccionar una opción específica según el resultado.

* TOOLTIP: TOOLTIP es una función que se utiliza para definir información adicional que se muestra al pasar el cursor sobre un elemento gráfico. Es útil para proporcionar detalles o contexto adicional sobre los datos mostrados en el Dashboard.

* FORECAST: La función FORECAST realiza un cálculo de pronóstico basado en un modelo predictivo y devuelve una estimación de un valor futuro. Es útil para realizar predicciones y proyecciones basadas en datos históricos.



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


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



## En la pagina de "Medidas" en esta pagina del Dashboard encontraremos las siguientes formulas DAX:

 1.Ratio Devoluciones = DIVIDE([Cantidad Devoluciones] , [Cantidad Ventas] , 0)
 
 1. Cantidad Devoluciones = SUM(FactSales[ReturnQuantity])
 
 1. Cantidad Devoluciones = SUM(FactSales[ReturnQuantity])


<p align="center">
  <img src="https://github.com/dlorenzanaa/bi-introduce-myself/blob/main/Imagenes/Dashboard%20DAX%20_Medidas.png" width="auto" alt="Logo">
</p>




<p align="center">
  <img src="https://github.com/dlorenzanaa/bi-introduce-myself/blob/main/Imagenes/Dashboard%20DAX%20_CALCULATE.png" width="auto" alt="Logo">
</p>







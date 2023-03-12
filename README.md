# sql-examples

## subtitulo

"Recursos de SQL para desarrolladores de todos los niveles. Explore consultas de ejemplo para dominar las consultas SELECT, INSERT, UPDATE y DELETE, como esta consulta que utiliza JOIN para combinar datos de dos tablas diferentes y mostrar el producto más popular".

SQL Queries
This readme file contains a list of SQL queries to be executed on the specified database tables.

## Query 1

Genere un SELECT a la tabla [Person]. [Person].

```sql
SELECT

*

FROM

[Person]. [Person]
```


Genere un SELECT a la tabla [Person]. [Person], únicamente de los campos BusinessEntityID, PersonType, FirstName y LastName.

```sql
SELECT

a.BusinessEntityID, a.PersonType, a.FirstName, a.LastName

FROM

[Person]. [Person] AS a
```

Genere un query con los mismos campos del punto número 2 donde PersonType sea igual a EM.

```sql
SELECT

a.BusinessEntityID, a.PersonType, a.FirstName, a.LastName

FROM

[Person]. [Person] AS a

WHERE

a.PersonType = 'EM'
```

Genere una consulta sobre la tabla [HumanResources]. [Employee] que muestre BusinessEntityID, NationalIDNumber y JobTitle, ordene los registros de mayor a menor por el campo BusinessEntityID.

```sql
SELECT

a.BusinessEntityID, a.NationalIDNumber, a.JobTitle

FROM

[HumanResources]. [Employee] AS a

ORDER BY

a.BusinessEntityID DESC
```

Genere una consulta sobre la tabla [HumanResources].[Employee] que muestre las JobTitle únicos, el campo JobTitle debe registrar en la consulta como Unicos.

SELECT  DISTINCT a.JobTitle

FROM

[HumanResources].[Employee] AS a

Genere una consulta para todos los campos de la tabla [HumanResources]. [Employee] donde el BusinessEntityID sea mayor a 10.

```sql
SELECT

*

FROM

[HumanResources]. [Employee] AS a

WHERE

a.BusinessEntityID > 10
```

Genere una consulta de todos los campos para la tabla [HumanResources]. [Employee] donde el JobTitle sea Sales Representative y el Gender F.

```sql
SELECT

*

FROM

[HumanResources]. [Employee] AS a

WHERE

a.JobTitle = 'Sales Representative' AND a.Gender = 'F'
```

Genere una consulta que permita obtener la cantidad por JobTitle. La consulta debe mostrar el campo JobTitle seguido de la cantidad que hay por dicho JobTitle, ordene de mayor a menor.

```sql
SELECT

a.JobTitle,

COUNT(a.JobTitle) AS Cantidad

FROM

[HumanResources]. [Employee] AS a

GROUP BY

a.JobTitle

ORDER BY

COUNT(a.JobTitle) DESC
```



Realice una consulta de la tabla [HumanResources]. [Employee] la cual indique el promedio del campo VacationHours donde el JobTitle sea Production Technician - WC50, el campo resultante del promedio debe llamarse Promedio.

```sql
SELECT AVG (a.VacationHours) AS Promedio

FROM

[HumanResources]. [Employee] AS a

WHERE

a.JobTitle = 'Production Technician - WC50'

```

Realice una consulta de la tabla [Sales]. [SalesPerson] la cual indique la suma total del campo SalesYTD, el nuevo campo resultante debe llamarse SumaTotal.

```sql
SELECT SUM(a.SalesYTD) AS SumaTotal

FROM

[Sales]. [SalesPerson] AS a
```

Realice una consulta de la tabla [Sales]. [SalesPerson] la cual indique la suma total del campo SalesYTD donde el campo TerritoryID no sea NULL, el nuevo campo resultante debe llamarse SumaTotal.

```sql
SELECT SUM(a.SalesYTD) AS SumaTotal

FROM

[Sales]. [SalesPerson] AS a

WHERE

aTerritoryID IS NOT NULL
```

Genere una consulta a la tabla [Sales]. [SalesPerson] que indique el valor máximo y el valor mínimo del campo Bonus, los nuevos campos deben llamarse maximo y minimo respectivamente.

```
SELECT

MAX(Bonus) AS Maximo,

MIN(Bonus) AS Minimo

FROM

[Sales]. [SalesPerson]
```

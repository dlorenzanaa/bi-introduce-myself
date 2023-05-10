# Ejemplos de SQL Server

En este repositorio encontrarás ejemplos de scripts de SQL Server utilizando diferentes instrucciones. A continuación, se presentan algunos ejemplos de scripts utilizando instrucciones DML, DDL, TCL y DCL.

## Instrucciones DML

DML se refiere a Data Manipulation Language y se utiliza para manipular los datos en las tablas de la base de datos. A continuación, se presentan algunos ejemplos de instrucciones DML:

INSERT: se utiliza para insertar nuevos datos en una tabla. Por ejemplo:
sql

```sql
INSERT INTO Ventas (Fecha, Producto, Cantidad, Precio) 
VALUES ('2023-05-09', 'Laptop', 10, 1500.00);
```

UPDATE: se utiliza para modificar datos existentes en una tabla. Por ejemplo:

```sql
UPDATE Ventas 
SET Precio = 1600.00 
WHERE Producto = 'Laptop';
```

## Instrucciones DDL

DDL se refiere a Data Definition Language y se utiliza para definir la estructura de la base de datos, incluyendo la creación, modificación y eliminación de objetos de base de datos como tablas, índices, restricciones y procedimientos almacenados. A continuación, se presentan algunos ejemplos de instrucciones DDL:

CREATE TABLE: se utiliza para crear una nueva tabla en la base de datos. Por ejemplo:
sql

```sql
CREATE TABLE Ventas (
  ID int NOT NULL PRIMARY KEY,
  Fecha date NOT NULL,
  Producto varchar(50) NOT NULL,
  Cantidad int NOT NULL,
  Precio money NOT NULL
);
```

ALTER TABLE: se utiliza para modificar la estructura de una tabla existente. Por ejemplo:

```sql
ALTER TABLE Ventas
ADD Descuento money NOT NULL DEFAULT 0;
```

## Instrucciones TCL

TCL se refiere a Transaction Control Language y se utiliza para controlar las transacciones en la base de datos. A continuación, se presentan algunos ejemplos de instrucciones TCL:

BEGIN TRANSACTION: se utiliza para iniciar una transacción en la base de datos. Por ejemplo:

```sql
BEGIN TRANSACTION;
INSERT INTO Ventas (Fecha, Producto, Cantidad, Precio) 
VALUES ('2023-05-09', 'Monitor', 5, 300.00);
UPDATE Ventas 
SET Precio = 250.00 
WHERE Producto = 'Monitor';
COMMIT;
```

ROLLBACK TRANSACTION: se utiliza para deshacer una transacción y revertir los cambios realizados en caso de errores o fallas. Por ejemplo:

```sql
BEGIN TRANSACTION;
INSERT INTO Ventas (Fecha, Producto, Cantidad, Precio) 
VALUES ('2023-05-09', 'Teclado', 10, 50.00);
UPDATE Ventas 
SET Precio = 40.00 
WHERE Producto = 'Teclado';
ROLLBACK;
```

## Instrucciones DCL

DCL se refiere a Data Control Language y se utiliza para definir los permisos y la seguridad en la base de datos. A continuación, se presentan algunos ejemplos de instrucciones DCL:

GRANT: se utiliza para otorgar permisos a usuarios y roles de usuario en la base de datos. Por ejemplo:

```sql
GRANT SELECT, INSERT, UPDATE ON Ventas TO Vendedor;
```
Con esta instrucción, se otorgan permisos SELECT, INSERT y UPDATE sobre la tabla "Ventas" al usuario "Vendedor". Esto permite al usuario realizar consultas, insertar nuevos registros y actualizar registros existentes en la tabla "Ventas".

DENY: se utiliza para denegar permisos a usuarios y roles de usuario en la base de datos. Por ejemplo:

```sql
DENY DELETE ON Ventas TO Vendedor;
```
Con esta instrucción, se deniega el permiso DELETE sobre la tabla "Ventas" al usuario "Vendedor". Esto impide que el usuario elimine registros existentes en la tabla "Ventas".

REVOKE: se utiliza para revocar permisos otorgados anteriormente a usuarios y roles de usuario en la base de datos. Por ejemplo:

```sql
REVOKE SELECT ON Ventas FROM Analista;
```

Con esta instrucción, se revoca el permiso SELECT sobre la tabla "Ventas" al usuario "Analista". Esto impide que el usuario realice consultas sobre la tabla "Ventas".

CREATE LOGIN: se utiliza para crear un nuevo inicio de sesión de usuario en la instancia de SQL Server. Por ejemplo:

```sql
CREATE LOGIN Vendedor WITH PASSWORD = 'P@ssw0rd';
```

Con esta instrucción, se crea un nuevo inicio de sesión de usuario llamado "Vendedor" con la contraseña "P@ssw0rd".

DROP LOGIN: se utiliza para eliminar un inicio de sesión de usuario existente en la instancia de SQL Server. Por ejemplo:

```sql
DROP LOGIN Vendedor;
```

Con esta instrucción, se elimina el inicio de sesión de usuario llamado "Vendedor".

Estos son solo algunos ejemplos de instrucciones DCL en SQL Server. La gestión de permisos y la seguridad son fundamentales en cualquier proyecto de bases de datos, por lo que es importante conocer bien estas instrucciones y cómo aplicarlas correctamente.

## JOINs

Los JOINs se utilizan para combinar datos de dos o más tablas en una consulta. SQL Server admite varios tipos de JOINs, incluidos los siguientes:

INNER JOIN: devuelve solo los registros que tienen coincidencias en ambas tablas. Por ejemplo:

```sql
SELECT Orders.OrderID, Customers.CustomerName
FROM Orders
INNER JOIN Customers ON Orders.CustomerID = Customers.CustomerID;
```

Esta consulta devuelve los ID de pedido y los nombres de los clientes que han realizado pedidos, es decir, solo los registros que tienen coincidencias tanto en la tabla "Orders" como en la tabla "Customers".

LEFT JOIN: devuelve todos los registros de la tabla izquierda (primera tabla mencionada en la consulta) y los registros coincidentes de la tabla derecha (segunda tabla mencionada en la consulta). Si no hay coincidencias en la tabla derecha, se devolverá NULL. Por ejemplo:

```sql
SELECT Customers.CustomerName, Orders.OrderID
FROM Customers
LEFT JOIN Orders ON Customers.CustomerID = Orders.CustomerID;
```

Esta consulta devuelve los nombres de todos los clientes y sus ID de pedido correspondientes (si han realizado algún pedido), incluidos los clientes que no han realizado ningún pedido.

RIGHT JOIN: es similar al LEFT JOIN, pero devuelve todos los registros de la tabla derecha y los registros coincidentes de la tabla izquierda. Si no hay coincidencias en la tabla izquierda, se devolverá NULL. Por ejemplo:

```sql
SELECT Customers.CustomerName, Orders.OrderID
FROM Customers
RIGHT JOIN Orders ON Customers.CustomerID = Orders.CustomerID;
```

Esta consulta devuelve los ID de pedido y los nombres de los clientes correspondientes (si existen) de todos los pedidos realizados, incluidos los pedidos que no tienen clientes asociados.

## UNIONs

Los UNIONs se utilizan para combinar el resultado de dos o más consultas SELECT en una sola tabla. SQL Server admite dos tipos de UNIONs, incluidos los siguientes:

UNION: combina el resultado de dos o más consultas SELECT en una sola tabla, eliminando duplicados. Por ejemplo:

```sql
SELECT City, Country FROM Customers
UNION
SELECT City, Country FROM Suppliers;
```

Esta consulta devuelve una lista de ciudades y países de los clientes y proveedores, sin incluir duplicados.

UNION ALL: es similar a UNION, pero no elimina duplicados. Por ejemplo:

```sql
SELECT City, Country FROM Customers
UNION ALL
SELECT City, Country FROM Suppliers;
```

Esta consulta devuelve una lista de ciudades y países de los clientes y proveedores, incluyendo duplicados.

Estos son solo algunos ejemplos de JOINs y UNIONs en SQL Server. Los JOINs y UNIONs son herramientas importantes para la combinación de datos en una consulta y es importante conocer bien sus diferencias y cómo aplicarlos correctamente.

## Conclusion

Esperamos que estos ejemplos de scripts de SQL Server utilizando instrucciones DML, DDL, TCL y DCL sean útiles para tus proyectos de bases de datos. Para obtener más información y ejemplos, consulta la documentación oficial de SQL Server de Microsoft.

-- Cambiar el contexto a la base de datos BDEJEMPLO2
USE BDEJEMPLO2;

-- Listar los diferentes puestos de los representantes sin repetir
SELECT DISTINCT Puesto
FROM Representantes;

-- Seleccionar los países en donde tenemos clientes sin repetir
SELECT DISTINCT Country
FROM Customers;

-- Mostrar país y ciudad de los clientes ordenados por país
SELECT Country, City
FROM Customers
ORDER BY Country;

-- Listar los 5 pedidos con el importe más alto
SELECT TOP 5 Num_Pedido, Fecha_Pedido, Fab, Producto, Cantidad, Importe
FROM Pedidos
ORDER BY Importe DESC;

-- Mostrar todos los clientes cuya empresa termina en 'l'
SELECT * 
FROM Clientes
WHERE Empresa LIKE '%l';

-- Mostrar todos los clientes cuya empresa termina en 'er'
SELECT * 
FROM Clientes
WHERE Empresa LIKE '%er';

-- Empresas que contienen la palabra 'auto'
SELECT * FROM Clientes
WHERE Empresa LIKE '%auto%';

-- Empresas que empiezan con 'La'
SELECT * FROM Clientes
WHERE Empresa LIKE 'La%';

-- Empresas que terminan con 'SA'
SELECT * FROM Clientes
WHERE Empresa LIKE '%SA';

-- Empresas que tienen exactamente 5 letras
SELECT * FROM Clientes
WHERE Empresa LIKE '_____';  -- 5 guiones bajos = 5 letras exactas

-- Empresas que empiezan con 'Com' y terminan con 'x'
SELECT * FROM Clientes
WHERE Empresa LIKE 'Com%x';

-- Empresas que NO contienen la palabra 'tech'
SELECT * FROM Clientes
WHERE Empresa NOT LIKE '%tech%';

-- Empresas que contienen un guion (-)
SELECT * FROM Clientes
WHERE Empresa LIKE '%-%';

-- Empresas que tienen un espacio en el nombre
SELECT * FROM Clientes
WHERE Empresa LIKE '% %';

-- Empresas que tienen números en el nombre
SELECT * FROM Clientes
WHERE Empresa LIKE '%0%' OR Empresa LIKE '%1%' OR Empresa LIKE '%2%'
   OR Empresa LIKE '%3%' OR Empresa LIKE '%4%' OR Empresa LIKE '%5%'
   OR Empresa LIKE '%6%' OR Empresa LIKE '%7%' OR Empresa LIKE '%8%'
   OR Empresa LIKE '%9%';

-- Empresas cuyo nombre empieza por cualquier letra entre A y F
SELECT * FROM Clientes
WHERE Empresa LIKE '[A-F]%';  -- Solo funciona en SQL Server

/*
ayer todos los representantyes que o bien 
a) trabajan en damiel , navarra o castellon, o bien no tienen jefe 
b) y estan contratados desde junio de mil novecientos 88 
c)o superan su cuota pero tienen ventas de 6000 mil o menos 
/***/**/


SELECT Nombre, Jefe, Cuota, Ventas, Fecha_Contrato
FROM Representantes
WHERE 
    (
        -- a) No tienen jefe
        Jefe IS NULL
    )
    AND Fecha_Contrato >= '1988-06-01'  -- b) Contratados desde junio de 1988

    OR 
    (
        -- c) Superan su cuota pero tienen ventas de 6000 o menos
        Ventas > Cuota
        AND Ventas <= 6000
    );


	/*
	listar todos los pedidos ,mostrando el numero de pedido 
	importe y nombre y limite de credito del cliente 
	*/

-- Ver columnas de la tabla Pedidos
SELECT TOP 1 * FROM Pedidos;

-- Ver columnas de la tabla Clientes
SELECT TOP 1 * FROM Clientes;

SELECT 
    P.Num_Pedido, 
    P.Importe, 
    C.Empresa AS Nombre_Cliente, 
    C.Limite_Credito
FROM Pedidos P
JOIN Clientes C ON P.Cliente = C.Num_Cli
ORDER BY P.Num_Pedido;


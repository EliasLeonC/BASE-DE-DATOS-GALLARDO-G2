-- SOLO USAR LA BASE DE DATOS SI YA EXISTE
USE bdg2;
GO

-- BORRAR TABLAS SI YA EXISTEN
IF OBJECT_ID('producto', 'U') IS NOT NULL DROP TABLE producto;
IF OBJECT_ID('categoria', 'U') IS NOT NULL DROP TABLE categoria;
GO

-- CREAR TABLA CATEGORIA
CREATE TABLE categoria (
    idcategoria INT NOT NULL IDENTITY(1,1),
    categorianombre NVARCHAR(20) NOT NULL,
    CONSTRAINT pk_categoria PRIMARY KEY (idcategoria)
);
GO

-- CREAR TABLA PRODUCTO
CREATE TABLE producto (
    idproducto INT NOT NULL,
    productonombre NVARCHAR(20) NOT NULL,
    existencia INT NOT NULL,
    categoriaid INT,
    precio MONEY NOT NULL,
    CONSTRAINT pk_producto PRIMARY KEY (idproducto),
    CONSTRAINT fk_producto_categoria FOREIGN KEY (categoriaid)
        REFERENCES categoria(idcategoria)
);
GO

-- INSERTAR CATEGORÍAS
INSERT INTO categoria (categorianombre)
VALUES 
    ('Lacteos'),
    ('Carnes Frias'),
    ('Vinos y Licores');
GO

-- VERIFICAR CATEGORÍAS
SELECT * FROM categoria;
GO

-- MODIFICAR REGISTRO
UPDATE categoria
SET categorianombre = 'Carnes Rojas'
WHERE idcategoria = 2;
GO

-- ELIMINAR CATEGORÍA CON ID 2 (SI QUIERES)
-- DELETE FROM categoria WHERE idcategoria = 2;

-- INSERTAR PRODUCTOS (EVITANDO CLAVES REPETIDAS)
INSERT INTO producto (categoriaid, productonombre, precio, existencia, idproducto)
VALUES 
    (1, 'Rancho viejo', 3450.5, 50, 1),
    (3, 'Don julio', 43.2, 456, 2),
    (1, 'Leche Nido', 567.4, 557, 3);
GO

-- CONSULTAR PRODUCTOS
SELECT * FROM producto;
GO


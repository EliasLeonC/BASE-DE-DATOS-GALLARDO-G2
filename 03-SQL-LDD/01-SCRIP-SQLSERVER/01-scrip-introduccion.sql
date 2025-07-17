--LEGUAJE SQL-LDD(CREATE,ALTER,DROP)

--CREAR LA BASE DE DATOS EMPRESAG2
CREATE DATABASE empresag2;
GO

-- UTILIZAR LA BASE DE DATOS
USE empresag2;

--CREAR LA TABLA CATEGORIAS
CREATE TABLE Categorias(
categoriaId int primary key,
nombrecsategorisa nvarchar (30) not null unique 
);
GO
-- Crear la tabla Empleado con clave primaria
CREATE TABLE Empleado (
    EmpleadoId   INT         IDENTITY(1,1) NOT NULL,
    Nombre       NVARCHAR(20) NOT NULL,
    ApellidoPaterno NVARCHAR(15) NOT NULL,
    CURP         CHAR(18)    NOT NULL,
    Telefono     CHAR(15)    NULL,
    Sexo         CHAR(1)     NOT NULL,
    Activo       BIT         NOT NULL,
    CONSTRAINT PK_Empleado PRIMARY KEY CLUSTERED (EmpleadoId),
	CONSTRAINT unique_curp
	UNIQUE(curp),
	CONSTRAINT chk_sexo
	CHECK (sexo in('M''F'))
);
GO

-- 1) Insertar en Categorias (dejando que el IDENTITY asigne el ID autom�ticamente)
INSERT INTO Categorias (Nombre)
VALUES ('VINOS Y LICORES');
GO

SELECT * FROM Categorias;
GO

-- Si realmente necesitas controlar el ID manualmente, usa IDENTITY_INSERT:
SET IDENTITY_INSERT Categorias ON;
INSERT INTO Categorias (CategoriaId, Nombre)
VALUES (2, 'VINOS Y LICORES');
SET IDENTITY_INSERT Categorias OFF;
GO

SELECT * FROM Categorias;
GO


-- 2) Insertar en Empleado
--  � EmpleadoId es IDENTITY, as� que NO lo incluimos aqu�
--  � CURP debe tener 18 caracteres, sexo 'M' o 'F', activo 1(true)/0(false)

INSERT INTO Empleado (
    Nombre,
    ApellidoPaterno,
    CURP,
    Telefono,
    Sexo,
    Activo
) VALUES (
    'Luis',
    'G�mez',
    'GOMG850203HDFLRR05',
    '3312345678',
    'M',
    1
);
GO

SELECT * FROM Empleado;
GO

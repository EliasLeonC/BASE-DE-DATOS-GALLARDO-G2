-- 0) (Opcional) Eliminar tablas si existen para evitar conflictos
IF OBJECT_ID('dbo.Works_On',    'U') IS NOT NULL DROP TABLE dbo.Works_On;
IF OBJECT_ID('dbo.Proyect',     'U') IS NOT NULL DROP TABLE dbo.Proyect;
IF OBJECT_ID('dbo.Departament', 'U') IS NOT NULL DROP TABLE dbo.Departament;
IF OBJECT_ID('dbo.Employe',     'U') IS NOT NULL DROP TABLE dbo.Employe;
IF OBJECT_ID('dbo.Tabla2',      'U') IS NOT NULL DROP TABLE dbo.Tabla2;
IF OBJECT_ID('dbo.Tabla1',      'U') IS NOT NULL DROP TABLE dbo.Tabla1;
GO

-- 1) Crear la base de datos sólo si NO existe
IF DB_ID('EmpresaG2') IS NULL
    CREATE DATABASE EmpresaG2;
GO

-- 2) Seleccionar la base
USE EmpresaG2;
GO

-- 3) Tabla padre con PK compuesta
CREATE TABLE dbo.Tabla1 (
    Tabla1Id1 INT       NOT NULL,
    Tabla1Id2 INT       NOT NULL,
    Nombre    VARCHAR(20) NOT NULL,
    CONSTRAINT PK_Tabla1 PRIMARY KEY (Tabla1Id1, Tabla1Id2)
);
GO

-- 4) Tabla hija 1–N apuntando a Tabla1
CREATE TABLE dbo.Tabla2 (
    Tabla2Id  INT IDENTITY(1,1) NOT NULL,
    Nombre    VARCHAR(20)       NOT NULL,
    Tabla1Id1 INT               NOT NULL,
    Tabla1Id2 INT               NOT NULL,
    CONSTRAINT PK_Tabla2 PRIMARY KEY (Tabla2Id),
    CONSTRAINT FK_Tabla2_Tabla1
      FOREIGN KEY (Tabla1Id1, Tabla1Id2)
      REFERENCES dbo.Tabla1 (Tabla1Id1, Tabla1Id2)
);
GO

-- 5) Tabla Employe (1–1 con Departament)
CREATE TABLE dbo.Employe (
    Id       INT IDENTITY(1,1) NOT NULL,
    Nombre   VARCHAR(20)      NOT NULL,
    Ap1      VARCHAR(15)      NOT NULL,
    Ap2      VARCHAR(15)      NULL,
    Sexo     CHAR(1)          NOT NULL,
    Salario  MONEY            NOT NULL,
    CONSTRAINT PK_Employe          PRIMARY KEY (Id),
    CONSTRAINT CHK_Employe_Sexo    CHECK (Sexo IN ('M','F')),
    CONSTRAINT CHK_Employe_Salario CHECK (Salario > 0)
);
GO

-- 6) Tabla Departament con FK 1–1 a Employe
CREATE TABLE dbo.Departament (
    Id               INT IDENTITY(1,1) NOT NULL,
    NombreProyecto   VARCHAR(20)       NOT NULL,
    Ubicacion        VARCHAR(15)       NOT NULL,
    FechaInicio      DATE              NOT NULL,
    IsEmployee       INT               NOT NULL,
    CONSTRAINT PK_Departament               PRIMARY KEY (Id),
    CONSTRAINT UQ_Departament_NombreProyecto UNIQUE (NombreProyecto),
    CONSTRAINT UQ_Departament_IsEmployee     UNIQUE (IsEmployee),
    CONSTRAINT FK_Departament_Employe       FOREIGN KEY (IsEmployee)
                                             REFERENCES dbo.Employe (Id)
);
GO

-- 7) Tabla Proyect (lado “N” de M:N)
CREATE TABLE dbo.Proyect (
    ProyectId     INT IDENTITY(1,1) NOT NULL,
    NameProyect   VARCHAR(20)       NOT NULL,
    CONSTRAINT PK_Proyect                   PRIMARY KEY (ProyectId),
    CONSTRAINT UQ_Proyect_NameProyect       UNIQUE (NameProyect)
);
GO

-- 8) Tabla intermedia Works_On para relación M:N
CREATE TABLE dbo.Works_On (
    EmployeeId  INT    NOT NULL,
    ProyectId   INT    NOT NULL,
    Horas       INT    NOT NULL,
    CONSTRAINT PK_Works_On                PRIMARY KEY (EmployeeId, ProyectId),
    CONSTRAINT FK_Works_On_Employee       FOREIGN KEY (EmployeeId)
                                           REFERENCES dbo.Employe (Id),
    CONSTRAINT FK_Works_On_Proyect        FOREIGN KEY (ProyectId)
                                           REFERENCES dbo.Proyect (ProyectId)
);
GO

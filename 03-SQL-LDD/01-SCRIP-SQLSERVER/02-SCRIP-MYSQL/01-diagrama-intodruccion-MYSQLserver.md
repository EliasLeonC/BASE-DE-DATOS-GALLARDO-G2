```sql
-- ----------------------------------------
-- 0) Eliminar tablas si existen (orden inverso de dependencias)
-- ----------------------------------------
DROP TABLE IF EXISTS `Works_On`;
DROP TABLE IF EXISTS `Proyect`;
DROP TABLE IF EXISTS `Departament`;
DROP TABLE IF EXISTS `Employe`;
DROP TABLE IF EXISTS `Tabla2`;
DROP TABLE IF EXISTS `Tabla1`;

-- ----------------------------------------
-- 1) Crear la base de datos y usarla
-- ----------------------------------------
CREATE DATABASE IF NOT EXISTS `EmpresaG2`
  CHARACTER SET utf8mb4
  COLLATE utf8mb4_unicode_ci;
USE `EmpresaG2`;

-- ----------------------------------------
-- 2) Tabla padre con PK compuesta
-- ----------------------------------------
CREATE TABLE `Tabla1` (
  `Tabla1Id1` INT       NOT NULL,
  `Tabla1Id2` INT       NOT NULL,
  `Nombre`    VARCHAR(20) NOT NULL,
  PRIMARY KEY (`Tabla1Id1`,`Tabla1Id2`)
) ENGINE=InnoDB
  DEFAULT CHARSET=utf8mb4
  COLLATE=utf8mb4_unicode_ci;

-- ----------------------------------------
-- 3) Tabla hija 1–N apuntando a Tabla1
-- ----------------------------------------
CREATE TABLE `Tabla2` (
  `Tabla2Id`  INT          NOT NULL AUTO_INCREMENT,
  `Nombre`    VARCHAR(20)  NOT NULL,
  `Tabla1Id1` INT          NOT NULL,
  `Tabla1Id2` INT          NOT NULL,
  PRIMARY KEY (`Tabla2Id`),
  INDEX `idx_Tabla2_Tabla1` (`Tabla1Id1`,`Tabla1Id2`),
  FOREIGN KEY (`Tabla1Id1`,`Tabla1Id2`)
    REFERENCES `Tabla1` (`Tabla1Id1`,`Tabla1Id2`)
    ON UPDATE CASCADE
    ON DELETE RESTRICT
) ENGINE=InnoDB
  DEFAULT CHARSET=utf8mb4
  COLLATE=utf8mb4_unicode_ci;

-- ----------------------------------------
-- 4) Tabla Employe (1–1 con Departament)
-- ----------------------------------------
CREATE TABLE `Employe` (
  `Id`       INT            NOT NULL AUTO_INCREMENT,
  `Nombre`   VARCHAR(20)    NOT NULL,
  `Ap1`      VARCHAR(15)    NOT NULL,
  `Ap2`      VARCHAR(15)    DEFAULT NULL,
  `Sexo`     ENUM('M','F')  NOT NULL,
  `Salario`  DECIMAL(19,4)  NOT NULL CHECK (`Salario` > 0),
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB
  DEFAULT CHARSET=utf8mb4
  COLLATE=utf8mb4_unicode_ci;

-- ----------------------------------------
-- 5) Tabla Departament con FK 1–1 a Employe
-- ----------------------------------------
CREATE TABLE `Departament` (
  `Id`               INT            NOT NULL AUTO_INCREMENT,
  `NombreProyecto`   VARCHAR(20)    NOT NULL,
  `Ubicacion`        VARCHAR(15)    NOT NULL,
  `FechaInicio`      DATE           NOT NULL,
  `IsEmployee`       INT            NOT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `UQ_Departament_Proyecto` (`NombreProyecto`),
  UNIQUE KEY `UQ_Departament_Empleado` (`IsEmployee`),
  INDEX     `idx_Departament_Empleado` (`IsEmployee`),
  FOREIGN KEY (`IsEmployee`)
    REFERENCES `Employe` (`Id`)
    ON UPDATE CASCADE
    ON DELETE RESTRICT
) ENGINE=InnoDB
  DEFAULT CHARSET=utf8mb4
  COLLATE=utf8mb4_unicode_ci;

-- ----------------------------------------
-- 6) Tabla Proyect (lado “N” de M:N)
-- ----------------------------------------
CREATE TABLE `Proyect` (
  `ProyectId`    INT          NOT NULL AUTO_INCREMENT,
  `NameProyect`  VARCHAR(20)  NOT NULL,
  PRIMARY KEY (`ProyectId`),
  UNIQUE KEY `UQ_Proyect_Nombre` (`NameProyect`)
) ENGINE=InnoDB
  DEFAULT CHARSET=utf8mb4
  COLLATE=utf8mb4_unicode_ci;

-- ----------------------------------------
-- 7) Tabla intermedia Works_On para relación M:N
-- ----------------------------------------
CREATE TABLE `Works_On` (
  `EmployeeId` INT NOT NULL,
  `ProyectId`  INT NOT NULL,
  `Horas`      INT NOT NULL,
  PRIMARY KEY (`EmployeeId`,`ProyectId`),
  INDEX `idx_WorksOn_Employee` (`EmployeeId`),
  INDEX `idx_WorksOn_Proyect`  (`ProyectId`),
  FOREIGN KEY (`EmployeeId`)
    REFERENCES `Employe` (`Id`)
    ON UPDATE CASCADE
    ON DELETE RESTRICT,
  FOREIGN KEY (`ProyectId`)
    REFERENCES `Proyect` (`ProyectId`)
    ON UPDATE CASCADE
    ON DELETE RESTRICT
) ENGINE=InnoDB
  DEFAULT CHARSET=utf8mb4
  COLLATE=utf8mb4_unicode_ci;
```
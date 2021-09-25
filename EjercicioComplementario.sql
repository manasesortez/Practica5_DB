CREATE DATABASE ejercicioComplementario_Guia_5;

USE ejercicioComplementario_Guia_5;

CREATE TABLE alumno(
    alumno_carnet CHAR(8) NOT NULL,
    alumno_nombreCompleto VARCHAR(50),
    PRIMARY KEY (alumno_carnet)
);

SELECT * FROM alumno;

INSERT INTO alumno(alumno_carnet, alumno_nombreCompleto)
VALUES
('GH121214', 'Gerrardo Hierro'),
('VN121415', 'Veronica Nuñez'),
('CD121515', 'Ceras Deras'),
('HL130334', 'Helen Lara'),
/**Parte A**/
('GM119056', 'Gricelda Martinez'),
('MC129854', 'Mauricio Campos'),
('IP110943', 'IP110943'),
('MU127895', 'Mikel Urrutia'),
('OH132390', 'Oscar Hernández'),
('ML139032', 'Mayra López');


CREATE TABLE materia(
  materia_codigo CHAR(5) NOT NULL,
  materia_nombre VARCHAR(30) UNIQUE,
  materia_uv INT CHECK(materia_uv>=2 AND materia_uv <=5),
  PRIMARY KEY (materia_codigo)
);

SELECT * FROM dbo.materia;

INSERT INTO dbo.materia(materia_codigo, materia_nombre, materia_uv)
VALUES
('BD01', 'Bases de Datos', 4),
('IP01', 'Introduccion a la Programacion', 4),
('AL01', 'Algrebra Lineal', 3),
('RD02', 'Redes de area amplia', 5),
('GE01', 'Gestion Empresarial', 2),
('HM02', 'Humanistica II', 3);


CREATE TABLE inscripcion(
    alumno_carnet CHAR(8) NOT NULL,
    materia_codigo CHAR(5) NOT NULL,
    inscripcion_ciclo CHAR(5) NOT NULL,
    PRIMARY KEY (alumno_carnet, materia_codigo, inscripcion_ciclo),
    CONSTRAINT FK_AL_CAR FOREIGN KEY (alumno_carnet) REFERENCES alumno(alumno_carnet)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    CONSTRAINT FK_MAT_CO FOREIGN KEY (materia_codigo) REFERENCES materia(materia_codigo)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);

SELECT * FROM inscripcion;

INSERT INTO inscripcion(alumno_carnet, materia_codigo, inscripcion_ciclo)
VALUES
('GH121214', 'BD01', 'C1-15'),
('GH121214', 'GE01', 'C1-15'),
('GH121214', 'HM02', 'C1-15'),
/**Parte B**/
('CD121515', 'AL01', 'C1-14'),
('CD121515', 'GE01', 'C1-14'),
('CD121515', 'HM02', 'C1-15'),
('GM119056', 'IP01', 'C2-14'),
('GM119056', 'RD02', 'C2-14'),
('HL130334', 'BD01', 'C1-15'),
('VN121415', 'BD01', 'C1-15'),
('VN121415', 'RD02', 'C1-15'),
('MC129854', 'AL01', 'C1-14'),
('MC129854', 'GE01', 'C1-14'),
('IP110943', 'GE01', 'C1-15'),
('IP110943', 'HM02', 'C1-15');


SELECT * FROM inscripcion;
/**Ejercicio 5 Uso de Update**/

UPDATE alumno SET alumno_nombreCompleto = 'Gerardo Hernandez'
WHERE alumno_carnet = 'GH121214';

UPDATE alumno SET alumno_carnet = 'GH111214'
WHERE alumno_nombreCompleto = 'Gerardo Hernandez';

SELECT * FROM alumno;
SELECT * FROM inscripcion;

DELETE FROM alumno WHERE alumno_carnet = 'GH111214';

SELECT * FROM alumno;
SELECT * FROM inscripcion;

/**c. Con la instrucción SELECT INTO, crear una tabla con el nombre MateriaUV que
tenga los datos de la materia donde las unidades valorativas sean mayores o
iguales a 4**/

SELECT materia_codigo AS MateriaUV_codigo, materia_nombre AS MateriaUV_nombre, materia_uv AS MateriaUV
INTO MateriaUV
FROM materia
WHERE materia.materia_uv >= 4;

SELECT * FROM MateriaUV;

/**d. Con la instrucción INSERT INTO – SELECT, crear una tabla con el nombre
Alumno2012 en donde se almacenen aquellos alumnos que tengan el carnet del
año 2012**/

SELECT alumno_carnet AS Alumnos2012_Carnet, alumno_nombreCompleto AS Alumnos2012_Nombre
INTO Alumnos2012
FROM alumno
WHERE alumno.alumno_carnet LIKE '__12%';

SELECT * FROM Alumnos2012;

/**
    e. Crear las siguientes consultas de actualización de datos
        i. Modificar el apellido del alumno con carnet GM119056 a Márquez
        ii. Cambiar el carnet del alumno Gricelda Márquez a GM119156
        iii. Modificar el ciclo de la inscripción de C1-14 a C2-15
        iv. Modificar el código de la materia HM02 a HM01 y el nombre de la materia a Humanística I
        v. Modificar el apellido del alumno con carnet IP110943 a Pereira
 */

 UPDATE alumno SET alumno_nombreCompleto = 'Gricelda Marquez'
 WHERE alumno_carnet = 'GM119056';

SELECT * FROM dbo.alumno;

UPDATE alumno SET alumno_carnet = 'GM119156'
WHERE  alumno_nombreCompleto = 'Gricelda Marquez';

UPDATE inscripcion SET inscripcion_ciclo = 'C2-15'
WHERE  inscripcion_ciclo = 'C1-14';

SELECT * FROM inscripcion;

UPDATE materia SET materia_codigo = 'HM01',
                   materia_nombre = 'Humanistica I'
WHERE  materia_codigo = 'HM02';

SELECT * FROM materia;

UPDATE alumno SET alumno_nombreCompleto = 'Pereira'
WHERE  alumno_carnet = 'IP110943';

SELECT * FROM alumno;
 /**
   f. Crear las siguientes consultas de eliminación de datos
        I. Eliminar el alumno con el carnet IP110943
        II. Eliminar los alumnos en donde el carnet comience con letra M
        III. Eliminar la materia Introducción a la Programación
        IV. Eliminar el alumno Oscar Hernández
        V. Eliminar la inscripción donde el código de la materia es igual RD02 y el ciclo es igual C1-15
  */

  

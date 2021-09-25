CREATE DATABASE ControlAlumnoU20171110;

USE ControlAlumnoU20171110;

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
('GM119056', 'Gricelda Martinez');


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
('GH121214', 'HM02', 'C1-15');

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






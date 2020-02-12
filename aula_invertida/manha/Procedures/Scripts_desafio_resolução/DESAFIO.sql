CREATE DATABASE OptusManha;

USE OptusManha;

CREATE TABLE TipoUsuario(
IdTipoUsuario INT PRIMARY KEY IDENTITY,
Titulo VARCHAR(30) NOT NULL
);

CREATE TABLE Usuarios(
IdUsuario INT PRIMARY KEY IDENTITY,
Nome VARCHAR(255) NOT NULL,
IdTipoUsuario INT FOREIGN KEY REFERENCES TipoUsuario(IdTipoUsuario)
);

CREATE TABLE Artistas(
IdArtista INT PRIMARY KEY IDENTITY,
Nome VARCHAR(255) NOT NULL
);



CREATE TABLE Estilos(
IdEstilo INT PRIMARY KEY IDENTITY,
Nome VARCHAR(255) NOT NULL
);

CREATE TABLE Albuns(
IdAlbum INT PRIMARY KEY IDENTITY,
Nome VARCHAR(255) NOT NULL,
DataLancamento Date NOT NULL,
QtdMinutos FLOAT NOT NULL,
Visualizacao INT NOT NULL,
IdArtista INT FOREIGN KEY REFERENCES Artistas(IdArtista) NOT NULL,
IdEstilo INT FOREIGN KEY REFERENCES Estilos(IdEstilo) NOT NULL
);

INSERT INTO TipoUsuario(Titulo)
VALUES ('1'),
	   ('2'),
	   ('3'),
	   ('4'),
	   ('5');


INSERT INTO Usuarios(Nome, IdTipoUsuario)
VALUES ('Maria Cabral do Amaral',1),
	   ('Beatriz dos Santos Manso',1),
	   ('Thalita Mariano',2),
	   ('Fernando Rebelo',3),
	   ('José Alencar Filho',4);


INSERT INTO Artistas(Nome)
VALUES ('Non Blondes'),
	   ('Aline Barros'),
	   ('André Matos'),
	   ('Ed Sheeran'),
	   ('Gusttavo Lima'),
	   ('Elvis Presley');

INSERT INTO Estilos(Nome)
VALUES ('Rock'),
	   ('Pop'),
	   ('Sertanejo'),
	   ('Metal'),
	   ('Eletrônica');

INSERT INTO Albuns(Nome, DataLancamento, QtdMinutos,Visualizacao,IdArtista, IdEstilo)
VALUES	('Rebirth','01/01/2001',30.40,0,3,1),
		('Angels Cry','01/01/1993',20.15,0,3,1),
		('Temple of Shadows','01/01/2004',5.00,1,3,1),
		('Omni','01/01/2018',30.10,1,3,1),
		('Holy Land','01/01/1996',18.14,0,3,1);


INSERT INTO Albuns(Nome, DataLancamento, QtdMinutos,Visualizacao,IdArtista, IdEstilo)
VALUES	('Rebirth 2','01/01/2001',30.40,0,3,1);


INSERT INTO Albuns(Nome, DataLancamento, QtdMinutos,Visualizacao,IdArtista, IdEstilo)
VALUES	('Rebirth 3','01/01/2001',30.40,0,3,2);

INSERT INTO Albuns(Nome, DataLancamento, QtdMinutos,Visualizacao,IdArtista, IdEstilo)
VALUES	('Rebirth 4','01/01/2001',30.40,0,3,3);


SELECT * FROM TipoUsuario;
SELECT * FROM Usuarios;
SELECT * FROM Artistas;
SELECT * FROM Albuns;
SELECT * FROM Estilos;


CREATE PROC Juncao @estilo INT 
AS
SELECT * FROM Albuns
INNER JOIN Estilos ON Albuns.IdEstilo = Estilos.IdEstilo
GO

EXEC Juncao 1






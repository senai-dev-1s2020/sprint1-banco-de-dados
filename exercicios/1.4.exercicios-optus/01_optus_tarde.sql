--DDL Linguagem de definiçao de dados

--Criar o banco de dados
CREATE DATABASE Optus_Tarde;

USE Optus_Tarde;

CREATE TABLE Estilos (
    IdEstilo    INT PRIMARY KEY IDENTITY,
    Nome        VARCHAR(250) 
);


CREATE TABLE Artistas (
    IdArtista   INT PRIMARY KEY IDENTITY,
    Nome        VARCHAR(250)  
);


CREATE TABLE Albuns(
    IdAlbum        INT PRIMARY KEY IDENTITY,
    Nome           VARCHAR(250) NOT NULL UNIQUE,
    DataLancamento DATE,
    Localizacao    VARCHAR(200),
    QtdMinutos     BIGINT,
    IdArtista      INT FOREIGN KEY REFERENCES Artistas (IdArtista),
	IdEstilo	   INT FOREIGN KEY REFERENCES Estilos (IdEstilo)
);

CREATE TABLE TipoUsuario (
	IdTipoUsuario INT PRIMARY KEY IDENTITY,
	Titulo		  VARCHAR(200)
);


CREATE TABLE Usuarios (
    IdUsuario      INT PRIMARY KEY IDENTITY,
    Nome           VARCHAR(250), 
    Email          VARCHAR(250),
    Senha          VARCHAR(250), 
    Permissao      VARCHAR(200),
	IdTipoUsuario  INT FOREIGN KEY REFERENCES TipoUsuario (IdTipoUsuario)
);

SELECT * FROM Albuns;

-- ALTERAÇÃO DE TABELA EXCLUIR COLUNA
ALTER TABLE Usuarios
DROP COLUMN Permissao;

-- DROP APAGAR TABELA
DROP TABLE Albuns;


-- DML LINGUAGEM DE MANIPULACAO DE DADOS
SELECT * FROM Estilos;
SELECT * FROM Albuns;
SELECT * FROM Artistas;
SELECT * FROM TipoUsuario;
SELECT * FROM Usuarios;

-- COMANDO DE INSERIR DADOS 
INSERT INTO Estilos (Nome)
VALUES ('Pagode'),('Samba'),('Rock');

INSERT INTO Artistas (Nome)
VALUES ('Anita'),('Zeca Pagodinha'),('Pitty');

INSERT INTO Albuns (Nome, DataLancamento, Localizacao, QtdMinutos, IdArtista, IdEstilo)
VALUES ('Pitty todos os sucessos','29/01/2020','SP', 120, 3, 3),
	   ('Tom','23/01/2020','RJ', 100, 2, 2);

-- Update Alterar dados

UPDATE Artistas
SET Nome = 'ZECA PAGODINHO'
WHERE IdArtista = 2;

--DELETE APAGAR DADOS 
DELETE FROM Artistas
WHERE IdArtista = 5;

--Limpar todos os dados da tabela
TRUNCATE TABLE Albuns;














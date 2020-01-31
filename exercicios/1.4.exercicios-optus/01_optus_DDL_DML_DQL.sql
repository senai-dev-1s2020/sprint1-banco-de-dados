--DDL Linguagem de definiçao de dados

--Criar o banco de dados
CREATE DATABASE Optus;

USE Optus;

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


-- ALTERAÇÃO DE TABELA EXCLUIR COLUNA
ALTER TABLE Usuarios
DROP COLUMN Permissao;

-- DROP APAGAR TABELA
DROP TABLE Albuns;


-- DML LINGUAGEM DE MANIPULACAO DE DADOS


-- COMANDO DE INSERIR DADOS 
INSERT INTO Estilos (Nome)
VALUES ('Pagode'),('Samba'),('Rock');

INSERT INTO Artistas (Nome)
VALUES ('Anita'),('Zeca Pagodinha'),('Pitty');

INSERT INTO Albuns (Nome, DataLancamento, Localizacao, QtdMinutos, IdArtista, IdEstilo)
VALUES ('Pitty todos os sucessos','29/01/2020','SP', 120, 3, 3),
	   ('Tom','23/01/2020','RJ', 100, 2, 2);

INSERT INTO Albuns (Nome, DataLancamento, Localizacao, QtdMinutos, IdArtista, IdEstilo)
VALUES ('Zeca pagodinho','29/01/2020','SP', 150, 1, 1),
	   ('Pericles','22/03/2019','RJ', 190, 2, 2);

INSERT INTO TipoUsuario (Titulo)
VALUES ('Administrador'),
	   ('Comum');

INSERT INTO Usuarios (Nome, Email, Senha, IdTipoUsuario)
VALUES ('Carol', 'carol@hotmail.com','carol123',1),
	   ('Saulo', 'saulo@hotmail.com','saulo123',2);

-- Update Alterar dados

UPDATE Artistas
SET Nome = 'ZECA PAGODINHO'
WHERE IdArtista = 2;

--DELETE APAGAR DADOS 
DELETE FROM Artistas
WHERE IdArtista = 5;

--Limpar todos os dados da tabela
TRUNCATE TABLE Albuns;

-- DQL LINGUAGEM DE CONSULTA DE DADOS 

SELECT * FROM Artistas;

SELECT Nome FROM Artistas;

SELECT Nome, DataLancamento FROM Albuns;

-- Operadores < > =  
SELECT * FROM Albuns WHERE IdArtista = 1;

SELECT * FROM Albuns WHERE IdAlbum > 1;

-- OR OU
SELECT Nome, QtdMinutos FROM Albuns 
WHERE (DataLancamento IS NULL) or (Localizacao IS NULL);

-- LIKE Comparacao de texto 

SELECT IdAlbum, Nome FROM Albuns 
WHERE Nome LIKE 'Pitty%' -- comeco da frase

SELECT IdAlbum, Nome FROM Albuns 
WHERE Nome LIKE '%Pitty' -- final da frase

SELECT IdAlbum, Nome FROM Albuns 
WHERE Nome LIKE '%Pitty%' -- no meio da frase

--ORDENACAO 

SELECT Nome FROM Albuns
ORDER BY Nome;

SELECT IdAlbum, Nome, QtdMinutos FROM Albuns
ORDER BY QtdMinutos;

-- Ordenacao invertida (Do maior para o menor)
SELECT IdAlbum, Nome, QtdMinutos FROM Albuns
ORDER BY QtdMinutos DESC;

-- -- Ordenacao  (Do menor para o maior)

SELECT IdAlbum, Nome, DataLancamento FROM Albuns
ORDER BY DataLancamento ASC;

-- COUNT 
SELECT COUNT(IdAlbum) FROM Albuns;

























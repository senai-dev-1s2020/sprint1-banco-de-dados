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

INSERT INTO Estilos (Nome)
VALUES ('Pop');

INSERT INTO Artistas (Nome)
VALUES ('Anita'),('Zeca Pagodinha'),('Pitty');

INSERT INTO Artistas (Nome)
VALUES ('Anita'),('Legiao Urbana'),('Metalica');

INSERT INTO Albuns (Nome, DataLancamento, Localizacao, QtdMinutos, IdArtista, IdEstilo)
VALUES ('Pitty todos os sucessos','29/01/2020','SP', 120, 3, 3),
	   ('Tom','23/01/2020','RJ', 100, 2, 2);

INSERT INTO Albuns (Nome, DataLancamento, Localizacao, QtdMinutos, IdArtista, IdEstilo)
VALUES ('Zeca pagodinho','29/01/2020','SP', 150, 1, 1),
	   ('Pericles','22/03/2019','RJ', 190, 2, 2);

INSERT INTO Albuns (Nome, DataLancamento, Localizacao, QtdMinutos, IdArtista, IdEstilo)
VALUES ('Anita - Medley','29/01/2020','SP', 120, 1, 4),
	   ('Metalica - Rockkkk','22/03/2019','RJ', 190, 9, 3);



	   
INSERT INTO Albuns (Nome, DataLancamento, Localizacao, QtdMinutos, IdArtista, IdEstilo)
VALUES ('Exaltasamba','23/01/2020','RJ', 200, 2, 2);



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

-- DQL Linguagem de consulta de dados

SELECT * FROM Albuns;
SELECT Nome FROM Albuns;
SELECT * FROM Albuns WHERE IdAlbum = 1;
SELECT * FROM Albuns WHERE IdAlbum > 1;

-- OR

SELECT Nome,  QtdMinutos FROM Albuns
WHERE (DataLancamento IS NULL) OR (Localizacao IS NULL);


--FILTRO DE TEXTO 
SELECT IdArtista, Nome FROM Artistas
WHERE Nome LIKE 'Pitty%'; --palavra no inicio

SELECT IdArtista, Nome FROM Artistas
WHERE Nome LIKE '%Pitty%'; --palavra no meio da frase

SELECT IdArtista, Nome FROM Artistas
WHERE Nome LIKE '%Pitty'; -- palavra no final da frase


-- ORDENACAO 

SELECT IdAlbum, Nome FROM Albuns
ORDER BY Nome; 

SELECT IdAlbum, Nome, DataLancamento FROM Albuns
ORDER BY DataLancamento, Nome; 

-- ORDENACAO INVERTIDA

SELECT IdAlbum, Nome, DataLancamento FROM Albuns
ORDER BY DataLancamento DESC

-- COUNT

SELECT COUNT(IdAlbum) FROM Albuns;

-- SELECIONAR OS ALBUNS DO MESMO ARTISTA 
SELECT * FROM Albuns WHERE IdArtista = 2;

-- USANDO INNER JOIN (JUNÇAO DE DUAS OU MAIS TABELAS)
SELECT Artistas.Nome, Albuns.Nome FROM Artistas
INNER JOIN Albuns ON Artistas.IdArtista = Albuns.IdArtista
WHERE Albuns.IdArtista = 2;

--SELECIONAR OS ALBUNS LANÇADOS NA MESMA DATA 
SELECT * FROM Albuns WHERE DataLancamento ='2020-01-23';

-- INNER JOIN 
SELECT * FROM Artistas 
INNER JOIN Albuns ON Artistas.IdArtista = Albuns.IdArtista
WHERE DataLancamento = '2020-01-23';

-- SELECIONAR ALBUNS E ARTISTAS E ORDENAR
-- POR DATA DE LANCAMENTO 
-- (MAIS ANTIGO PARA O MAIS RECENTE)
SELECT * FROM Albuns ORDER BY DataLancamento ASC;

--COM JOIN
SELECT Artistas.Nome as NomeArtista, Albuns.Nome as NomeAlbum, Albuns.DataLancamento-- atributos com apelido
FROM Artistas 
INNER JOIN Albuns ON Artistas.IdArtista = Albuns.IdArtista
ORDER BY DataLancamento ASC;

-- SELECIONAR ARTISTAS DO MESMO ESTILO MUSICAL 
SELECT IdArtista, IdEstilo FROM Albuns WHERE IdEstilo = 2; 


-- DESAFIO REALIZAR EXERCÍCIO 
-- COM INNER JOIN, COM 3 TABELAS 
SELECT Artistas.Nome, Estilos.Nome
FROM Artistas
INNER JOIN Albuns ON Artistas.IdArtista = Albuns.IdArtista
INNER JOIN Estilos ON Albuns.IdEstilo = Estilos.IdEstilo
WHERE Estilos.IdEstilo = 3; 





















SELECT * FROM Artistas;
SELECT * FROM Albuns;
SELECT * FROM Estilos;






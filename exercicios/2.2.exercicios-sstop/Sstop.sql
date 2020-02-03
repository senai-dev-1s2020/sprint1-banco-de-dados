-- DDL LINGUAGEM DE DEFINICAO DE DADOS 

--CRIA O BANCO DE DADOS 
CREATE DATABASE Sstop_Manha;

--Aponta o banco de dados que vou usar 
USE Sstop_Manha;

--CRIAR TABELA 
CREATE TABLE EstilosMusicais (
	IdEstiloMusical		INT PRIMARY KEY IDENTITY,
	Nome				VARCHAR(200)
);

--CRIAR TABELA 
CREATE TABLE Artistas(
	IdArtista		INT PRIMARY KEY IDENTITY,
	Nome			VARCHAR(200),
	IdEstiloMusical	INT FOREIGN KEY REFERENCES EstilosMusicais (IdEstiloMusical) 
);

--Alterar Adicionar novo atributo
ALTER TABLE EstilosMusicais
ADD Descricao VARCHAR(200);

-- EXCLUIR BANCO DE DADOS 
-- DROP DATABASE Sstop_Manha;

-- DML LINGUAGEM DE MANIPULACAO DE DADOS

-- COMANDO DE INSERIR DADOS

INSERT INTO EstilosMusicais (Nome, Descricao)
VALUES ('Samba','Estilo Musical'),
	   ('Jazz', 'Estilo top'),
	   ('Pop', 'Estilo popular');

INSERT INTO Artistas (Nome,IdEstiloMusical) 
VALUES ('Zeca Pagodinho',2),
	   ('Frank',3);

SELECT * FROM Artistas;

-- UPDATE ALTERAR DADOS DE DENTRO DAS TABELAS
UPDATE Artistas
SET Nome = 'Alcione'
WHERE IdArtista = 1;

UPDATE Artistas
SET IdEstiloMusical = 1
WHERE IdArtista = 3;

-- DELETE APAGAR DADOS DA TABELA
DELETE FROM Artistas
WHERE IdArtista = 4; 

-- APAGA TODOS OS DADOS DA TABELA 
TRUNCATE TABLE ARTISTAS;







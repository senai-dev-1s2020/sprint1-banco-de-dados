--CRIAR BANCO DE DADOS
CREATE DATABASE RoteiroMusical;

USE RoteiroMusical;

-- DDL Linguagem de DEFINICAO de DADOS
CREATE TABLE EstilosMusicais(
	IdEstilo INT PRIMARY KEY IDENTITY,
	Nome	 VARCHAR(200)
);

CREATE TABLE Artistas (
	IdArtista	INT PRIMARY KEY IDENTITY,
	NomeArtista VARCHAR(200),
	IdEstilo INT FOREIGN KEY REFERENCES EstilosMusicais (IdEstilo)
	);

-- Alteracao adicionar coluna nova
ALTER TABLE Artistas
ADD DataNascimento DATE;

-- Alteracao modificar coluna 
ALTER TABLE Artistas
ALTER COLUMN NomeArtista CHAR; 

--Alterar coluna apagar
ALTER TABLE Artistas
DROP COLUMN NomeArtista;

-- APAGAR TABELA
DROP TABLE Artistas;

--APAGAR BANCO DE DADOS
DROP DATABASE RoteiroMusical;
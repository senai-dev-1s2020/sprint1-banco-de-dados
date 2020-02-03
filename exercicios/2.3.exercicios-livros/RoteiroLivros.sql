-- comando para criar banco de dados
-- DDL Linguagem de DEFINICAO de dados
CREATE DATABASE RoteiroLivros;

USE RoteiroLivros;

CREATE TABLE Generos (
	IdGenero INT PRIMARY KEY IDENTITY ,
	Nome	 VARCHAR(200) NOT NULL
);

CREATE TABLE Autores (
	IdAutor INT PRIMARY KEY IDENTITY,
	NomeAutor VARCHAR(200)
);

CREATE TABLE Livros (
	IdLivro  INT PRIMARY KEY IDENTITY,
	Titulo   VARCHAR(255),
	IdGenero INT FOREIGN KEY REFERENCES Generos (IdGenero),
	IdAutor	 INT FOREIGN KEY REFERENCES Autores (IdAutor)
);

--DQL comando de consulta
SELECT * FROM Autores;
SELECT * FROM Generos;
SELECT * FROM Livros;
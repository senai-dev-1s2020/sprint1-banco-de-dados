-- DDL

Create database Escola
use escola

create table Aluno (
	IdAluno INT PRIMARY KEY IDENTITY,
	Nome	VARCHAR (100),
);

create table Materia (
	IdMateria INT PRIMARY KEY IDENTITY,
	Titulo	  VARCHAR (20),
);

create table Nota (
	IdNota INT PRIMARY KEY IDENTITY,
	Resultado FLOAT,
	IdAluno INT FOREIGN KEY REFERENCES Aluno(IdAluno),
	IdMateria INT FOREIGN KEY REFERENCES Materia(IdMateria),
);

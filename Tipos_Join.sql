-- Cria um banco de dados
CREATE DATABASE Tipos_Join;
GO

-- Define o uso do banco de dados
USE Tipos_Join;
GO

-- Cria as tabelas
CREATE TABLE TiposUsuario(
	IdTipoUsuario	INT PRIMARY KEY IDENTITY,
	Titulo			VARCHAR (150) UNIQUE NOT NULL
);
GO

CREATE TABLE Usuarios(
	IdUsuario		INT PRIMARY KEY IDENTITY,
	Nome			VARCHAR (150) NOT NULL,
	TipoUsuario		INT FOREIGN KEY REFERENCES TiposUsuario(IdTipoUsuario)
);
GO

-- Insere dois tipos de usuário
INSERT INTO TiposUsuario (Titulo)
VALUES					 ('Administrador'), ('Comum'), ('Moderador');
GO

-- Insere dois usuários
INSERT INTO Usuarios (Nome, TipoUsuario)
VALUES				 ('Usuário A', 1), ('Usuário B', 2);
GO

-- Insere um usuário sem definir o tipo de usuário
INSERT INTO Usuarios (Nome)
VALUES				 ('Usuário C');
GO

-- Lista todos os tipos de usuário
SELECT IdTipoUsuario, Titulo FROM TiposUsuario;

-- Lista todos os usuários
SELECT IdUsuario, Nome, TipoUsuario FROM Usuarios;

-- Lista todos os usuários mostrando as informações do tipo de usuário
SELECT IdUsuario, Nome, Titulo FROM Usuarios
-- JOIN TiposUsuario OU
INNER JOIN TiposUsuario
--			NULL		=				1, 2 OU 3 ? X
ON Usuarios.TipoUsuario = TiposUsuario.IdTipoUsuario;

-- Lista todos os usuários mostrando as informações do tipo de usuário
-- mesmo que um usuário não tenha tipo definido
SELECT IdUsuario, Nome, Titulo FROM Usuarios
LEFT JOIN TiposUsuario
ON Usuarios.TipoUsuario = TiposUsuario.IdTipoUsuario;

-- Lista os usuários mostrando as informações do tipo de usuário
-- e todos os tipos de usuário, mesmo que não tenha um usuário pra este tipo
SELECT IdUsuario, Nome, Titulo FROM Usuarios
RIGHT JOIN TiposUsuario
ON Usuarios.TipoUsuario = TiposUsuario.IdTipoUsuario;
CREATE DATABASE pclinicsTarde
GO
USE pclinicsTarde
GO

CREATE TABLE Clinica (
	IdClinica INT PRIMARY KEY IDENTITY,
	RazaoSocial VARCHAR(100),
	Endereco VARCHAR(100)
);

CREATE TABLE Veterinario (
	IdVet INT PRIMARY KEY IDENTITY,
	Nome VARCHAR (100),
	CRMV VARCHAR (100),
	IdClinica INT FOREIGN KEY REFERENCES Clinica(IdClinica)
);

CREATE TABLE Dono (
	IdDono INT PRIMARY KEY IDENTITY,
	Nome VARCHAR (100)
);

CREATE TABLE TipoPet (
	IdTipoPet INT PRIMARY KEY IDENTITY,
	Titulo VARCHAR (100)
);

CREATE TABLE Raca (
	IdRaca INT PRIMARY KEY IDENTITY,
	Titulo VARCHAR (100),
	IdTipoPet INT FOREIGN KEY REFERENCES TipoPet(IdTipoPet)
);

CREATE TABLE Pet (
	IdPet INT PRIMARY KEY IDENTITY,
	Nome VARCHAR (100),
	Telefone VARCHAR(100),
	IdDono INT FOREIGN KEY REFERENCES Dono(IdDono),
	IdRaca INT FOREIGN KEY REFERENCES Raca(IdRaca)
);

CREATE TABLE Atendimento (
	IdAtendimento INT PRIMARY KEY IDENTITY,
	DataAtendimento DATE,
	Descricao VARCHAR (4000),
	IdVet INT FOREIGN KEY REFERENCES Veterinario(IdVet),
	IdPet INT FOREIGN KEY REFERENCES Pet(IdPet)
);

INSERT INTO Clinica (RazaoSocial, Endereco)
VALUES ('Clinica Veterinaria','Alameda Barão de Limeira, 532');

INSERT INTO Veterinario (IdClinica, Nome, CRMV)
VALUES (1,'Pablo',235),
	(1,'Geoavana',345),
	(1,'Carlos',567);

INSERT INTO Dono(Nome)
VALUES ('João'),
	('Marina'),
	('Felipe'),
	('Gabriel'),
	('Erick');

INSERT INTO TipoPet(Titulo)
VALUES ('Cachorro'),
	('Gato'),
	('Cobra'),
	('Elefante'),
	('Leão');

INSERT INTO Raca(IdTipoPet, Titulo)
VALUES (5,'Albino'),
	(3,'Siames'),
	(2,'Persa'),
	(4,'Arabico'),
	(1,'Labrador');

INSERT INTO Pet(IdDono, IdRaca, Nome, Telefone)
VALUES (1,5,'Beach','2345678932'),
	(3,2,'Floquinho','7827362178'),
	(4,4,'Grandão','8372738172'),
	(5,2,'Vira','3823237711'),
	(2,1,'Taai','4237112873');

INSERT INTO Atendimento(IdVet, IdPet, DataAtendimento, Descricao)
VALUES (1,1,'23/02/2020','Tudo em ordem'),
	(2,4,'30/09/2018','Doença grave detectada'),
	(3,3,'04/05/2019','Tá bem o moleque'),
	(3,2,'02/01/2020','Pé no caixão');

------ TRIGGERS --------

-- É uma boa prática nomear seus triggers com um padrão que pode ser facilmente identificado
-- Um exemplo é o modelo TRG_TIPO_COMANDO_TABELA
CREATE TRIGGER TRG_AF_INSERT_ATENDIMENTO 
-- TRG é o que define um trigger
-- AF é o tipo de trigger
-- INSERT é o comando que ele supervisiona
-- ATENDIMENTO é a tabela em que o comando é executado
ON Atendimento
-- ON define em qual tabela o trigger irá supervisionar.
AFTER INSERT
-- AFTER é o tipo de trigger que só é executado quando outro comando funciona de forma bem sucedida.
-- O comando definido, nesse caso foi o INSERT.
-- Ou seja, quando o comando INSERT for executado com a tabela ATENDIMENTO e for bem sucedido, o bloco de comandos do trigger será executado.
AS
SELECT Veterinario.Nome as Veterinario, Veterinario.CRMV, Dono.Nome as Dono, Pet.Nome as Pet,
	   Raca.Titulo as Raça, TipoPet.Titulo as Tipo, Atendimento.DataAtendimento as 'Data do atendimento',
	   Atendimento.Descricao

	FROM Atendimento 
	INNER JOIN Veterinario
	ON Veterinario.IdVet = Atendimento.IdVet
	INNER JOIN Pet
	ON Atendimento.IdPet = Atendimento.IdPet
	INNER JOIN Raca
	ON Pet.IdRaca = Raca.IdRaca
	INNER JOIN TipoPet
	ON TipoPet.IdTipoPet = Raca.IdTipoPet
	INNER JOIN Dono
	ON Dono.IdDono = Pet.IdDono
GO
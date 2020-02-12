/*
CREATE DATABASE ExplicacaoTriggers;

CREATE TABLE CadastroPessoa(
	IdCadastroPessoa INT PRIMARY KEY IDENTITY NOT NULL,
	Nome VARCHAR(200),
	Idade INT,
	CPF BIGINT,
);

CREATE TABLE EncaminhaRF(
	IdEncaminha INT PRIMARY KEY IDENTITY NOT NULL,
	CorpoEncaminha VARCHAR(MAX),
);
USE ExplicacaoTriggers;
*/

-- Objetivo: Armazenar na tabela 'EncaminhaRF' dados cadastro do usuário

/* 
*  Especificações:
*  [FOR/AFTER/INSTEAD OF]
*  [INSERT/UPDATE/DELETE]
*/

CREATE TRIGGER encaminharReceitaFederal
ON CadastroPessoa
FOR INSERT
AS
-- Inicio (Corpo)
BEGIN 
	-- Variaveis que irão armazenar os valores
	DECLARE @IdCadastroPessoa INT, @Nome VARCHAR(200) , @CPF BIGINT

	-- Armazenamos nas variaveis os valores capturados da tabela 'CadastroPessoa'
	SELECT @IdCadastroPessoa = IdCadastroPessoa, 
		   @Nome = Nome,
		   @CPF = CPF
	FROM INSERTED -- Inserted referencia a tabela CadastroPessoa

	INSERT INTO EncaminhaRF (CorpoEncaminha)
	VALUES (
		'Cadastro N°: ' + CAST(@IdCadastroPessoa AS VARCHAR) + ' Nome: ' + @Nome + ' CPF: ' + CAST(@CPF AS VARCHAR)
	)
END

INSERT INTO CadastroPessoa(Nome,Idade,CPF)
VALUES (
	'João Neto Albuquerque',
	32,
	45632145676
)

SELECT * FROM CadastroPessoa;
SELECT * FROM EncaminhaRF;
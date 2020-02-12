/*CREATE DATABASE _Triggers;

USE _Triggers;

CREATE TABLE Aluno (
	IdAluno INT PRIMARY KEY IDENTITY NOT NULL,
	Nome VARCHAR(200),
	DataNascimento DATETIME
);

CREATE TABLE EnviarEmail (
	IdEnviarEmail INT PRIMARY KEY IDENTITY NOT NULL,
	Destinatario VARCHAR(200),
	Assunto VARCHAR(200),
	Corpo VARCHAR(MAX),
);*/

-- Criar uma trigger para a tabela Aluno quando for inserido um registro
-- Criar trigger [nomeExemplo]

CREATE TRIGGER utrEnviarEmailAlunoNovo	

ON Aluno -- Na [tabelaExemplo]

FOR INSERT-- Para quando [inserir,alterar,excluir]
AS
BEGIN 
	DECLARE
		@IdAluno int,
		@Nome varchar(100);

		SELECT 
			@IdAluno = IdAluno,
			@Nome = Nome
		FROM 
			INSERTED -- Que acabou de ser inserido

		INSERT INTO EnviarEmail	(Destinatario, Assunto,	Corpo )
		VALUES
		(
			'c.carlos99@outlook.com',
			'Novo aluno cadastrado',
			'Foi cadastrado o aluno codigo' + CAST(@IdAluno AS VARCHAR) + ' nome' + @Nome
		)		
END

SELECT * FROM Aluno;
SELECT * FROM EnviarEmail;


INSERT INTO Aluno(Nome, DataNascimento )
VALUES ('SAULO CAROL', '2020-01-04')
-- Define o banco de dados que será utilizado
USE Gufi_Manha;
GO

INSERT INTO TipoUsuario (TituloTipoUsuario)
VALUES					('Administrador')
						,('Comum');
GO

INSERT INTO TipoEvento	(TituloTipoEvento)
VALUES					('C#')
						,('React')
						,('SQL');
GO

INSERT INTO Instituicao	(CNPJ, NomeFantasia, Endereco)
VALUES					('11111111111111', 'Escola SENAI de Informática', 'Alameda Barão de Limeira, 538');
GO

INSERT INTO Usuario	(IdTipousuario, NomeUsuario, Email, Senha, DataCadastro, Genero)
VALUES				(1,'Administrador','adm@adm.com','adm123','06-02-2020','Não informado')
					,(2,'Carol','carol@email.com','carol123','06-02-2020','Feminino')
					,(2,'Saulo','saulo@email.com','saulo123','06-02-2020','Masculino');
GO

INSERT INTO Evento	(IdTipoEvento, IdInstituicao, NomeEvento, AcessoLivre, DataEvento, Descricao)
VALUES				(1,1,'Orientação a objetos','True','07-02-2020','Conceitos sobre os pilares da programação orientada a objetos')
					,(2,1,'Ciclo de vida','False','08-02-2020','Como utilizar os ciclos de vida com a biblioteca ReactJs')
					,(3,1,'Introdução a SQL','True','09-02-2020','Comandos básicos utilizando SQL Server');
GO

INSERT INTO Presenca	(IdUsuario, IdEvento, Situacao)
VALUES					(2, 2, 'Confirmada')
						,(2, 3, 'Não confirmada')
						,(3, 1, 'Confirmada');
GO
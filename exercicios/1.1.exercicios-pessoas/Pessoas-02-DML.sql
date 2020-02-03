-- DEFINE QUE O BANCO DE DADOS Pessoas SERÁ UTILIZADO
USE Pessoas;
GO

-- INSERÇÃO DE REGISTROS
INSERT INTO Pessoas (Nome)
VALUES				('Carol')
					,('Saulo');
GO

INSERT INTO CNHs (Descricao, IdPessoa)
VALUES			 ('1111111111111',1)
				,('2222222222222',2);
GO

INSERT INTO Telefones (Descricao, IdPessoa)
VALUES			 ('99999-9999',1)
				,('99999-9999',2);
GO

INSERT INTO Emails (Descricao, IdPessoa)
VALUES			 ('carol@email.com',1)
				,('saulo@email.com',2);
GO
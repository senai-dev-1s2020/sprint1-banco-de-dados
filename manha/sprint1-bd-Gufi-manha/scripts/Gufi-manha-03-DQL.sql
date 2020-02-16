-- Define o banco de dados que será utilizado
USE Gufi_Manha;
GO

-- SELECT ALL FROM TABLES
SELECT * FROM TipoUsuario;
SELECT * FROM TipoEvento;
SELECT * FROM Instituicao;
SELECT * FROM Usuario;
SELECT * FROM Evento;
SELECT * FROM Presenca;
GO

-- LISTAR TODOS OS USUÁRIOS CADASTRADOS
SELECT
	U.NomeUsuario AS Usuario,
	TU.TituloTipoUsuario AS Perfil,
	U.Email,
	U.DataCadastro,
	U.Genero 
FROM Usuario U
INNER JOIN TipoUsuario TU 
ON U.IdTipousuario = TU.IdTipoUsuario;
GO

-- OUTRA FORMA
/*
	SELECT 
		Usuario.NomeUsuario AS Usuario, 
		TipoUsuario.TituloTipoUsuario AS Perfil, 
		Usuario.Email, 
		Usuario.DataCadastro, 
		Usuario.Genero 
	FROM Usuario
	INNER JOIN TipoUsuario 
	ON Usuario.IdTipousuario = TipoUsuario.IdTipoUsuario;
	GO
*/

-- LISTAR TODAS AS INSTITUIÇÕES CADASTRADAS (CNPJ, NOME FANTASIA, ENDEREÇO)
SELECT 
	I.CNPJ
	,I.NomeFantasia
	,I.Endereco
FROM Instituicao I;
GO

-- LISTAR TODOS OS TIPOS DE EVENTOS (Titulo)
SELECT TE.TituloTipoEvento AS Tema FROM TipoEvento TE;
GO

-- LISTAR TODOS OS EVENTOS 
-- (NOME EVENTO, TIPO, DATA, PUBLICO OU PRIVADO, DESCRICAO, DADOS DA INSTITUICAO)
SELECT
	E.NomeEvento AS Evento
	,TE.TituloTipoEvento AS Tema
	,E.DataEvento
	,E.AcessoLivre
	,E.Descricao
FROM Evento E
INNER JOIN TipoEvento TE
ON E.IdTipoEvento = TE.IdTipoEvento
INNER JOIN Instituicao I
ON E.IdInstituicao = I.IdInstituicao;
GO

-- LISTAR APENAS OS EVENTOS QUE SÃO PÚBLICOS 
-- (NOME EVENTO, TIPO, DATA, PUBLICO OU PRIVADO, DESCRICAO, DADOS DA INSTITUICAO)
SELECT
	E.NomeEvento AS Evento
	,TE.TituloTipoEvento AS Tema
	,E.DataEvento
	,E.AcessoLivre
	,E.Descricao
FROM Evento E
INNER JOIN TipoEvento TE
ON E.IdTipoEvento = TE.IdTipoEvento
INNER JOIN Instituicao I
ON E.IdInstituicao = I.IdInstituicao
WHERE E.AcessoLivre = 1;
GO

-- LISTAR TODOS OS EVENTOS QUE UM DETERMINADO USUÁRIO PARTICIPA 
-- (NOME EVENTO, TIPO, DATA, PUBLICO OU PRIVADO, DESCRICAO, DADOS DA INSTITUICAO, DADOS DO USUARIO)
SELECT
	E.NomeEvento AS Evento
	,TE.TituloTipoEvento AS Tema
	,E.DataEvento
	,E.AcessoLivre
	,E.Descricao
	,I.NomeFantasia
	,I.Endereco
	,U.NomeUsuario AS Usuario,
	TU.TituloTipoUsuario AS Perfil,
	U.Email
FROM Presenca P
INNER JOIN Usuario U
ON P.IdUsuario = U.IdUsuario
INNER JOIN TipoUsuario TU
ON U.IdTipoUsuario = TU.IdTipoUsuario
INNER JOIN Evento E
ON P.IdEvento = E.IdEvento
INNER JOIN TipoEvento TE
ON E.IdTipoEvento = TE.IdTipoEvento
INNER JOIN Instituicao I
ON E.IdInstituicao = I.IdInstituicao
WHERE P.IdUsuario = 2;
GO

-- AO LISTAR OS EVENTOS, MOSTRAR NA COLUNA ACESSOLIVRE O VALOR 'PUBLICO' QUANDO FOR 1 E 'PRIVADO' QUANDO FOR 0
SELECT
	E.NomeEvento AS Evento
	,TE.TituloTipoEvento AS Tema
	,E.DataEvento
	,CASE WHEN E.AcessoLivre = 1 THEN 'Público' ELSE 'Privado' END AS Acesso
	,E.Descricao
FROM Evento E
INNER JOIN TipoEvento TE
ON E.IdTipoEvento = TE.IdTipoEvento
INNER JOIN Instituicao I
ON E.IdInstituicao = I.IdInstituicao;
GO

-- AO LISTAR OS EVENTOS QUE UM USUÁRIO PARTICIPA, MOSTRAR APENAS OS EVENTOS COM A SITUAÇÃO 'CONFIRMADA'
SELECT
	E.NomeEvento AS Evento
	,TE.TituloTipoEvento AS Tema
	,E.DataEvento
	,CASE E.AcessoLivre WHEN 1 THEN 'Público' WHEN 0 THEN 'Privado' END AS Acesso
	,E.Descricao
	,I.NomeFantasia
	,I.Endereco
	,U.NomeUsuario AS Usuario,
	TU.TituloTipoUsuario AS Perfil,
	U.Email
FROM Presenca P
INNER JOIN Usuario U
ON P.IdUsuario = U.IdUsuario
INNER JOIN TipoUsuario TU
ON U.IdTipoUsuario = TU.IdTipoUsuario
INNER JOIN Evento E
ON P.IdEvento = E.IdEvento
INNER JOIN TipoEvento TE
ON E.IdTipoEvento = TE.IdTipoEvento
INNER JOIN Instituicao I
ON E.IdInstituicao = I.IdInstituicao
WHERE P.IdUsuario = 2 AND P.Situacao = 'Confirmada';
GO
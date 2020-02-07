-- Define o banco de dados que será utilizado
USE Gufi_Manha;
GO

SELECT * FROM TipoUsuario;
SELECT * FROM TipoEvento;
SELECT * FROM Instituicao;
SELECT * FROM Usuario;
SELECT * , (CASE WHEN AcessoLivre = 1 THEN 'Publico' ELSE 'Privado' END) AS Acesso FROM Evento;
SELECT * FROM Presenca;
GO
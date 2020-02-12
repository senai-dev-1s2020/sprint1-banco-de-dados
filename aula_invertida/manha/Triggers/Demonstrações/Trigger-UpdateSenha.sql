CREATE DATABASE UpSenhaTrigger
go
Use UpSenhaTrigger
go
CREATE TABLE Usuarios(
	Id_Usuario	INT PRIMARY KEY IDENTITY,
	Nome		VARCHAR(100),
	Senha		VARCHAR(20)
	);
go
CREATE TABLE AlterarDados(
	NovaSenha	VARCHAR(20),
	Id_Alterado	INT
	);
	
	use
	--==============TRIGGER===============
	CREATE TRIGGER TGR_DeletarUsuário
		ON AlterarDados
		for INSERT
		AS
		BEGIN
				DECLARE	
							@Id_Alterado	INT

				SELECT
					@Id_Alterado = Id_Alterado
				FROM 
					INSERTED

			DELETE FROM Usuarios 
			WHERE @Id_Alterado = Id_Usuario
		END
	--=======================================

			select * from Usuarios
			select * from AlterarDados
	
	INSERT INTO AlterarDados (Id_Alterado)
	VALUES (1)



	



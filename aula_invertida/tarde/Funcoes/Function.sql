CREATE DATABASE Compras;

USE Compras;

CREATE TABLE Produto (
	IdProduto	INT PRIMARY KEY IDENTITY,
	Titulo		VARCHAR(200)
	);

CREATE TABLE Pedido (
	IdPedido	INT PRIMARY KEY IDENTITY,
	Valor		BIGINT,
	IdProduto	INT FOREIGN KEY REFERENCES Pedido(IdPedido)
	);

CREATE DATABASE Compras_DML

USE Compras;


SELECT * FROM Pedido;
SELECT * FROM Produto;

INSERT INTO Produto(Titulo)
VALUES ('iPhone X'),('MacBook Air'),('Nike Air Jordan 4'),('Galaxy S10'),('Mouse Dell');

INSERT INTO Pedido (Valor,IdProduto)
VALUES	(7500,1),
		(7800,2),
		(800,3),
		(4300,4),
		(250,5);

CREATE DATABASE Compras_DQL

USE Compras;

SELECT * FROM Pedido;

CREATE FUNCTION dbo.Soma
	(@Valor1 AS INT,
	@Valor2 AS INT)
	RETURNS INT
	AS
	BEGIN 
		DECLARE @Resultado AS INT 
		SET @Resultado = @Valor1 + @Valor2
		RETURN @Resultado
	END

SELECT dbo.Soma (7500,800) AS SomaDoProduto;


CREATE FUNCTION dbo.Media
	(@Valor1 AS DECIMAL,
	@Valor2	AS DECIMAL,
	@Valor3	AS DECIMAL,
	@Valor4 AS DECIMAL)
	RETURNS DECIMAL 
	AS
	BEGIN 
		DECLARE @Resultado AS DECIMAL
		SET @Resultado = ((@Valor1 + @Valor2 + @Valor3 + @Valor4) /4)
		RETURN @Resultado
	END

SELECT dbo.Media (8,9,10,10) AS Média;


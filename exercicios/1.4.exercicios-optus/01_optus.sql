CREATE DATABASE Optus;

USE Optus;

CREATE TABLE Estilos 
(
    IdEstilo    INT IDENTITY PRIMARY KEY
    ,Nome       VARCHAR(250) NOT NULL UNIQUE
)
GO

CREATE TABLE Artistas 
(
    IdArtista   INT IDENTITY PRIMARY KEY
    ,Nome       VARCHAR(250) NOT NULL UNIQUE
    --,IdEstilo   INT FOREIGN KEY REFERENCES Estilos (IdEstilo)
)
GO

CREATE TABLE Albuns
(
    IdAlbum         INT IDENTITY PRIMARY KEY
    ,Nome           VARCHAR(250) NOT NULL UNIQUE
    ,DataLancamento DATE
    ,Localizacao    VARCHAR(200)
    ,QtdMinutos     BIGINT
    ,Ativo          BIT NOT NULL DEFAULT(1)
    ,IdArtista      INT FOREIGN KEY REFERENCES Artistas (IdArtista)
)
GO

CREATE TABLE AlbunsEstilos 
(
	IdEstilo   INT FOREIGN KEY REFERENCES Estilos (IdEstilo)
	,IdAlbum   INT FOREIGN KEY REFERENCES Albuns (IdAlbum)
)
GO


CREATE TABLE Usuarios 
(
    IdUsuario       INT IDENTITY PRIMARY KEY
    ,Nome           VARCHAR(250) NOT NULL
    ,Email          VARCHAR(250) NOT NULL UNIQUE
    ,Senha          VARCHAR(250) NOT NULL
    ,Permissao      VARCHAR(200)
)
GO

INSERT INTO Estilos (Nome) VALUES ('Rock'), ('Pop'), ('Eletrônico');
INSERT INTO Estilos (Nome) VALUES ('Metal');
SELECT * FROM Estilos;

INSERT INTO Artistas (Nome) VALUES ('Angra'), ('Madonna'), ('Shaman');
SELECT * FROM Artistas;
--SELECT E.*, A.* FROM Estilos E INNER JOIN Artistas A ON E.IdEstilo = A.IdEstilo;

INSERT INTO Albuns (Nome, DataLancamento, Localizacao, QtdMinutos, Ativo, IdArtista) VALUES ('Holy Land', GETDATE(), 'Brasil', 57, 1, 1);
INSERT INTO Albuns (Nome, DataLancamento, Localizacao, QtdMinutos, Ativo, IdArtista) VALUES ('MDNA', GETDATE(), 'EUA', 75, 0, 2);
SELECT * FROM Albuns;
SELECT AL.*, AR.* FROM Albuns AL INNER JOIN Artistas AR ON AL.IdArtista = AR.IdArtista;

INSERT INTO AlbunsEstilos (IdAlbum, IdEstilo) VALUES (1, 1), (1, 4);
SELECT * FROM AlbunsEstilos;
SELECT A.*, AE.*, E.* FROM Albuns A INNER JOIN AlbunsEstilos AE ON A.IdAlbum = AE.IdAlbum INNER JOIN Estilos E ON AE.IdEstilo = E.IdEstilo;

INSERT INTO Usuarios (Nome, Email, Senha, Permissao) VALUES ('Administrador', 'admin@email.com', '123456', 'ADMINISTRADOR'), ('Artista', 'artista@email.com', '123456', 'ARTISTA');
SELECT * FROM Usuarios;
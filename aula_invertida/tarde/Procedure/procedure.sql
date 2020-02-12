use OPTUS;

--CRIAR PROCEDURE 

CREATE PROCEDURE InserirArtista
as
--inserir codigo sql
INSERT INTO Artista
Values('Fabio')

--EXECUTA PROCEDURE

Execute InserirArtista

select * from Artista

-- excluir procedure
drop procedure InserirArtista

CREATE PROCEDURE InserirArtista
@Nome VARCHAR (255) -- declarar variavel
as
--inserir codigo sql
INSERT INTO Artista
Values(@Nome)

execute InserirArtista 'Vitor'

--alter procedure

alter PROCEDURE InserirArtista
@Nome VARCHAR (255), -- declarar variavel
@Qualidade VARCHAR(255)
as
--inserir codigo sql
INSERT INTO Artista
Values(@Nome + @Qualidade)

execute InserirArtista 'Fabio',' Bonitao'

Create Procedure Busca
@CampoBusca VARCHAR(20)
AS
Select *
from Albuns
WHERE Albuns.Nome like '%' + @CampoBusca + '%'

execute busca 'Tropical'

--EXERCICIO RESOLUÇAO

 CREATE PROCEDURE MaisVisualizacao
 as
 --codigo sql
 select * from Albuns
 Order by Albuns.Visualisacao

 execute MaisVisualizacao

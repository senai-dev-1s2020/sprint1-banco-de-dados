USE OptusManha;


SELECT Artistas.Nome, Estilos.Nome FROM Albuns INNER JOIN Artistas ON Artistas.IdArtista = Albuns.IdArtista  
INNER JOIN Estilos ON Estilos.IdEstilo = Albuns.IdEstilo WHERE Estilos.IdEstilo = 4; 

create proc SelecionarPorEstilo @Estilo int
as
	SELECT Artistas.Nome, Estilos.Nome FROM Albuns INNER JOIN Artistas ON Artistas.IdArtista = Albuns.IdArtista  
	INNER JOIN Estilos ON Estilos.IdEstilo = Albuns.IdEstilo WHERE Estilos.IdEstilo = @Estilo; 
go	

execute SelecionarPorEstilo 1
go
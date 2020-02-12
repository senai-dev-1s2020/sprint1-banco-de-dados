create database ExerciciosAp;

create table Hamburguers (
IdHamburguer int primary key identity,
Nome varchar(200),
Preço int,
);

insert into Hamburguers (Nome, Preço)
values ('X-Salada', 15),
	   ('X-Branco', 14),
	   ('XXX Tentacion', 16)

select*from Hamburguers

select sum (Preço) as PreçoTotal from Hamburguers

select avg (Preço) as MédiaDePreços from Hamburguers

select count (IdHamburguer) Quantidade from Hamburguers

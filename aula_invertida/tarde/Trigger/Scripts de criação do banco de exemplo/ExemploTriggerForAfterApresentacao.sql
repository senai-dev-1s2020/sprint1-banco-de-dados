--Exemplos Utilizando Trigger FOR e AFTER
use pclinicsTarde;
go

--Utilizando FOR + recuperando dados inseridos
create trigger TRG_FOR_INSERT_ATENDIMENTO
on Atendimento
for insert
as
select * from inserted;

--Utilizando AFTER + recuperando dados deletados
create trigger TRG_FOR_DELETE_ATENDIMENTO
on Atendimento
after delete
as
select * from deleted;

--Insert retornando os dados que foram inseridos na tabela Atendimento
insert into Atendimento (IdVet, IdPet, DataAtendimento, Descricao) values (1,3,'04-02-2020','Pé no caixão');

--Delete
delete from Atendimento where IdAtendimento = 5;

--Conclusões:
--Como observado, After e For tem o mesmo resultado visualmente, mas a diferença dos dois seria:
--AFTER, como a própria palavra diz (DEPOIS), dispara o Trigger APÓS toda a linha de código DML ser executada.
--FOR, dispara o Trigger JUNTO com a requisição DML.


select * from Veterinario;
select * from Pet;
select * from Atendimento;


	
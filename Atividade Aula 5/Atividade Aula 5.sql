-- Atividade Aula 5

-- Questão 1 - Criar uma base de dados no Postgres com o nome de CINEMA e uma tabela de nome FILMES conforme exemplo fornecido no slide da aula.

create database cinema;

create table filmes (
	id int primary key,
	nome VARCHAR (50) unique not null,
	categoria varchar (50) not null,
	duração int not null,
	lançamento date not null
);

-- Questão 2 - Inserir apenas um registro na tabela FILMES, informando todos os atributos indicando a coluna ID = 6

insert into filmes values (6, 'Forrest Gump', 'drama', 142, '1994-12-07')

-- Questão 3 - Inserir na tabela FILMES, todos os registros do exemplo apresentado no slide

-- Para deletar items da tabela filmes (caso necessário)
--truncate filmes

insert into filmes (id, nome, categoria, duração, lançamento) 
values
(1, 'Como eu era Antes de Você', 'drama', 110, '2016-06-16'),
(2, 'Para Sempre', 'romance', 104, '2012-06-07'),
(3, 'Arremessando Alto', 'drama', 117, '2022-06-03'),
(4, 'King Richard: Criando Campeãs', 'drama', 144, '2021-12-02'),
(5, 'No Ritmo do Coração', 'drama', 111, '2021-09-23');

-- Para mostrar todos os registros na tabela FILMES
select * from filmes 
order by id;

-- Questão 4 - Deletar na tabela FILMES apenas a linha com o ID = 6

DELETE FROM filmes WHERE id = 6 RETURNING *;

-- Questão 5 - Adicionar uma coluna com nome de VERIFICAR do tipo booleano e atualizar os registros com categoria = drama como True na coluna VERIFICAR

ALTER TABLE filmes
  ADD VERIFICAR bool;

UPDATE filmes SET VERIFICAR = true WHERE categoria = 'drama';
UPDATE filmes SET VERIFICAR = false WHERE categoria != 'drama';

-- Questão 6 - Construa um SELECT que retorne os dados conforme imagem apresentada no slide da aula 5

select id, nome, categoria from filmes where id = 1 or id = 2

-- Questão 7 - Construa um SELECT que retorne os dados conforme imagem apresentada no slide da aula 5

select nome from filmes where id = 1 or id = 2 or id = 4 or id = 5
order by id

-- Questão 8 - Construa um SELECT que retorne os dados conforme imagem apresentada no slide da aula 5

select id, nome, categoria, duração, lançamento from filmes where id = 2

-- Questão 1 - Criar duas bases de dados no Postgres com os nomes "letscode" e "letscode_del"

create database letscode;

create database letscode_del;

-- Questão 2 - Alterar o nome da base de dados no Postgres de "LETSCODE" para "TURMA889"

alter database letscode rename to turma889

-- Questão 3 - Deletar a base de dados no Postgres com o nome de LETSCODE_DEL

drop database if exists letscode_del

-- Questão 4 - Criar uma tabela na base de dados TURMA889 com o nome de ALUNOS e colunas conforme imagem apresentada no slide da aula

create table turma889.public.alunos (
	id	integer,
	matricula	integer,
	nome	varchar,
	estado	varchar,
	formacao	varchar	
)

-- Questão 5 - Alterar o nome da coluna ESTADO para UF na tabela ALUNOS, na base de dados TURMA889

alter table alunos rename column estado to uf

-- Questão 6 - Incluir as colunas EMAIL e TELEFONE na tabela ALUNOS, na base de dados TURMA889

alter table alunos add column email varchar

alter table alunos add column telefone varchar

-- Questão 7 - Alterar o tipo de dados da coluna EMAIL para VARCHAR com limite a 100 caracteres

alter table alunos alter column email type varchar(100)

-- Questão 8 - Remover a coluna ID na tabela ALUNOS, na base de dados TURMA889

alter table alunos drop column id

-- Questão 9 - Remover a tabela ALUNOS, na base de dados TURMA889

drop table alunos

-- Questão 10 - Qual a melhor coluna para ser a chave primária na tabela ALUNOS, a coluna ID ou a coluna MATRÍCULA? Justifique e defina a coluna escolhida como chave primária da tabela

-- Resposta: Depende. Pode ser qualquer uma das duas. 
-- 				A justificativa para a escolha da coluna matrícula é que se ela for do tipo inteiro e não for possível repeti-la não precisamos criar uma outra coluna para ser uma chave primária. Podemos utilizar ela e considerarmos como a melhor opção nesse caso em que não precisaríamos criar uma nova coluna na tabela do banco de dados. Falando de negócio, a matrícula ganha de 10 x 0 do ID.
-- 				A justificativa para a escolha da coluna ID é que a busca pode ser mais rápida e eficiente que a matrícula, caso a matrícula apresente um número inteiro muito extenso. Poderia ser uma escolha mais performática.

-- Questão 11 - Ao criar uma nova base de dados no Postgres, o SGBD cria uma tabela padrão com nome PUBLIC.
-- a. Verdadeiro
-- b. Falso

-- Resposta: b. Falso
-- 		O que tem o nome public que é criado automaticamente pelo Postgres é o esquema (schema).

-- Questão 12 - A hierarquia no banco de dados Postgres é dada pela ordem base de dados > schema > tabela.
-- a. Verdadeiro
-- b. Falso

-- Resposta: a. Verdadeiro

-- Questão 13 - Para alterar colunas em tabelas, é preciso excluir a tabela e criar novamente com as alterações necessárias.
-- a. Verdadeiro
-- b. Falso

-- Resposta: b. Falso
-- 		Podemos alterar a coluna sem precisar excluir a tabela toda. Nós vimos a aplicação disso nos exercícios acima, a função do ALTER COLUMN com o ALTER TABLE.

-- Questão 14 - Qual comando SQL é usado para criar uma nova tabela ?
-- a. DROP TABLE
-- b. ALTER TABLE
-- c. ALTER DATABASE
-- d. CREATE DATABASE
-- e. CREATE TABLE

-- Resposta: e. CREATE TABLE
-- 		Vimos nos exercícios acima a utilização do CREATE TABLE.

-- Questão 15 - Qual comando SQL é usado para deletar uma base de dados ?
-- a. DROP TABLE
-- b. ALTER TABLE
-- c. ALTER DATABASE
-- d. DROP DATABASE
-- e. CREATE TABLE

-- Resposta: d. DROP DATABASE
-- 		Vimos nos exercícios acima a utilização do DROP DATABASE.

-- Questão 16 - O comando SQL ALTER TABLE é utilizado tanto para adicionar uma nova coluna, quanto para deletar uma coluna.
-- a. Verdadeiro
-- b. Falso

-- Resposta: a. Verdadeiro
-- 		O que vai diferenciar não é o ALTER TABLE, é o parâmetro depois: o ADD COLUMN ou o DROP COLUMN.

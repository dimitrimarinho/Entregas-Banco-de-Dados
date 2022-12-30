-- Questão 1 - Construir uma consulta que apresente o nome dos municípios que tiverem área reflorestada maior que 200.000 ha

-- Verificando municípios com área reflorestada maior que 200.000 ha
--select * from floresta f 
--where area_ha >= 200000

select distinct municipio from floresta f 
where area_ha >= 200000

-- Questão 2 - Construir uma consulta que apresente o nome dos municípios e a sigla dos estados que tiverem área reflorestada maior que 150.000 ha

-- Verificando municípios com área reflorestada maior que 150.000 ha
--select * from floresta f 
--where area_ha >= 150000

select distinct municipio, estado_sigla from floresta f 
where area_ha >= 150000

-- A Questão 3 foi anulada pelo professor

-- Questão 4 - Construir uma consulta que apresente nomes dos municípios e as espécies que tiverem área reflorestada maior que 30.000 ha no estado da Bahia

-- Verificando municípios com área reflorestada maior que 30.000 ha no estado da Bahia
--select * from floresta f 
--where area_ha >= 30000 and estado = 'Bahia'

select distinct municipio, especie from floresta f 
where area_ha >= 30000 and estado = 'Bahia'

-- Questão 5 - Construir uma view e uma view materializada com as informações da tabela original, depois comparar os tempos de execução das consultas.

	-- Construindo uma view com as informações da tabela original

CREATE VIEW floresta_view AS
    SELECT * FROM floresta;
   
EXPLAIN ANALYZE
SELECT * FROM floresta_view;
-- Three times (Execution Time): 
	--	2.246 ms
	--	2.189 ms
	--	2.314 ms

	-- Construindo uma view materializada com as informações da tabela original

CREATE MATERIALIZED VIEW floresta_materialized_view as
	SELECT * FROM floresta;

EXPLAIN ANALYZE
SELECT * FROM floresta_materialized_view;
-- Three times (Execution Time): 
	--	2.274 ms
	--	2.283 ms
	--	2.147 ms

-- Comparando as consultas anteriores (Questões 1, 2 e 4)


	-- Comparando os tempos de Execução da Questão 1 (View x Materialized View)

-- View
EXPLAIN ANALYZE
select distinct municipio from floresta_view 
where area_ha >= 200000
-- Three times (Execution Time): 
	--	3.816 ms
	--	3.510 ms
	--	3.721 ms

-- Materialized View
EXPLAIN ANALYZE
select distinct municipio from floresta_materialized_view 
where area_ha >= 200000
-- Three times (Execution Time): 
	--	3.287 ms
	--	3.628 ms
	--	3.489 ms

-- Criando View da consulta da Questão 1
CREATE VIEW view_questao1 AS
    select distinct municipio from floresta 
	where area_ha >= 200000

EXPLAIN ANALYZE
select * from view_questao1
-- Three times (Execution Time): 
	--	3.119 ms
	--	3.398 ms
	--	3.333 ms

-- Criando Materialized View da consulta da Questão 1
CREATE MATERIALIZED VIEW materialized_view_questao1 AS
    select distinct municipio from floresta
	where area_ha >= 200000

EXPLAIN ANALYZE
select * from materialized_view_questao1
-- Three times (Execution Time): 
	--	0.017 ms
	--	0.019 ms
	--	0.018 ms

	-- Comparando os tempos de Execução da Questão 2 (View x Materialized View)

-- View
EXPLAIN ANALYZE
select distinct municipio, estado_sigla from floresta_view 
where area_ha >= 150000
-- Three times (Execution Time): 
	--	3.653 ms
	--	3.578 ms
	--	3.971 ms

-- Materialized View
EXPLAIN ANALYZE
select distinct municipio, estado_sigla from floresta_materialized_view
where area_ha >= 150000
-- Three times (Execution Time): 
	--	3.659 ms
	--	3.250 ms
	--	3.603 ms

-- Criando View da consulta da Questão 2
CREATE VIEW view_questao2 AS
	select distinct municipio, estado_sigla from floresta 
	where area_ha >= 150000

EXPLAIN ANALYZE
select * from view_questao2
-- Three times (Execution Time): 
	--	3.635 ms
	--	3.513 ms
	--	3.446 ms

-- Criando Materialized View da consulta da Questão 2
CREATE MATERIALIZED VIEW materialized_view_questao2 AS
	select distinct municipio, estado_sigla from floresta 
	where area_ha >= 150000

EXPLAIN ANALYZE
select * from materialized_view_questao2
-- Three times (Execution Time): 
	--	0.018 ms
	--	0.020 ms
	--	0.018 ms


	-- Comparando os tempos de Execução da Questão 4 (View x Materialized View)

-- View
EXPLAIN ANALYZE
select distinct municipio, especie from floresta_view 
where area_ha >= 30000 and estado = 'Bahia'
-- Three times (Execution Time): 
	--	3.531 ms
	--	3.195 ms
	--	3.438 ms

-- Materialized View
EXPLAIN ANALYZE
select distinct municipio, especie from floresta_materialized_view
where area_ha >= 30000 and estado = 'Bahia'
-- Three times (Execution Time): 
	--	3.357 ms
	--	3.450 ms
	--	3.458 ms

-- Criando View da consulta da Questão 4
CREATE VIEW view_questao4 AS
	select distinct municipio, especie from floresta
	where area_ha >= 30000 and estado = 'Bahia'

EXPLAIN ANALYZE
select * from view_questao4
-- Three times (Execution Time): 
	--	3.568 ms
	--	3.287 ms
	--	3.136 ms

-- Criando Materialized View da consulta da Questão 4
CREATE MATERIALIZED VIEW materialized_view_questao4 AS
	select distinct municipio, especie from floresta
	where area_ha >= 30000 and estado = 'Bahia'

EXPLAIN ANALYZE
select * from materialized_view_questao4
-- Three times (Execution Time): 
	--	0.016 ms
	--	0.019 ms
	--	0.020 ms

/* Conforme esperado, as consultas salvas como visualizações materializadas (materialized views) executaram bem mais rápido,
isto é, foram mais performáticas que as consultas de views salvas. Isto ocorre porque as visualizações materializada são salvas
fisicamente no banco de dados (ocupam espaço físico), basta acessá-las. Enquanto as views trata-se de um salvamento virtual, isto é,
sempre que é chamada, ela processa novamente no banco de dados a consulta que foi salva através da visualização (view). */

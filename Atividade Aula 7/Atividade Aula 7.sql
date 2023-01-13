-- Questão 1 - Contar quantos municípios estão presentes na tabela florestas

select	count(municipio) as count_municipio,
		count(distinct municipio) as count_municipio_unico,
		count(distinct municipio_estado) as count_municipio_estado_unico
from florestas f 


-- Questão 2 - Qual o total de area_ha na tabela florestas?

select
	sum(area_ha) total_area_ha
from florestas f 


-- Questão 3 - Qual o total de area_ha na tabela florestas por espécie?

select
	especie,
	sum(area_ha) total_area_ha
from florestas f 
group by especie 


-- Questão 4 - Qual o total de area_ha na tabela florestas por ano?

select
	ano_data,
	sum(area_ha) total_area_ha
from florestas f 
group by ano_data 

select
	date_part('year', ano_data) as ano,
	sum(area_ha) total_area_ha
from florestas f 
group by date_part('year', ano_data) 


-- Questão 5 - Contar a quantidade de municípios tabela florestas por ano.

select	
	date_part('year', ano_data) as ano,	
	count(municipio) as count_municipio,
	count(distinct municipio) as count_municipio_unico,
	count(distinct municipio_estado) as count_municipio_estado_unico
from florestas f 
group by date_part('year', ano_data) 


-- Questão 6 - Qual a media de area_ha na tabela florestas por UF, comparando com a area_ha de cada registro?

select 
	estado_sigla,
	especie, 
	area_ha,
	avg(area_ha) over (partition by estado_sigla) 
from florestas f


-- Questão 7 - Qual o rank de area_ha na tabela florestas por região?

select 
	regiao,
	sum(area_ha) as total_area_ha,
	rank () over (order by sum(area_ha) desc)
from florestas f 
group by regiao


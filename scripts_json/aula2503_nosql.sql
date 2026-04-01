#Aula 25/03/26 - Introdução MySQL e JSON

SELECT * FROM countryinfo;
SELECT * FROM countryinfo 
WHERE _id = 'BRA';

SELECT JSON_KEYS(doc) FROM countryinfo
WHERE _id = 'BRA';

SELECT JSON_KEYS(doc,"$.geography") FROM countryinfo
WHERE _id = 'BRA';

SELECT JSON_EXTRACT(doc,"$.government") FROM countryinfo
WHERE _id = 'BRA';

SELECT JSON_EXTRACT(doc,"$.IndepYear") FROM
countryinfo WHERE _id = 'BRA';

SELECT (doc -> "$.geography.Continent") AS CONTINENTE,
(doc -> "$.demographics.Population") AS POPULACAO
FROM countryinfo;

#Questão 1
/*Exibam uma tabela com a população total e a média
da expectativa de vida de cada continente para os 
países que são monarquias. Agrupe e ordene
os dados exibidos*/
SELECT (doc -> "$.geography.Continent") AS CONTINENTE,
SUM((doc -> "$.demographics.Population")) AS POPULACAO,
AVG((doc -> "$.demographics.LifeExpectancy")) AS EXPECTATIVA_VIDA,
(doc -> "$.government.GovernmentForm") AS TIPO_GOVERNO,
(doc -> "$.Name") AS NOME_PAIS
FROM countryinfo
WHERE (doc -> "$.government.GovernmentForm") LIKE "%Monarchy%"
GROUP BY CONTINENTE, TIPO_GOVERNO, NOME_PAIS
ORDER BY 2;

#Questão 2
/*Demonstre o uso de 3 funções JSON, disponível
na documentação, utilizando diferentes chaves e valores 
do banco de dados world_x*/







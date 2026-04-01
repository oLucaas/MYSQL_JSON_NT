#30/03/2026 - JSON Contains Path

CREATE TABLE X (Y JSON);
INSERT INTO X VALUES ('{"nome": "Roberto", "telefone":"1234-5678"}');
INSERT INTO X VALUES ('{"nome": "Maria"}');
INSERT INTO X VALUES ('{"nome":"Alberto", "endereco": "Rua x numero Y"}');
INSERT INTO X VALUES ('{"nome":"Leticia", "endereco": "Rua x numero Y", 
"telefone":"1234-5678"}');
SELECT Y FROM X;

#JSON_CONTAINS 
/*Permite procurar o VALOR das propriedades/chaves
dentro do JSON*/
SELECT JSON_CONTAINS_PATH(Y, "ONE", '$.nome','$.endereco') FROM X;
SELECT JSON_CONTAINS_PATH(Y, "ALL", '$.nome','$.endereco')
FROM X;

SELECT JSON_CONTAINS(Y, '"1234-5678"', "$.telefone") FROM X;

SELECT * FROM X WHERE 
JSON_CONTAINS(Y, '"1234-5678"', "$.telefone") = 1;

#JSON_SEARCH
/*Permite encontrar um VALOR em qualquer 
propriedade*/
SELECT JSON_SEARCH(Y, "ONE", "Rua x numero Y") FROM X;
SELECT JSON_SEARCH(Y, "ALL", "1234-5678") FROM X;

#ARRAY UPDATE e ARRAY INSERT
CREATE DATABASE testjson;
USE testjson;

/*Estrutura de dados que armazena uma coleção
sequencial e ordenada de elementos, geralmente 
do mesmo tipo e sob um único nome de uma variável*/

-- ["A","B","C"] 
-- $[0] = "A", $[1] = "B", $[2] = "C"



-- JSON_ARRAY_APPEND
-- Insere novos elementos dentro do array


-- JSON_ARRAY_INSERT




#JSON INSERT, REPLACE e REMOVE
-- JSON_INSERT adiciona novos elementos



-- JSON_REPLACE substitui os elementos




-- JSON_REMOVE remove os elementos





# JSON MERGE (PRESERVE e PATH)
-- JSON_MERGE 
/*Faz uma junção entre dois ou mais json
PRESERVE: Quando temos 2 json com propriedades
diferentes o preserve os junta e transforma
em um json único. Caso hajam propriedades
em comum, estas propriedades viram arrays*/


# JSON_MERGE_PATCH
/*1º: A propriedade que existir no primeiro documento e não 
no segundo, aparecerá no documento final;
2º: A propriedade que existir em ambos será exibida
a do segundo documento*/






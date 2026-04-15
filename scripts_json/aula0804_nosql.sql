-- aula 08/04/2026
#ARRAY UPDATE e ARRAY INSERT
CREATE DATABASE testjson;
USE testjson;


/*Estrutura de dados que armazena uma coleção
sequencial e ordenada de elementos, geralmente 
do mesmo tipo e sob um único nome de uma variável*/

-- ["A","B","C"] 
-- $[0] = "A", $[1] = "B", $[2] = "C"
CREATE TABLE X (Y JSON);
INSERT INTO X  VALUES('["A","B","C"]');
SELECT * FROM X;
TRUNCATE X;
DELETE FROM X;
INSERT INTO X VALUES (JSON_ARRAY("A","B","C"));

-- JSON_ARRAY_APPEND
-- Insere novos elementos dentro do array
UPDATE X SET Y = JSON_ARRAY_APPEND(Y, "$[0]", "A1");
UPDATE X SET Y = JSON_ARRAY_APPEND(Y, "$[1]", "B1"
, "$[2]", "C2");
UPDATE X SET Y = JSON_ARRAY_APPEND(Y,"$", "E1");

SELECT * FROM X;

#JSON INSERT, REPLACE e REMOVE
-- JSON_INSERT adiciona novos elementos
INSERT INTO X VALUES ('{"chave1":"valor1"}');
SELECT * FROM X;

UPDATE X SET Y = JSON_INSERT(Y, 
"$.chave2", "valor2",
"$.chave3", "valor3", 
"$.chave4", "valor4"
);

-- JSON_REPLACE substitui os elementos
UPDATE X SET Y = JSON_REPLACE(Y,
"$.chave1", "valorx",
"$.chave4", "valorz"
);
SELECT * FROM X;

-- JSON_REMOVE remove os elementos
UPDATE X SET Y = JSON_REMOVE(Y,"$.chave4");

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

#JSON_DEPTH

#JSON_LENGTH
/*Retorna o número de propriedades/chaves que o JSON possui*/

#JSON_TYPE
-- Retorna o tipo da propriedade dentro do JSON (data, string...)

#JSON_VALID
-- Retorna se um json é válido ou não





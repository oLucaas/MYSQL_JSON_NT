CREATE schema empresa;
USE empresa;

SELECT * FROM tb_object_funcionario;

SELECT 
JSON_EXTRACT(JSON, "$.Primeiro_Nome", "$.Data_Nascimento",
"$.Numero_Departamento") 
FROM tb_object_funcionario;

SELECT JSON_UNQUOTE(JSON_EXTRACT(JSON, "$.Primeiro_Nome")),
JSON_UNQUOTE(JSON_EXTRACT(JSON, "$.Data_Nascimento")),
JSON_EXTRACT(JSON, "$.Salario")
FROM tb_object_funcionario;


SELECT 
JSON_TYPE(JSON_EXTRACT(JSON, "$.Data_Nascimento")),
JSON_TYPE(JSON_EXTRACT(JSON, "$.Salario")),
JSON_TYPE(JSON_EXTRACT(JSON, "$.Primeiro_Nome"))
FROM tb_object_funcionario
WHERE YEAR(JSON_EXTRACT(JSON, "$.Data_Nascimento")) 
>= 1980;

SELECT JSON_EXTRACT(JSON, "$.Dependentes[0].Sexo")
FROM tb_object_funcionario;

SELECT JSON_EXTRACT(JSON, "$.Dependentes[0].Parentesco")
FROM tb_object_funcionario
UNION
SELECT JSON_EXTRACT(JSON, "$.Dependentes[1].Parentesco")
FROM tb_object_funcionario;

#JSON_TABLE
/*Vamos unir dois campos presentes na chave
Dependentes, Parentesco e Sexo, em uma tabela,
organizando a visualização dos dados*/

SELECT JSON_EXTRACT(JSON, "$.Dependentes[0].Parentesco") 
AS PARENTESCO,
JSON_EXTRACT(JSON, "$.Dependentes[0].Sexo") AS SEXO
FROM tb_object_funcionario
UNION
SELECT JSON_EXTRACT(JSON, "$.Dependentes[1].Parentesco") 
AS PARENTESCO,
JSON_EXTRACT(JSON, "$.Dependentes[0].Sexo") AS SEXO
FROM tb_object_funcionario;


SELECT T1.PARENTESCO, T1.SEXO FROM tb_object_funcionario
CROSS JOIN
JSON_TABLE(
	JSON_EXTRACT(JSON, "$.Dependentes"), "$[*]"
    COLUMNS(PARENTESCO VARCHAR(20) PATH "$.Parentesco",
		SEXO VARCHAR(2) PATH "$.Sexo")
) AS T1;

/*Crie uma tabela baseada no campo dependentes com uma 
coluna para Sexo, Parentesco, Data de Nascimento e Nome
do dependente (tb_object_funcionario). Além disso, 
utilize o INNER JOIN para 
adicionar o nome do departamento (tb_departamento).*/








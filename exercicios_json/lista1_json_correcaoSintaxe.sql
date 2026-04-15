#Lista 1 - Correção de Sintaxe JSON

# Exercício 1
/*Analise a sintaxe (escrita) das variáveis 
que possuem como valor dados no formato JSON e corrija
os erros de sintaxe. Reescreva os códigos ou adicione a linha correta
utilizando um comentário, como no exemplo na alternativa a)*/

-- a)
 
aluno = {
		"nome""Maria", #Falta : entre a chave e valor
		"idade": 30, 
        "data_nascimento": 1995-02-02,
			"endereco:
				"rua":"Rua dos Fundos",
				"numero":123
				"bairro"; "Centro",
				"cep":77830000
			}
			"contato":{
				"telefone":"99999999",
				"email":"maria@dominio.com"
			}
		

-- b)

cidade = 
		"nome":"Londrina", 
		"idade": 90, 
        "data_fundacao": 1934-12-10,
		"":581000,
		"estado": "Paraná",
        "territorio":{
			"area":1652569,
			"relevo": "Predominantemente Plano",
            "altitude_maxima":840
            "altitude_minima":570,
			
		}

-- c)

funcionario = {
    "Cpf": "33344555587",
    "Sexo": "M",
    "Salario": 40000.0
    "Endereco": Rua da Lapa 34 São Paulo SP
    "Nome_Meio": "T",
    "Dependentes": [
        {
            "Sexo": "F",
            "Parentesco": "Filha",
            "Data_Nascimento": "1986-01-05T00:04:00",
            "Nome_Dependente": "Alicia"
        }
        {
            "Sexo": "F",
            "Parentesco": "Esposa",
            "Data_Nascimento": "1958-01-03T00:05:00",
            "Nome_Dependente": "Janaína"
        },
        {
            "Sexo": "M",
            "Parentesco": "Filho",
            "Data_Nascimento" "1983-01-25T00:10:00",
            "Nome_Dependente": "Tiago"
        },
    "Ultimo_Nome": "Wong",
    "Primeiro_Nome": "Fernando",
    "Cpf_Supervisor: "88866555576",
    "Data_Nascimento": "1955-01-12T00:08:00",
    "Numero_Departamento": "5"
}
}

# Exercício 2

/*Analise as consultas SQL abaixo e aponte os erros de sintaxe. Tanto 
as estruturas JSON quanto os comandos SQL podem estar erradas.*/

-- a)

SELECT 
	JSON_EXTRACT("$.Primeiro_Nome", 
    "$.Data_Nascimento", "$.Salario")
WHERE tb_object_funcionario;

-- b)

SELECT 
	JSON_UNQUOTE(JSON_EXTRACT(JSON,"$.Primeiro_Nome")) 
    JSON_UNQUOTE(JSON_EXTRACT(JSON,"$.Data_Nascimento"), 
    JSON_EXTRACT(JSON,"$.Salario")
FROM empresa;

-- c)

SELECT T1.PARENTESCO, T1.SEXO FROM tb_object_funcionario
CROSS JOIN
JSON_TABLE (
	JSON_EXTRACT(JSON, "$.Dependentes"), "$[*]"
    COLUMNS (PARENTESCO VARCHAR(50) "$.Parentesco",
			SEXO VARCHAR(50) PATH "$.Sexo")
) AS T2;

-- d)

SELECT JSON_KEYS(doc, "geography") FROM countryinfo 
WHERE _id = 'BRA';

-- e)

SELECT JSON_EXTRACT(doc, "$.GNP") as GNP
  , JSON_EXTRACT(doc, "$.Code") as Code
  , JSON_EXTRACT(doc, "$.Name") as Name
  , JSON_EXTRACT(doc, "$.IndepYear") as IndepYear
  , JSON_EXTRACT(doc, "$.geography.Region") as Region
  , JSON_EXTRACT(doc, "$.geography.Continent") as Continent
  , JSON_EXTRACT(doc, "$.geography[0]") as SurfaceArea
  , JSON_EXTRACT(doc, "$.government.HeadOfState") as HeadOfState
  , JSON_EXTRACT(doc, "$.government.GovernmentForm") as GovernmentForm
  , JSON_EXTRACT(doc, "$.demographics") as Population
    JSON_EXTRACT(doc, "$.demographics.LifeExpectancy") as LifeExpectancy
  FROM countryinfo;
  
-- f)

SELECT JSON_EXTRACT("$.geography.Continent") as Continent,
(JSON_EXTRACT(doc, "$.demographics.Population")) as Population,
AVG(JSON_EXTRACT(doc, "$.demographics.LifeExpectancy")) as LifeExpectancy 
WHERE JSON_EXTRACT(doc, "$.government.") LIKE('%Monarchy%'),
FROM countryinfo
GROUP BY JSON_EXTRACT(doc, "$.geography")
ORDER BY 2;
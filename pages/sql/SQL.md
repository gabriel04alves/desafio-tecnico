# 📚 Apostila de Consultas SQL (SQLite)

Esta apostila aborda conceitos intermediários e avançados de consultas SQL utilizando o **SQLite**, com exemplos focados em um esquema de base de dados que envolve **cidades**, **estados** e **países**. Estes exemplos ajudarão você a entender melhor como usar **INNER JOIN**, **subconsultas**, **agregações** e outras operações complexas em situações práticas.

## 📋 Sumário

- [Conceitos Básicos de SQL](#conceitos-básicos-de-sql)
- [Cláusula SELECT e Filtragem de Dados](#cláusula-select-e-filtragem-de-dados)
- [INNER JOIN](#inner-join)
- [OUTER JOIN](#outer-join)
- [Subconsultas](#subconsultas)
- [Cláusulas de Agregação (GROUP BY, HAVING)](#cláusulas-de-agregação-group-by-having)
- [Operações com UNION e INTERSECT](#operações-com-union-e-intersect)
- [Manipulação de Dados (INSERT, UPDATE, DELETE)](#manipulação-de-dados-insert-update-delete)
- [Ordenação e Limitação de Resultados](#ordenação-e-limitação-de-resultados)

### [🔗 Acesse os Exercícios de SQL](/QTSSQL.md)

---

### Estrutura de Tabelas

Vamos supor um esquema de banco de dados simples que envolve as seguintes tabelas:

- **pais**: contém dados sobre países.
- **estado**: contém dados sobre estados e é relacionado com países.
- **cidade**: contém dados sobre cidades e é relacionado com estados.
- **habitante**: contém informações sobre os habitantes e é relacionado com cidades.

### Tabela `pais`

| id  | nome           |
| --- | -------------- |
| 1   | Brasil         |
| 2   | Estados Unidos |

### Tabela `estado`

| id  | nome           | pais_id |
| --- | -------------- | ------- |
| 1   | São Paulo      | 1       |
| 2   | Rio de Janeiro | 1       |
| 3   | Califórnia     | 2       |

### Tabela `cidade`

| id  | nome           | estado_id |
| --- | -------------- | --------- |
| 1   | São Paulo      | 1         |
| 2   | Rio de Janeiro | 2         |
| 3   | Los Angeles    | 3         |

### Tabela `habitante`

| id  | nome  | idade | cidade_id |
| --- | ----- | ----- | --------- |
| 1   | Maria | 30    | 1         |
| 2   | João  | 25    | 2         |
| 3   | Sarah | 40    | 3         |

---

### Conceitos Básicos de SQL

A estrutura básica para recuperar dados de uma tabela é o comando `SELECT`. Vamos começar com um exemplo básico de como consultar os nomes dos habitantes.

```sql
SELECT nome FROM habitante;
```

Você pode filtrar os resultados utilizando a cláusula `WHERE`. Por exemplo, para buscar habitantes com mais de 30 anos:

```sql
SELECT nome FROM habitante WHERE idade > 30;
```

---

### INNER JOIN

O **INNER JOIN** é usado para combinar dados de duas ou mais tabelas com base em uma condição de correspondência entre elas. Aqui, vamos juntar as tabelas `habitante` e `cidade` para mostrar o nome do habitante e sua cidade correspondente.

```sql
SELECT habitante.nome, cidade.nome AS cidade
FROM habitante
INNER JOIN cidade ON habitante.cidade_id = cidade.id;
```

Neste exemplo, estamos unindo as tabelas `habitante` e `cidade` com base no campo `cidade_id` que existe em `habitante`, mostrando o nome do habitante junto com sua cidade.

---

### OUTER JOIN

Um **LEFT JOIN** retorna todas as linhas da tabela da esquerda (primeira tabela) e as correspondentes da tabela da direita. Se não houver correspondência, ele retorna `NULL` nos campos da tabela da direita.

#### Exemplo: Habitantes e suas cidades, incluindo cidades que não têm habitantes

```sql
SELECT cidade.nome, habitante.nome AS habitante
FROM cidade
LEFT JOIN habitante ON cidade.id = habitante.cidade_id;
```

Aqui, estamos exibindo todas as cidades e, se houver habitantes nessas cidades, os seus nomes serão mostrados. Se uma cidade não tiver habitantes, o resultado será `NULL` na coluna de habitantes.

---

### Subconsultas

Subconsultas são consultas dentro de outras consultas. Elas podem ser úteis para resolver problemas complexos de forma eficiente.

#### Exemplo: Subconsulta no `WHERE`

Aqui, vamos buscar o nome dos estados que têm habitantes com mais de 30 anos.

```sql
SELECT estado.nome
FROM estado
WHERE id IN (SELECT cidade.estado_id
             FROM cidade
             INNER JOIN habitante ON cidade.id = habitante.cidade_id
             WHERE habitante.idade > 30);
```

A subconsulta primeiro encontra os `estado_id` de estados onde há habitantes com mais de 30 anos, e a consulta externa traz os nomes desses estados.

---

### Cláusulas de Agregação (GROUP BY, HAVING)

Operações de agregação são usadas para realizar cálculos como contagens ou somas sobre conjuntos de dados. A cláusula `GROUP BY` é utilizada para agrupar dados com base em uma ou mais colunas.

#### Exemplo: Contagem de Habitantes por Cidade

Aqui, agrupamos os habitantes pela cidade e contamos quantos habitantes existem em cada uma.

```sql
SELECT cidade.nome, COUNT(habitante.id) AS total_habitantes
FROM cidade
LEFT JOIN habitante ON cidade.id = habitante.cidade_id
GROUP BY cidade.nome;
```

#### Exemplo: Usando `HAVING`

Agora vamos filtrar as cidades que têm mais de 1 habitante.

```sql
SELECT cidade.nome, COUNT(habitante.id) AS total_habitantes
FROM cidade
LEFT JOIN habitante ON cidade.id = habitante.cidade_id
GROUP BY cidade.nome
HAVING COUNT(habitante.id) > 1;
```

---

### Operações com UNION e INTERSECT

Estas operações são usadas para combinar ou comparar resultados de várias consultas.

#### Exemplo: UNION

Aqui, combinamos os nomes de todas as cidades e estados em uma lista única.

```sql
SELECT nome FROM cidade
UNION
SELECT nome FROM estado;
```

#### Exemplo: INTERSECT

Aqui, buscamos nomes que estão tanto na tabela de cidades quanto na de estados (se houver).

```sql
SELECT nome FROM cidade
INTERSECT
SELECT nome FROM estado;
```

---

### Manipulação de Dados (INSERT, UPDATE, DELETE)

- **INSERT**: insere novos dados.
- **UPDATE**: atualiza dados existentes.
- **DELETE**: remove dados.

#### Exemplo: Inserir uma Nova Cidade

```sql
INSERT INTO cidade (nome, estado_id)
VALUES ('Curitiba', 1);
```

#### Exemplo: Atualizar a Idade de um Habitante

```sql
UPDATE habitante
SET idade = 35
WHERE nome = 'João';
```

#### Exemplo: Deletar um Habitante

```sql
DELETE FROM habitante
WHERE nome = 'Maria';
```

---

### Ordenação e Limitação de Resultados

Você pode usar `ORDER BY` para ordenar os resultados e `LIMIT` para restringir o número de linhas retornadas.

#### Exemplo: Ordenar Habitantes por Idade

```sql
SELECT nome, idade FROM habitante
ORDER BY idade DESC;
```

#### Exemplo: Limitar o Número de Resultados

```sql
SELECT nome FROM habitante
ORDER BY idade DESC
LIMIT 3;
```

---

## 📌 Conclusão

Esta apostila oferece uma introdução aos conceitos intermediários e avançados de consultas SQL no contexto de um banco de dados relacionado a cidades e estados. Pratique estes exemplos para reforçar seus conhecimentos e melhorar sua habilidade em resolver problemas de lógica com SQL.

### [🔗 Acesse os exercícios de SQL](../pages/QTSSQL.md)

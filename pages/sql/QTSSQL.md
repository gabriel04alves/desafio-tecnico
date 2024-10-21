# 🗃️ Questões de SQL Intermediário a Avançado

Neste conjunto de questões, vamos aplicar os conceitos aprendidos sobre SQL utilizando o SQLite. Primeiro, você precisará baixar e importar os scripts de criação do banco de dados e de inserção de dados no SQLite Online. Siga os passos abaixo para configurar o ambiente:

### Configurando o Ambiente

1. **Baixando os Scripts:**

   - [Script de Criação do Banco (`schema.sql`)](../../scripts/schema.sql)
   - [Script de População de Dados (`populate.sql`)](../../scripts/populate.sql)

2. **Importando os Scripts no SQLite Online:**
   - Acesse [SQLite Online](https://sqliteonline.com/).
   - Clique em **Escolher arquivo** e selecione o arquivo `schema.sql`.
   - Clique em **Run SQL** para criar o esquema do banco de dados.
   - Em seguida, importe o arquivo `populate.sql` seguindo o mesmo processo.

### Exercícios

1. **Liste todas as cidades com mais de 1 habitante.**

   ```sql
   -- Resposta exercício 1
   ```

2. **Selecione o nome e a idade dos habitantes que moram em cidades cujo nome começa com 'S'.**

   ```sql
   -- Resposta exercício 2
   ```

3. **Encontre o nome das cidades que possuem habitantes com idade superior a 25 anos.**

   ```sql
   -- Resposta exercício 3
   ```

4. **Liste os habitantes que não estão associados a nenhuma cidade (use LEFT JOIN).**

   ```sql
   -- Resposta exercício 4
   ```

5. **Atualize a idade do habitante com nome 'Pedro' para 35 anos.**

   ```sql
   -- Resposta exercício 5
   ```

6. **Encontre o número total de habitantes por estado.**

   ```sql
   -- Resposta exercício 6
   ```

7. **Selecione o nome da cidade e a quantidade de habitantes, mostrando apenas cidades com mais de 1 habitante.**

   ```sql
   -- Resposta exercício 7
   ```

8. **Liste as cidades que têm o mesmo número de habitantes que a cidade 'São Paulo'.**

   ```sql
   -- Resposta exercício 8
   ```

9. **Encontre a cidade com o maior número de habitantes e mostre seu nome e a quantidade de habitantes.**

   ```sql
   -- Resposta exercício 9
   ```

10. **Liste o nome e a idade dos habitantes que têm a mesma profissão que 'Ana'.**

    ```sql
    -- Resposta exercício 10
    ```

11. **Selecione o estado e o número total de profissões diferentes dos habitantes desse estado.**

    ```sql
    -- Resposta exercício 11
    ```

12. **Encontre os habitantes que possuem mais de uma profissão.**

    ```sql
    -- Resposta exercício 12
    ```

### Gabarito

1.  ```sql
    SELECT cidade.nome
    FROM cidade
    JOIN habitante ON cidade.id = habitante.cidade_id
    GROUP BY cidade.nome
    HAVING COUNT(habitante.id) > 1;
    ```

2.  ```sql
    SELECT habitante.nome, habitante.idade
    FROM habitante
    JOIN cidade ON habitante.cidade_id = cidade.id
    WHERE cidade.nome LIKE 'S%';
    ```

3.  ```sql
    SELECT DISTINCT cidade.nome
    FROM cidade
    JOIN habitante ON cidade.id = habitante.cidade_id
    WHERE habitante.idade > 25;
    ```

4.  ```sql
    SELECT habitante.nome
    FROM habitante
    LEFT JOIN cidade ON habitante.cidade_id = cidade.id
    WHERE cidade.id IS NULL;
    ```

5.  ```sql
    UPDATE habitante
    SET idade = 35
    WHERE nome = 'Pedro';
    ```

6.  ```sql
    SELECT estado.nome, COUNT(habitante.id) AS total_habitantes
    FROM estado
    LEFT JOIN cidade ON estado.id = cidade.estado_id
    LEFT JOIN habitante ON cidade.id = habitante.cidade_id
    GROUP BY estado.nome;
    ```

7.  ```sql
    SELECT cidade.nome, COUNT(habitante.id) AS total_habitantes
    FROM cidade
    LEFT JOIN habitante ON cidade.id = habitante.cidade_id
    GROUP BY cidade.nome
    HAVING COUNT(habitante.id) > 1;
    ```

8.  ```sql
    SELECT c1.nome
    FROM cidade c1
    JOIN (SELECT COUNT(h.id) AS total_habitantes, c.id AS cidade_id
          FROM cidade c
          JOIN habitante h ON c.id = h.cidade_id
          WHERE c.nome = 'São Paulo'
          GROUP BY c.id) t1 ON c1.id = t1.cidade_id
    JOIN (SELECT COUNT(h.id) AS total_habitantes, c.id AS cidade_id
          FROM cidade c
          JOIN habitante h ON c.id = h.cidade_id
          GROUP BY c.id) t2 ON t1.total_habitantes = t2.total_habitantes AND c1.id <> t2.cidade_id;
    ```

9.  ```sql
    SELECT cidade.nome, COUNT(habitante.id) AS total_habitantes
    FROM cidade
    JOIN habitante ON cidade.id = habitante.cidade_id
    GROUP BY cidade.nome
    ORDER BY total_habitantes DESC
    LIMIT 1;
    ```

10. ```sql
    SELECT h2.nome, h2.idade
    FROM habitante h1
    JOIN habitante_profissao hp1 ON h1.id = hp1.habitante_id
    JOIN habitante h2 ON hp1.profissao_id = hp2.profissao_id
    WHERE h1.nome = 'Ana' AND h2.nome <> 'Ana';
    ```

11. ```sql
    SELECT estado.nome, COUNT(DISTINCT hp.profissao_id) AS total_profissoes
    FROM estado
    JOIN cidade ON estado.id = cidade.estado_id
    JOIN habitante ON cidade.id = habitante.cidade_id
    JOIN habitante_profissao hp ON habitante.id = hp.habitante_id
    GROUP BY estado.nome;
    ```

12. ```sql
    SELECT h.nome, COUNT(hp.profissao_id) AS total_profissoes
    FROM habitante h
    JOIN habitante_profissao hp ON h.id = hp.habitante_id
    GROUP BY h.id
    HAVING COUNT(hp.profissao_id) > 1;
    ```

-- Inserção de estados
INSERT INTO estado (nome) VALUES ('São Paulo');
INSERT INTO estado (nome) VALUES ('Rio de Janeiro');
INSERT INTO estado (nome) VALUES ('Minas Gerais');
INSERT INTO estado (nome) VALUES ('Bahia');
INSERT INTO estado (nome) VALUES ('Santa Catarina');

-- Inserção de cidades
INSERT INTO cidade (nome, estado_id) VALUES ('São Paulo', 1);
INSERT INTO cidade (nome, estado_id) VALUES ('Campinas', 1);
INSERT INTO cidade (nome, estado_id) VALUES ('Guarulhos', 1);
INSERT INTO cidade (nome, estado_id) VALUES ('Rio de Janeiro', 2);
INSERT INTO cidade (nome, estado_id) VALUES ('Niterói', 2);
INSERT INTO cidade (nome, estado_id) VALUES ('Belo Horizonte', 3);
INSERT INTO cidade (nome, estado_id) VALUES ('Contagem', 3);
INSERT INTO cidade (nome, estado_id) VALUES ('Salvador', 4);
INSERT INTO cidade (nome, estado_id) VALUES ('Feira de Santana', 4);
INSERT INTO cidade (nome, estado_id) VALUES ('Florianópolis', 5);
INSERT INTO cidade (nome, estado_id) VALUES ('Blumenau', 5);

-- Inserção de habitantes
INSERT INTO habitante (nome, idade, cidade_id) VALUES ('João', 25, 1);
INSERT INTO habitante (nome, idade, cidade_id) VALUES ('Maria', 30, 4);
INSERT INTO habitante (nome, idade, cidade_id) VALUES ('Pedro', 28, 1);
INSERT INTO habitante (nome, idade, cidade_id) VALUES ('Ana', 26, 5);
INSERT INTO habitante (nome, idade, cidade_id) VALUES ('José', 35, 3);
INSERT INTO habitante (nome, idade, cidade_id) VALUES ('Mariana', 22, 2);
INSERT INTO habitante (nome, idade, cidade_id) VALUES ('Carlos', 29, 7);
INSERT INTO habitante (nome, idade, cidade_id) VALUES ('Juliana', 31, 6);
INSERT INTO habitante (nome, idade, cidade_id) VALUES ('Fernando', 27, 9);
INSERT INTO habitante (nome, idade, cidade_id) VALUES ('Amanda', 24, 8);
INSERT INTO habitante (nome, idade, cidade_id) VALUES ('Roberto', 40, 10);
INSERT INTO habitante (nome, idade, cidade_id) VALUES ('Renata', 38, 11);

-- Inserção de profissões
INSERT INTO profissao (nome) VALUES ('Programador');
INSERT INTO profissao (nome) VALUES ('Engenheiro');
INSERT INTO profissao (nome) VALUES ('Médico');
INSERT INTO profissao (nome) VALUES ('Professor');
INSERT INTO profissao (nome) VALUES ('Advogado');

-- Associação de profissões aos habitantes
INSERT INTO habitante_profissao (habitante_id, profissao_id) VALUES (1, 1);  -- João é Programador
INSERT INTO habitante_profissao (habitante_id, profissao_id) VALUES (2, 3);  -- Maria é Médica
INSERT INTO habitante_profissao (habitante_id, profissao_id) VALUES (3, 2);  -- Pedro é Engenheiro
INSERT INTO habitante_profissao (habitante_id, profissao_id) VALUES (4, 4);  -- Ana é Professora
INSERT INTO habitante_profissao (habitante_id, profissao_id) VALUES (5, 2);  -- José é Engenheiro
INSERT INTO habitante_profissao (habitante_id, profissao_id) VALUES (6, 5);  -- Mariana é Advogada
INSERT INTO habitante_profissao (habitante_id, profissao_id) VALUES (7, 1);  -- Carlos é Programador
INSERT INTO habitante_profissao (habitante_id, profissao_id) VALUES (8, 4);  -- Juliana é Professora
INSERT INTO habitante_profissao (habitante_id, profissao_id) VALUES (9, 2);  -- Fernando é Engenheiro
INSERT INTO habitante_profissao (habitante_id, profissao_id) VALUES (10, 5); -- Amanda é Advogada
INSERT INTO habitante_profissao (habitante_id, profissao_id) VALUES (11, 3); -- Roberto é Médico
INSERT INTO habitante_profissao (habitante_id, profissao_id) VALUES (12, 1); -- Renata é Programadora

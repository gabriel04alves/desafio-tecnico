-- Criação da tabela estado
CREATE TABLE estado (
    id INTEGER PRIMARY KEY,
    nome TEXT
);

-- Criação da tabela cidade
CREATE TABLE cidade (
    id INTEGER PRIMARY KEY,
    nome TEXT,
    estado_id INTEGER,
    FOREIGN KEY (estado_id) REFERENCES estado(id)
);

-- Criação da tabela habitante
CREATE TABLE habitante (
    id INTEGER PRIMARY KEY,
    nome TEXT,
    idade INTEGER,
    cidade_id INTEGER,
    FOREIGN KEY (cidade_id) REFERENCES cidade(id)
);

-- Criação da tabela profissão
CREATE TABLE profissao (
    id INTEGER PRIMARY KEY,
    nome TEXT
);

-- Criação da tabela habitante_profissao (relacionamento muitos para muitos)
CREATE TABLE habitante_profissao (
    habitante_id INTEGER,
    profissao_id INTEGER,
    PRIMARY KEY (habitante_id, profissao_id),
    FOREIGN KEY (habitante_id) REFERENCES habitante(id),
    FOREIGN KEY (profissao_id) REFERENCES profissao(id)
);

CREATE DATABASE si_escola_esportes;

USE si_escola_esportes;

CREATE TABLE escolas (
    id_escola INT AUTO_INCREMENT PRIMARY KEY,
    nome_escola VARCHAR(50),
    data_cadastro DATETIME,
    situacao VARCHAR(20)
) ENGINE=InnoDB;

CREATE TABLE escolaridade (
    id_escolaridade INT AUTO_INCREMENT PRIMARY KEY,
    escolaridade VARCHAR(10)
) ENGINE=InnoDB;

CREATE TABLE categoria_pessoa (
    id_categoria_pessoa INT AUTO_INCREMENT PRIMARY KEY,
    categoria_pessoa VARCHAR(16)
) ENGINE=InnoDB;

CREATE TABLE periodos_letivos (
    id_periodo_letivo INT AUTO_INCREMENT PRIMARY KEY,
    ano_semestre DATE,
    data_inicio DATE,
    data_fim DATE,
    situacao VARCHAR(20)
) ENGINE=InnoDB;

CREATE TABLE modalidades (
    id_modalidade INT AUTO_INCREMENT PRIMARY KEY,
    modalidade VARCHAR(20),
    descricao VARCHAR(200),
    situacao VARCHAR(20)
) ENGINE=InnoDB;

CREATE TABLE pessoas (
    id_pessoa INT AUTO_INCREMENT PRIMARY KEY,
    id_categoria INT,
    id_escola INT,
    id_escolaridade INT,
    nome_completo VARCHAR(50),
    data_nascimento DATE,
    telefone VARCHAR(20),
    email VARCHAR(100),
    cpf VARCHAR(20),
    endereco VARCHAR(255),
    data_cadastro DATETIME,
    senha VARCHAR(255),
    situacao VARCHAR(20),

    CONSTRAINT fk_pessoas_categoria
        FOREIGN KEY (id_categoria)
        REFERENCES categoria_pessoa(id_categoria_pessoa),

    CONSTRAINT fk_pessoas_escola
        FOREIGN KEY (id_escola)
        REFERENCES escolas(id_escola),

    CONSTRAINT fk_pessoas_escolaridade
        FOREIGN KEY (id_escolaridade)
        REFERENCES escolaridade(id_escolaridade)
) ENGINE=InnoDB;

CREATE TABLE endereco (
    id_endereco INT AUTO_INCREMENT PRIMARY KEY,
    id_pessoa INT,
    logradouro VARCHAR(30),
    numero VARCHAR(10),
    bairro VARCHAR(30),
    cep VARCHAR(15),
    cidade VARCHAR(50),
    data_cadastro DATETIME,
    situacao VARCHAR(20),

    CONSTRAINT fk_endereco_pessoa
        FOREIGN KEY (id_pessoa)
        REFERENCES pessoas(id_pessoa)
) ENGINE=InnoDB;

CREATE TABLE turmas (
    id_turma INT AUTO_INCREMENT PRIMARY KEY,
    id_periodo_letivo INT,
    id_modalidade INT,
    nome_turma VARCHAR(30),
    horario_inicio TIME,
    horario_fim TIME,
    dia_semana VARCHAR(15),
    data_cadastro DATETIME,
    situacao VARCHAR(20),

    CONSTRAINT fk_turmas_periodo
        FOREIGN KEY (id_periodo_letivo)
        REFERENCES periodos_letivos(id_periodo_letivo),

    CONSTRAINT fk_turmas_modalidade
        FOREIGN KEY (id_modalidade)
        REFERENCES modalidades(id_modalidade)
) ENGINE=InnoDB;

CREATE TABLE matricula (
    id_matricula INT AUTO_INCREMENT PRIMARY KEY,
    id_pessoa INT,
    id_periodo_letivo INT,
    id_turma INT,
    data_matricula DATE,
    situacao VARCHAR(20),

    CONSTRAINT fk_matricula_pessoa
        FOREIGN KEY (id_pessoa)
        REFERENCES pessoas(id_pessoa),

    CONSTRAINT fk_matricula_periodo
        FOREIGN KEY (id_periodo_letivo)
        REFERENCES periodos_letivos(id_periodo_letivo),

    CONSTRAINT fk_matricula_turma
        FOREIGN KEY (id_turma)
        REFERENCES turmas(id_turma)
) ENGINE=InnoDB;

CREATE TABLE aulas (
    id_aula INT AUTO_INCREMENT PRIMARY KEY,
    id_turma INT,
    data_aula DATE,
    horario_inicio TIME,
    horario_fim TIME,
    descricao VARCHAR(200),

    CONSTRAINT fk_aulas_turma
        FOREIGN KEY (id_turma)
        REFERENCES turmas(id_turma)
) ENGINE=InnoDB;

CREATE TABLE acompanhamento (
    id_acompanhamento INT AUTO_INCREMENT PRIMARY KEY,
    id_aula INT,
    nome_psicologa VARCHAR(100),
    observacao VARCHAR(500),
    data_acompanhamento DATE,
    situacao VARCHAR(20),

    CONSTRAINT fk_acompanhamento_aula
        FOREIGN KEY (id_aula)
        REFERENCES aulas(id_aula)
) ENGINE=InnoDB;

CREATE TABLE frequencia_alunos (
    id_frequencia_alunos INT AUTO_INCREMENT PRIMARY KEY,
    id_turma INT,
    data_hora DATETIME,
    presente BOOLEAN,
    situacao VARCHAR(20),

    CONSTRAINT fk_frequencia_turma
        FOREIGN KEY (id_turma)
        REFERENCES turmas(id_turma)
) ENGINE=InnoDB;
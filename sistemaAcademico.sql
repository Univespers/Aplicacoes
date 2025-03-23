CREATE DATABASE IF NOT EXISTS sistema_academico;
USE sistema_academico;

-- Tabela Aluno
CREATE TABLE Aluno (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    emailUnivesp VARCHAR(100) UNIQUE NOT NULL,
    telefone VARCHAR(20),
    senha VARCHAR(255) NOT NULL,
    sobreMim TEXT
);

-- Tabela RedeSocial (Relacionamento 1:1 com Aluno)
CREATE TABLE RedeSocial (
    id INT AUTO_INCREMENT PRIMARY KEY,
    aluno_id INT UNIQUE,
    emailPessoal VARCHAR(100),
    linkedin VARCHAR(255),
    facebook VARCHAR(255),
    instagram VARCHAR(255),
    discord VARCHAR(255),
    github VARCHAR(255),
    reddit VARCHAR(255),
    FOREIGN KEY (aluno_id) REFERENCES Aluno(id) ON DELETE CASCADE
);

-- Tabela Curso (Relacionamento 1:N com Aluno)
CREATE TABLE Curso (
    id INT AUTO_INCREMENT PRIMARY KEY,
    aluno_id INT,
    curso VARCHAR(100) NOT NULL,
    polo VARCHAR(100),
    semestreAtual INT,
    temasInteressePesquisa TEXT,
    habilidades TEXT,
    materias TEXT,
    FOREIGN KEY (aluno_id) REFERENCES Aluno(id) ON DELETE CASCADE
);

INSERT INTO Aluno (nome, emailUnivesp, telefone, senha, sobreMim) 
VALUES ('João Silva', 'joao.silva@univesp.br', '11987654321', 'senhaSegura123', 'Sou estudante de Tecnologia da Informação na Univesp.');
INSERT INTO Aluno (nome, emailUnivesp, telefone, senha, sobreMim) 
VALUES ('Pedro Cardoso', 'pedro.cardoso@univesp.br', '11912345698', 'senhaSegura321', 'Sou estudante de Ciência de Dados na Univesp.');
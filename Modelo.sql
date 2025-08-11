
CREATE TABLE unidades_academicas (
    id_unidade INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    sigla VARCHAR(10) NOT NULL
);

-- Tabela de Cursos
CREATE TABLE cursos (
    id_curso INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    sigla VARCHAR(10),
    id_unidade INT,
    FOREIGN KEY (id_unidade) REFERENCES unidades_academicas(id_unidade)
);


CREATE TABLE alunos (
    id_aluno INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    matricula VARCHAR(20) UNIQUE NOT NULL,
    cpf VARCHAR(14) UNIQUE NOT NULL,
    data_nascimento DATE,
    id_curso INT,
    FOREIGN KEY (id_curso) REFERENCES cursos(id_curso)
);


CREATE TABLE professores (
    id_professor INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    siape VARCHAR(20) UNIQUE NOT NULL,
    titulacao VARCHAR(50),
    id_unidade INT,
    FOREIGN KEY (id_unidade) REFERENCES unidades_academicas(id_unidade)
);


CREATE TABLE disciplinas (
    id_disciplina INT PRIMARY KEY AUTO_INCREMENT,
    codigo VARCHAR(10) UNIQUE NOT NULL,
    nome VARCHAR(100) NOT NULL,
    carga_horaria INT,
    id_curso INT,
    FOREIGN KEY (id_curso) REFERENCES cursos(id_curso)
);


CREATE TABLE periodos_letivos (
    id_periodo INT PRIMARY KEY AUTO_INCREMENT,
    ano INT NOT NULL,
    semestre INT NOT NULL,
    inicio DATE,
    fim DATE
);


CREATE TABLE ofertas (
    id_oferta INT PRIMARY KEY AUTO_INCREMENT,
    id_disciplina INT,
    id_professor INT,
    id_periodo INT,
    turma VARCHAR(5),
    horario VARCHAR(50),
    sala VARCHAR(50),
    vagas INT,
    FOREIGN KEY (id_disciplina) REFERENCES disciplinas(id_disciplina),
    FOREIGN KEY (id_professor) REFERENCES professores(id_professor),
    FOREIGN KEY (id_periodo) REFERENCES periodos_letivos(id_periodo)
);


CREATE TABLE matriculas (
    id_matricula INT PRIMARY KEY AUTO_INCREMENT,
    id_aluno INT,
    id_oferta INT,
    data_matricula DATE,
    FOREIGN KEY (id_aluno) REFERENCES alunos(id_aluno),
    FOREIGN KEY (id_oferta) REFERENCES ofertas(id_oferta)
);


CREATE TABLE avaliacoes (
    id_avaliacao INT PRIMARY KEY AUTO_INCREMENT,
    id_matricula INT,
    tipo VARCHAR(50), -- Ex: Prova 1, Prova Final, Trabalho
    nota DECIMAL(4,2),
    data_avaliacao DATE,
    FOREIGN KEY (id_matricula) REFERENCES matriculas(id_matricula)
);



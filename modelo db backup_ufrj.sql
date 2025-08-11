CREATE TABLE bkp_alunos (
    id_backup INT PRIMARY KEY AUTO_INCREMENT,
    id_aluno INT,
    nome VARCHAR(100),
    matricula VARCHAR(20),
    cpf VARCHAR(14),
    data_nascimento DATE,
    id_curso INT,
    data_evento DATETIME,
    tipo_evento ENUM('INSERT','UPDATE','DELETE')
);

CREATE TABLE bkp_avaliacoes (
    id_backup INT PRIMARY KEY AUTO_INCREMENT,
    id_avaliacao INT,
    id_matricula INT,
    tipo VARCHAR(50),
    nota DECIMAL(4,2),
    data_avaliacao DATE,
    data_evento DATETIME,
    tipo_evento ENUM('INSERT','UPDATE','DELETE')
);

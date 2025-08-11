-- 1. Unidades Acadêmicas
INSERT INTO unidades_academicas (nome, sigla) VALUES
('Instituto de Matemática', 'IM'),
('Escola Politécnica', 'POLI'),
('Instituto de Letras', 'ILE'),
('Faculdade de Educação', 'FE');

-- 2. Cursos
INSERT INTO cursos (nome, sigla, id_unidade) VALUES
('Engenharia de Computação', 'ECOMP', 2),
('Matemática', 'MAT', 1),
('Letras - Português', 'LET-POR', 3),
('Pedagogia', 'PED', 4);

-- 3. Alunos
INSERT INTO alunos (nome, matricula, cpf, data_nascimento, id_curso) VALUES
('Ana Souza', '2023001', '123.456.789-00', '2003-05-10', 1),
('Bruno Lima', '2023002', '987.654.321-00', '2002-08-21', 1),
('Carla Mendes', '2023003', '456.789.123-00', '2001-12-15', 2),
('Diego Santos', '2023004', '321.654.987-00', '2000-03-30', 3);

-- 4. Professores
INSERT INTO professores (nome, siape, titulacao, id_unidade) VALUES
('Marcos Pereira', 'SIAPE001', 'Doutor', 2),
('Fernanda Rocha', 'SIAPE002', 'Mestre', 1),
('Ricardo Gomes', 'SIAPE003', 'Doutor', 3),
('Juliana Costa', 'SIAPE004', 'Especialista', 4);

-- 5. Disciplinas
INSERT INTO disciplinas (codigo, nome, carga_horaria, id_curso) VALUES
('COMP101', 'Programação I', 60, 1),
('COMP102', 'Banco de Dados', 60, 1),
('MAT101', 'Cálculo I', 60, 2),
('LET101', 'Literatura Brasileira', 60, 3),
('PED101', 'Didática', 60, 4);

-- 6. Períodos Letivos
INSERT INTO periodos_letivos (ano, semestre, inicio, fim) VALUES
(2023, 1, '2023-03-01', '2023-07-15'),
(2023, 2, '2023-08-01', '2023-12-15');

-- 7. Ofertas
INSERT INTO ofertas (id_disciplina, id_professor, id_periodo, turma, horario, sala, vagas) VALUES
(1, 1, 1, 'A', 'Seg-Qua 08:00-10:00', 'Lab 101', 30),
(2, 1, 1, 'B', 'Ter-Qua 10:00-12:00', 'Lab 102', 25),
(3, 2, 1, 'A', 'Seg-Qua 14:00-16:00', 'Sala 201', 40),
(4, 3, 2, 'A', 'Ter-Qua 08:00-10:00', 'Sala 301', 35),
(5, 4, 2, 'A', 'Qui-Sex 10:00-12:00', 'Sala 401', 30);

-- 8. Matrículas
INSERT INTO matriculas (id_aluno, id_oferta, data_matricula) VALUES
(1, 1, '2023-02-20'),
(1, 2, '2023-02-21'),
(2, 1, '2023-02-22'),
(3, 3, '2023-02-23'),
(4, 4, '2023-07-25');

-- 9. Avaliações
INSERT INTO avaliacoes (id_matricula, tipo, nota, data_avaliacao) VALUES
(1, 'Prova 1', 8.5, '2023-04-10'),
(1, 'Trabalho', 9.0, '2023-05-20'),
(2, 'Prova 1', 7.0, '2023-04-15'),
(3, 'Prova 1', 6.5, '2023-04-12'),
(4, 'Prova 1', 9.0, '2023-09-10');

database backup_ufrj


-- BACKUP delete usuarios 
DELIMITER //
CREATE TRIGGER trg_bkp_aluno_delete
BEFORE DELETE ON alunos
FOR EACH ROW
BEGIN
    INSERT INTO backup_sistema.bkp_alunos (id_aluno, nome, matricula, cpf, data_nascimento, id_curso, data_evento, tipo_evento)
    VALUES (OLD.id_aluno, OLD.nome, OLD.matricula, OLD.cpf, OLD.data_nascimento, OLD.id_curso, NOW(), 'DELETE');
END //
DELIMITER ;

-- BACKUP UPDATE AVALIAÇÕES 
DELIMITER //
CREATE TRIGGER trg_bkp_avaliacao_update
BEFORE UPDATE ON avaliacoes
FOR EACH ROW
BEGIN
    INSERT INTO backup_sistema.bkp_avaliacoes (id_avaliacao, id_matricula, tipo, nota, data_avaliacao, data_evento, tipo_evento)
    VALUES (OLD.id_avaliacao, OLD.id_matricula, OLD.tipo, OLD.nota, OLD.data_avaliacao, NOW(), 'UPDATE');
END //
DELIMITER ;

-- BACKUP DELETE AVALIAÇÃO 
DELIMITER //
CREATE TRIGGER trg_bkp_avaliacao_delete
BEFORE DELETE ON avaliacoes
FOR EACH ROW
BEGIN
    INSERT INTO backup_sistema.bkp_avaliacoes (id_avaliacao, id_matricula, tipo, nota, data_avaliacao, data_evento, tipo_evento)
    VALUES (OLD.id_avaliacao, OLD.id_matricula, OLD.tipo, OLD.nota, OLD.data_avaliacao, NOW(), 'DELETE');
END //
DELIMITER ;

-- BACKUP UPDATE ALUNO 
DELIMITER //
CREATE TRIGGER trg_bkp_aluno_update
BEFORE UPDATE ON alunos
FOR EACH ROW
BEGIN
    INSERT INTO backup_ufrj.bkp_alunos 
        (id_aluno, nome, matricula, cpf, data_nascimento, id_curso, data_evento, tipo_evento)
    VALUES 
        (OLD.id_aluno, OLD.nome, OLD.matricula, OLD.cpf, OLD.data_nascimento, OLD.id_curso, NOW(), 'UPDATE');
END //
DELIMITER ;

-- Ofertas e Disciplinas 
SELECT 
    o.turma AS ofertas, 
    o.horario,
    o.sala, 
    o.vagas,
	
    d.nome AS disciplina,
    d.carga_horaria 
FROM ofertas AS o 
JOIN disciplinas AS d
    ON o.id_disciplina = d.id_disciplina
WHERE d.carga_horaria > 20
ORDER BY o.turma;



-- alunos e seus respectivos cursos
select 
    a.id_aluno,
    a.nome as alunos,
	c.nome as curso
	FROM alunos AS a
    JOIN cursos AS C
	on a.id_aluno = c.id_curso
	order by a.nome;


-- Notas de um aluno especifico por disciplina 	
select 
    d.nome as disciplina,
	av.tipo as avaliacoes,
	av.nota 
	FROM avaliacoes AS av
	JOIN matriculas m 
	ON av.id_matricula = m.id_matricula
	JOIN ofertas AS o
	ON m.id_oferta = o.id_oferta
	JOIN disciplinas AS d
	ON o.id_disciplina = d.id_disciplina
	WHERE m.id_aluno = 1
	ORDER BY d.nome, av.data_avaliacao;
	

-- Médias de notas por disciplina
select 
    d.nome as disciplina,
	ROUND(avg(av.nota), 2) AS média
	FROM avaliacoes AS av
	JOIN matriculas AS m
	ON av.id_matricula = m.id_matricula
	JOIN ofertas AS o 
	ON m.id_oferta = o.id_oferta 
	JOIN disciplinas AS d
	ON o.id_disciplina = d.id_disciplina 
	GROUP BY d.nome
	ORDER BY d.nome;
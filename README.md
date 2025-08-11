<p align="center">
  <img src="./972c67f5-43e1-4646-8b8c-245944607596.png" alt="Brasão UFRJ" width="150"/>
</p>

# Sistema Acadêmico - Projeto MySQL UFRJ Style

---

## Universidade Federal do Rio de Janeiro (UFRJ)  
**Instituto de Computação** — Banco de Dados e Sistemas de Informação  

---

## Apresentação

Este projeto representa uma implementação acadêmica de um sistema de gestão universitária em MySQL, inspirado nos princípios e na arquitetura adotados pela UFRJ. A modelagem abrange as principais entidades e suas relações no contexto da administração acadêmica, contemplando desde unidades organizacionais até processos fundamentais como matrículas e avaliações.

Com foco em integridade, auditabilidade e facilidade operacional, o sistema utiliza recursos avançados do MySQL, incluindo triggers para backup automático, procedures para automatização de processos e views para consultas otimizadas, conferindo robustez e confiabilidade à gestão dos dados.

---

## Estrutura do Banco de Dados

- **unidades_academicas:** Representa os órgãos acadêmicos da UFRJ, como o Instituto de Matemática (IM), Poli, entre outros.
- **cursos:** Catalogação dos cursos oferecidos, vinculados às unidades acadêmicas.
- **alunos:** Cadastro detalhado dos estudantes.
- **professores:** Corpo docente associado às unidades.
- **disciplinas:** Disciplinas curriculares estruturadas por curso.
- **periodos_letivos:** Definição dos ciclos acadêmicos (anos, semestres).
- **ofertas:** Disponibilização das disciplinas em períodos específicos, turmas, professores e vagas.
- **matriculas:** Registro das inscrições dos alunos nas ofertas.
- **avaliacoes:** Armazenamento das avaliações e notas vinculadas às matrículas.

---

## Banco de Backup

Para garantir a segurança e histórico dos dados, foi criado um banco de backup (`backup_ufrj`), que armazena logs de alterações via triggers, permitindo auditoria e recuperação de informações.

---

## Funcionalidades Desenvolvidas

- **Triggers** para captura automática de operações de inserção, atualização e exclusão, alimentando o banco de backup.
- **Procedures** para processos complexos, como verificação de vagas antes da matrícula.
- **Functions** para cálculos acadêmicos, como médias ponderadas.
- **Views** para facilitar consultas frequentes, reduzindo complexidade.
- **Eventos** programados para automação de tarefas periódicas.

---

## Utilização

1. Criação dos bancos e tabelas na ordem correta para manter as relações.
2. Inserção dos dados iniciais (unidades, cursos, alunos, etc.).
3. Configuração do banco `backup_ufrj` com as tabelas de histórico.
4. Implementação das triggers para backup automático.
5. Execução das procedures e funções para operações cotidianas.
6. Utilização de views para consultas e extração de relatórios.
7. Integração com ferramentas externas (Power BI, Tableau) para dashboards e análises.

---

## Exemplo de Consulta Acadêmica

```sql
SELECT a.nome AS aluno, c.nome AS curso, d.nome AS disciplina, av.nota
FROM alunos a
JOIN matriculas m ON a.id_aluno = m.id_aluno
JOIN ofertas o ON m.id_oferta = o.id_oferta
JOIN disciplinas d ON o.id_disciplina = d.id_disciplina
JOIN avaliacoes av ON m.id_matricula = av.id_matricula
WHERE a.id_aluno = 1;

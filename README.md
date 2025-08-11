---

# Sistema Acadêmico - Projeto MySQL UFRJ Style

## Descrição

Este projeto consiste em um sistema acadêmico simplificado desenvolvido em MySQL, inspirado na estrutura utilizada por universidades como a UFRJ. O banco de dados modela as principais entidades e relações do ambiente acadêmico, incluindo unidades acadêmicas, cursos, alunos, professores, disciplinas, períodos letivos, ofertas, matrículas e avaliações.

Além disso, o projeto inclui mecanismos para backup automático por meio de triggers, procedimentos armazenados para facilitar operações comuns e uma base para relatórios e dashboards.

---

## Estrutura do Banco de Dados

### Tabelas Principais

* **unidades\_academicas:** Unidades organizacionais da universidade (ex: IM, POLI).
* **cursos:** Cursos oferecidos, vinculados a unidades acadêmicas.
* **alunos:** Dados pessoais dos alunos, vinculados a cursos.
* **professores:** Professores vinculados a unidades acadêmicas.
* **disciplinas:** Disciplinas relacionadas aos cursos.
* **periodos\_letivos:** Informações sobre períodos acadêmicos (ano, semestre, datas).
* **ofertas:** Ofertas de disciplinas em determinados períodos, com turma, professor e vagas.
* **matriculas:** Matrículas dos alunos nas ofertas.
* **avaliacoes:** Avaliações e notas associadas às matrículas.

### Banco de Backup

* **backup\_ufrj:** Banco separado para armazenar históricos de alterações e exclusões através de triggers, garantindo integridade e auditabilidade.

---

## Funcionalidades Implementadas

* **Triggers:** Para backup automático em operações de INSERT, UPDATE e DELETE nas tabelas críticas.
* **Procedures:** Automatização de processos como matrícula de alunos com verificação de vagas.
* **Functions:** Cálculos específicos, como média das notas dos alunos.
* **Views:** Visões pré-definidas para facilitar consultas comuns.
* **Eventos:** Agendamento de tarefas automáticas, como controle de matrículas.

---

## Como Usar

1. **Criar banco principal e tabelas:**
   Execute os scripts SQL para criar todas as tabelas na ordem correta, garantindo as relações de chave estrangeira.

2. **Popular dados iniciais:**
   Utilize os scripts de inserção fornecidos para popular unidades, cursos, alunos, professores, disciplinas, períodos, ofertas, matrículas e avaliações.

3. **Criar banco de backup e tabelas de histórico:**
   Execute o script para criar o banco `backup_ufrj` e suas tabelas de backup.

4. **Criar triggers:**
   No banco principal, crie as triggers que inserem automaticamente dados no banco de backup ao ocorrerem alterações.

5. **Executar procedimentos armazenados e funções:**
   Utilize procedures para matrículas e outras operações, e funções para cálculos.

6. **Consultar e criar relatórios:**
   Utilize as views para facilitar consultas ou conecte ferramentas externas (Power BI, Tableau, etc.) para dashboards.

---

## Exemplo de Consulta

```sql
SELECT a.nome AS aluno, c.nome AS curso, d.nome AS disciplina, av.nota
FROM alunos a
JOIN matriculas m ON a.id_aluno = m.id_aluno
JOIN ofertas o ON m.id_oferta = o.id_oferta
JOIN disciplinas d ON o.id_disciplina = d.id_disciplina
JOIN avaliacoes av ON m.id_matricula = av.id_matricula
WHERE a.id_aluno = 1;
```

---

## Tecnologias Utilizadas

* MySQL 8.0+
* SQL procedural (Triggers, Procedures, Functions)
* Ferramentas externas sugeridas para análise e visualização (Power BI, Tableau, etc.)

---

## Próximos Passos

* Implementar controle de acesso com usuários e permissões específicas.
* Desenvolver interface web para interação com o banco.
* Expandir o histórico com logs detalhados de usuários.
* Automatizar relatórios periódicos via eventos agendados.

---

## Autor

Isaque Silva de Jesus



-- Questão 01
select pessoa.nome, count(*)
from pessoa join professor on professor.matricula_professor = pessoa.matricula_pessoa
join ministra on ministra.matricula_professor = professor.matricula_professor
join turma on turma.codigo_disciplina = ministra.codigo_disciplina
and turma.codigo_curso = ministra.codigo_curso
and turma.ano_semestre = ministra.ano_semestre
join disciplina on disciplina.codigo_disciplina = turma.codigo_disciplina
group by pessoa.nome;


-- Questão 02
select pessoa.nome, count(*)
from aluno_turma join aluno on aluno_turma.matricula_aluno = aluno.matricula_aluno
join pessoa on pessoa.matricula_pessoa = aluno.matricula_aluno
join turma on turma.ano_semestre = aluno_turma.ano_semestre
and turma.codigo_disciplina = aluno_turma.codigo_disciplina
and turma.codigo_curso = aluno_turma.codigo_curso
group by pessoa.nome;

-- Questão 03
select pessoa.nome
from pessoa join professor on professor.matricula_professor = pessoa.matricula_pessoa
where pessoa.nome not in (select pessoa.nome
						 from pessoa join ministra on ministra.matricula_professor = pessoa.matricula_pessoa
						 where ministra.ano_semestre = '2009.1');




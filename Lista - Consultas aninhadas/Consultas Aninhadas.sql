-- Questão 01

select pessoa.nome, (select count(*) from ministra where ministra.matricula_professor = pessoa.matricula_pessoa) as x
from pessoa join professor on pessoa.matricula_pessoa = professor.matricula_professor
order by 2 desc;


select pessoa.nome,ministra.ano_semestre,count(ministra.ano_semestre)
from pessoa join professor on pessoa.matricula_pessoa = professor.matricula_professor
join ministra on ministra.matricula_professor = pessoa.matricula_pessoa
group by 1,2;





-- Questão 02

select pessoa.nome,(select count(*) from aluno_turma where pessoa.matricula_pessoa = aluno_turma.matricula_aluno)
from pessoa join aluno on aluno.matricula_aluno = pessoa.matricula_pessoa
group by pessoa.nome, 2
order by 2 desc;

-- Questão 03

select pessoa.nome
from pessoa join professor on pessoa.matricula_pessoa = professor.matricula_professor
where pessoa.matricula_pessoa not in (select professor.matricula_professor from professor join ministra on professor.matricula_professor = ministra.matricula_professor
									  where ministra.ano_semestre = '2009.1')
order by 1;

-- Questão 04
select pessoa.nome
from pessoa join aluno on pessoa.matricula_pessoa = aluno.matricula_aluno
where aluno.matricula_aluno not in (select aluno.matricula_aluno 
								   from aluno join aluno_turma on aluno.matricula_aluno = aluno_turma.matricula_aluno
								   join turma on turma.codigo_disciplina = aluno_turma.codigo_disciplina
								   and turma.codigo_curso = aluno_turma.codigo_curso
								   and turma.ano_semestre = aluno_turma.ano_semestre
								   join disciplina on turma.codigo_disciplina = disciplina.codigo_disciplina
								   where disciplina.ementa = 'E2')
order by 1;

-- Questão 05
select pessoa.nome 
from pessoa join professor on professor.matricula_professor = pessoa.matricula_pessoa
where (select count(*)
	  from ministra
	  where ministra.matricula_professor = pessoa.matricula_pessoa and ministra.ano_semestre = '2009.2') > 2;
	  

-- Questão 06
select pessoa.nome, pessoa.matricula_pessoa
from pessoa join professor on pessoa.matricula_pessoa = professor.matricula_professor
where pessoa.matricula_pessoa in (select ministra.matricula_professor
								 from ministra
								 group by ministra.matricula_professor
								 order by count(*) desc
								 limit 3);
								 
								 
-- Questão 07
(select pessoa.nome
from pessoa join aluno on aluno.matricula_aluno = pessoa.matricula_pessoa
join curso on aluno.codigo_curso = curso.codigo_curso 
where curso.nome like '%Computacao%')
except 
(select pessoa.nome 
from pessoa join aluno on aluno.matricula_aluno = pessoa.matricula_pessoa
join curso on aluno.codigo_curso = curso.codigo_curso
join aluno_turma on aluno_turma.matricula_aluno = aluno.matricula_aluno
join turma on turma.ano_semestre = aluno_turma.ano_semestre 
and turma.codigo_disciplina = aluno_turma.codigo_disciplina
and turma.codigo_curso = curso.codigo_curso
join disciplina on disciplina.codigo_disciplina = turma.codigo_disciplina 
where curso.nome like '%Computacao%' and disciplina.ementa = 'E1');


-- Questão 08
select pessoa.nome
from pessoa join aluno on aluno.matricula_aluno = pessoa.matricula_pessoa
where aluno.matricula_aluno in (select aluno.matricula_aluno
							   from aluno join aluno_turma on aluno_turma.matricula_aluno = aluno.matricula_aluno
							   join turma on turma.codigo_disciplina = aluno_turma.codigo_disciplina
							   and turma.codigo_curso = aluno_turma.codigo_curso
							   and turma.ano_semestre = aluno_turma.ano_semestre
							   join disciplina on disciplina.codigo_disciplina = turma.codigo_disciplina
							   join professor on professor.matricula_professor = disciplina.matricula_professor
							   join pessoa on pessoa.matricula_pessoa = professor.matricula_professor
							   join curso on curso.codigo_curso = aluno.codigo_curso
							   where pessoa.nome = 'Jose Alcantara' and curso.nome = 'Sistemas de Informacao');


-- Questão 09
select distinct pessoa.nome,curso.nome,(select MIN(prova.nota) from prova where aluno.matricula_aluno = prova.matricula_aluno),(select MAX(prova.nota) from prova where aluno.matricula_aluno = prova.matricula_aluno),(select round(avg(prova.nota),2) from prova where aluno.matricula_aluno = prova.matricula_aluno)
from pessoa, aluno, curso, prova
where pessoa.matricula_pessoa = aluno.matricula_aluno and curso.codigo_curso = aluno.codigo_curso
order by 1;


-- Questão 10

select distinct pessoa.nome,curso.nome,(select round(avg(prova.nota),2) from prova where aluno.matricula_aluno = prova.matricula_aluno)
from pessoa, aluno, curso, prova
where pessoa.matricula_pessoa = aluno.matricula_aluno and curso.codigo_curso = aluno.codigo_curso
order by 3 desc
limit 5;
	  
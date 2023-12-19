-- Quais idosos não tem responsável? -> Feito por Antonio Erick
create view idoso_sem_responsavel as
select idoso.nome as nome_sem_resp,idoso.cpf as cpf_sem_resp
from idoso
where cpf not in (select idoso.cpf
				 from idoso join precisa on idoso.cpf = precisa.cpf_idoso
				 join responsavel on responsavel.cpf = precisa.cpf_responsavel);

-- Quantidade de idosos por Enfermeiro -> Feito por João Pedro
create view Idoso_por_enf as select f.nome as nome_enfermeiro, count(a.cpf_idoso) as idosos
                            from acompanha a
                            join enfermeiro e on a.coren = e.coren
                            join funcionario f on e.cpf_funcionario = f.cpf
                        	group by f.nome;

-- Quantidade de fisioterapeutas por idoso -> Feito por Victor Emanuel
create view fisio_por_idoso as 
select i.nome as idoso, count(c.crefito) as fisioterapeutas
from consulta c
join idoso i on c.cpf_idoso = i.cpf
group by i.nome;
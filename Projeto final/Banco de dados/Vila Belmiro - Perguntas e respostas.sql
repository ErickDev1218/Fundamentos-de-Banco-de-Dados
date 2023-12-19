-- Quantos idosos estão no banco de dados?
select count(*)
from idoso;

-- Quais são os idosos e seus respectivos responsáveis?
select idoso.nome, responsavel.nome
from idoso, responsavel, precisa
where precisa.cpf_idoso = idoso.cpf and responsavel.cpf = precisa.cpf_responsavel;

-- Quais enfermeiros atendem pelo menos 1 idoso?
select funcionario.nome
from enfermeiro,funcionario, acompanha
where funcionario.cpf = enfermeiro.cpf_funcionario and acompanha.coren = enfermeiro.coren and acompanha.cpf_idoso is not null;

-- Quem são os fisioterapeutos em ordem contraria a alfabetica?
select funcionario.nome as y
from funcionario join fisioterapeuta on fisioterapeuta.cpf_funcionario = funcionario.cpf
order by y desc;

-- Quantos contatos já foram feitos por fisioterapeutas?
select count(comunica.ata_contato)
from fisioterapeuta, funcionario, comunica, responsavel
where fisioterapeuta.cpf_funcionario = funcionario.cpf and comunica.cpf_funcionario = fisioterapeuta.cpf_funcionario and comunica.cpf_responsavel is not null;

-- Qual o coren e o nome do enfermeiro acompanhou o Antonio Erick?
select enfermeiro.coren, funcionario.nome
from funcionario,idoso, enfermeiro join acompanha on acompanha.coren = enfermeiro.coren
where acompanha.cpf_idoso = idoso.cpf and idoso.nome like '%Erick%' and funcionario.cpf = enfermeiro.cpf_funcionario;

-- Quem sao os enfermeiros em ordem alfabetica ?
select funcionario.nome as x
from funcionario join enfermeiro on funcionario.cpf = enfermeiro.cpf_funcionario
order by x asc;
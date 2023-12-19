select departamento.nome, count(empregado) as emp, avg()
from
group by(empregado.gerencia_cod_dep)

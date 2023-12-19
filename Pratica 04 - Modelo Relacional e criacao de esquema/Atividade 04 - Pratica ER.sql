/*--------------- PRIMEIRA QUESTÃO ---------------*/
create table Estudante(numero int primary key not null,
					  pnome varchar(50),
					  sobrenome varchar(50),
					  cidade varchar(50),
					  cep int,
					  estado varchar(50),
					  rua varchar(50),
					  num_casa int,
					  nascDate date,
					  sexo char(1),
					  classe varchar(50),
					  progGrad varchar(50),
					  num_seg int unique);
					  
create table Departamento(nome varchar(50) primary key,
						 codigo int unique,
						 num_escritorio int,
						 telefone varchar(50),
						 faculdade varchar(50));
						 
create table Curso(num_curso int primary key,
				  nome_curso varchar(50),
				  descricao varchar(100),
				  horas int,
				  nivel varchar(50),
				  nome_dep varchar(50),
				  foreign key(nome_dep) references Departamento (nome) );
				  
create table Estudante_telefone(telefone varchar(50) primary key,
							   num_estudante int,
							   foreign key (num_estudante) references Estudante (numero));
							   
create table Secao(numero_secao int primary key,
				  numero_curso int,
				  instrutor varchar(50),
				  semestre int,
				  ano int,
				  foreign key (numero_curso) references Curso(num_curso));
				  
create table Participa(nome_dep varchar(50),
					  numero_aluno int,
					  prioridade int primary key,
					  foreign key (nome_dep) references Departamento(nome),
					  foreign key (numero_aluno) references Estudante(numero));
					  
create table Relatorio_notas(num_estudante int,
							numero_secao int,
							numero_curso int,
							nota_numerico int,
							foreign key (num_estudante) references Estudante(numero),
							foreign key (numero_secao) references Secao(numero_secao),
							foreign key (numero_curso) references Curso(num_curso));
							
							
/*--------------- SEGUNDA QUESTÃO ---------------*/			  
insert into Estudante(numero,pnome,sobrenome,cidade,cep,estado,rua,num_casa,nascDate,sexo,classe,progGrad,num_seg)
values (1,'Erick','Freitas','Quixadá',688,'Ceará','Rua 04',50,'1999-04-23','M','Computação','Ciência da computação',123456);
							   
insert into Estudante_telefone(telefone,num_estudante)
values ('(88) 9 9682-0597',1);
						 
insert into Departamento(nome,codigo,num_escritorio,telefone,faculdade)
values ('Departamento de ciência da computação',542631,333,'(88) 5555-3333','Universidade Federal do Ceará');
				  
insert into Curso(num_curso,nome_curso,descricao,horas,nivel,nome_dep)
values (1218,'Ciência da computação','Curso de formacao em CC',4192,'Bacharel','Departamento de ciência da computação');

insert into Secao(numero_secao,numero_curso,instrutor,semestre,ano)
values (331,1218,'Lívia',4,2023);

insert into Relatorio_notas(num_estudante,numero_secao,numero_curso,nota_numerico)
values (1,331,1218,10);

insert into Participa(nome_dep,numero_aluno,prioridade)
values ('Departamento de ciência da computação',1,0);

update Estudante 
set cidade = 'Fortaleza'
where numero = 1;

/*--------------- TERCEIRA QUESTÃO ---------------*/

insert into Estudante(numero,pnome,sobrenome,cidade,cep,estado,rua,num_casa,nascDate,sexo,classe,progGrad,num_seg)	
values (2,'Kartylla','Araújo','Quixadá',555,'Ceará','Rua Juarez',649,'13-03-1996','F','Enfermagem','Curso de estética',123456);

/*
Questão 3.1
O código acima infrige uma restrição de unicidade, pois o atributo num_seg deve ser único e na tabela estudante
já existe alguém com o num_seg 123456, portanto, um atributo único NÃO pode ser repetir em nenhuma tupla.
Desta forma o SGBD notifica que duplicar o valor da chave viola a restrição de unicidade.
*/
							
update Participa
set nome_dep = 'Gera erro'
where prioridade = 0;

/*
Questão 3.2
O código acima infrige uma restrição de referência, pois na tabela Departamento não existe nenhum
departamento com o atributo nome = Gera Erro. Desta forma, a FK ficaria sem uma PK de referência.
O SGBD retorna um erro impedindo a ação e informando a quebra de restrição.
*/
							
delete from Estudante
where numero = 1;

/*
Questão 3.3
O código acima infrige uma restrição de referência, pois a PK de estudante está sendo usada por várias
FK de outras tabelas, logo, se eu excluisse dessa forma, levaria a inconsistencia de dados nas outras
tabelas.
O SGBD informa um erro, dizendo que a tupla é referênciada por várias outras tabelas e isso violará
a restrição de FK e cancela a ação.
*/
							
							
							
							
							
							
							
							
							
							
							
							
							
							
							
							
							
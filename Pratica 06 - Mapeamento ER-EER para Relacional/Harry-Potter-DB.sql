create table Personagem(nome varchar(50) primary key);

create table Professor(nome_personagem varchar(50), foreign key (nome_personagem) references Personagem(nome) on delete cascade);

create table Aluno(nome_personagem varchar(50) primary key, ano_escolar date, foreign key (nome_personagem) references Personagem(nome));

alter table Professor
add constraint Professor_pk
primary key (nome_personagem);

create table Bruxo_das_trevas(nome_personagem varchar(50) primary key, foreign key (nome_personagem) references Personagem(nome));

create table Habilidade(tipo varchar(50) primary key);

--Atributo multivalorado
create table Competencia(nome_professor varchar(50) primary key
						 ,comp1 varchar(50),
						 comp2 varchar(50),
						 comp3 varchar(50),
						 comp4 varchar(50),
						foreign key (nome_professor) references Professor(nome_personagem));
						
create table Prof_ens_hab(tipo_habilidade varchar(50),
						 nome_professor varchar(50),
						 foreign key (tipo_habilidade) references Habilidade(tipo),
						 foreign key (nome_professor) references Professor(nome_personagem));
						 
create table Pers_usa_hab(nome_personagem varchar(50),
						 tipo_habilidade varchar (50),
						 foreign key (nome_personagem) references Personagem (nome),
						 foreign key (tipo_habilidade) references Habilidade(tipo));
						 
create table Pers_fam_Pers(nome_personagem1 varchar(50),
						  nome_personagem2 varchar(50),
						  foreign key (nome_personagem1) references Personagem(nome) on delete cascade,
						  foreign key (nome_personagem2) references Personagem(nome) on delete cascade);
						  
						  
						

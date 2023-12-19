CREATE TABLE funcionario
(
  nome VARCHAR(100) NOT NULL,
  cpf VARCHAR(11) NOT NULL,
  rg VARCHAR(15) NOT NULL,
  carteira_trab VARCHAR(15) NOT NULL,
  rua VARCHAR(50) NOT NULL,
  numero INT NOT NULL,
  cep INT NOT NULL,
  cidade VARCHAR(50) NOT NULL,
  PRIMARY KEY (cpf)
);

CREATE TABLE enfermeiro
(
  coren VARCHAR(9) NOT NULL,
  cpf_funcionario VARCHAR(11) NOT NULL,
  PRIMARY KEY (coren),
  FOREIGN KEY (cpf_funcionario) REFERENCES funcionario(cpf) on update cascade on delete cascade
);

CREATE TABLE fisioterapeuta
(
  crefito VARCHAR(15) NOT NULL,
  cpf_funcionario VARCHAR(11) NOT NULL,
  PRIMARY KEY (crefito),
  FOREIGN KEY (cpf_funcionario) REFERENCES funcionario(cpf) on update cascade on delete cascade
);

CREATE TABLE responsavel
(
  nome VARCHAR(100) NOT NULL,
  cpf VARCHAR(11) NOT NULL,
  rg VARCHAR(15) NOT NULL,
  rua VARCHAR(50) NOT NULL,
  cep INT NOT NULL,
  numero INT NOT NULL,
  cidade VARCHAR(50) NOT NULL,
  ocupacao VARCHAR(30) NOT NULL,
  grau_familiaridade VARCHAR(20) NOT NULL,
  PRIMARY KEY (cpf)
);

CREATE TABLE idoso
(
  nome VARCHAR(100) NOT NULL,
  cpf VARCHAR(11) NOT NULL,
  rg_idoso VARCHAR(15) NOT NULL,
  PRIMARY KEY (cpf)
);

CREATE TABLE precisa
(
  cpf_idoso VARCHAR(11) NOT NULL,
  cpf_responsavel VARCHAR(11) NOT NULL,
  PRIMARY KEY (cpf_idoso, cpf_responsavel),
  FOREIGN KEY (cpf_idoso) REFERENCES idoso(cpf) on update cascade,
  FOREIGN KEY (cpf_responsavel) REFERENCES responsavel(cpf) on update cascade
);

CREATE TABLE acompanha
(
  data_acompanhamento VARCHAR(10) NOT NULL,
  evolucao_enf VARCHAR(1000) NOT NULL,
  cpf_idoso VARCHAR(11) NOT NULL,
  coren VARCHAR(9) NOT NULL,
  PRIMARY KEY (cpf_idoso, coren),
  FOREIGN KEY (cpf_idoso) REFERENCES idoso(cpf) on update cascade,
  FOREIGN KEY (coren) REFERENCES enfermeiro(coren) on update cascade on delete cascade
);

CREATE TABLE consulta
(
  data_consulta VARCHAR(10) NOT NULL,
  evolucao_fisio VARCHAR(1000) NOT NULL,
  cpf_idoso VARCHAR(11) NOT NULL,
  crefito VARCHAR(15) NOT NULL,
  PRIMARY KEY (cpf_idoso, crefito),
  FOREIGN KEY (cpf_idoso) REFERENCES idoso(cpf) on update cascade,
  FOREIGN KEY (crefito) REFERENCES fisioterapeuta(crefito) on update cascade on delete cascade
);

CREATE TABLE responsavel_tel
(
  telefone_pessoal INT NOT NULL,
  telefone_fixo INT NOT NULL,
  telefone_comercial INT NOT NULL,
  cpf_responsavel VARCHAR(11) NOT NULL,
  PRIMARY KEY (cpf_responsavel),
  FOREIGN KEY (cpf_responsavel) REFERENCES responsavel(cpf)
);

CREATE TABLE comunica
(
  ata_contato VARCHAR(1000) NOT NULL,
  cpf_responsavel VARCHAR(11) NOT NULL,
  cpf_funcionario VARCHAR(11) NOT NULL,
  PRIMARY KEY (cpf_responsavel, cpf_funcionario),
  FOREIGN KEY (cpf_responsavel) REFERENCES responsavel(cpf) on update cascade on delete cascade,
  FOREIGN KEY (cpf_funcionario) REFERENCES funcionario(cpf) on update cascade on delete cascade
);
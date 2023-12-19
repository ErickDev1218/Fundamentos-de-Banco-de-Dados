--Povoando Funcionário
INSERT INTO funcionario (nome, cpf, rg, carteira_trab, rua, numero, cep, cidade) VALUES 
('Ana Silva', '12345678901', '123456', 'CT123', 'Rua das Flores', 101, 12345, 'São Paulo'),
('Carlos Oliveira', '23456789012', '234567', 'CT234', 'Avenida Brasil', 202, 23456, 'Rio de Janeiro'),
('Fernanda Santos', '34567890123', '345678', 'CT345', 'Rua dos Coqueiros', 303, 34567, 'Salvador'),
('Ricardo Souza', '45678901234', '456789', 'CT456', 'Avenida Paulista', 404, 45678, 'São Paulo'),
('Juliana Lima', '56789012345', '567890', 'CT567', 'Rua da Paz', 505, 56789, 'Curitiba'),
('Lucas Pereira', '67890123456', '678901', 'CT678', 'Avenida Atlântica', 606, 67890, 'Fortaleza'),
('Amanda Almeida', '78901234567', '789012', 'CT789', 'Rua do Carmo', 707, 78901, 'Recife'),
('Gabriel Costa', '89012345678', '890123', 'CT890', 'Avenida Beira-Mar', 808, 89012, 'Natal'),
('Bianca Martins', '90123456789', '901234', 'CT901', 'Rua dos Girassóis', 909, 90123, 'Belém'),
('Rafael Oliveira', '01234567890', '012345', 'CT012', 'Avenida dos Flamboyants', 1010, 01234, 'Manaus');

--Povoando Funcionário
INSERT INTO funcionario (nome, cpf, rg, carteira_trab, rua, numero, cep, cidade) VALUES 
('Mariana Oliveira', '11223344556', '112233', 'CT112', 'Rua das Palmeiras', 11, 11223, 'São Paulo'),
('Diego Silva', '22334455667', '223344', 'CT223', 'Avenida dos Bandeirantes', 22, 22334, 'Rio de Janeiro'),
('Carolina Souza', '33445566778', '334455', 'CT334', 'Rua das Laranjeiras', 33, 33445, 'Salvador'),
('Marcelo Santos', '44556677889', '445566', 'CT445', 'Avenida Paulista', 44, 44556, 'São Paulo'),
('Renata Lima', '55667788990', '556677', 'CT556', 'Rua da Paz', 55, 55667, 'Curitiba'),
('Gustavo Pereira', '66778899001', '667788', 'CT667', 'Avenida Atlântica', 66, 66778, 'Fortaleza'),
('Elaine Almeida', '77889900112', '778899', 'CT778', 'Rua do Carmo', 77, 77889, 'Recife'),
('Fábio Costa', '88990011223', '889900', 'CT889', 'Avenida Beira-Mar', 88, 88990, 'Natal'),
('Tatiane Martins', '99001122334', '990011', 'CT990', 'Rua dos Girassóis', 99, 99001, 'Belém'),
('Rodrigo Oliveira', '00112233445', '001122', 'CT001', 'Avenida dos Flamboyants', 101, 00112, 'Manaus');

--Povoando Enfermeiro
INSERT INTO enfermeiro (coren, cpf_funcionario) VALUES 
('111111', (SELECT cpf FROM funcionario WHERE nome = 'Ana Silva')),
('222222', (SELECT cpf FROM funcionario WHERE nome = 'Carlos Oliveira')),
('333333', (SELECT cpf FROM funcionario WHERE nome = 'Fernanda Santos')),
('444444', (SELECT cpf FROM funcionario WHERE nome = 'Ricardo Souza')),
('555555', (SELECT cpf FROM funcionario WHERE nome = 'Juliana Lima')),
('666666', (SELECT cpf FROM funcionario WHERE nome = 'Lucas Pereira')),
('777777', (SELECT cpf FROM funcionario WHERE nome = 'Amanda Almeida')),
('888888', (SELECT cpf FROM funcionario WHERE nome = 'Gabriel Costa')),
('999999', (SELECT cpf FROM funcionario WHERE nome = 'Bianca Martins')),
('000000', (SELECT cpf FROM funcionario WHERE nome = 'Rafael Oliveira'));

--Povoando Fisioterapeuta
INSERT INTO fisioterapeuta (crefito, cpf_funcionario) VALUES 
('11111', (SELECT cpf FROM funcionario WHERE nome = 'Mariana Oliveira')),
('22222', (SELECT cpf FROM funcionario WHERE nome = 'Diego Silva')),
('33333', (SELECT cpf FROM funcionario WHERE nome = 'Carolina Souza')),
('44444', (SELECT cpf FROM funcionario WHERE nome = 'Marcelo Santos')),
('55555', (SELECT cpf FROM funcionario WHERE nome = 'Renata Lima')),
('66666', (SELECT cpf FROM funcionario WHERE nome = 'Gustavo Pereira')),
('77777', (SELECT cpf FROM funcionario WHERE nome = 'Elaine Almeida')),
('88888', (SELECT cpf FROM funcionario WHERE nome = 'Fábio Costa')),
('99999', (SELECT cpf FROM funcionario WHERE nome = 'Tatiane Martins')),
('00000', (SELECT cpf FROM funcionario WHERE nome = 'Rodrigo Oliveira'));

--Povoando Responsável
INSERT INTO responsavel (nome, cpf, rg, rua, cep, numero, cidade, ocupacao, grau_familiaridade) VALUES 
('Gustavo Gurgel', '11223344556', '112233', 'Rua das Palmeiras', 11223, 11, 'São Paulo', 'Advogada', 'Filho(a)'),
('Victor Emanuel', '22334455667', '223344', 'Avenida dos Bandeirantes', 22334, 22, 'Rio de Janeiro', 'Engenheiro', 'Filho(a)'),
('Fernanda Lima', '33445566778', '334455', 'Rua das Laranjeiras', 33445, 33, 'Salvador', 'Médica', 'Filho(a)'),
('Carlos Souza', '44556677889', '445566', 'Avenida Paulista', 44556, 44, 'São Paulo', 'Professor', 'Pai'),
('Mario Aragas', '55667788990', '556677', 'Rua da Paz', 55667, 55, 'Curitiba', 'Enfermeira', 'Filho(a)'),
('Eduardo Pereira', '66778899001', '667788', 'Avenida Atlântica', 66778, 66, 'Fortaleza', 'Empresário', 'Pai'),
('Patricia Almeida', '77889900112', '778899', 'Rua do Carmo', 77889, 77, 'Recife', 'Psicóloga', 'Filho(a)'),
('Ricardo Costa', '88990011223', '889900', 'Avenida Beira-Mar', 88990, 88, 'Natal', 'Médico', 'Pai'),
('Camila Martins', '99001122334', '990011', 'Rua dos Girassóis', 99001, 99, 'Belém', 'Advogada', 'Filho(a)'),
('Jorge Eduardo', '00112233445', '001122', 'Avenida dos Flamboyants', 11234, 101, 'Manaus', 'Engenheiro', 'Pai');

-- Alterando a relação de parentesco
UPDATE responsavel SET grau_familiaridade = 'Pai' WHERE cpf = '11223344556'; -- Gustavo Gurgel
UPDATE responsavel SET grau_familiaridade = 'Mãe' WHERE cpf = '33445566778'; -- Fernanda Lima
UPDATE responsavel SET grau_familiaridade = 'Neto(a)' WHERE cpf = '22334455667'; -- Victor Emanuel

--Povoando Idoso
INSERT INTO idoso (nome, cpf, rg_idoso) VALUES 
('Antonio Erick', '11223344550', '112233'),
('Maria Oliveira', '22334455661', '223344'),
('Antonio Joabe', '33445566772', '334455'),
('Rosa Lima', '44556677883', '445566'),
('Matheus Conrado', '55667788994', '556677'),
('Lúcia Almeida', '66778899005', '667788'),
('Kaynan Pereira', '77889900116', '778899'),
('Helena Martins', '88990011227', '889900'),
('Eduarda Oliveira', '99001122338', '990011'),
('Deivid dos Santos', '00112233449', '001122');

--Povoando Precisa
INSERT INTO precisa (cpf_idoso, cpf_responsavel) VALUES 
('11223344550', '11223344556'), -- Antonio Erick - Gustavo Gurgel
('22334455661', '22334455667'), -- Maria Oliveira - Victor Emanuel
('33445566772', '33445566778'), -- Antonio Joabe - Fernanda Lima
('44556677883', '44556677889'), -- Rosa Lima - Carlos Souza
('55667788994', '55667788990'), -- Matheus Conrado - Mario Aragas
('66778899005', '66778899001'), -- Lúcia Almeida - Eduardo Pereira
('77889900116', '77889900112'), -- Kaynan Pereira - Patricia Almeida
('88990011227', '88990011223'), -- Helena Martins - Ricardo Costa
('99001122338', '99001122334'), -- Eduarda Oliveira - Camila Martins
('00112233449', '00112233445'); -- Deivid dos Santos - Jorge Eduardo

--Povoando Responsavel_tel
INSERT INTO responsavel_tel (telefone_pessoal, telefone_fixo, telefone_comercial, cpf_responsavel) VALUES 
(123456789, 987654321, 111111111, '11223344556'), -- Gustavo Gurgel
(234567890, 876543210, 222222222, '22334455667'), -- Victor Emanuel
(345678901, 765432109, 333333333, '33445566778'), -- Fernanda Lima
(456789012, 654321098, 444444444, '44556677889'), -- Carlos Souza
(567890123, 543210987, 555555555, '55667788990'), -- Mario Aragas
(678901234, 432109876, 666666666, '66778899001'), -- Eduardo Pereira
(789012345, 321098765, 777777777, '77889900112'), -- Patricia Almeida
(890123456, 210987654, 888888888, '88990011223'), -- Ricardo Costa
(901234567, 109876543, 999999999, '99001122334'), -- Camila Martins
(123456789, 234567890, 345678901, '00112233445'); -- Jorge Eduardo

--Povoando Comunica
INSERT INTO comunica (ata_contato, cpf_responsavel, cpf_funcionario) VALUES 
('Reunião agendada para discutir plano de tratamento.', '11223344556', '12345678901'),
('Visita domiciliar para avaliação do paciente.', '22334455667', '23456789012'),
('Confirmação de consulta para o próximo mês.', '33445566778', '34567890123'),
('Discussão sobre o protocolo de cuidados.', '44556677889', '45678901234'),
('Avaliação da recuperação do paciente.', '55667788990', '56789012345'),
('Consulta para ajuste na medicação.', '66778899001', '67890123456'),
('Revisão do plano de reabilitação.', '77889900112', '78901234567'),
('Consulta de acompanhamento médico.', '88990011223', '89012345678'),
('Discussão sobre o tratamento fisioterapêutico.', '99001122334', '90123456789'),
('Avaliação da pressão arterial e dos sinais vitais.', '00112233445', '01234567890');

--Povoando Acompanha
INSERT INTO acompanha (data_acompanhamento, evolucao_enf, cpf_idoso, coren) VALUES 
('2023-10-26', 'Paciente apresentou melhora no quadro respiratório.', '11223344550', '111111'),
('2023-10-25', 'Paciente realizou exercícios de fisioterapia sem dificuldades.', '22334455661', '222222'),
('2023-10-24', 'Paciente mostrou sinais de progresso na mobilidade.', '33445566772', '333333'),
('2023-10-23', 'Paciente apresentou boa resposta ao tratamento.', '44556677883', '444444'),
('2023-10-22', 'Paciente relatou redução na dor após a terapia.', '55667788994', '555555'),
('2023-10-21', 'Paciente realizou caminhada assistida com bom desempenho.', '66778899005', '666666'),
('2023-10-20', 'Paciente participou ativamente das atividades terapêuticas.', '77889900116', '777777'),
('2023-10-19', 'Paciente demonstrou melhor coordenação motora.', '88990011227', '888888'),
('2023-10-18', 'Paciente realizou exercícios de fortalecimento muscular.', '99001122338', '999999'),
('2023-10-17', 'Paciente mostrou sinais de aumento da resistência física.', '00112233449', '000000');

--Povoando Consulta
INSERT INTO consulta (data_consulta, evolucao_fisio, cpf_idoso, crefito) VALUES 
('2023-10-26', 'Paciente apresentou melhora na mobilidade e na respiração.', '11223344550', '11111'),
('2023-10-25', 'Paciente realizou exercícios de fisioterapia com boa adesão.', '22334455661', '22222'),
('2023-10-24', 'Paciente demonstrou aumento da força muscular.', '33445566772', '33333'),
('2023-10-23', 'Paciente apresentou redução na dor e ganho de amplitude de movimento.', '44556677883', '44444'),
('2023-10-22', 'Paciente realizou treino de equilíbrio com progresso.', '55667788994', '55555'),
('2023-10-21', 'Paciente mostrou melhora na capacidade respiratória após a sessão.', '66778899005', '66666'),
('2023-10-20', 'Paciente realizou exercícios de fortalecimento com boa técnica.', '77889900116', '77777'),
('2023-10-19', 'Paciente apresentou boa resposta ao tratamento de reabilitação.', '88990011227', '88888'),
('2023-10-18', 'Paciente realizou exercícios de alongamento e flexibilidade.', '99001122338', '99999'),
('2023-10-17', 'Paciente relatou melhora na qualidade de vida e na disposição.', '00112233449', '00000');

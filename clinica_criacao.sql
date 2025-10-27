DROP TABLE IF EXISTS consulta;
DROP TABLE IF EXISTS pet;
DROP TABLE IF EXISTS veterinario;
DROP TABLE IF EXISTS tutor;

CREATE TABLE tutor (
	id_tutor BIGSERIAL PRIMARY KEY,
	nome_tutor VARCHAR(100) NOT NULL,
	cpf VARCHAR UNIQUE,
	numero_contato VARCHAR NOT NULL,
	email VARCHAR(100),
	endereco VARCHAR(300)
);

CREATE TABLE veterinario (
	id_vet BIGSERIAL PRIMARY KEY,
	nome_vet VARCHAR NOT NULL,
	crmv VARCHAR NOT NULL,
	especialidade VARCHAR NOT NULL
);

CREATE TABLE pet (
	id_pet BIGSERIAL PRIMARY KEY,
	nome_pet VARCHAR(100) NOT NULL,
	especie VARCHAR(100) NOT NULL,
	raca VARCHAR(100) NOT NULL,
	data_nasc DATE,
	id_tutor BIGINT, -- Chave estrangeira 
	FOREIGN KEY (id_tutor) REFERENCES Tutor(id_tutor)
);

CREATE TABLE consulta (
	id_consulta BIGSERIAL PRIMARY KEY,
	id_pet BIGINT, -- Chave estrangeira 	
	id_vet BIGINT, -- Chave estrangeira 
	data_consulta DATE NOT NULL,
	hora_consulta TIME,
	sintomas TEXT,
	diagnostico TEXT,
	tratamento TEXT,

	FOREIGN KEY (id_pet) REFERENCES pet(id_pet),
	FOREIGN KEY (id_vet) REFERENCES veterinario(id_vet)
);

-- Inserção de dados

INSERT INTO tutor (nome_tutor, cpf, numero_contato, email, endereco) VALUES
('Iasmin', '07127587410', '62985263524', 'iasmin@gmail.com', 'Rua Angico, 140'),
('Fabiana', '00215845441', '62986158748', 'fabiana@outlook.com', 'Rua Seu Jorge, 593');

INSERT INTO veterinario (nome_vet, crmv, especialidade) VALUES
('Joana', 'CRMV-GO 58963', 'Oftamologista'),
('Jorge', 'CRMV-GO 63214', 'Ortopedista');

INSERT INTO pet (nome_pet, especie, raca, data_nasc, id_tutor) VALUES
('Cogumelo', 'Cachorro', 'SRD', '2025-01-29', 1),
('Tilapia', 'Gata', 'Siamês', '2024-07-01', 2);

INSERT INTO consulta (id_pet, id_vet, data_consulta, hora_consulta, sintomas, diagnostico, tratamento) VALUES
(2, 1, '2025-10-18', '10:45:00', 'Irritação e vermelhidão no olho', 'Contato com planta toxica', 'Não permitir acesso a planta, limpar o local 2x ao dia com soro e aplicar colirio'),
(1, 2, '2025-10-18', '11:15:00', 'Pata machucada', 'Machucado sem fratura', 'Não pular/ correr, manter o bebe de repouso durante 3 dias, aplicar compressas quente ao local, e ministrar o medicamento para dor');













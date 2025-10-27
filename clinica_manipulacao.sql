UPDATE tutor
SET email = 'iasmincorregozinho@gmail.com'
WHERE id_tutor = 1;

INSERT INTO consulta (id_pet, id_vet, data_consulta, hora_consulta, sintomas, diagnostico, tratamento) VALUES
(2, 1, '2025-10-26', '10:45:00', 'Não faz xixi', 'Possivel infeccção de urina', 'Antibiotico');

DELETE FROM consulta
WHERE id_consulta = 3;
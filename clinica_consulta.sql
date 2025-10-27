SELECT 
	p.nome_pet AS nome_pet,
	v.nome_vet AS nome_vet,
	c.data_consulta,
	c.sintomas,
	c.diagnostico
FROM consulta c
JOIN pet p ON c.id_pet = p.id_pet
JOIN veterinario v ON c.id_vet = v.id_vet;

SELECT 
	p.nome_pet AS nome_pet,
	c.data_consulta,
	c.tratamento
FROM consulta c
JOIN pet p ON c.id_pet = p.id_pet
WHERE p.nome_pet = 'Tilapia';
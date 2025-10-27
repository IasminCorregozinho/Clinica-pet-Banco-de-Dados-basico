SELECT 
	p.nome AS nome_pet,
	v.nome AS nome_vet,
	c.data_consulta,
	c.sintomas,
	c.diagnostico
FROM consulta c
JOIN pet p ON c.id_pet = p.id_pet
JOIN veterinario v ON c.id_veterinario = v.id_veterinario;

SELECT 
	p.nome AS nome_pet,
	c.data_consulta,
	c.tratamento
FROM consulta c
JOIN pet p ON c.id_pet = p.id_pet
WHERE p.nome = 'Tilapia';
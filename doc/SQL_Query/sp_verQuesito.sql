create procedure sp_verQuesito (@quesito int)
as
	if (@quesito = 0) begin
		select es.nome_escola, qu.nota1, qu.nota2, qu.nota3, qu.nota4, qu.nota5, qu.maior, qu.menor, qu.total
		from comissaoFrente qu
		inner join escola es
		on qu.id_escola = es.id_escola
	end
	else if (@quesito = 1) begin
		select es.nome_escola, qu.nota1, qu.nota2, qu.nota3, qu.nota4, qu.nota5, qu.maior, qu.menor, qu.total
		from evolucao qu
		inner join escola es
		on qu.id_escola = es.id_escola
	end
	else if (@quesito = 2) begin
		select es.nome_escola, qu.nota1, qu.nota2, qu.nota3, qu.nota4, qu.nota5, qu.maior, qu.menor, qu.total
		from fantasia qu
		inner join escola es
		on qu.id_escola = es.id_escola
	end
	else if (@quesito = 3) begin
		select es.nome_escola, qu.nota1, qu.nota2, qu.nota3, qu.nota4, qu.nota5, qu.maior, qu.menor, qu.total
		from bateria qu
		inner join escola es
		on qu.id_escola = es.id_escola
	end
	else if (@quesito = 4) begin
		select es.nome_escola, qu.nota1, qu.nota2, qu.nota3, qu.nota4, qu.nota5, qu.maior, qu.menor, qu.total
		from alegoria qu
		inner join escola es
		on qu.id_escola = es.id_escola
	end
	else if (@quesito = 5) begin
		select es.nome_escola, qu.nota1, qu.nota2, qu.nota3, qu.nota4, qu.nota5, qu.maior, qu.menor, qu.total
		from harmonia qu
		inner join escola es
		on qu.id_escola = es.id_escola
	end
	else if (@quesito = 6) begin
		select es.nome_escola, qu.nota1, qu.nota2, qu.nota3, qu.nota4, qu.nota5, qu.maior, qu.menor, qu.total
		from sambaEnredo qu
		inner join escola es
		on qu.id_escola = es.id_escola
	end
	else if (@quesito = 7) begin
		select es.nome_escola, qu.nota1, qu.nota2, qu.nota3, qu.nota4, qu.nota5, qu.maior, qu.menor, qu.total
		from mestreSala qu
		inner join escola es
		on qu.id_escola = es.id_escola
	end
	else if (@quesito = 8) begin
		select es.nome_escola, qu.nota1, qu.nota2, qu.nota3, qu.nota4, qu.nota5, qu.maior, qu.menor, qu.total
		from enredo qu
		inner join escola es
		on qu.id_escola = es.id_escola
	end
create procedure sp_addNotas (@quesito int, @escola int, @nota decimal(4,1), @posNota int)
as
	if (@quesito = 0) begin
		exec sp_comissaoFrente @escola, @nota, @posNota
	end
	else if (@quesito = 1) begin
		exec sp_evolucao @escola, @nota, @posNota
	end
	else if (@quesito = 2) begin
		exec sp_fantasia @escola, @nota, @posNota
	end
	else if (@quesito = 3) begin
		exec sp_bateria @escola, @nota, @posNota
	end
	else if (@quesito = 4) begin
		exec sp_alegoria @escola, @nota, @posNota
	end
	else if (@quesito = 5) begin
		exec sp_harmonia @escola, @nota, @posNota
	end
	else if (@quesito = 6) begin
		exec sp_sambaEnredo @escola, @nota, @posNota
	end
	else if (@quesito = 7) begin
		exec sp_mestreSala @escola, @nota, @posNota
	end
	else if (@quesito = 8) begin
		exec sp_enredo @escola, @nota, @posNota
	end
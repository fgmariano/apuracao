create procedure sp_fantasia(@escola int, @nota decimal(4,1), @posNota int)
as
	declare @maior decimal(4,1), @menor decimal(4,1), @total decimal(4,1)
	if (@posNota = 1) begin
		insert into fantasia (id_escola, nota1) values
		(@escola, @nota)
	end
	else if (@posNota = 2) begin
		update fantasia
		set nota2 = @nota
		where id_escola = @escola
	end
	else if (@posNota = 3) begin
		update fantasia
			set nota3 = @nota
			where id_escola = @escola
		update fantasia
			set maior = dbo.fn_maior(2, @escola), menor = dbo.fn_menor(2, @escola)
			where id_escola = @escola
		select @total = dbo.fn_total(@escola, 2)
		update fantasia
			set total = @total
			where id_escola = @escola
		exec sp_updateEscola @escola, @total, 3
	end
	else if (@posNota = 4) begin
		update fantasia
			set nota4 = @nota
			where id_escola = @escola
		update fantasia
			set maior = dbo.fn_maior(2, @escola), menor = dbo.fn_menor(2, @escola)
			where id_escola = @escola
		select @total = dbo.fn_total(@escola, 2)
		update fantasia
			set total = @total
			where id_escola = @escola
		exec sp_updateEscola @escola, @total, 4
	end
	else if (@posNota = 5) begin
		update fantasia
			set nota5 = @nota
			where id_escola = @escola
		update fantasia
			set maior = dbo.fn_maior(2, @escola), menor = dbo.fn_menor(2, @escola)
			where id_escola = @escola
		select @total = dbo.fn_total(@escola, 2)
		update fantasia
			set total = @total
			where id_escola = @escola
		exec sp_updateEscola @escola, @total, 5
	end
create procedure sp_updateEscola(@escola int, @total decimal(4,1), @posNota int)
as
	declare @notaParcial decimal (4,1)
	select @notaParcial = nota_parcial from escola where id_escola = @escola
	if (@posNota = 3) begin
		set @total = IsNull(@notaParcial, 0) + @total
	end
	if (@posNota = 4) begin
		set @total = IsNull(@notaParcial, 0) + @total
	end
	if (@posNota = 5) begin
		set @total = IsNull(@notaParcial, 0) + @total
		update escola
			set nota_parcial = @total
			where id_escola = @escola
	end
	update escola
		set nota_final = @total
		where id_escola = @escola
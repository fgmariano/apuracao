create function fn_total(@escola int, @quesito int)
returns decimal(4,1)
as
begin
	declare @nota1 decimal(4,1),
			@nota2 decimal(4,1),
			@nota3 decimal(4,1),
			@nota4 decimal(4,1),
			@nota5 decimal(4,1),
			@maior decimal(4,1),
			@menor decimal(4,1),
			@total decimal(5,1)
	if (@quesito = 0) begin
	select
		@nota1 = nota1,
		@nota2 = nota2,
		@nota3 = nota3,
		@nota4 = nota4,
		@nota5 = nota5,
		@maior = maior,
		@menor = menor
	from
		comissaoFrente
	where id_escola = @escola
	end
	else if (@quesito = 1) begin
		select
			@nota1 = nota1,
			@nota2 = nota2,
			@nota3 = nota3,
			@nota4 = nota4,
			@nota5 = nota5,
			@maior = maior,
			@menor = menor
		from
			evolucao
		where id_escola = @escola
	end
	else if (@quesito = 2) begin
		select
			@nota1 = nota1,
			@nota2 = nota2,
			@nota3 = nota3,
			@nota4 = nota4,
			@nota5 = nota5,
			@maior = maior,
			@menor = menor
		from
			fantasia
		where id_escola = @escola
	end
	else if (@quesito = 3) begin
		select
			@nota1 = nota1,
			@nota2 = nota2,
			@nota3 = nota3,
			@nota4 = nota4,
			@nota5 = nota5,
			@maior = maior,
			@menor = menor
		from
			bateria
		where id_escola = @escola
	end
	else if (@quesito = 4) begin
		select
			@nota1 = nota1,
			@nota2 = nota2,
			@nota3 = nota3,
			@nota4 = nota4,
			@nota5 = nota5,
			@maior = maior,
			@menor = menor
		from
			alegoria
		where id_escola = @escola
	end
	else if (@quesito = 5) begin
		select
			@nota1 = nota1,
			@nota2 = nota2,
			@nota3 = nota3,
			@nota4 = nota4,
			@nota5 = nota5,
			@maior = maior,
			@menor = menor
		from
			harmonia
		where id_escola = @escola
	end
	else if (@quesito = 6) begin
		select
			@nota1 = nota1,
			@nota2 = nota2,
			@nota3 = nota3,
			@nota4 = nota4,
			@nota5 = nota5,
			@maior = maior,
			@menor = menor
		from
			sambaEnredo
		where id_escola = @escola
	end
	else if (@quesito = 7) begin
		select
			@nota1 = nota1,
			@nota2 = nota2,
			@nota3 = nota3,
			@nota4 = nota4,
			@nota5 = nota5,
			@maior = maior,
			@menor = menor
		from
			mestreSala
		where id_escola = @escola
	end
	else if (@quesito = 8) begin
		select
			@nota1 = nota1,
			@nota2 = nota2,
			@nota3 = nota3,
			@nota4 = nota4,
			@nota5 = nota5,
			@maior = maior,
			@menor = menor
		from
			enredo
		where id_escola = @escola
	end
	set @total = @nota1
	set @total = @total + @nota2
	set @total = @total + @nota3
	set @total = @total + IsNull(@nota4, 0)
	set @total = @total + IsNull(@nota5, 0)
	set @total = @total - @maior
	set @total = @total - @menor
	return @total
end
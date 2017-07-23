create function fn_menor(@quesito int, @escola int)
returns decimal(4,1)
as
begin
	declare @nota1 float,
			@nota2 float,
			@nota3 float,
			@nota4 float,
			@nota5 float,
			@menor decimal(4,1)
	if (@quesito = 0) begin
	select
		@nota1 = nota1,
		@nota2 = nota2,
		@nota3 = nota3,
		@nota4 = nota4,
		@nota5 = nota5
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
			@nota5 = nota5
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
			@nota5 = nota5
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
			@nota5 = nota5
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
			@nota5 = nota5
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
			@nota5 = nota5
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
			@nota5 = nota5
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
			@nota5 = nota5
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
			@nota5 = nota5
		from
			enredo
		where id_escola = @escola
	end
	set @menor = @nota1
	if (@menor >= @nota2) begin
		set @menor = @nota2
	end
	if (@menor >= @nota3) begin
		set @menor = @nota3
	end
	if (@menor >= @nota4) begin
		set @menor = @nota4
	end
	if (@menor >= @nota5) begin
		set @menor = @nota5
	end
	return @menor
end
create function fn_verTotal(@escola int)
returns decimal(5,1)
as
begin
	declare @total decimal(5,1)
	select @total = total from comissaoFrente where id_escola = @escola
	select @total = @total+total from evolucao where id_escola = 0
	select @total = @total+total from fantasia where id_escola = 0
	select @total = @total+total from bateria where id_escola = 0
	select @total = @total+total from alegoria where id_escola = 0
	select @total = @total+total from harmonia where id_escola = 0
	select @total = @total+total from sambaEnredo where id_escola = 0
	select @total = @total+total from mestreSala where id_escola = 0
	select @total = @total+total from enredo where id_escola = 0
	return @total
end